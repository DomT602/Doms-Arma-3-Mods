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
        [player,-1] call BIS_fnc_respawnTickets;
        [_unit,1] call BIS_fnc_respawnTickets;
        _listbox lbSetTextRight [_index,str(_unitsLives + 1)];
    };
    case "give": {
        [_unit,1] call BIS_fnc_respawnTickets;
        _listbox lbSetTextRight [_index,str(_unitsLives + 1)];
    };
    case "remove": {
        [_unit,-1] call BIS_fnc_respawnTickets;
        _listbox lbSetTextRight [_index,str(_unitsLives - 1)];
    };
    case "reset": {
        private _unitsLives = [_unit] call BIS_fnc_respawnTickets; //need to check this
        if (_unitsLives isNotEqualTo DT_defaultLives) then {
            [_unit,DT_defaultLives - _unitsLives] call BIS_fnc_respawnTickets;
            _listbox lbSetTextRight [_index,str(DT_defaultLives)];
        };
    };
};

_listbox lbSetCurSel _index;