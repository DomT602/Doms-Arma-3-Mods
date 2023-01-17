/*
	File: fn_secureUAV.sqf
	Author: Dom
	Description: Creates and monitors mission to secure a downed UAV
*/
private _locations = DT_civLocations select {!(_x in DT_activeCivLocations)};
private _townNamespace = selectRandom _locations;

private _townCentre = getPosASL _townNamespace;
private _objectivePosition = [_townCentre,500,2500,15,0,0.2,0,[]] call BIS_fnc_findSafePos;
private _townName = _townNamespace getVariable ["townName",""];
private _taskAndMarkerVar = format ["secureUAV%1",_townName];

private _markerPos = [_objectivePosition,250] call CBA_fnc_randPos;
private _marker = createMarker [_taskAndMarkerVar,_markerPos];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [500,500];

[true,_taskAndMarkerVar,["A friendly UAV has been shot down, secure its intel and then destroy it.","Secure UAV",""],_markerPos,"CREATED",1,true,"SCOUT",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _craters = [];
_craters pushBack (createVehicle ["CraterLong",_objectivePosition,[],0,"CAN_COLLIDE"]);
_craters pushBack (createVehicle ["CraterLong",(_objectivePosition getPos [6,180]),[],0,"CAN_COLLIDE"]);
_craters pushBack (createVehicle ["CraterLong",(_objectivePosition getPos [12,180]),[],0,"CAN_COLLIDE"]);

private _uav = createVehicle ["B_UAV_02_F",_objectivePosition,[],0,"CAN_COLLIDE"];
_uav attachTo [(_craters select 0),[0,-1,1]];
_uav setDamage 0.75;
_uav setVectorUp [0.5,0,1];
[_uav] remoteExecCall ["DT_fnc_downloadUAVIntel",0,_uav];

private _squads = [_objectivePosition,100,300] call DT_fnc_createPatrols;

[
	{
		params ["_uav"];
		!alive _uav
	},
	{
		params ["_uav","_missionVar","_objectivePosition","_squads","_craters"];

		if (_uav getVariable ["intelDownloaded",false]) then {
			[_missionVar,true] call DT_fnc_endMission;
		} else {
			[_missionVar,false] call DT_fnc_endMission;
		};

		[_missionVar] call DT_fnc_startNewMission;

		[
			{
				params ["_pos"];
				[_pos] call DT_fnc_areaIsClear
			},
			{
				params ["_pos","_squads","_craters"];

				{
					[_x] call DT_fnc_deleteGroup;
				} forEach _squads;

				{
					deleteVehicle _x;
				} forEach _craters;

				{
					deleteVehicle _x;
				} forEach (nearestObjects [_pos,["LandVehicle","Air","GroundWeaponHolder","WeaponHolderSimulated"],750]);
			},
			[_objectivePosition,_squads,_craters]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_uav,_taskAndMarkerVar,_objectivePosition,_squads,_craters]
] call CBA_fnc_waitUntilAndExecute;