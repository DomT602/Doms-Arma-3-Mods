/*
	File: fn_initViewDistance.sqf
	Author: Dom
	Description: Starts or stops the view distance handler
*/
params [
	["_enable",true,[false]]
];

if (_enable) then {
	private _firstTimeSetup = isNil {profileNamespace getVariable "DT_footViewDistance"};
	DT_viewDistance_getInMan = player addEventHandler ["GetInMan",DT_fnc_getInMan];
	DT_viewDistance_getOutMan = player addEventHandler ["GetOutMan",DT_fnc_getOutMan];
	DT_viewDistance_respawn = player addEventHandler ["Respawn",DT_fnc_getOutMan];

	if (DT_viewDistance_isACEEnabled) then {
		DT_viewDistance_uavHandle = ["ACE_controlledUAV",{
			ACE_controlledUAV params [["_uav",objNull]];
			if (isNull _uav) then {
				[] call DT_fnc_getOutMan;
			} else {
				[player,nil,_uav] call DT_fnc_getInMan;
			};
		}] call CBA_fnc_addEventHandler;
	} else {
		DT_viewDistance_uavHandle = addMissionEventHandler ["PlayerViewChanged",{
			params ["","","","","","_uav"];

			if (isNull _uav) then {
				[] call DT_fnc_getOutMan;
			} else {
				[player,nil,_uav] call DT_fnc_getInMan;
			};
		}];
	};

	{
		private _variable = profileNamespace getVariable [_x,[5000,5000,25,0]];
		_variable params ["_viewDistance","_objectDistance","_terrainGrid"];
		if (_viewDistance > DT_viewDistanceMax) then {
			_variable set [0,DT_viewDistanceMax];
		};
		if (_objectDistance > DT_viewDistanceMax) then {
			_variable set [1,DT_viewDistanceMax];
		};
		if (_terrainGrid > DT_terrainGridMax) then {
			_variable set [2,DT_terrainGridMax];
		};
		if (count _variable isEqualTo 3) then { //needed for people who used old version
			_variable pushBack 0;
		};
		if (_firstTimeSetup) then {
			profileNamespace setVariable [_x,_variable];
		};
	} forEach [
		"DT_footViewDistance",
		"DT_shipViewDistance",
		"DT_carViewDistance",
		"DT_rotaryViewDistance",
		"DT_airViewDistance"
	];

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

	if (DT_viewDistance_isACEEnabled) then {
		["ACE_controlledUAV",DT_viewDistance_uavHandle] call CBA_fnc_removeEventHandler;
	} else {
		removeMissionEventHandler ["PlayerViewChanged",DT_viewDistance_uavHandle];
	};
	DT_viewDistance_uavHandle = nil;
};