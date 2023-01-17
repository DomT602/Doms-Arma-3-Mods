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

if (_container getVariable ["boobyTrapped",false]) then {
	_container setVariable ["boobyTrapped",nil,true];
	private _trap = selectRandom (getArray(missionConfigFile >> "Opfor_Setup" >> "opforTrapMunitions"));
	createVehicle [_trap,_container,[],0,"CAN_COLLIDE"];
};

if (_container getVariable ["carBomb",false] && {!isNull (driver _container)}) then {
	_container setVariable ["carBomb",nil,true];
	[_container] remoteExecCall ["DT_fnc_detonateCarBomb",2];
};