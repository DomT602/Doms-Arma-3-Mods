if !(isClass(configFile >> "CfgPatches" >> "ace_common")) then {
	
	// Add event handler for UAV control change if ACE is not usable
	ACE_controlledUAV = [objNull, objNull, [], ""];
	addMissionEventHandler ["PlayerViewChanged", {
		// On non-server client this command is semi-broken
		// arg index 5 should be the controlled UAV, but it will often be objNull (delay from locality switching?)
		// On PlayerViewChanged event, start polling for new uav state for a few seconds (should be done within a few frames)

		params ["", "", "", "", "_newCameraOn", "_UAV"];
		//TRACE_2("PlayerViewChanged",_newCameraOn,_UAV);

		[{
			if (isNull player) exitWith {true};
			private _UAV = getConnectedUAV player;
			if (!alive player) then {_UAV = objNull;};
			private _position = [player] call DT_fnc_getUavControlPosition;
			private _seatAI = objNull;
			private _turret = [];
			switch (toLowerANSI _position) do {
				case (""): {
					_UAV = objNull; // set to objNull if not actively controlling
				};
				case ("driver"): {
					_turret = [-1];
					_seatAI = driver _UAV;
				};
				case ("gunner"): {
					_turret = [0];
					_seatAI = gunner _UAV;
				};
			};

			private _newArray = [_UAV, _seatAI, _turret, _position];
			if (_newArray isEqualTo ACE_controlledUAV) exitWith {false}; // no change yet

			//TRACE_2("Seat Change",_newArray,ACE_controlledUAV);
			//ACE_controlledUAV = _newArray;
			["ACE_controlledUAV", _newArray] call CBA_fnc_localEvent;

			// stay in the loop as we might switch from gunner -> driver, and there may be a empty position event in-between
			false
		}, {}, [], 3, {/*TRACE_1("timeout",_this);*/}] call CBA_fnc_waitUntilAndExecute;
	}];
	
};