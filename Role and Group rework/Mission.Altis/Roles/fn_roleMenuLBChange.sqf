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

private _display = findDisplay 9700;
private _textBox = _display displayCtrl 1100;

private _text = format ["
	<t align='center' font='PuristaBold' size='1.6'>%1</t>
	<br/>
	<t align='center' font='PuristaLight'>%2</t>

	<br/><br/><br/>

	<t font='PuristaLight' valign='bottom' align='left'>%3</t>
	<t font='PuristaBold' align='Right' valign='bottom'><img size='0.8' image='a3\ui_f\data\gui\cfg\ranks\%4_gs.paa'/> %4</t>
	<br/>

	<t font='PuristaLight' valign='bottom' align='left'>%5</t>
	<t font='PuristaBold' align='Right' valign='bottom'>(%6/%7)</t>
	<br/>",
	_roleName,_roleDesc,localize "STR_LIVE_STATS_RANK",_roleRank,localize "STR_DT_Role_Menu_Slots",_roleCurrentCount,_roleMaxCount
];
_textBox ctrlSetStructuredText parseText _text;

private _button = _display displayCtrl 2400;
private _currentRole = player getVariable ["DT_role","rifleman"];

if (_currentRole isEqualTo _selectedRole || {_roleCurrentCount >= _roleMaxCount}) then {
	_button ctrlEnable false;
} else {
	_button ctrlEnable true;    
};