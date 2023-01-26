/*
	File: fn_onInventoryOpened.sqf
	Author: Dom
	Description: Called when the player opens their inventory
*/
params [
	["_unit",objNull,[objNull]],
	["_container",objNull,[objNull]],
	["_secContainer",objNull,[objNull]]
];

if (_container getVariable ["DT_boobyTrapped",false]) then {
	_container setVariable ["DT_boobyTrapped",nil,true];
	private _trap = selectRandom (getArray(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforTrapMunitions"));
	createVehicle [_trap,_container,[],0,"CAN_COLLIDE"];
};

if (_container getVariable ["DT_carBomb",false] && {!isNull (driver _container)}) then {
	_container setVariable ["DT_carBomb",nil,true];
	[_container] remoteExecCall ["DT_fnc_detonateCarBomb",2];
};