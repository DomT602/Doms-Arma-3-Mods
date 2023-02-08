/*
	File: fn_calculateEnemySquads.sqf
	Author: Dom
	Description: Calculates enemy squads on player count and chosen modifier
*/

private _playerCount = (count playableUnits) max 1;
private _difficultyModifier = paramsArray select 3;

private _infantryCount = ceil ((_playerCount / 4) * _difficultyModifier);
private _lightVehCount = ceil ((_playerCount / 8) * _difficultyModifier);
private _mediumVehCount = round ((_playerCount / 12) * _difficultyModifier);
private _heavyVehCount = if (missionNamespace getVariable ["DT_opforHeaviesDisabled",false]) then {0} else {round ((_playerCount / 16) * _difficultyModifier)};

[_infantryCount,_lightVehCount,_mediumVehCount,_heavyVehCount];