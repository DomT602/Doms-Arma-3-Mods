/*
	File: fn_destroyCache.sqf
	Author: Dom
	Description: Creates and monitors mission to destroy a ammunition cache
*/
private _locations = DT_civLocations select {!(_x in DT_activeCivLocations)};
private _townNamespace = selectRandom _locations;

private _townCentre = getPosASL _townNamespace;
private _townName = _townNamespace getVariable ["townName",""];
private _taskAndMarkerVar = format ["destroyCache%1",_townName];

private _marker = createMarker [_taskAndMarkerVar,_townCentre];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [300,300];

[true,_taskAndMarkerVar,[format ["Intel suggests the enemy are hiding a cache of weaponry near %1, locate and destroy it.",_townName],"Destroy cache",""],_townCentre,"CREATED",1,true,"DESTROY",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _nearBuildings = [_townCentre,300] call DT_fnc_getBuildings;
private _randomBuildingPositions = (selectRandom _nearBuildings) buildingPos -1;
private _spawnPosition = selectRandom _randomBuildingPositions;

private _cacheClass = selectRandom ["Box_FIA_Ammo_F","Box_FIA_Support_F"];
private _cache = createVehicle [_cacheClass,_spawnPosition,[],0,"NONE"];
_cache addEventHandler ["Explosion",{
	params ["_vehicle","_damage"];
	if (_damage > 1) then {
		_vehicle setDamage 1;
	};
}];

private _squads = [_spawnPosition,100] call DT_fnc_createPatrols;
_squads pushBack ([_spawnPosition,75] call DT_fnc_createMortar);
_squads pushBack ([_spawnPosition,100] call DT_fnc_createStatic);
[_spawnPosition] call DT_fnc_createMines;

[
	{
		params ["_cache"];
		!alive _cache
	},
	{
		params ["","_missionVar","_locationObject","_squads"];

		[_missionVar,true] call DT_fnc_endMission;
		[_locationObject,paramsArray select 1] call DT_fnc_adjustKarma;
		[_missionVar] call DT_fnc_startNewMission;
		
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
			[getPosASL _locationObject,_squads]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_cache,_taskAndMarkerVar,_townNamespace,_squads]
] call CBA_fnc_waitUntilAndExecute;