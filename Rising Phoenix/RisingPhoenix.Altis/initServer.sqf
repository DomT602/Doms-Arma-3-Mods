/*
	Faction: initServer.sqf
	Author: Dom
	Requires: Start the server up
*/
DT_isLambsEnabled = isClass(configFile >> "CfgPatches" >> "lambs_main");
DT_isZenEnabled = isClass(configFile >> "CfgPatches" >> "ZEN_main");
DT_isTFAREnabled = isClass (configFile >> "CfgPatches" >> "task_force_radio");
publicVariable "DT_isTFAREnabled";
DT_isACREEnabled = isClass (configFile >> "CfgPatches" >> "acre_main");
publicVariable "DT_isACREEnabled";

DT_bluforFaction = switch (paramsArray select 0) do {
	case 0: {"CTRG"};
	case 1: {"NATO"};
	case 2: {"CSAT"};
	case 3: {"AMF"};
	case 4: {"BAF"};
	case 5: {"USSOCOM"};
};
publicVariable "DT_bluforFaction";

DT_opforFaction = switch (paramsArray select 1) do {
	case 0: {"CSAT"};
	case 1: {"AAF"};
	case 2: {"NATO"};
	case 3: {"AA"};
	case 4: {"ADA"};
	case 5: {"ChDKZ"};
	case 6: {"KRG"};
	case 7: {"MEE"};
};
publicVariable "DT_opforFaction";

DT_dynamicGroups = getArray(missionConfigFile >> DT_bluforFaction >> "Dynamic_Groups" >> "group_setup");
if (DT_isTFAREnabled || {DT_isACREEnabled}) then {
	DT_swRadioFrequencies = [[],[]];
	DT_lrRadioFrequencies = [[],[]];
};
{
	_x params ["_groupName","_roles","","_swFreq","_lrFreq"];

	if (DT_isTFAREnabled || {DT_isACREEnabled}) then {
		DT_swRadioFrequencies params ["_swFreqs","_swGroups"];
		private _freqIndex = _swFreqs find _swFreq;
		if (_freqIndex isNotEqualTo -1) then {
			(_swGroups select _freqIndex) pushBack _groupName;
		} else {
			_swFreqs pushBack _swFreq;
			_swGroups pushBack [_groupName];
		};

		DT_lrRadioFrequencies params ["_lrFreqs","_lrGroups"];
		private _freqIndex = _lrFreqs find _lrFreq;
		if (_freqIndex isNotEqualTo -1) then {
			(_lrGroups select _freqIndex) pushBack _groupName;
		} else {
			_lrFreqs pushBack _lrFreq;
			_lrGroups pushBack [_groupName];
		};
	};
	_x deleteAt 4;
	_x deleteAt 3;

	private _roleCount = count _roles;
	private _playerArray = [];
	for "_i" from 1 to _roleCount do {
		_playerArray pushBack objNull;
	};

	_x pushBack grpNull;
	_x pushBack _playerArray;
} forEach DT_dynamicGroups;
if (DT_isTFAREnabled || {DT_isACREEnabled}) then {
	publicVariable "DT_swRadioFrequencies";
	publicVariable "DT_lrRadioFrequencies";
};

[DT_dynamicGroups] remoteExecCall ["DT_fnc_updateGroups",-2,"DT_DG_JIP"];

addMissionEventHandler ["HandleDisconnect",DT_fnc_handleDisconnect];

[] call DT_fnc_setupLocations;

resistance setFriend [west,0];
west setFriend [independent,0];
resistance setFriend [east,1];
east setFriend [independent,1];

DT_missionDetails = [];
DT_missionCount = 0;

["AllVehicles","initpost",{
	params ["_vehicle"];
	[_vehicle] call DT_fnc_clearCargo;

	{
		_x addCuratorEditableObjects [_this,true];
	} forEach allCurators;
},true,[],true] call CBA_fnc_addClassEventHandler;

["ace_explosives_defuse",DT_fnc_onDefuse] call CBA_fnc_addEventHandler;

[] call DT_fnc_mainLoop;
[] call DT_fnc_startNewMission;
[] call DT_fnc_startSideMission;

DT_ambientCivs = [];
DT_ambientCivHandle = -1;
[paramsArray select 5] call DT_fnc_spawnAmbientCiv;

DT_ambientOpfor = [];
DT_ambientOpforHandle = -1;
[paramsArray select 12] call DT_fnc_spawnAmbientOpfor;

DT_supportCooldowns = [];
private _supportActions = getArray(missionConfigFile >> DT_bluforFaction >> "supports");
for "_i" from 1 to (count _supportActions) do {
	DT_supportCooldowns pushBack 0;
};
publicVariable "DT_supportCooldowns";

DT_serverReady = true;
publicVariable "DT_serverReady";