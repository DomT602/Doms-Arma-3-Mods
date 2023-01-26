/*
	File: fn_spawnCivilians.sqf
	Author: Dom
	Description: Spawns civilians in a town
*/
params [
	["_townObj",objNull,[objNull]]
];

private _civilianCount = paramsArray select 6;
if ([] call DT_fnc_isNight) then {
	_civilianCount = round (_civilianCount / 2);
};

private _civTypes = getArray(missionConfigFile >> "Civilian_Setup" >> "civilianTypes");
private _localKarma = [_townObj] call DT_fnc_getKarma;
private _position = getPosASL _townObj;

private _civilians = [];
for "_i" from 1 to _civilianCount do {
	private _group = createGroup [civilian,true];
	private _className = selectRandom _civTypes;
	private _spawnPosition = [_position,0,300,5,0,1,0,[],[_position,_position]] call BIS_fnc_findSafePos;

	private _civilian = _group createUnit [_className,_spawnPosition,[],10,"NONE"];
	_civilians pushBack _civilian;
	[_group,_spawnPosition] call DT_fnc_civilianWalking;

	if (_localKarma < 0) then {
		if (_localKarma < -50) then {
			if (33 > random 100) then {
				[_civilian] call DT_fnc_setupSuicideBomber;
			};
		} else {
			if (abs _localKarma > random 100) then {
				private _civWeps = getArray(missionConfigFile >> "Civilian_Setup" >> "civilianWeapons");
				private _weapon = selectRandom _civWeps;
				private _magazine = selectRandom (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
				for "_i" from 1 to (ceil random 5) do {
					_civilian addItem _magazine;
				};
				_civilian addWeapon _weapon;

				private _hostileGroup = createGroup [independent,true];
				_hostileGroup copyWaypoints _group;
				[_civilian] joinSilent _hostileGroup;
			};
		};

		_civilian setVariable ["DT_individualKarma",-1,true];
	} else {
		_civilian addEventHandler ["Hit",DT_fnc_civilianHit];
		_civilian addEventHandler ["Killed",DT_fnc_civilianKilled];

		if (7 > random 10) then {
			private _bodyParts = ["Head","Body","LeftArm","RightArm","LeftLeg","RightLeg"];
			private _damageTypes = ["bullet","grenade","explosive","vehiclecrash","stab","falling","ropeburn"];

			private _woundCount = 2 + (round (random 1));
			for "_i" from 1 to _woundCount do {
				[_civilian,random 0.5,(selectRandom _bodyParts),(selectRandom _damageTypes)] call ace_medical_fnc_addDamageToUnit;
			};

			_civilian setVariable ["ace_medical_ai_lastFired",(CBA_missionTime + 600)];
		};
	};
};

[
	{
		params ["_obj"];
		[_obj] call DT_fnc_areaIsClear
	},
	{
		params ["_obj","_civilians"];
		
		{
			if (alive _x) then {
				deleteVehicle _x;
			};
		} forEach _civilians;

		private _index = DT_activeCivLocations find _obj;
		DT_activeCivLocations deleteAt _index;
	},
	[_townObj,_civilians]
] call CBA_fnc_waitUntilAndExecute;