/*
	Faction: fn_initRoleMenu.sqf
	Author: Dom
	Requires: Starts up and populates the role menu
*/

createDialog "DT_roleMenu";

private _display = findDisplay 9700;
private _listbox = _display displayCtrl 1500;
private _rolesArray = missionConfigFile >> "Dynamic_Roles";
private _currentRole = player getVariable ["DT_role","rifleman"];

for "_i" from 0 to (count _rolesArray) - 1 do {
	private _currentConfig = _rolesArray select _i;
	private _role = configName _currentConfig;
	private _roleName = getText(_currentConfig >> "name");
	private _roleMaxCount = getNumber(_currentConfig >> "maxCount");
	private _roleCount = [_role] call DT_fnc_countRole;

	private _lbTextRight = format ["(%1/%2)",_roleCount,_roleMaxCount];

	private _index = _listbox lbAdd _roleName;
	_listbox lbSetTextRight [_index, _lbTextRight];
	_listbox lbSetData [_index,_role];
	private _alpha = if (_roleCount >= _roleMaxCount) then {0.2} else {1};
	_listbox lbSetColorRight [_index,[1,1,1,_alpha]];
};

_listbox lbSetCurSel 0;