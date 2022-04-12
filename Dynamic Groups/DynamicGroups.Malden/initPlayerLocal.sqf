/*
	Faction: initPlayerLocal.sqf
	Author: Dom
	Requires: Start us up
*/

DT_isACEEnabled = isClass (configFile >> "CfgPatches" >> "ace_common");
DT_arsenalBoxes = [arsenal_1];

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
			{(DT_arsenalBoxes findIf {(player distance _x) < 50}) isNotEqualTo -1}
		}
	] call ace_interact_menu_fnc_createAction;
	[player,1,["ACE_SelfActions"],_arsenalCategory] call ace_interact_menu_fnc_addActionToObject;
} else {
	{
		_x addAction ["Open Group Menu",DT_fnc_initGroupMenu];
	} forEach DT_arsenalBoxes;
};