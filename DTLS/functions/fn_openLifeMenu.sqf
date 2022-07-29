/*
	File: fn_openLifeMenu.sqf
	Author: Dom
	Description: Opens the life menu and disables buttons as required
*/
createDialog "DT_lifeMenu";

private _display = findDisplay 9700;
private _listbox = _display displayCtrl 1500;
private _myIndex = 0;

{
	private _index = _listbox lbAdd (name _x);
	_listbox lbSetData [_index,getPlayerUID _x];

	if (_x isEqualTo player) then {
		_myIndex = _index;
	};

	if (getPlayerUID _x in DT_adminUIDs) then {
		_listbox lbSetPicture [_index,"a3\ui_f\data\GUI\Cfg\Ranks\general_gs.paa"];
		_listbox lbSetColor [_index,[0,0.627,1,1]];
	};

	if (_x getVariable ["DT_role","rifleman"] isEqualTo "medic" || {_x getUnitTrait "medic"}) then {
		_listbox lbSetPicture [_index,"a3\ui_f\data\map\vehicleicons\pictureHeal_ca.paa"];
		_listbox lbSetColor [_index,[0,1,0,1]];
	};

	private _lives = [_x] call BIS_fnc_respawnTickets;
	_listbox lbSetTextRight [_index,str(_lives)];

	if (_lives isEqualTo 0) then {
		if (alive _x) then {
			_listbox lbSetColorRight [_index,[1,0.451,0,1]];
		} else {
			_listbox lbSetColorRight [_index,[1,0,0,1]];
		};	
	};
} forEach playableUnits;

_listbox lbSetCurSel _myIndex;

if !(getPlayerUID player in DT_adminUIDs) then {
	(_display displayCtrl 2401) ctrlEnable false;
	(_display displayCtrl 2402) ctrlEnable false;
	(_display displayCtrl 2403) ctrlEnable false;
	(_display displayCtrl 2404) ctrlEnable false;
};