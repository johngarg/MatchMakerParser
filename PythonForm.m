Package["MatchMakerParser`"]

Print["Subpackage PythonForm.m loaded!"]

$Kwargs = "kwargs";
$Numpy = "np.";
$L = "(";
$R = ")";

$PythonForm`Symbols = CreateDataStructure["HashSet"];
PackageExport["$PythonForm`Symbols"]

PythonFormIdx::usage = "An auxiliary function to deal with Python's 0-indexing.";
PythonFormIdx[x_Integer] := x - 1;
PythonFormIdx[x_] := PythonForm[x];

PythonForm[x_String] := "'" <> x <> "'";
PythonForm[x_List] := StringRiffle[Map[PythonForm, x], {"[", ", ", "]"}];
PythonForm[x_Integer] := ToString[x];
PythonForm[x_Association] :=
  "{" <>
      Table[
        PythonForm[ToString[i[[1]]]] <> ":" <> PythonForm[i[[2]]] <> ","
      , {i, Normal[x]}
      ] <> "}";
PythonForm[Rational[a_, b_]] := PythonForm[a] <> "/" <> PythonForm[b];
PythonForm[Times[a_, b_]] := PythonForm[a] <> " * " <> PythonForm[b];
PythonForm[Plus[a_, b__]] := $L <> StringRiffle[Map[PythonForm, List[a, b]], " + "] <> $R;
PythonForm[Power[a_, b_]] := $L <> PythonForm[a] <> $R <> "**" <> $L <> PythonForm[b] <> $R;
PythonForm[Log[x__]] := $Numpy <> "log" <> $L <> PythonForm[x] <> $R;
PythonForm[\[Pi]] := $Numpy <> "pi";
PythonForm[Global`\[Mu]] := Block[{s = "mu"}, $PythonForm`Symbols["Insert", s]; "self." <> s];
PythonForm[Free[i_]] := ToString[i];
PythonForm[y_[indices___]] := PythonForm[y] <> "[" <> StringRiffle[Map[PythonFormIdx, List[indices]], ","] <> "]";
PythonForm[KroneckerDelta[i_, j_]] := "self.kronecker_delta" <> $L <> PythonFormIdx[i] <> "," <> PythonFormIdx[j] <> $R;
PythonForm[x_] /; Head[x] === Symbol := Block[{s = ToString[x]}, $PythonForm`Symbols["Insert", s]; "self." <> s];

PackageExport["PythonForm"]
