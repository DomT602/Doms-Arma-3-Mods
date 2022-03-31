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
	private _roleCurrentCount = [_role] call DT_fnc_countRole;

	_listbox lbAdd _roleName;
	private _count = (lbSize _listbox) - 1;
	_listbox lbSetData [_count,_role];
	private _colour = if (_roleCurrentCount >= _roleMaxCount) then {[1,0,0,1]} else {[0,1,0,1]};
	_listbox lbSetColor [_count,_colour];
};

_listbox lbSetCurSel 0;