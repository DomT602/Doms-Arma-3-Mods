/*
	File: fn_captureCommander.sqf
	Author: Dom
	Description: Creates and monitors mission to capture a local commander
*/
params [
	["_taskGiver",objNull,[objNull]],
	["_name","",[""]]
];
private _homeLocation = getPosATL _taskGiver;

private _locations = DT_civLocations select {!(_x in DT_activeCivLocations) && {_x distance _homeLocation < 5000}};
private _townNamespace = selectRandom _locations;

private _townCentre = getPosASL _townNamespace;
private _townName = _townNamespace getVariable ["DT_townName",""];
private _taskAndMarkerVar = format ["captureCommander%1",_townName];

private _marker = createMarker [_taskAndMarkerVar,_townCentre];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [500,500];

[true,_taskAndMarkerVar,[format ["A local commander, %1, has been spotted in %2, capture him and bring him back to base.",_name,_townName],format ["Capture %1",_name],""],_townCentre,"CREATED",1,true,"TARGET",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _nearBuildings = [_townCentre,500] call DT_fnc_getBuildings;
private _randomBuildingPositions = (selectRandom _nearBuildings) buildingPos -1;
private _spawnPosition = selectRandom _randomBuildingPositions;

private _officerClass = getText(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforOfficer");
private _group = createGroup [east,true];
private _officer = [_group,east,_officerClass,_spawnPosition] call DT_fnc_createUnit;
_officer setName _name;

[
	{
		params ["_officer"];
		!alive _officer || {captive _officer}
	},
	{
		params ["_officer","_taskVar"];
		if (alive _officer) then {
			[_taskVar,getPosATL arsenal_1] call BIS_fnc_taskSetDestination;
			_taskVar call BIS_fnc_taskSetCurrent;
		};
	},
	[_officer,_taskAndMarkerVar]
] call CBA_fnc_waitUntilAndExecute;

private _squads = [_spawnPosition,50] call DT_fnc_createPatrols;

[
	{
		params ["_officer","_startPosition"];
		!alive _officer || {_officer distance arsenal_1 < 50}
	},
	{
		params ["_officer","_spawnPosition","_missionVar","_locationObject","_squads"];

		if (_officer distance arsenal_1 < 50) then {
			[_missionVar,true] call DT_fnc_endMission;
			[_locationObject,paramsArray select 4] call DT_fnc_adjustKarma;
			if !(missionNamespace getVariable ["DT_opforAirDisabled",false]) then {
				[name _officer] call DT_fnc_destroyAirbase;
			};
		} else {
			[_missionVar,false] call DT_fnc_endMission;
		};

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