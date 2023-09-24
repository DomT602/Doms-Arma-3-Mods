/*
	File: fn_spawnAmbientOpfor.sqf
	Author: Dom
	Description: Spawns ambient enemy patrols and starts the handler is required
*/
params [
	["_count",1,[0]]
];

private _locations = DT_civLocations select {!(_x in DT_activeCivLocations)};
private _vehiclesTypes = getArray(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforTroopCarriers");

for "_i" from 1 to _count do {
	private _group = [selectRandom _vehiclesTypes,getPosASL (selectRandom _locations),750,true] call DT_fnc_createVehicle;
	private _vehicle = objectParent (leader _group);
	_vehicle setVariable ["DT_isProtected",true,true];

	DT_ambientOpfor pushBack [_vehicle,_group,[0,0,0]];
};

if (DT_ambientOpforHandle isEqualTo -1) then {
	DT_ambientOpforHandle = [
		{
			if (DT_ambientOpfor isEqualTo []) exitWith {
				[_this select 1] call CBA_fnc_removePerFrameHandler;
				DT_ambientOpforHandle = -1;
			};
			
			{
				_x params ["_vehicle","_group","_lastPos"];
				if (isNull _group) then {
					DT_ambientOpfor deleteAt _forEachIndex;
					if (!isNull _vehicle && {[_unit] call DT_fnc_areaIsClear}) then {
						deleteVehicle _vehicle;
					};
				} else {
					if (playableUnits isEqualTo []) exitWith {};
					private _currentPos = getPosATL _vehicle;
					if (_lastPos distance _currentPos < 1 && {[_vehicle] call DT_fnc_areaIsClear}) then {
						private _locations = DT_civLocations select {!(_x in DT_activeCivLocations)};
						private _nearRoads = (selectRandom _locations) nearRoads 750;
						private _spawnPos = getPosATL (selectRandom _nearRoads);
						
						_vehicle setPosATL _spawnPos;
						_vehicle setDamage 0;

						{
							if (alive _x && {vehicle _x isNotEqualTo _vehicle}) then {
								_x moveInAny _vehicle;
							};
						} forEach (units _group);
					} else {
						if (waypoints _group isEqualTo []) then {
							private _position = [];
							while {_position isEqualTo []} do {
								private _nearRoads = (selectRandom DT_civLocations) nearRoads 750;
								if (_nearRoads isNotEqualTo []) then {
									_position = getPosATL (selectRandom _nearRoads);
								};
							};
							
							private _waypoint = _group addWaypoint [_position,10];
							_waypoint setWaypointType "MOVE";
							_waypoint setWaypointBehaviour "SAFE";
							_waypoint setWaypointCompletionRadius 30;
							_waypoint setWayPointStatements ["true","deleteWaypoint [group this,currentWaypoint (group this)]"];
						} else {
							if (!isNull _vehicle && {fuel _vehicle < 0.1}) then {
								[_vehicle,1] remoteExecCall ["setFuel",_vehicle];
							};
							_x set [2,_currentPos];
						};
					};
				};
			} forEachReversed DT_ambientOpfor;
		},
		15
	] call CBA_fnc_addPerFrameHandler;
};