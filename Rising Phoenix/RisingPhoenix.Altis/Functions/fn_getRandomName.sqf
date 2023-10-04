/*
	File: fn_getRandomName.sqf
	Author: Dom
	Requires: Gets a random name utilising names which AI can use
*/
params [
	["_class","",[""]]
];

private _factionNameType = getText (configfile >> "CfgVehicles" >> _class >> "genericNames");
private _firstNames = configfile >> "CfgWorlds" >> "GenericNames" >> _factionNameType >> "FirstNames";
private _firstNamesCount = (count _firstNames) - 1;
private _name = getText (_firstNames select round (random _firstNamesCount));

private _lastNames = configfile >> "CfgWorlds" >> "GenericNames" >> _factionNameType >> "LastNames";
private _lastNamesCount = (count _lastNames) - 1;
_name = format ["%1 %2",_name,getText (_lastNames select round (random _lastNamesCount))];

_name