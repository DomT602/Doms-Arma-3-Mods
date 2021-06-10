/*
	File: fn_getOutMan.sqf
	Author: Dom
	Description: Updates to correct view distance for exiting a vehicle
*/

(profileNamespace getVariable ["DT_footViewDistance",[5000,5000,25]]) params ["_viewDistance","_objectDistance","_terrainGrid"];
setViewDistance _viewDistance;
setObjectViewDistance _objectDistance;
setTerrainGrid _terrainGrid;