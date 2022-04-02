/*
	File: fn_keyHandler.sqf
	Author: Dom
	Description: Handles key presses on display 46
*/
params ["_display","_key","_shift","_ctrl","_alt"];

private _hasBoundKey = !(actionKeys "User10" isEqualTo []);
if (_hasBoundKey && {(inputAction "User10") > 0} || (!_hasBoundKey && {_key isEqualTo 219})) then {
	if (isNull (findDisplay 9701)) then {
		[] call DT_fnc_initGroupMenu;
	};
};