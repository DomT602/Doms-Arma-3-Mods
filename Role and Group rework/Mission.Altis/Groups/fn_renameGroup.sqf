/*
	File: fn_renameGroup.sqf
	Author: Dom
	Description: Renames the players group
*/
params [
	["_control",controlNull,[controlNull]],
	["_key",0,[0]]
];

if (_key in [28,156]) then {
	private _newName = ctrlText _control;
	if (_newName isEqualTo "") exitWith {"The group name cannot be blank."};
	private _filterWords = getArray(missionConfigFile >> "Dynamic_Groups" >> "group_filterWords");

	private _loweredName = toLower _newName;
	{
		if (_x in _loweredName) exitWith {
			_newName = "";
			hint "You entered a blacklisted word.";
		};
	} forEach _filterWords;
	if (_newName isEqualTo "") exitWith {closeDialog 0};

	private _group = group player;
	_group setGroupIdGlobal [_newName];
	[] remoteExecCall ["DT_fnc_updateMenuifOpen",_group];
};