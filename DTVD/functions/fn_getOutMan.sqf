/*
	File: fn_getOutMan.sqf
	Author: Dom
	Description: Updates to correct view distance for exiting a vehicle
*/

(profileNamespace getVariable ["DT_footViewDistance",[5000,5000,25]]) params ["_viewDistance","_objectDistance","_terrainGrid"];
if (viewDistance isNotEqualTo _viewDistance) then {
	setViewDistance _viewDistance;
};
if ((getObjectViewDistance select 0) isNotEqualTo _objectDistance) then {
	setObjectViewDistance _objectDistance;
};
if (getTerrainGrid isNotEqualTo _terrainGrid) then {
	setTerrainGrid _terrainGrid;
};