Package["MatchMakerParser`"]

Print["Main package MatchMakerParser.m loaded!"];


$Couplings::usage = "Association list of couplings to dimension."
$Couplings = <||>;
PackageExport["$Couplings"]

$ExoticParams::usage = "List of exotic parameters."
$ExoticParams = {};
PackageExport["$ExoticParams"]

DeclareCouplings::usage = "Function used to declare coupling matrices in
MatchMaker output. Returns a list of the inputs."
DeclareCouplings[couplings__] :=
  Table[
    $Couplings[coupling[[1]]] = coupling[[2]]; coupling
  , {coupling, List[couplings]}
  ];
PackageExport["DeclareCouplings"]

DeclareExoticParams::usage = "Function used to declare exotic coupling matrices
and masses in MatchMaker output.";
DeclareExoticParams[params__] := $ExoticParams = List[params];
PackageExport["DeclareExoticParams"]


GetSumIndexPattern::usage = "For a coupling featuring in a product whose indices
are being summed over, returns a list like {i, 3}, where i is the index and the
second element is the range declared in `DeclareCouplings`.";
GetSumIndexPattern[y_[idx__]] /; MemberQ[Keys[$Couplings], y] :=
  MapThread[List, {List[idx], $Couplings[y]}];
GetSumIndexPattern[x_] := Nothing;

NormaliseIndices::usage = "Normalise index patterns so that duplicates are
deleted, and mismatching sums are truncated in a way that allows the sum to be
performed. In such an event, a warning is shown.";
NormaliseIndices[indices_List] := Nothing;

ParseSums::usage = "Function to parse repeated indices into sums with the
correct ranges.";
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
    (* TODO Replace DeleteDuplicate below with `NormaliseIndices` *)
    allIndices = DeleteDuplicates[Join @@ indicesByCoupling];

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

ParseMatchMakerOutput[rules_] :=
  Table[
    RuleDelayed @@ {
      rule[[1]]
    , Composition[ParseSums, Expand][
      rule[[1]] //. {Pattern -> pattern, pattern[x_, y_] :> Free[x]} /. rule
      ]
    }
  , {rule, rules}
  ];
PackageExport["ParseMatchMakerOutput"]

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

OutputPythonClass[name_][List[rules__RuleDelayed]] :=
  Block[
    { boilerplateTemplate
    , methodTemplate
    , operatorTriple
    , methodStringList
    , exoticParamTemplate
    , exoticCouplingTemplate
    , attrStringList
    }
  ,
    boilerplateTemplate =
    StringTemplate[
      "import matchingresult
import numpy as np

class `n`MatchingResult(matchingresult.GenericMatchingResult):
    def __init__(self, name='`n`', scale=91.1876):
        super().__init__(name, scale)\n"
    ][<| "n" -> name |>];

    exoticParamTemplate =
    StringTemplate[
      "        self.`` = 1\n"
    ];
    exoticCouplingTemplate =
    StringTemplate[
      "        self.`` = np.zeros(``)\n"
    ];
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

    operatorTriples =
    Table[
      Append[OperatorNameAndIndexStrings[rule[[1]]], PythonForm[rule[[2]]]]
    , {rule, List[rules]}
    ];

    methodStringList =
    Table[methodTemplate @@ triple, {triple, operatorTriples}];

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
