/*
	Faction: initServer.sqf
	Author: Dom
	Requires: Start the server up
*/

addMissionEventHandler ["HandleDisconnect",{_this call DT_fnc_handleDisconnect}];