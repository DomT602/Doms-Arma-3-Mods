/*
	Faction: fn_roleMenuLBChange.sqf
	Author: Dom
	Requires: Updates the role menu
*/
params [
	["_control",controlNull,[controlNull]],
	["_index",0,[0]]
];

private _selectedRole = _control lbData _index;
private _roleData = missionConfigFile >> "Dynamic_Roles" >> _selectedRole;
private _roleName = getText(_roleData >> "name");
private _roleRank = getText(_roleData >> "rank");
private _roleDesc = getText(_roleData >> "description");
private _roleMaxCount = getNumber(_roleData >> "maxCount");
private _roleCurrentCount = [_selectedRole] call DT_fnc_countRole;

private _defaultLoadout = getArray(_roleData >> "defaultLoadout");
private _defaultLoadoutText = [];

for "_i" from 0 to 5 do {
	private _array = _defaultLoadout select _i;
	_array params [["_className",""]];
	if (_className isEqualTo "") then {
		_defaultLoadoutText pushBack "-";
	} else {
		if (_i isEqualTo 5) then {
			_defaultLoadoutText pushBack (getText(configFile >> "CfgVehicles" >> _className >> "displayName"));
		} else {
			_defaultLoadoutText pushBack (getText(configFile >> "CfgWeapons" >> _className >> "displayName"));
		};
	};
};
private _helmetClass = _defaultLoadout select 6;
if (_helmetClass isEqualTo "") then {
	_defaultLoadoutText pushBack "-";
} else {
	_defaultLoadoutText pushBack (getText(configFile >> "CfgWeapons" >> _helmetClass >> "displayName"));
};

private _display = findDisplay 9700;
private _textBox = _display displayCtrl 1100;

private _text = format ["
	<t align='center' font='PuristaBold' size='1.6'>%1</t>
	<br/>
	<t align='center' font='PuristaLight'>%2</t>

	<br/><br/>

	<t font='PuristaLight' valign='bottom' align='left'>Rank</t>
	<t font='PuristaBold' align='Right' valign='bottom'><img size='0.8' image='a3\ui_f\data\gui\cfg\ranks\%3_gs.paa'/> %3</t>

	<br/>

	<t font='PuristaLight' valign='bottom' align='left'>Available slots</t>
	<t font='PuristaBold' align='Right' valign='bottom'>(%4/%5)</t>
	
	<br/><br/>

	<t font='PuristaBold' size='1.2'>DEFAULT LOADOUT</t>

	<br/>

	<t font='PuristaLight' valign='bottom' align='left'>Primary</t>
	<t font='PuristaBold' align='Right' valign='bottom'>%6</t>

	<br/>

	<t font='PuristaLight' valign='bottom' align='left'>Launcher</t>
	<t font='PuristaBold' align='Right' valign='bottom'>%7</t>

	<br/>

	<t font='PuristaLight' valign='bottom' align='left'>Secondary</t>
	<t font='PuristaBold' align='Right' valign='bottom'>%8</t>

	<br/><br/>

	<t font='PuristaLight' valign='bottom' align='left'>Uniform</t>
	<t font='PuristaBold' align='Right' valign='bottom'>%9</t>
	
	<br/>

	<t font='PuristaLight' valign='bottom' align='left'>Vest</t>
	<t font='PuristaBold' align='Right' valign='bottom'>%10</t>
	
	<br/>

	<t font='PuristaLight' valign='bottom' align='left'>Backpack</t>
	<t font='PuristaBold' align='Right' valign='bottom'>%11</t>

	<br/>

	<t font='PuristaLight' valign='bottom' align='left'>Helmet</t>
	<t font='PuristaBold' align='Right' valign='bottom'>%12</t>
	
	",
	_roleName,_roleDesc,_roleRank,_roleCurrentCount,_roleMaxCount,
	_defaultLoadoutText#0, _defaultLoadoutText#1, _defaultLoadoutText#2,
	_defaultLoadoutText#3, _defaultLoadoutText#4, _defaultLoadoutText#5, _defaultLoadoutText#6
];
_textBox ctrlSetStructuredText parseText _text;

private _button = _display displayCtrl 2400;
private _currentRole = player getVariable ["DT_role","rifleman"];

(ctrlPosition _textBox) params ["_xPos","_yPos","_width"];
private _height = ctrlTextHeight _textBox;
_textBox ctrlSetPosition [_xPos,_yPos,_width,_height];
_textBox ctrlCommit 0;

if (_currentRole isEqualTo _selectedRole || {_roleCurrentCount >= _roleMaxCount}) then {
	_button ctrlEnable false;
} else {
	_button ctrlEnable true;	
};