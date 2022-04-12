/*
	Faction: initPlayerLocal.sqf
	Author: Dom
	Requires: Start us up
*/

DT_arsenalBoxes = [arsenal_1];
["rifleman"] call DT_fnc_selectRole;
["rifleman"] remoteExecCall ["DT_fnc_updateRoleMenu",-2];

player addAction ["Open Role Menu",DT_fnc_initRoleMenu];

waitUntil {!isNull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this call DT_fnc_keyHandler"];

private _text = if (actionKeys "User10" isEqualTo []) then {
	"Group Menu has been initialised. You can use Windows Key to access it. You can re-bind this on Custom Action 10."
} else {
	format ["Group Menu has been initialised. Use %1 (Custom Action 10) to access it.",actionKeysNames "User10"];
};
systemChat _text;