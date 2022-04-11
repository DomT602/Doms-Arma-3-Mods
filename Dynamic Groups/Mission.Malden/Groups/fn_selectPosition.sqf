/*
	File: fn_selectPosition.sqf
	Author: Dom
	Description: Selects the position in the group
*/

private _display = findDisplay 9702;
private _tree = _display displayCtrl 1500;
private _selectionPath = tvCurSel _tree;
private _oldGroup = group player;

_selectionPath params ["_groupIndex","_unitIndex"];

(parseSimpleArray (_tree tvData _selectionPath)) params ["_unitNetID","_desiredRole"];
private _unit = objectFromNetId _unitNetID;
if !(isNull _unit) exitWith {}; //role selected already

closeDialog 0;

private _roleConfig = missionConfigFile >> "Dynamic_Roles" >> _desiredRole;

private _roleRank = getText(_roleConfig >> "rank");
player setUnitRank _roleRank;

private _roleTraits = getArray(_roleConfig >> "traits");
{
	_x params ["_trait","_value"];
	if (_value isEqualType true && {_value}) then {
		player setUnitTrait [_trait,false];
	};
} forEach (getAllUnitTraits player);

{
	_x params ["_trait","_value",["_custom",false]];
	if (_value isEqualTo "true") then {_value = true} else {if (_value isEqualTo "false") then {_value = false}};
	player setUnitTrait [_trait,_value,_custom];
} forEach _roleTraits;

player setUnitLoadout getArray(_roleConfig >> "defaultLoadout");
private _weapons = getArray(_roleConfig >> "arsenalWeapons");
_weapons append getArray(missionConfigFile >> "Common_Arsenal" >> "weapons");
private _magazines = getArray(_roleConfig >> "arsenalMagazines");
_magazines append getArray(missionConfigFile >> "Common_Arsenal" >> "magazines");
private _items = getArray(_roleConfig >> "arsenalItems");
_items append getArray(missionConfigFile >> "Common_Arsenal" >> "items");
private _backpacks = getArray(_roleConfig >> "arsenalBackpacks");
_backpacks append getArray(missionConfigFile >> "Common_Arsenal" >> "backpacks");

{
	[_x,(_x call BIS_fnc_getVirtualWeaponCargo)] call BIS_fnc_removeVirtualWeaponCargo;
	[_x,_weapons,false,false] call BIS_fnc_addVirtualWeaponCargo;

	[_x,(_x call BIS_fnc_getVirtualMagazineCargo)] call BIS_fnc_removeVirtualMagazineCargo;
	[_x,_magazines,false,false] call BIS_fnc_addVirtualMagazineCargo;

	[_x,(_x call BIS_fnc_getVirtualItemCargo)] call BIS_fnc_removeVirtualItemCargo;
	[_x,_items,false,false] call BIS_fnc_addVirtualItemCargo;

	[_x,(_x call BIS_fnc_getVirtualBackpackCargo)] call BIS_fnc_removeVirtualBackpackCargo;
	[_x,_backpacks,false,true] call BIS_fnc_addVirtualBackpackCargo;
} forEach DT_arsenalBoxes;

private _oldSelectionPath = [player] call DT_fnc_removeFromGroup;

private _groupToUpdate = DT_dynamicGroups select _groupIndex;
private _selectedGroup = _groupToUpdate select 3;
if (isNull _selectedGroup) then {
	_selectedGroup = createGroup [playerSide,true];
	_selectedGroup setGroupIdGlobal [_groupToUpdate select 0];
	_groupToUpdate set [3,_selectedGroup];
};
[player] joinSilent _selectedGroup;

private _unitsInGroup = _groupToUpdate select 4;
_unitsInGroup set [_unitIndex,player];
_groupToUpdate set [4,_unitsInGroup];
DT_dynamicGroups set [_groupIndex,_groupToUpdate];

[DT_dynamicGroups,_oldSelectionPath,_selectionPath,player] remoteExecCall ["DT_fnc_updateGroups",0,"DT_DG_JIP"];