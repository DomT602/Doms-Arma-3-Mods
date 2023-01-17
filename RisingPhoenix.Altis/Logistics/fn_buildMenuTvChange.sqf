/*
	File: fn_buildMenuTvChange.sqf
	Author: Dom
	Description: Called on a new selection in the building menu
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];

private _display = findDisplay 9741;
private _button = _display displayCtrl 2400;
private _textBox = _display displayCtrl 1100;
if (count _selectionPath isEqualTo 1) exitWith {_button ctrlEnable false; _textBox ctrlSetStructuredText parseText ""};

_button ctrlEnable true;

private _class = _control tvData _selectionPath;
private _config = configFile >> "CfgVehicles" >> _class;

private _totalSeats = [_class,true] call BIS_fnc_crewCount;
private _crewSeats = [_class,false] call BIS_fnc_crewCount;

private _text = format ["
	<t size='2'>Information:</t><br/>
	Max Speed: %1<br/>
	Crew Seats: %2<br/>
	Passenger Seats: %3<br/>",
	getNumber (_config >> "maxSpeed"),
	_crewSeats,
	(_totalSeats - _crewSeats)
];

_textBox ctrlSetStructuredText parseText _text;