/*
	File: fn_onGetInMan.sqf
	Author: Dom
	Description: Handles protecting vehicle from the cleanup script
*/
params ["_unit","_role","_vehicle"];

if !(_vehicle getVariable ["DT_isProtected",false]) then {
	_vehicle setVariable ["DT_isProtected",true,true];
};