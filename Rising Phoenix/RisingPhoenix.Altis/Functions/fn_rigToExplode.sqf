/*
	File: fn_rigToExplode.sqf
	Author: Dom
	Description: Adds ACE action to rig a trolley to explode
*/
params [
	["_object",objNull,[objNull]]
];

private _action = [
	"rigItem",
	"Rig to explode",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\destroy_ca.paa",
	{
		["The bombs are rigged to explode in 30 seconds, get clear!"] call DT_fnc_notify;
		[
			{
				params ["_target"];
				createVehicle ["Bo_GBU12_LGB",_target];
				deleteVehicle _target;
			},
			_target,
			30
		] call CBA_fnc_waitAndExecute;
	},
	{alive _target}
] call ace_interact_menu_fnc_createAction;
[_object,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;