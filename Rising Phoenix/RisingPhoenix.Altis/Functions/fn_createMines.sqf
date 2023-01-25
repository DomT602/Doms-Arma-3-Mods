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

for "_i" from 1 to _count do {
	private _mine = createMine [selectRandom _iedTypes,selectRandom _nearRoads,[],5];
	{
		_x revealMine _mine;
	} forEach [east,independent,civilian];
};