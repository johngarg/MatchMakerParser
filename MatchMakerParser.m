(* ::Package:: *)

Package["MatchMakerParser`"]

Print["Main package MatchMakerParser.m loaded!"];

$Couplings::usage = "Association list of couplings to dimension. E.g.

  <| YLQS -> {3, 3}, ... |>

means the coupling YLQS has two indices that each go over 1, 2, 3.";
$Couplings = <||>;
PackageExport["$Couplings"]

$ExoticParams::usage = "List of exotic parameters.";
$ExoticParams = {};
PackageExport["$ExoticParams"]

DeclareCouplings::usage = "Function used to declare coupling matrices in
MatchMaker output. Returns a list of the inputs. E.g.

  DeclareCouplings[{YLQS, {3, 3}}, ...]

";
DeclareCouplings[couplings__] :=
  Table[
    $Couplings[coupling[[1]]] = coupling[[2]]; coupling
  , {coupling, List[couplings]}
  ];
PackageExport["DeclareCouplings"]

DeclareExoticParams::usage = "Function used to declare exotic coupling matrices
and masses in MatchMaker output. E.g.

DeclareExoticParams[YLQS , YeuS, MS1];

";
DeclareExoticParams[params__] := $ExoticParams = List[params];
PackageExport["DeclareExoticParams"]

GetSumIndexPattern::usage = "For a coupling featuring in a product whose indices
are being summed over, returns a list like {i, 3}, where i is the index and the
second element is the range declared in `DeclareCouplings`.";
GetSumIndexPattern[y_[idx__]] /; MemberQ[Keys[$Couplings], y] :=
  MapThread[List, {List[idx], $Couplings[y]}];
GetSumIndexPattern[x_] := Nothing;

(* TODO Extend so that mismatching sums are truncated in a way that allows the
sum to be performed. In such an event, a warning should be shown. *)
NormaliseIndices::usage = "Normalise index patterns so that duplicates are
deleted.";
NormaliseIndices[indices_List] := DeleteDuplicates[indices];

(* TODO Fix this to use np.einsum *)
ParseSums::usage = "Function to parse repeated indices into sums with the
correct ranges. E.g.

ParseSums[x[i] y[j,i]] (* => Sum[x[i] y[j,i], {i, 3}] *)

