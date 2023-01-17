/*
	File: fn_mainLoop.sqf
	Author: Dom
	Description: Main loop for missions and other xx functions
*/

DT_activeCivLocations = [];

[
	{
		private _units = playableUnits;
		{
			if !(_x in DT_activeCivLocations) then {
				private _nearbyPlayers = _units inAreaArray [getPosATL _x,750,750,0,false,250];
				if (_nearbyPlayers isNotEqualTo []) then {
					DT_activeCivLocations pushBack _x;
					[_x] call DT_fnc_spawnCivilians;
				};
			};
		} forEach DT_civLocations;
	},
	3
] call CBA_fnc_addPerFrameHandler;