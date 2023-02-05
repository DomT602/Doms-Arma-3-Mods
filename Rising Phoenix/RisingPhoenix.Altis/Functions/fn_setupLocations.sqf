/*
	File: fn_setupLocations.sqf
	Author: Dom
	Description: Sets up locations for use by various missions
*/

private _halfWorldSize = worldSize / 2;
private _nearbyTowns = nearestLocations [[_halfWorldSize,_halfWorldSize],["NameVillage","NameCity","NameCityCapital"],_halfWorldSize];

DT_civLocations = [];
{
	private _pos = position _x;
	_pos set [2,0];
	private _buildings = _pos nearObjects ["House",300];
	if (_pos distance arsenal_1 > 750 && {_buildings isNotEqualTo []}) then {
		private _townNameSpace = createSimpleObject ["CBA_NamespaceDummy",_pos];
		_townNameSpace setVariable ["DT_townName",text _x,true];
		_townNameSpace setVariable ["DT_townKarma",round random [-100,0,100]];

		DT_civLocations pushBack _townNameSpace;
	};
} forEach _nearbyTowns;
publicVariable "DT_civLocations";

DT_airportLocations = []; 
private _config = configFile >> "cfgWorlds" >> worldName; 
private _primAirport = getArray(_config >> "ilsPosition"); 
_primAirport set [2,0]; 
private _ilsDirection = getArray(_config >> "ilsDirection");
private _primAirportDirection = (_ilsDirection # 0) atan2 (_ilsDirection # 2) - 180;
DT_airportLocations pushBack [_primAirport,_primAirportDirection]; 
 
{ 
	private _secAirport = getArray(_x >> "ilsPosition"); 
	_secAirport set [2,0]; 
	private _ilsDirection = getArray(_x >> "ilsDirection");
	private _secAirportDirection = (_ilsDirection # 0) atan2 (_ilsDirection # 2) - 180;
	DT_airportLocations pushBack [_secAirport,_secAirportDirection]; 
} forEach ("true" configClasses (_config >> "SecondaryAirports")); 