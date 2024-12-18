/*
	File: initPlayerLocal.sqf
	Author: Dom
	Requires: Start us up
*/

DT_isACEEnabled = isClass (configFile >> "CfgPatches" >> "ace_common");
DT_arsenalBoxes = [arsenal_1];

player addEventHandler ["Respawn",DT_fnc_onRespawn];

if (DT_isACEEnabled) then {
	private _groupCategory = [
		"groupCategory",
		"Group Menu",
		"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\meet_ca.paa",
		{[] call DT_fnc_initGroupMenu},
		{
			isNull objectParent player &&
			{(DT_arsenalBoxes findIf {(player distance _x) < 50}) isNotEqualTo -1}
		}
	] call ace_interact_menu_fnc_createAction;
	[player,1,["ACE_SelfActions"],_groupCategory] call ace_interact_menu_fnc_addActionToObject;

	private _arsenalCategory = [
		"arsenalCategory",
		"Arsenal",
		"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\armor_ca.paa",
		{[player,player,false] call ace_arsenal_fnc_openBox},
		{
			isNull objectParent player &&
			{player getVariable ["ace_arsenal_virtualItems",[]] isNotEqualTo [] &&
			{(DT_arsenalBoxes findIf {(player distance _x) < 50}) isNotEqualTo -1}}
		}
	] call ace_interact_menu_fnc_createAction;
	[player,1,["ACE_SelfActions"],_arsenalCategory] call ace_interact_menu_fnc_addActionToObject;

	["ace_arsenal_displayClosed",{
		DT_savedLoadout = [player] call CBA_fnc_getLoadout;
	}] call CBA_fnc_addEventHandler;
} else {
	{
		_x addAction ["Open Group Menu",DT_fnc_initGroupMenu];
	} forEach DT_arsenalBoxes;

	[missionNamespace,"arsenalClosed",{
		DT_savedLoadout = getUnitLoadout player;
	}] call BIS_fnc_addScriptedEventHandler;
};