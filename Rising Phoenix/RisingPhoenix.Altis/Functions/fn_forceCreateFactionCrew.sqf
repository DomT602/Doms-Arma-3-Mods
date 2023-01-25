/*
	File: fn_forceCreateFactionCrew.sqf
	Author: Dom
	Description: Used for when a vehicles config crew is not the correct faction
*/
params [
	["_vehGroup",grpNull,[grpNull]],
	["_emptyVehicle",objNull,[objNull]]
];

private _squadComposition = selectRandom (getArray(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforSquads"));
private _driver = [_vehGroup,east,selectRandom _squadComposition,_emptyVehicle] call DT_fnc_createUnit;
_driver moveInDriver _emptyVehicle;
if (fullCrew [_emptyVehicle,"gunner",true] isNotEqualTo []) then {
	private _gunner = [_vehGroup,east,selectRandom _squadComposition,_emptyVehicle] call DT_fnc_createUnit;
	_gunner moveInGunner _emptyVehicle;
};
if (fullCrew [_emptyVehicle,"commander",true] isNotEqualTo []) then {
	private _commander = [_vehGroup,east,selectRandom _squadComposition,_emptyVehicle] call DT_fnc_createUnit;
	_commander moveInCommander _emptyVehicle;
};