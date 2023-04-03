/*
	File: fn_initViewDistance.sqf
	Author: Dom
	Description: Starts or stops the view distance handler
*/
params [
    ["_enable",true,[false]]
];

if (_enable) then {
	DT_viewDistance_getInMan = player addEventHandler ["GetInMan",DT_fnc_getInMan];
	DT_viewDistance_getOutMan = player addEventHandler ["GetOutMan",DT_fnc_getOutMan];
	DT_viewDistance_respawn = player addEventHandler ["Respawn",DT_fnc_getOutMan];

	DT_viewDistance_uavHandle = ["ACE_controlledUAV", {
		ACE_controlledUAV params [["_uav",objNull]];
		if (isNull _uav) then {
			[] call DT_fnc_getOutMan;
		} else {
			[player,nil,_uav] call DT_fnc_getInMan;
		};
    }] call CBA_fnc_addEventHandler;

	private _vehicle = objectParent player;
	if (isNull _vehicle) then {
		[] call DT_fnc_getOutMan;
	} else {
		[player,nil,_vehicle] call DT_fnc_getInMan;
	};
} else {
	if (isNil "DT_viewDistance_getInMan") exitWith {};
	player removeEventHandler ["getInMan",DT_viewDistance_getInMan];
	DT_viewDistance_getInMan = nil;
	player removeEventHandler ["getInMan",DT_viewDistance_getOutMan];
	DT_viewDistance_getOutMan = nil;
	player removeEventHandler ["respawn",DT_viewDistance_respawn];
	DT_viewDistance_respawn = nil;

	["ACE_controlledUAV",DT_viewDistance_uavHandle] call CBA_fnc_removeEventHandler;
	DT_viewDistance_uavHandle = nil;
};