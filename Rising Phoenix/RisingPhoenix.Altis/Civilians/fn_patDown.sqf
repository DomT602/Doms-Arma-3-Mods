/*
	File: fn_patDown.sqf
	Author: Dom
	Description: Pats down and removes items from target unit
*/
params [
	["_unit",objNull,[objNull]]
];

nearestObjects [_unit,["GroundWeaponHolder"],3] params [["_holder",objNull]];
if (isNull _holder) then {
	_holder = createVehicle ["GroundWeaponHolder",_unit,[],0,"CAN_COLLIDE"];
};

{
	_unit removeWeapon _x;
	_holder addWeaponCargoGlobal [_x,1];
} forEach weapons _unit;

{
	_unit removeMagazine _x;
	_holder addMagazineCargoGlobal [_x,1];
} forEach magazines _unit;

{
	_unit unlinkItem _x;
	_holder addItemCargoGlobal [_x,1];
} forEach assignedItems _unit;

{
	_unit removeItem _x;
	_holder addItemCargoGlobal [_x,1];
} forEach items _unit;