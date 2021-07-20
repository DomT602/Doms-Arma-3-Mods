/*
	File: fn_changeSingleValue.sqf
	Author: Dom
	Description: Handles an update to one specific view distance value
*/
params [
	["_viewType","foot",[""]],
	["_index",0,[0]],
	["_value",5000,[0]]
];

ACE_controlledUAV params [["_uav",objNull]];
private _vehicle = if (isNull _uav) then {objectParent player} else {_uav};

if (_viewType isEqualTo "rotary") exitWith {
	if (_vehicle isKindOf "Helicopter") then {
		if (_index isEqualTo 0) then {
			setViewDistance _value;
		} else {
			setObjectViewDistance _value;
		};
	};
};

if (_viewType isEqualTo "air") exitWith {
	if (_vehicle isKindOf "Air" && {!(_vehicle isKindOf "Helicopter")}) then {
		if (_index isEqualTo 0) then {
			setViewDistance _value;
		} else {
			setObjectViewDistance _value;
		};
	};
};

if (_viewType isEqualTo "ship") exitWith {
	if (_vehicle isKindOf "Ship") then {
		if (_index isEqualTo 0) then {
			setViewDistance _value;
		} else {
			setObjectViewDistance _value;
		};
	};
};

if (_viewType isEqualTo "car") exitWith {
	if (_vehicle isKindOf "LandVehicle") then {
		if (_index isEqualTo 0) then {
			setViewDistance _value;
		} else {
			setObjectViewDistance _value;
		};
	};
};

if (_viewType isEqualto "foot") exitWith {
	if (isNull _vehicle) then {
		if (_index isEqualTo 0) then {
			setViewDistance _value;
		} else {
			setObjectViewDistance _value;
		};
	};
};