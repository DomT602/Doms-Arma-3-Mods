/*
	Faction: fn_initGroupMenu.sqf
	Author: Dom
	Requires: Starts up and populates the group menu
*/

if !(dialog) then {
	createDialog "DT_groupMenu";
};

private _display = findDisplay 9701;
private _tree = _display displayCtrl 1500;
tvClear _tree;
private _friendlyGroups = allGroups select {side _x isEqualTo playerSide && {units _x isNotEqualTo [] && {isPlayer (leader _x)}}};
_friendlyGroups sort true;
private _rolesArray = missionConfigFile >> "Dynamic_Roles";
private _myPath = [0,0];

{
	private _group = _x;
	private _treeIndex = _tree tvAdd [[],groupID _group];
	_tree tvSetData [[_treeIndex],netID _group];

	{
		private _roleInfo = _rolesArray >> (_x getVariable ["DT_role","rifleman"]);
		private _roleName = getText(_roleInfo >> "name");
		private _unitIndex = _tree tvAdd [[_treeIndex],name _x];
		_tree tvSetData [[_treeIndex,_unitIndex],netID _x];
		_tree tvSetPicture [[_treeIndex,_unitIndex],getText(_roleInfo >> "icon")];
		private _colour = [0,1,0,1];
		if (leader _group isEqualTo _x) then {
			_colour = [1,1,0,1];
		};
		_tree tvSetPictureColor [[_treeIndex,_unitIndex],_colour];
		_tree tvSetPictureRight [[_treeIndex,_unitIndex],format["a3\ui_f\data\GUI\Cfg\Ranks\%1_gs.paa",getText(_roleInfo >> "rank")]];

		if (player isEqualTo _x) then {
			_myPath = [_treeIndex,_unitIndex];
		};
	} forEach units _group;
} forEach _friendlyGroups;

_tree tvSetCurSel _myPath;