";
ParseSums[expr_Plus] := Map[ParseSums, expr];
ParseSums[expr_Times] :=
  Block[
    {indicesByCoupling, allIndices}
  ,
    (* Return indices like {{indices on first coupling}, {indices on 2nd}, ...} *)
    (* We don't care about the free indices, so remove them at the end *)
    indicesByCoupling =
    Table[GetSumIndexPattern[i], {i, List @@ expr}] /. {Free[y_], n_} :> Nothing;

    (* Join all the indices together as they would appear in the sum *)
    allIndices = NormaliseIndices[Join @@ indicesByCoupling];

    If[
      allIndices === {}
    , expr (* If no indices to sum, just return expr *)
    , Sum @@ Join @@ {{expr}, allIndices}
    ]
  ];
ParseSums[y_[idx__]] /; MemberQ[Keys[$Couplings], y] := y[idx];
ParseSums[y_[idx__]] /; y === KroneckerDelta := y[idx];
ParseSums[x_] := x;
PackageExport["ParseSums"]
PackageExport["Free"]
PackageExport["sum"]

ParseMatchMakerOutput::usage = "Parses sums in a list of rules as output by
Matchmaker.";
ParseMatchMakerOutput[rules_] :=
  Table[
    RuleDelayed @@ {
      rule[[1]]
    , Composition[ParseSums, Expand][
      Block[
        {uniq = Unique[p]}
      ,
        (* Wrap free indices with a `Free` head to flag them for `ParseSum` so
        that they are not summed over *)
        rule[[1]] //. {Pattern -> uniq, uniq[x_, y_] :> Free[x]} /. rule]
      ]
    }
  , {rule, rules}
  ];
PackageExport["ParseMatchMakerOutput"]

OperatorNameAndIndexStrings::usage = "Returns a length-2 list whose first
element is the `opName` as a string, and the second is a string representation
of the indices separated by a comma. E.g.

OperatorNameAndIndexStrings[Olq[i, j, k]] (* => {\"Olq\", \"i,j,k\"} *)

";
OperatorNameAndIndexStrings[opName_[indices___]] :=
  Block[
    {cleanIndices, opNameString = ToString[opName], uniq = Unique[p]}
  ,
    If[
      indices === {}
    , {opNameString, ""}
    , cleanIndices = List[indices] //. {Pattern -> uniq, uniq[x_, y_] :> x};
      {opNameString, StringRiffle[Map[ToString, cleanIndices], ","]}
    ]
  ];
OperatorNameAndIndexStrings[opName_] := {ToString[opName], ""};

OutputPythonClass::usage = "Maps output of ParseMatchMakerOutput to a string
representation of a Python class.";
OutputPythonClass[name_][List[rules__RuleDelayed]] :=
  Block[
    { boilerplateTemplate
    , methodTemplate
    , operatorTriples
    , methodStringList
    , exoticParamTemplate
    , exoticCouplingTemplate
    , attrStringList
    , nonVanishingOperatorCoefficients
    , nonvanishingAttr
    }
  ,
    boilerplateTemplate =
    StringTemplate[
      "import python.matchingresult
import numpy as np

class `n`MatchingResult(python.matchingresult.GenericMatchingResult):
    def __init__(self, name='`n`', scale=1.0):
        super().__init__(name, scale)\n"
    ][<| "n" -> name |>];

    exoticParamTemplate =
    StringTemplate[
      "        self.`` = 1\n"
    ];
    exoticCouplingTemplate =
    StringTemplate[
      "        self.`` = np.ones(``)\n"
    ];

    (* Create list of strings representing attributes of Python class. For
    numerical parameters: something like "self.param = 1" and for tensors
    "self.param = np.zeros(...)" *)
    attrStringList =
    Table[
      If[MemberQ[Keys[$Couplings], param]
       , exoticCouplingTemplate @@ {
         ToString[param]
         , StringReplace[ToString[$Couplings[param]]
                       , {"}" -> ")", "{" -> "("}
           ]
         }
       , exoticParamTemplate[ToString[param], ToString[param]]
      ]
    , {param, $ExoticParams}
    ];

    methodTemplate =
    StringTemplate[
      "    def ``(self, ``):
        return ``\n"
    ];

    (* A list of length-3 lists of strings like: {opName, indices, method body}
    *)
    operatorTriples =
    Table[
      Append[OperatorNameAndIndexStrings[rule[[1]]], PythonForm[rule[[2]]]]
    , {rule, List[rules]}
    ];

    (* Remove non-Warsaw operator coefficients from `operatorTriples`. Don't
    include HCs in this list? *)
    operatorTriples =
    Select[
      operatorTriples
    , MemberQ[$WarsawOperatorCoefficients, First[#]] (*&& ! StringEndsQ[First[#], "bar"]*) &
    ];

    (* Isolate the non-vanishing operator coefficients *)
    nonVanishingOperatorCoefficients =
    Select[
      operatorTriples
    , Last[#] != "0" &
    ];

    (* Assign list of labels to `self.nonvanishing` *)
    nonvanishingAttr =
    "        self.nonvanishing = " <>
                                   PythonForm[Map[First, nonVanishingOperatorCoefficients]] <>
                                   "\n";
    AppendTo[attrStringList, nonvanishingAttr];

    (* Apply method template to triples to construct methods *)
    methodStringList =
    Table[methodTemplate @@ triple, {triple, operatorTriples}];

    (* Add the attributes and methods to the boilerplate code *)
    Table[
      boilerplateTemplate = boilerplateTemplate <> attr;
      , {attr, attrStringList}
    ];
    Table[
      boilerplateTemplate = boilerplateTemplate <> "\n" <> method;
    , {method, methodStringList}
    ];

    boilerplateTemplate
  ];
PackageExport["OutputPythonClass"]

MatchMakerToPython::usage = "Central function of package. The user needs to
declare couplings and exotic parameters with `DeclareCouplings` and
`DeclareExoticParams`, then this function will write out a python file to
`outputPythonFilePath` with the matching information contained within
`matchMakerDataPath` directly as it came from matchmaker. `name` is the name of
the process, and will be prepended to the name of the class.";
MatchMakerToPython[
  name_String
, matchMakerDataPath_String
, outputPythonFilePath_String
] :=
  Block[
    {matchMakerData, parsedMatchMakerData, pythonCode, usedSymbols}
  ,
    matchMakerData = Read[matchMakerDataPath][[-2]];

    Print["Parsing matchmaker data..."];
    parsedMatchMakerData = ParseMatchMakerOutput[matchMakerData];

    Print["Successfully parsed! Converting to Python code..."];
    pythonCode = OutputPythonClass[name][parsedMatchMakerData];

    usedSymbols =
    StringRiffle[
      Table[
        "# " <> ToString[i]
      , {i, Normal[$PythonForm`Symbols]}
      ]
    , "\n"
    ];

    Print["Writing Python file " <> outputPythonFilePath];
    WriteString[
      outputPythonFilePath
    , "## Symbols used:\n" <> usedSymbols <> "\n\n" <> pythonCode
    ];
  ];

PackageExport["MatchMakerToPython"]


MatchMakerToPythonOnlyTree[
  name_String
, matchMakerDataPath_String
, outputPythonFilePath_String
] :=
  Block[
    {matchMakerData, parsedMatchMakerData, pythonCode, usedSymbols}
  ,
    matchMakerData = Read[matchMakerDataPath][[-2]];

    Print["Parsing matchmaker data..."];
    parsedMatchMakerData = ParseMatchMakerOutput[matchMakerData /. MatchMakerParser`onelooporder -> 0];

    Print["Successfully parsed! Converting to Python code..."];
    pythonCode = OutputPythonClass[name][parsedMatchMakerData];

    usedSymbols =
    StringRiffle[
      Table[
        "# " <> ToString[i]
      , {i, Normal[$PythonForm`Symbols]}
      ]
    , "\n"
    ];

    Print["Writing Python file " <> outputPythonFilePath];
    WriteString[
      outputPythonFilePath
    , "## Symbols used:\n" <> usedSymbols <> "\n\n" <> pythonCode
    ];
  ];

PackageExport["MatchMakerToPythonOnlyTree"]
