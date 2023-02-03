/*
	File: fn_initTalkMenu.sqf
	Author: Dom
	Description: Opens and populates the talk menu with civilians
*/
params [
	["_unit",cursorObject,[objNull]]
];

if !(isNull (_unit getVariable ["DT_currentTalker",objNull])) exitWith {["He is busy talking to someone else."] call DT_fnc_notify};

DT_talkingTarget = _unit;
_unit setVariable ["DT_currentTalker",player,true];
[_unit,0] remoteExecCall ["forceSpeed",_unit];
[_unit,player] remoteExecCall ["doWatch",_unit];

private _display = createDialog ["DT_talkMenu",true];
private _questionBox = _display displayCtrl 1500;

private _generalQuestions = [
	"What is your name?",
	"Have you seen any unusual activity recently?",
	"What can we do to help you?",
	"Where is the nearest burger joint?",
	"Are there any nearby enemies?",
	"What do people around here think about us?"
];

private _interrogationQuestions = [
	"How have you helped the enemy?",
	"Whats the name of the local commander?",
	"Where is the local commander?", //starts HVT mission
	"Do convoys pass through this town?" //starts convoy ambush mission
];

{
	private _index = _questionBox lbAdd _x;
	_questionBox lbSetValue [_index,_forEachIndex];
} forEach _generalQuestions;

private _restrainButton = _display displayCtrl 2401;
if (captive _unit) then {
	private _baseIndex = lbSize _questionBox;
	{
		private _index = _questionBox lbAdd _x;
		_questionBox lbSetValue [_index,_baseIndex + _forEachIndex];
	} forEach _interrogationQuestions;

	_restrainButton ctrlSetText localize "STR_ACE_Captives_ReleaseCaptive";
	_restrainButton ctrlSetEventHandler ["buttonClick","[DT_talkingTarget,false,player] remoteExecCall ['ACE_captives_fnc_setHandcuffed',DT_talkingTarget]; closeDialog 0"];
} else {
	(_display displayCtrl 2402) ctrlEnable false;
	if ([player,"ACE_CableTie"] call ace_common_fnc_hasItem) then {
		_restrainButton ctrlSetEventHandler ["buttonClick","[DT_talkingTarget,true,player] remoteExecCall ['ACE_captives_fnc_setHandcuffed',DT_talkingTarget]; player removeItem 'ACE_CableTie'; closeDialog 0"];
	} else {
		_restrainButton ctrlEnable false;
	};
};

_questionBox lbSetCurSel 0;

[
	{
		params ["_unit","_oldCaptiveState"];
		!alive _unit || {!alive player || {!dialog || {player distance _unit > 5 || {captive _unit isNotEqualTo _oldCaptiveState || {_unit getVariable ["ACE_isUnconscious",false]}}}}}
	},
	{
		params ["_unit"];
		private _display = findDisplay 9743;
		if !(isNull _display) then {
			closeDialog 0;
		};

		DT_talkingTarget = nil;
		_unit setVariable ["DT_currentTalker",nil,true];
		[_unit,-1] remoteExecCall ["forceSpeed",_unit];
		_unit doWatch objNull;
	},
	[_unit,captive _unit]
] call CBA_fnc_waitUntilAndExecute;