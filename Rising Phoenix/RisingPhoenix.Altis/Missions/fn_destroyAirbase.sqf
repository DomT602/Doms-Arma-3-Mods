/*
	File: fn_destroyAirbase.sqf
	Author: Dom
	Description: Creates and monitors mission to destroy an airbase following a successful commander capture
*/
params [
	["_name","",[""]]
];

private _airports = DT_airportLocations select {[_x select 0] call DT_fnc_areaIsClear};
if (_airports isEqualTo []) exitWith {};
(selectRandom _airports) params ["_airportPos","_airportDir"];

private _taskAndMarkerVar = "destroyAirbase";
private _marker = createMarker [_taskAndMarkerVar,_airportPos];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [300,300];

[true,_taskAndMarkerVar,[format ["%1 revealed to us information about an enemy airbase, destroy any helicopters and munitions to prevent the enemy calling in air support.",_name],"Destroy airbase",""],_airportPos,"CREATED",1,true,"ATTACK",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _templateObjects = selectRandom (getArray(missionConfigFile >> "Compositions" >> "opforAirbases"));
private _heliTypes = getArray (missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforAttackHelicopters");
_heliTypes = _heliTypes apply {if (_x isEqualType []) then {_x select 0} else {_x}};
private _objects = [];
private _objectives = [];

{
	_x params ["_class","_pos","_dir"];
	_pos = _pos vectorAdd _airportPos;
	private _object = createVehicle [_class,_pos,[],0,"CAN_COLLIDE"];
	_object setPosATL _pos;
	_object setVectorUp [0,0,1];
	_object setDir _dir;

	_objects pushBack _object;

	if (_class isEqualTo "Land_Bomb_Trolley_01_F") then {
		[_object] remoteExecCall ["DT_fnc_rigToExplode",0,_object];
		_objectives pushBack _object;
	} else {
		if (_class in ["Land_HelipadCircle_F","Land_HelipadSquare_F","Land_HelipadRescue_F"]) then {
			private _helicopter = createVehicle [selectRandom _heliTypes,_pos,[],0,"NONE"];
			_helicopter lock 2;
			_helicopter setDir _dir;
			_objectives pushBack _helicopter;
		};
	};
} forEach _templateObjects;

private _squads = [_airportPos,50] call DT_fnc_createPatrols;
_squads pushBack ([_airportPos,25] call DT_fnc_createMortar);
_squads pushBack ([_airportPos,50] call DT_fnc_createStatic);

[
	{
		params ["_objectives"];
		(_objectives select {alive _x}) isEqualTo []
	},
	{
		params ["","_missionVar","_airportPos","_squads","_objects"];

		[_missionVar,true] call DT_fnc_endMission;
		missionNamespace setVariable ["DT_opforAirDisabled",true];

		[
			{
				params ["_pos"];
				[_pos] call DT_fnc_areaIsClear
			},
			DT_fnc_clearArea,
			[_airportPos,_squads,_objects]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_objectives,_taskAndMarkerVar,_airportPos,_squads,_objects]
] call CBA_fnc_waitUntilAndExecute;