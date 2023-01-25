/*
	File: fn_downloadUAVIntel.sqf
	Author: Dom
	Description: ACE Action to download intel from a UAV
*/
params [
	["_object",objNull,[objNull]]
];

private _action = [
	"downloadUAV",
	"Download UAV data",
	"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\download_ca.paa",
	{
		[
			15,
			_target,
			{
				params ["_uav"];
				_uav setVariable ["intelDownloaded",true,true];
				["The intelligence was downloaded, now destroy the UAV to prevent it being taken by the enemy."] remoteExecCall ["DT_fnc_notify",0];
			},
			{
				["Download cancelled."] call DT_fnc_notify;
			},
			"Downloading",
			{
				params ["_uav"];
				!(_uav getVariable ["intelDownloaded",false])
			}
		] call ace_common_fnc_progressBar;
	},
	{
		alive _target && {!(_target getVariable ["intelDownloaded",false])}
	}
] call ace_interact_menu_fnc_createAction;
[_object,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;