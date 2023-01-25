/*
	File: fn_buildLoop.sqf
	Author: Dom
	Description: Manages PFH of building
*/
params ["_args","_handle"];
_args params ["_previewObject","_spheres","_collisionZone","_actions","_class"];

if (DT_buildAction > 0 || {!alive player || {!isNull objectParent player}}) then {
	[_handle] call CBA_fnc_removePerFrameHandler;
	private _finalPosition = getPosATLVisual _previewObject;
	private _finalDir = getDir _previewObject;
	deleteVehicle _previewObject;
	{
		deleteVehicle _x;
	} forEach _spheres;
	{
		player removeAction _x;
	} forEach _actions;

	if (DT_buildAction isEqualTo 1) then {
		[
			{
				params ["_class","_finalPosition","_finalDir"];
				private _object = createVehicle [_class,_finalPosition,[],0,"CAN_COLLIDE"];
				_object setPosATL _finalPosition;
				_object setDir _finalDir;

				if (unitIsUAV _object) then {
					[_object] call DT_fnc_setupUAV;
				};
			},
			[_class,_finalPosition,_finalDir],
			0.01
		] call CBA_fnc_waitAndExecute;
	} else {
		["Build cancelled."] call DT_fnc_notify;
	};
} else {
	private _nextPreviewPos = player modelToWorld [0,3 + _collisionZone,DT_buildElevation];
	_previewObject setPosATL _nextPreviewPos;
	_previewObject setDir ((getDir player) + DT_buildRotation);

	private _nearbyObjects = nearestObjects [_nextPreviewPos,["AllVehicles","House_F"],_collisionZone,true];
	_nearbyObjects append (nearestTerrainObjects [_nextPreviewPos,["TREE","BUILDING"],_collisionZone,false,true]);

	private _ignoreObjects = [
		"Land_HelipadSquare_F",
		"Land_TentHangar_V1_F",
		"Land_runway_edgelight",
		"Land_runway_edgelight_blue_F",
		"Land_Flush_Light_green_F",
		"Land_Flush_Light_red_F",
		"Land_Flush_Light_yellow_F",
		"CamoNet_BLUFOR_F",
		"CamoNet_BLUFOR_open_F",
		"CamoNet_BLUFOR_big_F",
		"Land_PortableLight_single_F",
		"Land_PortableLight_double_F",
		"PortableHelipadLight_01_blue_F",
		"PortableHelipadLight_01_green_F",
		"PortableHelipadLight_01_red_F",
		"Land_Sign_WarningMilitaryArea_F",
		"Land_Sign_WarningMilAreaSmall_F",
		"Land_Sign_WarningMilitaryVehicles_F",
		"Land_ClutterCutter_large_F",
		"Land_HighVoltageColumnWire_F",
		"Land_PowerWireBig_left_F"
	];

	private _collidingObjects = [];
	{
		if !(_x isKindOf "Man" || {(typeOf _x) in _ignoreObjects || {_x isEqualTo _previewObject}}) then {
			_collidingObjects pushBack _x;
		};
	} forEach _nearbyObjects;

	private _sphereColour = "#(rgb,8,8,3)color(1,0,0,1)";
	if (_collidingObjects isEqualTo []) then {
		_sphereColour = "#(rgb,8,8,3)color(0,1,0,1)";
		DT_canBuild = true;
	} else {
		DT_canBuild = false;
		{
			drawIcon3D ["\A3\ui_f\data\map\markers\handdrawn\objective_CA.paa",[1,0,0,1],(getPosATL _x vectorAdd [0,0,2]),1,1,0,getText(configOf _x >> "displayName"),0,0.04];
		} forEach _collidingObjects;
	};

	{
		_x setPosATL (_nextPreviewPos getPos [_collisionZone,10 * _forEachIndex]);
		_x setObjectTexture [0,_sphereColour];
	} forEach _spheres;
};