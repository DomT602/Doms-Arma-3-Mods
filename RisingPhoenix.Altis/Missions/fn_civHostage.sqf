/*
	File: fn_civHostage.sqf
	Author: Dom
	Description: Creates and monitors mission to rescue a civilian hostage
*/
params [
	["_taskGiver",objNull,[objNull]]
];
private _homeLocation = getPosATL _taskGiver;

private _locations = DT_civLocations select {!(_x in DT_activeCivLocations) && {_x distance _homeLocation < 5000}};
private _townNamespace = selectRandom _locations;

private _townCentre = getPosASL _townNamespace;
private _townName = _townNamespace getVariable ["townName",""];
private _taskAndMarkerVar = format ["hostageRescue%1",_townName];

private _marker = createMarker [_taskAndMarkerVar,_townCentre];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [300,300];

[true,_taskAndMarkerVar,[format ["A local civilian has been kidnapped and is held in %1, rescue him and take him back home.",_townName],"Rescue civilian",""],_townCentre,"CREATED",1,true,"MEET",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _nearBuildings = [_townCentre,300] call DT_fnc_getBuildings;
private _randomBuildingPositions = (selectRandom _nearBuildings) buildingPos -1;
private _spawnPosition = selectRandom _randomBuildingPositions;

private _civTypes = getArray(missionConfigFile >> "Civilian_Setup" >> "civilianTypes");
private _group = createGroup [civilian,true];
private _hostage = _group createUnit [selectRandom _civTypes,_spawnPosition,[],0,"NONE"];
[_hostage,true] call ACE_captives_fnc_setHandcuffed;


[
	{
		params ["_hostage"];
		!alive _hostage || {!([_hostage,10] call DT_fnc_areaIsClear)}
	},
	{
		params ["_hostage","_taskVar","_newDestination"];
		if (alive _hostage) then {
			[_taskVar,_newDestination] call BIS_fnc_taskSetDestination;
			_taskVar call BIS_fnc_taskSetCurrent;
		};
	},
	[_hostage,_taskAndMarkerVar,_homeLocation]
] call CBA_fnc_waitUntilAndExecute;

private _squads = [_spawnPosition,50] call DT_fnc_createPatrols;
[_spawnPosition] call DT_fnc_createMines;

[
	{
		params ["_hostage","_homeLocation"];
		!alive _hostage || {_hostage distance _homeLocation < 150}
	},
	{
		params ["_hostage","","_missionVar","_locationObject","_squads","_oldLocation"];

		if (alive _hostage) then {
			[_missionVar,true] call DT_fnc_endMission;
			[_locationObject,(paramsArray select 1) * 2] call DT_fnc_adjustKarma;

			[
				{
					params ["_unit"];
					[_unit] call DT_fnc_areaIsClear
				},
				{
					params ["_unit"];
					[group _unit] call DT_fnc_deleteGroup;
				},
				[_hostage]
			] call CBA_fnc_waitUntilAndExecute;
		} else {
			[_missionVar,false] call DT_fnc_endMission;
		};

		[
			{
				params ["_pos"];
				[_pos] call DT_fnc_areaIsClear
			},
			{
				params ["_pos","_squads"];

				{
					[_x] call DT_fnc_deleteGroup;
				} forEach _squads;

				{
					deleteVehicle _x;
				} forEach (nearestObjects [_pos,["LandVehicle","Air","GroundWeaponHolder","WeaponHolderSimulated"],750]);
			},
			[_oldLocation,_squads]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_hostage,_homeLocation,_taskAndMarkerVar,_townNamespace,_squads,_spawnPosition]
] call CBA_fnc_waitUntilAndExecute;