<<MatchMakerParser`;

DeclareCouplings[
  {yd, {3, 3}}
, {yu, {3, 3}}
, {yl, {3, 3}}
, {ydbar, {3, 3}}
, {yubar, {3, 3}}
, {ylbar, {3, 3}}
(* Exotic *)
, {YLQS, {3, 3}}
, {YeuS, {3, 3}}
, {YLQSbar, {3, 3}}
, {YeuSbar, {3, 3}}
];

(* User should need to do this somewhere *)
DeclareExoticParams[
  YLQS
, YeuS
, YLQSbar
, YeuSbar
, MS1
];

{fileName, name, matchMakerDataPath, outputPythonFilePath} = $ScriptCommandLine;

(* Only keep matching onto physical basis *)
matchMakerData = Read[matchMakerDataPath][[-2]];

(* For now, just test with a small subset *)
matchMakerData = matchMakerData; (* [[10 ;; 20]]; *)

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
