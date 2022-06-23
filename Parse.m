<<MatchMakerParser`;

{fileName, name, matchMakerDataPath, outputPythonFilePath, configFilePath} = $ScriptCommandLine;

(* Evaluate config file *)
Get[configFilePath];

(* Output Python file *)
MatchMakerToPython[name, matchMakerDataPath, outputPythonFilePath];
