/*
	File: fn_setupPlayer.sqf
	Author: Dom
	Description: Finishes setting up the player in their new role/group
*/
params [
	["_desiredRole","rifleman",[""]]
];

private _roleConfig = missionConfigFile >> "Dynamic_Roles" >> _desiredRole;

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