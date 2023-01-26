/*
	File: fn_createMines.sqf
	Author: Dom
	Description: Creates mines on roads in a desired radius
*/
params [
	["_pos",[],[[]]],
	["_radius",200,[0]],
	["_count",(paramsArray select 11),[0]]
];

private _iedTypes = getArray(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforMines");
private _nearRoads = _pos nearRoads _radius;
if (_nearRoads isEqualTo []) then {
	private _searchArea = [_pos,_radius / 2,_radius / 2,0,false];
	for "_i" from 0 to _count do {
		_nearRoads pushBack ([_searchArea] call CBA_fnc_randPosArea);
	};
};

for "_i" from 1 to _count do {
	private _mine = createMine [selectRandom _iedTypes,selectRandom _nearRoads,[],5];
	{
		_x revealMine _mine;
	} forEach [east,independent,civilian];
};