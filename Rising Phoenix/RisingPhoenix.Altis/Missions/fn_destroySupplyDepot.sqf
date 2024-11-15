/*
	File: fn_destroySupplyDepot.sqf
	Author: Dom
	Description: Creates and monitors mission to destroy a vehicle supply depot
*/
params [
	["_searchPos",[],[[]]],
	["_name","",[""]]
];

private _spawnPos = [_searchPos,750,5000,25,0,0.25,0] call BIS_fnc_findSafePos;

private _taskAndMarkerVar = "destroyVehicleDepot";
private _marker = createMarker [_taskAndMarkerVar,_spawnPos];
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerSize [300,300];

private _description = if (_name isEqualTo "") then {
	"Following a convoy ambush, we have located a supply depot which is servicing enemy vehicles. Destroy it to prevent the enemy from using heavy vehicles."
} else {
	format ["%1 revaled to us information on a supply depot which is servicing enemy vehicles. Destroy it to prevent the enemy from using heavy vehicles.",_name]
};
[true,_taskAndMarkerVar,[_description,"Destroy Supply Depot",""],_spawnPos,"CREATED",1,true,"ATTACK",true] call BIS_fnc_taskCreate;
DT_missionDetails pushBack _taskAndMarkerVar;
publicVariable "DT_missionDetails";

private _templateObjects = selectRandom (getArray(missionConfigFile >> "Compositions" >> "opforSupplyDepots"));
private _tankTypes = getArray (missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforHeavyVehicles");
_tankTypes = _tankTypes apply {if (_x isEqualType []) then {_x select 0} else {_x}};

private _objects = [];
private _objectives = [];

{
	_x params ["_class","_pos","_dir"];
	_pos = _pos vectorAdd _spawnPos;

	if (_class isEqualTo "PortableHelipadLight_01_yellow_F") then {
		private _tank = createVehicle [selectRandom _tankTypes,_pos,[],0,"NONE"];
		_tank lock 2;
		_tank setDir _dir;
		_objectives pushBack _tank;
	} else {
		private _object = createVehicle [_class,_pos,[],0,"CAN_COLLIDE"];
		_object setPosATL _pos;
		_object setVectorUp [0,0,1];
		_object setDir _dir;

		_objects pushBack _object;
	};
} forEach _templateObjects;

private _squads = [_spawnPos,50] call DT_fnc_createPatrols;
_squads pushBack ([_spawnPos,25] call DT_fnc_createMortar);
_squads pushBack ([_spawnPos,50] call DT_fnc_createStatic);

[
	{
		params ["_objectives"];
		(_objectives select {alive _x}) isEqualTo []
	},
	{
		params ["","_missionVar","_spawnPos","_squads","_objects"];

		[_missionVar,true] call DT_fnc_endMission;
		missionNamespace setVariable ["DT_opforHeaviesDisabled",true];

		[
			{
				params ["_pos"];
				[_pos] call DT_fnc_areaIsClear
			},
			DT_fnc_clearArea,
			[_spawnPos,_squads,_objects]
		] call CBA_fnc_waitUntilAndExecute;
	},
	[_objectives,_taskAndMarkerVar,_spawnPos,_squads,_objects]
] call CBA_fnc_waitUntilAndExecute;