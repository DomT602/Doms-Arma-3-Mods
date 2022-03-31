/*
	Faction: init.sqf
	Author: Dom
	Requires: Start us up
*/

DT_arsenalBoxes = [arsenal_1];
["rifleman"] call DT_fnc_selectRole;
player addAction ["Open Role Menu",DT_fnc_initRoleMenu];
player addAction ["Open Group Menu",DT_fnc_initGroupMenu];