/*
	File: initPlayerLocal.sqf
	Author: Dom
	Requires: Start us up
*/

waitUntil {missionNamespace getVariable ["DT_serverReady",false] && {!isNull player && {!isNull (findDisplay 46)}}};

player addEventHandler ["InventoryOpened",DT_fnc_onInventoryOpened];
player addEventHandler ["Respawn",DT_fnc_onRespawn];
player addEventHandler ["GetInMan",DT_fnc_onGetInMan];
addMissionEventHandler ["Map",DT_fnc_createBluforMarkers];
if (DT_isTFAREnabled) then {
	["radioSetup","OnRadiosReceived",DT_fnc_initSwRadios] call TFAR_fnc_addEventHandler;
	["radioSwChange","OnSWchannelSet",{DT_lastSwChannel = _this select 2}] call TFAR_fnc_addEventHandler;
	["radioLrChange","OnLRchannelSet",{DT_lastLrChannel = _this select 3}] call TFAR_fnc_addEventHandler;
} else {
	if (DT_isACREEnabled) then {
		DT_swRadioFrequencies params ["_frequencies","_groupArrays"];
		{
			private _freq = parseNumber _x;
			private _index = (_forEachIndex + 1);
			(_groupArrays select _forEachIndex) params ["_groupName"];

			{
				[_x,"default",_index,"label",_groupName] call acre_api_fnc_setPresetChannelField;
				[_x,"default",_index,"frequencyRX",_freq] call acre_api_fnc_setPresetChannelField;
				[_x,"default",_index,"frequencyTX",_freq] call acre_api_fnc_setPresetChannelField;
			} forEach ["ACRE_PRC343","ACRE_PRC148","ACRE_PRC152"];
		} forEach _frequencies;

		DT_lrRadioFrequencies params ["_frequencies","_groupArrays"];
		{
			private _freq = parseNumber _x;
			private _index = (_forEachIndex + 1);
			(_groupArrays select _forEachIndex) params ["_groupName"];

			{
				[_x,"default",_index,"label",_groupName] call acre_api_fnc_setPresetChannelField;
				[_x,"default",_index,"frequencyRX",_freq] call acre_api_fnc_setPresetChannelField;
				[_x,"default",_index,"frequencyTX",_freq] call acre_api_fnc_setPresetChannelField;
			} forEach ["ACRE_PRC117F","ACRE_PRC77"];
		} forEach _frequencies;
	};
};

["ace_arsenal_displayClosed",{
	DT_savedLoadout = [player] call CBA_fnc_getLoadout;
	["Loadout saved."] call DT_fnc_notify;

	if (DT_isTFAREnabled && {call TFAR_fnc_haveLRRadio}) then {call DT_fnc_initLrRadio};
}] call CBA_fnc_addEventHandler;

["ace_treatmentSucceded",{
	params ["_caller","_target","_selectionName","_className","_itemUser","_usedItem"];

	private _medicalItems = [
		"ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage","ACE_quikclot",
		"ACE_splint",
		"ACE_bloodIV_250","ACE_bloodIV_500","ACE_bloodIV",
		"ACE_plasmaIV_250","ACE_plasmaIV_500","ACE_plasmaIV",
		"ACE_salineIV_250","ACE_salineIV_500","ACE_salineIV"
	];

	if (([typeOf _target] call DT_fnc_getConfigSide) isEqualTo civilian && {_usedItem in _medicalItems}) then {
		[getPosASL _target,paramsArray select 8] remoteExecCall ["DT_fnc_adjustKarma",2];
		[format["%1 thanks you for the treatment.",name _target]] call DT_fnc_notify;
	};
}] call CBA_fnc_addEventHandler;

[] call DT_fnc_createAceInteractions;
[] call DT_fnc_setupDiaryTutorials;

DT_isZeus = (getPlayerUID player) in (getArray(missionConfigFile >> "zeusUIDs"));
if (DT_isZeus) then {
	[player] remoteExecCall ["DT_fnc_assignZeus",2];
};

player setVehiclePosition [getMarkerPos "respawn_west",[],5];
[] call DT_fnc_initGroupMenu;

createDialog ["RscDisplayWelcome",true];
private _display = findDisplay 999999;
private _text = _display displayCtrl 1100;
private _message = "
	<t align='center' size='6' shadow='0'><br/>Op Rising Phoenix</t><br/>
	Welcome to Operation Rising Phoenix, a highly customisable gamemode designed for its replayability. Through the use of Mission Parameters, you can change various settings including the factions and difficulty of the playthrough.<br/>
	To get started, select a role from the group menu and access subsequent menus through ACE Self Interact. You can view more information about this gamemode in the diary.<br/><br/>
	<a color='#00DFFF'>•</a> Github: <a href='https://github.com/DomT602/Doms-Arma-3-Mods/tree/main/Rising%20Phoenix' color='#56BDD6'> https://github.com/DomT602/Doms-Arma-3-Mods/tree/main/Rising%20Phoenix</a><br/>
	<a color='#00DFFF'>•</a> Discord: <a href='https://discord.gg/FewM2Wfc9y' color='#56BDD6'> https://discord.gg/FewM2Wfc9y</a>
";

_text ctrlSetStructuredText (parseText _message);
(ctrlPosition _text) params ["_xPos","_yPos","_width"];
private _height = ctrlTextHeight _text;
_text ctrlSetPosition [_xPos,_yPos,_width,_height];
_text ctrlCommit 0;