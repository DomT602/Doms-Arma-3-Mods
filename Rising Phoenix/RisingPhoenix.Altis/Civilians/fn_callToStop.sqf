/*
	File: fn_callToStop.sqf
	Author: Dom
	Description: Calls out for civilians to stop moving for easy talk access
*/

["You call out for attention."] call DT_fnc_notify;

private _nearbyUnits = player nearEntities [["CAManBase"],15];
private _karma = [getPosATL player] call DT_fnc_getKarma;
_karma = round (_karma / 20); //value between -5 and 5

{
	if (side _x isEqualTo east) then {
		[_x,player] remoteExecCall ["reveal",_x];
	} else {
		private _individualKarma = (_x getVariable ["DT_individualKarma",0]) + _karma;
		if (_individualKarma > -5) then {
			[_x,0] remoteExecCall ["forceSpeed",_x];
			[_x,player] remoteExecCall ["doWatch",_x];

			private _delay = if (_karma > 0) then {10 + (_karma * 3)} else {10};
			[
				{
					params ["_unit"];
					if (isNull (_unit getVariable ["DT_currentTalker",objNull])) then {
						_unit forceSpeed -1;
						_unit doWatch objNull;
					};
				},
				_x,
				_delay
			] remoteExecCall ["CBA_fnc_waitAndExecute",_x];
		};
	};	
} forEach _nearbyUnits;