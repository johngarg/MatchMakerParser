Package["MatchMakerParser`"]

(* MIT License

Copyright (c) 2022 John Gargalionis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. *)

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
    {indices, ranges}
  ,
    indices =
    Table[
      GetSumIndexPattern[i]
    , {i, List @@ expr}
    ] /. {Free[y_], n_} :> Nothing;

    Print[NormaliseIndices[Join @@ indices]];

    Hold[Sum] @@ Join @@ {
      {expr /. Free -> Identity}
    , DeleteDuplicates[Join @@ indices]
    }
  ];
ParseSums[y_[idx__]] /; MemberQ[Keys[$Couplings], y] := y[idx] /. {Free[i_] :> i};
PackageExport["ParseSums"]

ParseMatchMakerOutput[rules_] :=
  Table[
    Composition[ParseSums, Expand][
      rule[[1]] //. {Pattern -> pattern, pattern[x_, y_] :> Free[x]} /. rule
    ]
  , {rule, rules}
  ];

PackageExport["ParseMatchMakerOutput"]
