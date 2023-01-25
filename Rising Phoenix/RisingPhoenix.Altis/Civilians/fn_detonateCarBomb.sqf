/*
	File: fn_detonateCarBomb.sqf
	Author: Dom
	Description: Handles the explosion and attempts to run the civilian away from the vehicle
*/
params [
	["_vehicle",objNull,[objNull]]
];

private _driver = driver _vehicle;
private _group = group _driver;
_group leaveVehicle _vehicle;
[_group] call CBA_fnc_clearWaypoints;

private _randomPosition = _driver getPos [50,random 360];
_driver setBehaviour "CARELESS";
_driver setCombatMode "BLUE";
_driver setUnitPos "UP";
_driver disableAI "AUTOCOMBAT";
_driver setSpeedMode "FULL";
_driver doMove _randomPosition;

[
	{
		params ["_unit","_vehicle"];
		!alive _unit || {_unit distance _vehicle > 15 || {captive _unit}}
	},
	{
		params ["_unit","_vehicle"];

		if (alive _unit && {!(captive _unit)}) then {
			if ("DemoCharge_Remote_Mag" in magazineCargo _vehicle) then {
				private _bomb = createVehicle ["DemoCharge_Remote_Ammo_Scripted",_vehicle,[],0,"CAN_COLLIDE"];
				_bomb setDamage 1;
			};
		};
	},
	[_driver,_vehicle],
	5,
	{
		params ["_unit","_vehicle"];

		if (alive _unit && {!(captive _unit)}) then {
			if ("DemoCharge_Remote_Mag" in magazineCargo _vehicle) then {
				private _bomb = createVehicle ["DemoCharge_Remote_Ammo_Scripted",_vehicle,[],0,"CAN_COLLIDE"];
				_bomb setDamage 1;
			};
		};
	}
] call CBA_fnc_waitUntilAndExecute;