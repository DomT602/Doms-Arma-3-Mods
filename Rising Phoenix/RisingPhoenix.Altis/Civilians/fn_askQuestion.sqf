/*
	File: fn_askQuestion.sqf
	Author: Dom
	Description: Asks a question and receives the answer
*/
params [
	["_unit",cursorObject,[objNull]],
	["_questionIndex",0,[0]]
];

private _unitPos = getPosASL _unit;
private _karma = [_unitPos] call DT_fnc_getKarma;
_karma = round (_karma / 20); //value between -5 and 5
private _individualKarma = _unit getVariable ["DT_individualKarma",0];
_karma = _karma + _individualKarma;

private _isCaptive = captive _unit;
if (_isCaptive) then {_karma = _karma - 1};

private _display = findDisplay 9743;
private _listbox = _display displayCtrl 1500;

private _questionsAsked = _unit getVariable ["DT_questionsAsked",[]];
private _questionAnswers = _unit getVariable ["DT_questionAnswers",[]];
private _response = "";
private _alreadyAsked = _questionIndex in _questionsAsked;

if (_alreadyAsked) exitWith {
	private _alreadyAnsweredStarters = [
		"I already answered that: ",
		"I told you before; ",
		"You already asked me that, "
	];

	private _oldIndex = _questionsAsked find _questionIndex;
	private _oldResponse = _questionAnswers select _oldIndex;
	_response = format ["%1%2",selectRandom _alreadyAnsweredStarters,_oldResponse];
	(_display displayCtrl 1100) ctrlSetStructuredText parseText _response;
};

_questionsAsked pushBack _questionIndex;
_unit setVariable ["DT_questionsAsked",_questionsAsked,true];

private _genericNegativeResponses = [
	"I'm not telling you that.",
	"Piss off.",
	"I spit on what you have done here.",
	"Just leave me alone."
];

private _fnc_enemyReport = {
	params ["_distance","_direction"];

	private _distanceText = "nearby to the";
	if (_distance > 500) then {
		if (_distance > 1500) then {
			_distanceText = "far to the"
		} else {
			_distanceText = "some distance to the";
		};
	};

	private _directionText = "north";
	if (_direction > 45) then {
		_directionText = "northeast";
		if (_direction > 90) then {
			_directionText = "east";
			if (_direction > 135) then {
				_directionText = "southeast";
				if (_direction > 180) then {
					_directionText = "south";
					if (_direction > 225) then {
						_directionText = "southwest";
						if (_direction > 270) then {
							_directionText = "west";
							if (_direction > 315) then {
								_directionText = "northwest";
							};
						};
					};
				};
			};
		};
	};

	[_distanceText,_directionText]
};

