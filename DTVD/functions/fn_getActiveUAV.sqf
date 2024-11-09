/*
	File: fn_getActiveUAV.sqf
	Author: Dom
	Description: Attempts to return the UAV object if a player is actively controlling one
*/

if (DT_viewDistance_isACEEnabled) exitWith {
	ACE_controlledUAV param [0,objNull];
};

private _activeUav = getConnectedUAV player;

if !(isNull _activeUav) then {
	private _positions = UAVControl _activeUav;
	private _connectedPosition = _positions find player;
	if (_connectedPosition isEqualTo -1) then {
		_activeUav = objNull;
	} else {
		if ((_positions select (_connectedPosition + 1)) isEqualTo "") then {
			_activeUav = objNull;
		};
	};
};

_activeUav;