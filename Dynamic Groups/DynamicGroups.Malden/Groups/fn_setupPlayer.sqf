/*
	File: fn_setupPlayer.sqf
	Author: Dom
	Description: Finishes setting up the player in their new role/group
*/
params [
	["_desiredRole","rifleman",[""]],
	["_isRespawn",false,[true]],
	["_team","",[""]]
];

private _roleConfig = missionConfigFile >> "Dynamic_Roles" >> _desiredRole;
private _defaultLoadout = getArray(_roleConfig >> "defaultLoadout");

if (_isRespawn) then {
	player setUnitLoadout (missionNamespace getVariable ["DT_savedLoadout",_defaultLoadout]);
	player assignTeam _team;
} else {
	DT_savedLoadout = _defaultLoadout;
	player setUnitLoadout _defaultLoadout;
	
	private _weapons = getArray(_roleConfig >> "arsenalWeapons");
	_weapons append getArray(missionConfigFile >> "Common_Arsenal" >> "weapons");
	private _magazines = getArray(_roleConfig >> "arsenalMagazines");
	_magazines append getArray(missionConfigFile >> "Common_Arsenal" >> "magazines");
	private _items = getArray(_roleConfig >> "arsenalItems");
	_items append getArray(missionConfigFile >> "Common_Arsenal" >> "items");
	private _backpacks = getArray(_roleConfig >> "arsenalBackpacks");
	_backpacks append getArray(missionConfigFile >> "Common_Arsenal" >> "backpacks");

	if (DT_isACEEnabled) then {
		[player,true,false] call ace_arsenal_fnc_removeVirtualItems;
		{
			[player,_x,false] call ace_arsenal_fnc_addVirtualItems;
		} forEach [_weapons,_magazines,_items,_backpacks];
		private _roleName = getText(_roleConfig >> "name");
		[_roleName,_defaultLoadout] call ace_arsenal_fnc_addDefaultLoadout;
	} else {
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
	};

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
		_x params ["_trait","_value",["_custom","false"]];
		if (_value isEqualTo "true") then {_value = true} else {if (_value isEqualTo "false") then {_value = false}};
		player setUnitTrait [_trait,_value,call compile _custom];
	} forEach _roleTraits;

	private _customVariables = getArray(_roleConfig >> "customVariables");
	{
		player setVariable [_x,nil,true];
	} forEach (missionNamespace getVariable ["DT_myCustomVariables",[]]);

	DT_myCustomVariables = [];
	{
		_x params ["_variable","_value","_global"];
		player setVariable [_variable,_value,call compile _global];
		DT_myCustomVariables pushBack _variable;
	} forEach _customVariables;

	player setVariable ["DT_role",_desiredRole,true];
};