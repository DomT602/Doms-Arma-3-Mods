/*
	File: fn_destroyAA.sqf
	Author: Dom
	Description: Creates and monitors mission to destroy an AA emplacement
*/

private _halfWorldSize = worldSize / 2;
private _spawnPos = [[_halfWorldSize,_halfWorldSize],0,-1,25,0,0.4,0] call BIS_fnc_findSafePos;

private _taskAndMarkerVar = "destroyAA";
private _marker = createMarker [_taskAndMarkerVar,_spawnPos];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [300,300];

[true,_taskAndMarkerVar,["The enemy has setup an AA site, destroy it.","Destroy AA",""],_spawnPos,"CREATED",1,true,"ATTACK",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _templateObjects = selectRandom (getArray(missionConfigFile >> "Compositions" >> "opforAASites"));
private _AATypes = getArray (missionConfigFile >> "Opfor_Setup" >> "opforAAVehicles");
private _objects = [];
private _objectives = [];

{
	_x params ["_class","_pos","_dir"];
	_pos = _pos vectorAdd _spawnPos;
	private _object = createVehicle [_class,_pos,[],0,"CAN_COLLIDE"];
	_object setPosATL _pos;
	_object setVectorUp [0,0,1];
	_object setDir _dir;

	_objects pushBack _object;

	if (_class isEqualTo "PortableHelipadLight_01_yellow_F") then {
		private _aaVeh = createVehicle [selectRandom _AATypes,_pos,[],0,"NONE"];
		createVehicleCrew _aaVeh;
		(driver _aaVeh) disableAI "MOVE";
		_aaVeh lock 3;
		_aaVeh setDir _dir;
		_objectives pushBack _aaVeh;
	};
} forEach _templateObjects;

private _squads = [_spawnPos,50] call DT_fnc_createPatrols;
_squads pushBack ([_spawnPos,25] call DT_fnc_createMortar);

[
	{
		params ["_objectives"];
		(_objectives select {alive _x}) isEqualTo []
	},
	{
		params ["","_missionVar","_spawnPos","_squads","_objects"];
		
		[_missionVar,true] call DT_fnc_endMission;
		["destroyAA"] call DT_fnc_startSideMission;

		[
			{
				params ["_pos"];
				[_pos] call DT_fnc_areaIsClear
			},
			{
				params ["_pos","_squads","_objects"];

				{
					[_x] call DT_fnc_deleteGroup;
				} forEach _squads;

				{
					deleteVehicle _x;
				} forEach _objects;

				{
					deleteVehicle _x;
				} forEach (nearestObjects [_pos,["LandVehicle","Air","GroundWeaponHolder","WeaponHolderSimulated"],750]);
			},
			[_spawnPos,_squads,_objects]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_objectives,_taskAndMarkerVar,_spawnPos,_squads,_objects]
] call CBA_fnc_waitUntilAndExecute;