Package["MatchMakerParser`"]

Print["Subpackage PythonForm.m loaded!"]

$Kwargs = "kwargs";
$Numpy = "np.";
$L = "(";
$R = ")";

$PythonForm`Symbols = CreateDataStructure["HashSet"];
PackageExport["$PythonForm`Symbols"]

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
PythonForm[Global`\[Mu]] := Block[{s = "mu"}, $PythonForm`Symbols["Insert", s]; "self." <> s];
PythonForm[Free[i_]] := ToString[i];

(* TODO Need to generalise these to cases of more than two indices *)
(* TODO Fix up the 0 indexing better! *)
PythonForm[y_[i_,j_]] /; MemberQ[Keys[$Couplings], y] := PythonForm[y] <> "[" <> PythonForm[i] <> "," <> PythonForm[j] <> "]";
PythonForm[y_[i_Integer,j_Integer]] /; MemberQ[Keys[$Couplings], y] := PythonForm[y] <> "[" <> PythonForm[i-1] <> "," <> PythonForm[j-1] <> "]";
PythonForm[y_[i_Integer,j_]] /; MemberQ[Keys[$Couplings], y] := PythonForm[y] <> "[" <> PythonForm[i-1] <> "," <> PythonForm[j] <> "]";
PythonForm[y_[i_,j_Integer]] /; MemberQ[Keys[$Couplings], y] := PythonForm[y] <> "[" <> PythonForm[i] <> "," <> PythonForm[j-1] <> "]";

PythonForm[y_[i_,j_]] := PythonForm[y] <> "[" <> PythonForm[i] <> "," <> PythonForm[j] <> "]";

(* TODO Fix up the 0 indexing better! *)
PythonForm[KroneckerDelta[i_Integer, j_Integer]] := "self.kronecker_delta" <> $L <> PythonForm[i-1] <> "," <> PythonForm[j-1] <> $R;
PythonForm[KroneckerDelta[i_Integer, j_]] := "self.kronecker_delta" <> $L <> PythonForm[i-1] <> "," <> PythonForm[j] <> $R;
PythonForm[KroneckerDelta[i_, j_Integer]] := "self.kronecker_delta" <> $L <> PythonForm[i] <> "," <> PythonForm[j-1] <> $R;
PythonForm[KroneckerDelta[i_, j_]] := "self.kronecker_delta" <> $L <> PythonForm[i] <> "," <> PythonForm[j] <> $R;

PythonForm[x_] /; Head[x] === Symbol := Block[{s = ToString[x]}, $PythonForm`Symbols["Insert", s]; "self." <> s];

PackageExport["PythonForm"]
