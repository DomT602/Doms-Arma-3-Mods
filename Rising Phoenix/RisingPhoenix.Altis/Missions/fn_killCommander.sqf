/*
	File: fn_killCommander.sqf
	Author: Dom
	Description: Creates and monitors mission to kill a local commander
*/
params [
	["_taskGiver",objNull,[objNull]]
];
private _homeLocation = getPosATL _taskGiver;

private _locations = DT_civLocations select {!(_x in DT_activeCivLocations) && {_x distance _homeLocation < 5000}};
private _townNamespace = selectRandom _locations;

private _townCentre = getPosASL _townNamespace;
private _townName = _townNamespace getVariable ["DT_townName",""];
private _taskAndMarkerVar = format ["killCommander%1",_townName];

private _marker = createMarker [_taskAndMarkerVar,_townCentre];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [500,500];

[true,_taskAndMarkerVar,[format ["We have information on a local commander in %1, kill him. He is likely to flee once he is engaged, make sure he cannot escape.",_townName],"Kill Commander",""],_townCentre,"CREATED",1,true,"KILL",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _nearBuildings = [_townCentre,500] call DT_fnc_getBuildings;
private _randomBuildingPositions = (selectRandom _nearBuildings) buildingPos -1;
private _spawnPosition = selectRandom _randomBuildingPositions;

private _officerClass = getText(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforOfficer");
private _group = createGroup [east,true];
private _officer = [_group,east,_officerClass,_spawnPosition] call DT_fnc_createUnit;
_officer forceSpeed 0;
_officer addEventHandler ["FiredNear",{
	params ["_unit","_firer"];

	_unit removeEventHandler [_thisEvent,_thisEventHandler];

	_unit forceSpeed -1;
	_unit setSkill ["courage",1];

	private _dir = _unit getDir _firer;
	_dir = _dir + 180;
	private _posAwayFromPlayers = _unit getPos [1500,_dir];
	private _waypointPos = [_posAwayFromPlayers,0,700,0,0,1,0,[],[_posAwayFromPlayers,_posAwayFromPlayers]] call BIS_fnc_findSafePos;

	private _group = group _unit;
	private _waypoint = _group addWaypoint [_waypointPos,0];
	_waypoint setWaypointSpeed "FULL";
	_waypoint setWaypointBehaviour "SAFE";
	_waypoint setWaypointCombatMode "YELLOW";
}];

private _squads = [_spawnPosition,50] call DT_fnc_createPatrols;

[
	{
		params ["_officer","_startPosition"];
		!alive _officer || {_officer distance _startPosition > 500}
	},
	{
		params ["_officer","_spawnPosition","_missionVar","_locationObject","_squads"];

		if (alive _officer) then {
			[_missionVar,false] call DT_fnc_endMission;

			[
				{
					params ["_unit"];
					[_unit] call DT_fnc_areaIsClear
				},
				{
					params ["_unit"];
					[group _unit] call DT_fnc_deleteGroup;
				},
				[_officer]
			] call CBA_fnc_waitUntilAndExecute;
		} else {
			[_missionVar,true] call DT_fnc_endMission;
			[_locationObject,paramsArray select 4] call DT_fnc_adjustKarma;
		};

		[
			{
				params ["_pos"];
				[_pos] call DT_fnc_areaIsClear
			},
			DT_fnc_clearArea,
			[_spawnPosition,_squads]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_officer,_spawnPosition,_taskAndMarkerVar,_townNamespace,_squads]
] call CBA_fnc_waitUntilAndExecute;