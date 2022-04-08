/*
	Faction: fn_updateRoleMenu.sqf
	Author: Dom
	Requires: Updates the role menu once role has been switched by another player
*/
params [
	["_newRole","",[""]],
	["_oldRole","",[""]]
];

private _display = findDisplay 9700;
if (isNull _display) exitWith {};
private _listbox = _display displayCtrl 1500;
private _listboxSize = lbSize _listbox;

private _newIndex = -1;
private _oldIndex = -1;
for "_i" from 0 to (_listboxSize - 1) do {
	private _text = _listbox lbText _i;
	if (_text isEqualTo _newRole) then {
		_newIndex = _i;
	} else {
		if (_text isEqualTo _oldRole) then {
			_oldIndex = _i;
		};
	};
};

{
	_x params ["_role","_index"];

	if (_index isNotEqualTo -1) then {
		private _roleCount = [_role] call DT_fnc_countRole;
		private _roleMaxCount = getNumber(missionConfigFile >> "Dynamic_Roles" >> _role >> "maxCount");
		private _alpha = if (_roleCount >= _roleMaxCount) then {0.2} else {1};

		_listbox lbSetTextRight [_index,format["(%1/%2)",_roleCount,_roleMaxCount]];
		_listbox lbSetColorRight [_index,[1,1,1,_alpha]];
	};
} forEach [[_newRole,_newIndex],[_oldRole,_oldIndex]];