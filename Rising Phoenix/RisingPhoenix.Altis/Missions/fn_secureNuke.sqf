/*
	File: fn_secureNuke.sqf
	Author: Dom
	Description: Creates and monitors final mission to secure a nuke before it explodes
*/

private _halfWorldSize = worldSize / 2;
private _spawnPos = [[_halfWorldSize,_halfWorldSize],0,-1,25,0,0.3,0] call BIS_fnc_findSafePos;

private _taskAndMarkerVar = "secureNuke";
private _marker = createMarker [_taskAndMarkerVar,_spawnPos];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [500,500];

[true,_taskAndMarkerVar,["The enemy have setup a dirty bomb, defuse it before it detonates!","Secure Nuke",""],_spawnPos,"CREATED",1,true,"DANGER",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

[_spawnPos,100,300] call DT_fnc_createPatrols;
[_spawnPos,100,300] call DT_fnc_createPatrols;
[_spawnPos,50] call DT_fnc_createMortar;
[_spawnPos,50] call DT_fnc_createStatic;
[_spawnPos] call DT_fnc_createMines;

private _bunker = createVehicle ["Land_Bunker_01_HQ_F",_spawnPos];
private _nuke = createVehicle ["Land_Device_assembled_F",_spawnPos];
_nuke attachTo [_bunker,[1.5,0,-0.5]];
[_nuke] remoteExecCall ["DT_fnc_defuseNuke",0,_nuke];

[
	{
		params ["_nuke"];
		_nuke getVariable ["DT_defused",false]
	},
	{
		params ["_nuke","_missionVar"];

		["The Nuclear Weapon was defused."] remoteExecCall ["DT_fnc_notify",0];
		[_missionVar,true] call DT_fnc_endMission;
		[{["end1",true] remoteExecCall ["BIS_fnc_endMission",0]},[],30] call CBA_fnc_waitAndExecute;
	},
	[_nuke,_taskAndMarkerVar],
	900 + random 900,
	{
		params ["_nuke","_missionVar"];

		[getPosASL _nuke,3000,300,true] remoteExecCall ["zen_modules_fnc_moduleNukeLocal",0];
		[_missionVar,false] call DT_fnc_endMission;
		[{["end1",false] remoteExecCall ["BIS_fnc_endMission",0]},[],30] call CBA_fnc_waitAndExecute;
	}
] call CBA_fnc_waitUntilAndExecute;