switch _questionIndex do {
	case 0: {
		if (_isCaptive || {_karma >= 0}) then {
			private _options = [
				"My name is",
				"I am",
				"I'm",
				"I am called"
			];
			_response = format ["%1 %2.",selectRandom _options,name _unit];
		} else {
			_response = selectRandom _genericNegativeResponses;
		};
	};
	case 1: {
		private _options = [
			["You're looking pretty suspicious.",""],
			["Some armed men have just arrived in our village.",""],
			["I don't know of anything of interest.",""],
			["Do you think I'm not telling you something?",""],
			["I only just got here, I don't know anything.",""]
		];

		if (_karma > 0) then {
			if ((DT_missionDetails findIf {"hostageRescue" in _x}) isEqualTo -1) then {
				_options pushBack ["I saw some armed men take a man from our town.","DT_fnc_civHostage"];
			};

			private _nearbyMines = nearestMines [_unitPos,[],500,false,false];
			if (_nearbyMines isNotEqualTo []) then {
				_options pushBack ["I saw some mines being planted, let me mark them on your map.","DT_fnc_markMines"];
			};
		} else {
			_options append _genericNegativeResponses;
		};

		private _selectedOption = selectRandom _options;
		if (_selectedOption isEqualType []) then {
			_response = _selectedOption select 0;
			[_unit] remoteExecCall [_selectedOption select 1,2];
		} else {
			_response = _selectedOption;
		};
	};
	case 2: {
		private _options = [
			"We don't need your help."
		];
		if (_karma < 0) then {
			_options pushBack "You can help by leaving my town.";
		};

		if (_isCaptive) then {
			_options pushBack "You can help by letting me go.";
		};

		private _unitInjured = _unit call ACE_medical_ai_fnc_isInjured;
		if (_unitInjured) then {
			if (_karma > 0) then {
				_options pushBack selectRandom ["I need medical help.","Please, help me, it hurts."];
			} else {
				_options pushBack selectRandom ["My pain is not as bad as letting you help me."];
			};
		};

		private _nearUnits = _unitPos nearEntities ["CAManBase",500];
		private _nearInjuredCount = {side _x isEqualTo civilian && {_x call ACE_medical_ai_fnc_isInjured}} count _nearUnits;
		if (_nearInjuredCount > 0) then {
			if (_nearInjuredCount > 6) then {
				_options pushBack "There are many people in the area that need medical help.";
			} else {
				if (_nearInjuredCount > 4) then {
					_options pushBack "There are some people in the area that need medical help.";
				} else {
					_options pushBack "A few people in the area need medical help.";
				};
			};
		};

		private _nearIndeps = {side _x isEqualTo independent} count _nearUnits;
		if (_nearIndeps isEqualTo 0) then {
			private _nearbyMines = nearestMines [_unitPos,[],500,false,false];
			if (_nearbyMines isNotEqualTo []) then {
				private _mineCount = count _mines;
				private _mineText = "There are some IEDs we would like clearing.";
				if (_mineCount > 5) then {
					_mineText = "There are lots of IEDs we would like clearing.";
				};
				_options pushBack _mineText;
			};
		};

		_response = selectRandom _options;
	};
	case 3: {
		private _options = [
			"We only have RedBurger, that way.",
			"This town has the best RB around.",
			"Seems like I am being grilled."
		];
		if (_karma < 0) then {
			_options pushBack "Go away or I'll give you a Whopper.";
			_options append _genericNegativeResponses;
		};

		_response = selectRandom _options;
		[getPosASL _unit,1] remoteExecCall ["DT_fnc_adjustKarma",2];
	};
	case 4: {
		private _prefixes = [
			"I think that there are enemies",
			"There might be enemies"
		];

		private _opforUnits = (_unitPos nearEntities ["CAManBase",2500]) select {side _x isEqualTo east};
		_opforUnits params [["_nearestEnemy",objNull]];
		private _distance = _unit distance _nearestEnemy;
		private _direction = _unit getDir _nearestEnemy;

		if (_karma < 0) then {
			private _options = [
				"I know nothing about this 'enemy' you talk about.",
				"You are the only enemy around here.",
				"Do you count yourself as the enemy?",
				"In my eyes, you are the only enemy here",
				"I don't know of any enemies nearby."
			];
			_options append _genericNegativeResponses;
			([random 2500,random 360] call _fnc_enemyReport) params ["_distText","_dirText"];
			_options pushBack format ["%1 %2 %3.",selectRandom _prefixes,_distText,_dirText];

			([_distance,_direction] call _fnc_enemyReport) params ["_distText","_dirText"];
			_options pushBack format ["%1 %2 %3.",selectRandom _prefixes,_distText,_dirText];

			_response = selectRandom _options;
		} else {
			if (_opforUnits isEqualTo []) then {
				_response = "I don't know of any enemies nearby.";
			} else {
				([_distance,_direction] call _fnc_enemyReport) params ["_distText","_dirText"];
				_response = format ["%1 %2 %3.",selectRandom _prefixes,_distText,_dirText];
			};
		};
	};
	case 5: {
		private _options = [
			"I haven't done anything.",
			"Why are you accusing me of that?"
		];
		if (_karma < 0) then {
			_options append _genericNegativeResponses;
		};
		
		_response = selectRandom _options;
	};
	case 6: {
		if (_karma < -5) then {
			_response = selectRandom _genericNegativeResponses;
		} else {
			if ((DT_missionDetails findIf {"captureCommander" in _x}) isEqualTo -1 && {random 100 > 75}) then {
				private _officerName = [getText(missionConfigFile >> "Opfor_Setup" >> DT_opforFaction >> "opforOfficer")] call DT_fnc_getRandomName;
				_response = format ["He's called %1, he was here an hour ago.",_officerName];
				[_unit,_officerName] remoteExecCall ["DT_fnc_captureCommander",2];
			} else {
				_response = selectRandom ["I haven't seen anything recently.","I don't know anything."];
			};
		};
	};
	case 7: {
		if (_karma < -5) then {
			_response = selectRandom _genericNegativeResponses;
		} else {
			if ((DT_missionDetails findIf {"killCommander" in _x}) isEqualTo -1 && {random 100 > 75}) then {
				_response = selectRandom ["A commander came through here recently.","I saw lots of soldiers camped outside in a nearby town."];
				[_unit] remoteExecCall ["DT_fnc_killCommander",2];
			} else {
				_response = selectRandom ["I haven't seen anything recently.","I don't know anything."];
			};
		};
	};
	case 8: {
		if ((DT_missionDetails findIf {"destroyConvoy" in _x}) isEqualTo -1 && {random 100 > 75}) then {
			_response = "A convoy usually passes through about now.";
			[_unit] remoteExecCall ["DT_fnc_destroyConvoy",2];
		} else {
			_response = selectRandom ["I haven't seen anything recently.","I don't know anything."];
		};
	};
};

_questionAnswers pushBack _response;
_unit setVariable ["DT_questionAnswers",_questionAnswers,true];
(_display displayCtrl 1100) ctrlSetStructuredText parseText _response;