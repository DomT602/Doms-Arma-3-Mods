/*
	File: fn_onTvSelectChange.sqf
	Author: Dom
	Description: Updates the group menu
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];
private _display = findDisplay 9701;

_selectionPath params ["_groupIndex",["_playerIndex",-1]];
DT_groupMenuSelection = [groupFromNetId (_control tvData [_groupIndex])];
if (_playerIndex isNotEqualTo -1) then {
	DT_groupMenuSelection pushBack (objectFromNetId (_control tvData _selectionPath));
};

private _editBox = _display displayCtrl 1400;
DT_groupMenuSelection params ["_group"];
_editBox ctrlSetText (groupId _group);
_editBox ctrlEnable (leader _group isEqualTo player);

private _groupArray = missionConfigFile >> "Dynamic_Groups" >> "interactions";

private _startIDC = 2399; //start - 1
for "_i" from _startIDC to (_startIDC + 9) do {
	private _button = _display displayCtrl _i;
	_button ctrlShow false;
};

for "_i" from 0 to (count _groupArray) - 1 do {
	private _currentConfig = _groupArray select _i;
	private _check = getText(_currentConfig >> "condition");

	if (call compile _check) then {
		private _action = getText(_currentConfig >> "action");
		private _title = getText(_currentConfig >> "title");
		_startIDC = _startIDC + 1;
		private _button = _display displayCtrl _startIDC;
		_button ctrlSetText _title;
		_button ctrlSetEventHandler ["buttonClick",_action];
		_button ctrlShow true;
	};
};