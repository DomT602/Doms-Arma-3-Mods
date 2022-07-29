/*
	File: fn_alterLives.sqf
	Author: Dom
	Description: Adjusts the players lives depending on selection
*/
params [
	["_action","",[""]]
];
private _display = findDisplay 9700;
private _listbox = _display displayCtrl 1500;
private _index = lbCurSel _listbox;
private _uid = _listbox lbData _index;
private _unit = [_uid] call DT_fnc_findPlayerByUID;
private _unitsLives = [_unit] call BIS_fnc_respawnTickets;

switch _action do {
	case "transfer": {
		private _myIndex = -1;
		for "_i" from 0 to (lbSize _listbox)-1 do {
			private _uid = _listbox lbData _i; 
			if (_uid isEqualTo (getPlayerUID player)) exitWith {
				_myIndex = _i;
			};
		};
		[player,-1] call BIS_fnc_respawnTickets;
		private _myLives = [player] call BIS_fnc_respawnTickets;
		_listbox lbSetTextRight [_myIndex,str(_myLives - 1)];
		if ((_myLives - 1) isEqualTo 0) then {
			_listbox lbSetColorRight [_index,[1,0.451,0,1]];
		};

		[_unit,1] call BIS_fnc_respawnTickets;
		_listbox lbSetTextRight [_index,str(_unitsLives + 1)];
		_listbox lbSetColorRight [_index,[1,1,1,1]];
	};
	case "give": {
		[_unit,1] call BIS_fnc_respawnTickets;
		_listbox lbSetTextRight [_index,str(_unitsLives + 1)];
		_listbox lbSetColorRight [_index,[1,1,1,1]];
	};
	case "remove": {
		[_unit,-1] call BIS_fnc_respawnTickets;
		_listbox lbSetTextRight [_index,str((_unitsLives - 1) max 0)];
		if ((_unitsLives - 1) isEqualTo 0) then {
			if (alive _unit) then {
				_listbox lbSetColorRight [_index,[1,0.451,0,1]];
			} else {
				_listbox lbSetColorRight [_index,[1,0,0,1]];
			};
		};
	};
	case "reset": {
		if (_unitsLives isNotEqualTo DT_defaultLives) then {
			[_unit,DT_defaultLives - _unitsLives] call BIS_fnc_respawnTickets;
			_listbox lbSetTextRight [_index,str(DT_defaultLives)];
			_listbox lbSetColorRight [_index,[1,1,1,1]];
		};
	};
	case "resetAll": {
		for "_i" from 0 to (lbSize _listbox)-1 do {
			private _uid = _listbox lbData _i; 
			private _unit = [_uid] call DT_fnc_findPlayerByUID;
			private _unitsLives = [_unit] call BIS_fnc_respawnTickets;

			if (_unitsLives isNotEqualTo DT_defaultLives) then {
				[_unit,DT_defaultLives - _unitsLives] call BIS_fnc_respawnTickets;
				_listbox lbSetTextRight [_i,str(DT_defaultLives)];
				_listbox lbSetColorRight [_i,[1,1,1,1]];
			};
		};
	};
};

_listbox lbSetCurSel _index;