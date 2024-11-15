/*
	File: fn_secureIntel.sqf
	Author: Dom
	Description: Creates and monitors mission to secure intel
*/
private _locations = DT_civLocations select {!(_x in DT_activeCivLocations)};
private _townNamespace = selectRandom _locations;

private _townCentre = getPosASL _townNamespace;
private _townName = _townNamespace getVariable ["DT_townName",""];
private _taskAndMarkerVar = format ["secureIntel%1",_townName];

private _marker = createMarker [_taskAndMarkerVar,_townCentre];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [300,300];

[true,_taskAndMarkerVar,[format ["Our sources indiciate an intelligence stash near %1, locate and bring it back to base.",_townName],"Secure intel",""],_townCentre,"CREATED",1,true,"SEARCH",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _nearBuildings = [_townCentre,300] call DT_fnc_getBuildings;
private _randomBuildingPositions = (selectRandom _nearBuildings) buildingPos -1;
private _spawnPosition = selectRandom _randomBuildingPositions;

private _laptopClasses = ["Land_laptop_03_closed_sand_F","Land_laptop_03_closed_black_F","Land_laptop_03_closed_olive_F"];
private _laptop = createVehicle [selectRandom _laptopClasses,_spawnPosition];
[_laptop,1] call ace_cargo_fnc_setSize;
[_laptop,true,[0,1,1]] remoteExecCall ["ace_dragging_fnc_setCarryable",0,_laptop];

private _squads = [_spawnPosition,100] call DT_fnc_createPatrols;
_squads pushBack ([_spawnPosition,75] call DT_fnc_createMortar);
[_spawnPosition] call DT_fnc_createMines;

[
	{
		params ["_laptop"];
		!alive _laptop || {_laptop distance arsenal_1 < 50}
	},
	{
		params ["_laptop","_missionVar","_locationObject","_squads"];

		if (alive _laptop) then {
			[_missionVar,true] call DT_fnc_endMission;
			[_locationObject,paramsArray select 4] call DT_fnc_adjustKarma;
			if (33 > random 100) then {
				private _missions = [
					["The intel had details of an upcoming attack on a town in the region.",DT_fnc_defendTown],
					["The intel had details on a commander in the region.",DT_fnc_killCommander]
				];
				(selectRandom _missions) params ["_message","_code"];

				[_message] remoteExecCall ["DT_fnc_notify",0];
				[_locationObject] call _code;
			};
		} else {
			[_missionVar,false] call DT_fnc_endMission;
		};

		[_missionVar] call DT_fnc_startNewMission;

		[
			{
				params ["_laptop"];
				[_laptop] call DT_fnc_areaIsClear
			},
			{
				params ["_laptop"];
				deleteVehicle _laptop;
			},
			[_laptop]
		] call CBA_fnc_waitUntilAndExecute;

		[
			{
				params ["_pos"];
				[_pos] call DT_fnc_areaIsClear
			},
			DT_fnc_clearArea,
			[getPosASL _locationObject,_squads]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_laptop,_taskAndMarkerVar,_townNamespace,_squads]
] call CBA_fnc_waitUntilAndExecute;