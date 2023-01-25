/*
	File: fn_defuseNuke.sqf
	Author: Dom
	Description: ACE Action to defuse a nuclear weapon
*/
params [
	["_object",objNull,[objNull]]
];

private _action = [
	"defuseNuke",
	"Defuse Nuke",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa",
	{
		[
			30,
			_target,
			{
				params ["_nuke"];

				private _chance = 25;
				if (player getUnitTrait "Engineer" || {player getUnitTrait "explosiveSpecialist"}) then {_chance = _chance + 25};
				if ([player,"ToolKit"] call ace_common_fnc_hasItem || {[player,"ACE_DefusalKit"] call ace_common_fnc_hasItem}) then {_chance = _chance + 25};

				if (_chance > random 100) then {
					_nuke setVariable ["defused",true,true];
				} else {
					["Defusing failed."] call DT_fnc_notify;
				};
			},
			{
				["Defusing cancelled."] call DT_fnc_notify;
			},
			"Defusing",
			{
				params ["_nuke"];
				!(_nuke getVariable ["defused",false])
			}
		] call ace_common_fnc_progressBar;
	},
	{
		!(_target getVariable ["defused",false])
	},nil,nil,nil,5
] call ace_interact_menu_fnc_createAction;
[_object,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;