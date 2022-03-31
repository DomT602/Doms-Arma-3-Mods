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
	_tree tvAdd [[],groupID _x];
	private _treeIndex = _forEachIndex;
	_tree tvSetData [[_treeIndex],netID _x];

	{
		private _roleInfo = _rolesArray >> (player getVariable ["DT_role","rifleman"]);
		private _roleName = getText(_roleInfo >> "name");
		_tree tvAdd [[_treeIndex],name _x];
		_tree tvSetData [[_treeIndex,_forEachIndex],netID _x];
		_tree tvSetPicture [[_treeIndex,_forEachIndex],getText(_roleInfo >> "icon")];
		_tree tvSetPictureColor [[_treeIndex,_forEachIndex],[0,1,0,1]];
		_tree tvSetPictureRight [[_treeIndex,_forEachIndex],format["a3\ui_f\data\GUI\Cfg\Ranks\%1_gs.paa",getText(_roleInfo >> "rank")]];

		if (player isEqualTo _x) then {
			_myPath = [_treeIndex,_forEachIndex];
		};
	} forEach units _x;
} forEach _friendlyGroups;

_tree tvSetCurSel _myPath;