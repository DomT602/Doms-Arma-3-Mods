/*
	File: fn_lifeMenuLbChange.sqf
	Author: Dom
	Description: Called on selection change in life menu listbox
*/
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];
private _display = findDisplay 9700;

private _uid = _control lbData _index;
private _unit = [_uid] call DT_fnc_findPlayerByUID;
private _unitsLives = [_unit] call BIS_fnc_respawnTickets; //need to check this

(_display displayCtrl 1000) ctrlSetText format ["Lives: %1",_unitsLives];

private _transferButton = _display displayCtrl 2400;
if (_unit isEqualTo player) then {
	_transferButton ctrlEnable false;
} else {
	if (player getVariable ["DT_role","rifleman"] isEqualTo "medic" || {player getUnitTrait "medic" || {getPlayerUID player in DT_adminUIDs || {getPlayerUID player in DT_transferOverrideUIDs}}}) then {
		_transferButton ctrlEnable true;
	};
};