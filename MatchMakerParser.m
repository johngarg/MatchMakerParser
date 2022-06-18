Package["MatchMakerParser`"]

Print["Main package MatchMakerParser.m loaded!"];


$Couplings::usage = "Association list of couplings to dimension."
$Couplings = <||>;
PackageExport["$Couplings"]

DeclareCouplings::usage = "Function used to declare coupling matrices in
MatchMaker output."
DeclareCouplings[couplings__] :=
  Table[
    $Couplings[coupling[[1]]] = coupling[[2]]; coupling
  , {coupling, List[couplings]}
  ];
PackageExport["DeclareCouplings"]

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
    {indicesByCoupling, allIndices, exprNoFree}
  ,
    (* Return indices like {{indices on first coupling}, {indices on 2nd}, ...} *)
    (* We don't care about the free indices, so remove them at the end *)
    indicesByCoupling =
    Table[GetSumIndexPattern[i], {i, List @@ expr}] /. {Free[y_], n_} :> Nothing;

    (* Join all the indices together as they would appear in the sum *)
    (* TODO Replace DeleteDuplicate below with `NormaliseIndices` *)
    allIndices = DeleteDuplicates[Join @@ indicesByCoupling];

    (* Remove Free head on free indices, since GetSumIndexPattern already
    called *)
    exprNoFree = expr /. Free -> Identity;

    If[
      allIndices === {}
    , exprNoFree (* If no indices to sum, just return expr *)
    , Hold[Sum] @@ Join @@ {{exprNoFree}, allIndices}
    ]
  ];
ParseSums[y_[idx__]] /; MemberQ[Keys[$Couplings], y] := y[idx] /. {Free[i_] :> i};
PackageExport["ParseSums"]

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
