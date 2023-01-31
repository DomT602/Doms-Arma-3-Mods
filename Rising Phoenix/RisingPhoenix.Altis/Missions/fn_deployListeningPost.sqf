/*
	File: fn_deployListeningPost.sqf
	Author: Dom
	Description: Creates and monitors mission to deploy a listening post in a town
*/
private _locations = DT_civLocations select {!(_x in DT_activeCivLocations)};
private _townNamespace = selectRandom _locations;

private _townCentre = getPosASL _townNamespace;
private _townName = _townNamespace getVariable ["DT_townName",""];
private _taskAndMarkerVar = format ["deployListeningPost%1",_townName];

private _marker = createMarker [_taskAndMarkerVar,_townCentre];
_marker setMarkerColor "ColorUnknown";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [150,150];

[true,_taskAndMarkerVar,[format ["Command would like a listening post deployed in %1. The post has been delivered to the logistics area, pick it up, deploy it and defend it.",_townName],"Deploy Listening Post",""],_townCentre,"CREATED",1,true,"DEFEND",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _post = createVehicle ["Land_PortableWeatherStation_01_olive_F",supplyDepot_1];
[_post,2] call ace_cargo_fnc_setSize;
[_post,true,[0,1,1]] remoteExecCall ["ace_dragging_fnc_setCarryable",0,_post];

[
	{
		params ["_post","_townCentre"];
		!alive _post || {(_post distance2D _townCentre) < 150}
	},
	{
		params ["_post","_townCentre","_missionVar"];
		if (alive _post) then {
			["The listening post is now active."] remoteExecCall ["DT_fnc_notify",0];
			private _counter = 1;
			[
				{
					params ["_args","_handle"];
					_args params ["_post","_count","_missionVar"];

					private _nearPlayers = playableUnits findIf {_x distance _post < 50};
					private _enemyCount = {side _x isEqualTo east} count (_post nearEntities ["CAManBase",30]);
					if (!alive _post || {_count mod 1200 isEqualTo 0 || {_nearPlayers isEqualTo -1 && {_enemyCount > 0}}}) exitWith {
						[_handle] call CBA_fnc_removePerFrameHandler;
						[
							{
								params ["_pos"];
								[_pos] call DT_fnc_areaIsClear
							},
							{
								params ["_pos"];
								[_pos,true] call DT_fnc_clearArea;
							},
							[getPosATL _post]
						] call CBA_fnc_waitUntilAndExecute;

						deleteVehicle _post;
						[_missionVar] call DT_fnc_startNewMission;

						if (_count mod 1200 isEqualTo 0) then {
							[_missionVar,true] call DT_fnc_endMission;
						} else {
							["The listening post was destroyed."] remoteExecCall ["DT_fnc_notify",0];
							[_missionVar,false] call DT_fnc_endMission;
						};
					};
					_args set [1,(_count + 1)];
				},
				1,
				[_post,_counter,_missionVar]
			] call CBA_fnc_addPerFrameHandler;

			private _counterAttackTime = round (120 + random 120);
			private _attackPos = getPosATL _post;
			for "_i" from 1 to 3 do {
				[DT_fnc_spawnAssault,[_attackPos],(_counterAttackTime * _i)] call CBA_fnc_waitAndExecute;
			};
		} else {
			["The listening post was destroyed."] remoteExecCall ["DT_fnc_notify",0];
			[_missionVar,false] call DT_fnc_endMission;
		};
	},
	[_post,_townCentre,_taskAndMarkerVar]
] call CBA_fnc_waitUntilAndExecute;