Package["MatchMakerParser`"]

Print["Subpackage MDBForm.m loaded!"]


$FreeIndices = {};
PackageExport["$FreeIndices"]


MDBForm[x_String] := "\"" <> x <> "\"";

MDBForm[Power[mass_, n_]] /;
   (Head[mass] === Symbol) && MemberQ[$ExoticParams, mass] &&
    MassQ[mass] :=
  StringForm["[\"mass\", ``, ``, ``]", MDBForm[MassToField[mass]],
   "\"\"", n];

MDBForm[Power[mass_[index_], n_]] /;
   (Head[mass] === Symbol) && MemberQ[$ExoticParams, mass] &&
    MassQ[mass] :=
  StringForm["[\"mass\", ``, ``, ``]", MDBForm[MassToField[mass]],
   MDBForm[ToString[index]], n];

(* Term *)
MDBForm[expr_Times] :=
  StringRiffle[Map[MDBForm, List @@ expr], {"[", ", ", "]"}];

MDBForm[x_Integer] :=
  StringForm["[\"numerical\", ``, 1]", ToString[x]];

MDBForm[Rational[a_, b_]] :=
  Sequence[MDBForm[a],
   StringForm[ "[\"numerical\", ``, -1]", ToString[b]]];

MDBForm[Power[\[Pi], n_]] :=
  StringForm["[\"constant\", \"pi\", ``, []]", n];

MDBForm[Power[g_[indices___], n_]] :=
  StringForm["[\"coupling\", \"``\", ``, ``, [``]]", MDBForm[g], n,
   EndsWithBarQ[g],
   StringRiffle[Map[MDBForm[Idx[#]] &, List[indices]], ", "]];

MDBForm[Power[g_, n_]] /; (Head[g] === Symbol) :=
  MDBForm[Power[g[], n]];

MDBForm[g_[indices__]] /; MemberQ[Map[First, Normal[$Couplings]], g] :=
  MDBForm[Power[g[indices], "1"]];

MDBForm[KroneckerDelta[i_, j_]] :=
  StringForm[ "[\"constant\", \"kdelta\", 1, [``,``]]",
   MDBForm[Idx[i]], MDBForm[Idx[j]]];

(* log_mass_factor *)
MDBForm[Log[Times[Power[mass_, 2], Power[\[Mu], -2]]]] /;
   (Head[mass] === Symbol) && MemberQ[$ExoticParams, mass] &&
    MassQ[mass] :=
  StringForm["[\"log_mass\", ``, ``, ``]", MDBForm[MassToField[mass]],
    "\"\"", 2];

MDBForm[Log[Times[Power[mass_[index_], 2], Power[\[Mu], -2]]]] /;
   (Head[mass] === Symbol) && MemberQ[$ExoticParams, mass] &&
    MassQ[mass] :=
  StringForm["[\"log_mass\", ``, ``, ``]", MDBForm[MassToField[mass]],
    MDBForm[ToString[index]], 2];


Idx[x_] := Block[{stringx = ToString[x]},
   If[
    MemberQ[$FreeIndices, stringx],
    $FreeIndices = DeleteCases[$FreeIndices, stringx],
    AppendTo[$FreeIndices, stringx]
    ];
   stringx
   ];


(* Aux. functions *)
EndsWithBarQ[symbol_] :=
  If[StringEndsQ[SymbolName[symbol], "bar"], "true", "false"];
MassQ[mass_] /; (Head[mass] === Symbol) :=
  StringStartsQ[SymbolName[mass], "M"];
MassToField[mass_] /; (Head[mass] === Symbol) :=
  StringDrop[SymbolName[mass], 1];


MDBParseTerm[coeff_, fields_List, expr_] := Block[
  {$FreeIndices = {}, factors},
  factors = MDBForm[expr];
  StringForm[
   "{\"coefficient\": \"``\", \"fields\": [``], \"factors\": ``, \
\"free_indices\": [``]}",
   coeff,
   StringRiffle[fields, ","],
   factors,
   StringRiffle[MDBForm /@ $FreeIndices, ","]
   ]
  ];


(* These definitions should be run in the notebook session *)

MDBForm[g1] := "g1";
MDBForm[g2] := "g2";
MDBForm[muH] := "muH";
MDBForm[mu] := "mu";
MDBForm[lam] := "lam";
MDBForm[onelooporder] := Nothing;

MDBForm[yl] := "Ye";
MDBForm[ylbar] := "Ye";
MDBForm[yd] := "Yd";
MDBForm[ydbar] := "Yd";
MDBForm[yu] := "Yu";
MDBForm[yubar] := "Yu";


PackageExport["MDBForm"]
PackageExport["MDBParseTerm"]
