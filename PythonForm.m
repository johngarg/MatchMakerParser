Package["MatchMakerParser`"]

Print["Subpackage PythonForm.m loaded!"]

$Kwargs = "kwargs";
$Numpy = "np.";
$L = "(";
$R = ")";

$MatchMakerParser`PythonForm`Symbols = CreateDataStructure["HashSet"];

PythonForm[x_String] := "'" <> x <> "'";
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
PythonForm[y_[i_,j_]] := PythonForm[y] <> "[" <> PythonForm[i] <> "," <> PythonForm[j] <> "]";
(* PythonForm[x_] /; Head[x] === Symbol := $Kwargs <> "[" <> PythonForm[ToString[x]] <> "]"; *)
PythonForm[x_] /; Head[x] === Symbol := Block[{s = ToString[x]}, $PythonForm`Symbols["Insert", s]; s];

PackageExport["$MatchMakerParser`PythonForm`Symbols"]
