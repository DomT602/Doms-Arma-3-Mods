/*
	File: fn_markMines.sqf
	Author: Dom
	Description: Marks nearby mines on the map, originating from questioning a civilian
*/
params [
	["_unit",objNull,[objNull]]
];

private _nearbyMines = nearestMines [_unit,[],500,false,false];
private _name = name _unit;

{
	if (random 10 > 5) then {
		private _marker = createMarker [format ["_USER_DEFINED %1mineMarker%2",_name,_forEachIndex],_x,1];
		_marker setMarkerText format ["Mine reported by %1",_name];
		_marker setMarkerType "hd_warning";
		_marker setMarkerColor "ColorRED";
	};
} forEach _nearbyMines;