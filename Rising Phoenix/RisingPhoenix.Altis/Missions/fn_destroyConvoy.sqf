/*
	File: fn_destroyConvoy.sqf
	Author: Dom
	Description: Creates and monitors mission to destroy a nearby convoy
*/
params [
	["_taskGiver",objNull,[objNull]]
];

private _townObject = [_taskGiver] call DT_fnc_getClosestTown;
private _townCentre = getPosASL _townObject;
private _townName = _townObject getVariable ["DT_townName",""];
private _taskAndMarkerVar = format ["destroyConvoy%1",_townName];

private _marker = createMarker [_taskAndMarkerVar,_townCentre];
_marker setMarkerColor "ColorUnknown";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [300,300];

[true,_taskAndMarkerVar,[format ["A convoy is due to pass through %1 shortly, ambush and destroy it.",_townName],"Ambush convoy",""],_townCentre,"CREATED",1,true,"MINE",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _roadPositions = (_townCentre nearRoads 1500) apply {getPosATL _x};
_roadPositions = [_roadPositions,[],{_townCentre distance _x},"DESCEND"] call BIS_fnc_sortBy;
_roadPositions params ["_spawnPos"];

private _oppositeDirection = _spawnPos getDir _townCentre;
private _oppositeArea = _townCentre getPos [1500,_oppositeDirection];
private _destinationRoadPositions = (_oppositeArea nearRoads 1500) apply {getPosATL _x};
_destinationRoadPositions = [_destinationRoadPositions,[],{_oppositeArea distance _x},"ASCEND"] call BIS_fnc_sortBy;
_destinationRoadPositions params ["_destination"];

private _squad = [_spawnPos,_townCentre,_destination] call DT_fnc_createConvoy;
private _units = units _squad;

[
	{
		params ["_units"];
		({alive _x} count _units) < 3
	},
	{
		params ["","_missionVar","_locationObject","_squad"];
		
		[_missionVar,true] call DT_fnc_endMission;
		[_locationObject,paramsArray select 4] call DT_fnc_adjustKarma;

		[
			{
				params ["_pos"];
				[_pos] call DT_fnc_areaIsClear
			},
			DT_fnc_clearArea,
			[getPosASL _locationObject,_squad]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_units,_taskAndMarkerVar,_townObject,_squad]
] call CBA_fnc_waitUntilAndExecute;