/*
	File: fn_clearTown.sqf
	Author: Dom
	Description: Creates and monitors mission to clear a town
*/
private _locations = DT_civLocations select {!(_x in DT_activeCivLocations)};
private _townNamespace = selectRandom _locations;

private _townCentre = getPosASL _townNamespace;
private _townName = _townNamespace getVariable ["DT_townName",""];
private _taskAndMarkerVar = format ["clear%1",_townName];

private _marker = createMarker [_taskAndMarkerVar,_townCentre];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [300,300];

[true,_taskAndMarkerVar,[format ["%1 has been occupied by the enemy. Clear and retake the area.",_townName],format ["Liberate %1",_townName],""],_townCentre,"CREATED",1,true,"ATTACK",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _squads = [_townCentre,200,300] call DT_fnc_createPatrols;
_squads pushBack ([_townCentre,100] call DT_fnc_createMortar);
_squads pushBack ([_townCentre] call DT_fnc_createStatic);
[_townCentre] call DT_fnc_createMines;

private _units = [];
{
	_units append (units _x);
} forEach _squads;

[
	{
		params ["_units"];
		({alive _x} count _units) < 3
	},
	{
		params ["","_missionVar","_locationObject","_squads"];

		[_missionVar,true] call DT_fnc_endMission;
		[_locationObject,paramsArray select 4] call DT_fnc_adjustKarma;
		[_missionVar] call DT_fnc_startNewMission;
		
		[
			{
				params ["_pos"];
				[_pos] call DT_fnc_areaIsClear
			},
			DT_fnc_clearArea,
			[getPosASL _locationObject,_squads]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_units,_taskAndMarkerVar,_townNamespace,_squads]
] call CBA_fnc_waitUntilAndExecute;