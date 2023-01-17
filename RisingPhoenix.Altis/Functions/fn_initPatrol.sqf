/*
	File: fn_initPatrol.sqf
	Author: Dom
	Description: Sets up patrolling AI
*/
params [
	["_group",grpNull,[grpNull]],
	["_position",[],[[]]],
	["_radius",150,[0]]
];

private _leader = leader _group;
if (DT_isLambsEnabled && {isNull objectParent _leader}) then {
	if (random 100 > 66) then {
		if (([_position,_radius,false] call lambs_main_fnc_findBuildings) isEqualTo []) then {
			[_group,(_position getPos [random 25,random 360]),_radius,[],true,false,-1] remoteExecCall ["lambs_wp_fnc_taskCamp",_leader];
		} else {
			[_group,_position,_radius,[],false,true,-2,false] remoteExecCall ["lambs_wp_fnc_taskGarrison",_leader];
		};
	} else {
		[_group,_position,_radius] remoteExecCall ["lambs_wp_fnc_taskPatrol",_leader];
	};
} else {
	private _waypoints = [];
	for "_i" from 0 to 5 do {
		_waypoints pushBack ([_position,_radius] call CBA_fnc_randPos);
	};

	private _lastIndex = (count _waypoints) - 1;
	{
		private _waypoint = _group addWaypoint [_x,5];

		if (_forEachIndex isEqualTo _lastIndex) then {
			_waypoint setWaypointType "CYCLE";
		} else {
			_waypoint setWaypointType "MOVE";
		};
		_waypoint setWaypointSpeed "LIMITED";
		_waypoint setWaypointBehaviour "SAFE";
		_waypoint setWaypointCombatMode "YELLOW";
	} forEach _waypoints;
};