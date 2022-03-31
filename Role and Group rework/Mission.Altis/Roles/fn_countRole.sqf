/*
	Faction: fn_countRole.sqf
	Author: Dom
	Requires: Counts the number of players as a certain role
*/
params [
	["_roleToCount","",[""]]
];

{
	(_x getVariable ["DT_role","rifleman"]) isEqualTo _roleToCount;
} count allPlayers;