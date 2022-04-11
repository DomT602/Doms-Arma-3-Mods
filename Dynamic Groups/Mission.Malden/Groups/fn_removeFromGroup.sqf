/*
	File: fn_removeFromGroup.sqf
	Author: Dom
	Description: Remove desired unit from a group
*/
params [
	["_unit",objNull,[objNull]]
];

private _oldGroup = group _unit;
private _oldSelectionPath = [];

private _oldGroupIndexToUpdate = DT_dynamicGroups findIf {_x select 3 isEqualTo _oldGroup};
if (_oldGroupIndexToUpdate isNotEqualTo -1) then {
	private _oldGroupToUpdate = DT_dynamicGroups select _oldGroupIndexToUpdate;
	private _oldUnitsInGroup = _oldGroupToUpdate select 4;
	private _oldUnitIndex = _oldUnitsInGroup find _unit;
	_oldUnitsInGroup set [_oldUnitIndex,objNull];
	_oldGroupToUpdate set [4,_oldUnitsInGroup];
	DT_dynamicGroups set [_oldGroupIndexToUpdate,_oldGroupToUpdate];
	_oldSelectionPath = [_oldGroupIndexToUpdate,_oldUnitIndex];
};

_oldSelectionPath