/*
	File: fn_clearTown.sqf
	Author: Dom
	Description: Creates and monitors mission to defend a town
*/
params [
	["_taskGiver",objNull,[objNull]]
];
private _homeLocation = getPosATL _taskGiver;

private _locations = DT_civLocations select {!(_x in DT_activeCivLocations) && {_x distance _homeLocation < 5000}};
private _townNamespace = selectRandom _locations;

private _townCentre = getPosASL _townNamespace;
private _townName = _townNamespace getVariable ["townName",""];
private _taskAndMarkerVar = format ["defend%1",_townName];

private _marker = createMarker [_taskAndMarkerVar,_townCentre];
_marker setMarkerColor "ColorUnknown";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [300,300];

[true,_taskAndMarkerVar,[format ["An enemy attack is incoming at %1, defend it.",_townName],format ["Defend %1",_townName],""],_townCentre,"CREATED",1,true,"DEFEND",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

[
	{
		params ["_pos"];
		!([_pos,500] call DT_fnc_areaIsClear)
	},
	{
		params ["_townCentre","_taskAndMarkerVar","_townNamespace"];
		private _squads = [_townCentre] call DT_fnc_spawnAssault;

		private _units = [];
		{
			_units append (units _x);
		} forEach _squads;

		[
			{
				params ["_units","_pos"];
				({alive _x} count _units) < 3 || {[_pos,300] call DT_fnc_areaIsClear}
			},
			{
				params ["_units","_pos","_missionVar","_locationObject","_squads"];

				if (({alive _x} count _units) < 3) then {
					[_missionVar,true] call DT_fnc_endMission;
					[_locationObject,(paramsArray select 1) * 2] call DT_fnc_adjustKarma;
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
					[_pos,_squads]
				] call CBA_fnc_waitUntilAndExecute;
			},
			[_units,_townCentre,_taskAndMarkerVar,_townNamespace,_squads]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_townCentre,_taskAndMarkerVar,_townNamespace]
] call CBA_fnc_waitUntilAndExecute;