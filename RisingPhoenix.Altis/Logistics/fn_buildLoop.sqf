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

	private _nearbyObjects = nearestObjects [_nextPreviewPos,["AllVehicles","House"],_collisionZone,true];
	_nearbyObjects append (nearestTerrainObjects [_nextPreviewPos,["TREE","BUILDING"],_collisionZone,false,true]);

	private _ignoreObjects = [
		"Land_HelipadSquare_F",
		"Land_TentHangar_V1_F",
		"Land_runway_edgelight",
		"Land_runway_edgelight_blue_F",
		"Land_Flush_Light_green_F",
		"Land_Flush_Light_red_F",
		"Land_Flush_Light_yellow_F",
		"Flag_NATO_F",
		"Flag_White_F",
		"Flag_RedCrystal_F",
		"CamoNet_BLUFOR_F",
		"CamoNet_BLUFOR_open_F",
		"CamoNet_BLUFOR_big_F",
		"Land_PortableLight_single_F",
		"Land_PortableLight_double_F",
		"PortableHelipadLight_01_blue_F",
		"PortableHelipadLight_01_green_F",
		"PortableHelipadLight_01_red_F",
		"Land_BagFence_Round_F",
		"Land_BagFence_Short_F",
		"Land_BagFence_Long_F",
		"Land_BagFence_Corner_F",
		"Land_BagFence_End_F",
		"Land_Sign_WarningMilitaryArea_F",
		"Land_Sign_WarningMilAreaSmall_F",
		"Land_Sign_WarningMilitaryVehicles_F",
		"Land_Razorwire_F",
		"Land_ConcreteHedgehog_01_F",
		"Land_CzechHedgehog_01_F",
		"Land_DragonsTeeth_01_4x2_new_F",
		"Land_DragonsTeeth_01_1x1_new_F",
		"Land_CncBarrierMedium_F",
		"Land_CncBarrierMedium4_F",
		"Land_Concrete_SmallWall_4m_F",
		"Land_Concrete_SmallWall_8m_F",
		"Land_CncShelter_F",
		"Land_CncWall1_F",
		"Land_CncWall4_F",
		"BlockConcrete_F",
		"Land_RampConcrete_F",
		"Land_RampConcreteHigh_F",
		"Land_HBarrier_1_F",
		"Land_HBarrier_3_F",
		"Land_HBarrier_5_F",
		"Land_HBarrier_Big_F",
		"Land_HBarrierWall4_F",
		"Land_HBarrierWall6_F",
		"Land_HBarrierWall_corner_F",
		"Land_HBarrierWall_corridor_F",
		"Land_SandbagBarricade_01_half_F",
		"Land_SandbagBarricade_01_F",
		"Land_SandbagBarricade_01_hole_F",
		"Land_BagBunker_Small_F",
		"Land_BagBunker_Large_F",
		"Land_BagBunker_Tower_F",
		"Land_MedicalTent_01_NATO_generic_open_F",
		"Land_MedicalTent_01_NATO_generic_outer_F",
		"CargoPlaftorm_01_green_F",
		"Land_HBarrierTower_F",
		"Sign_Sphere100cm_F",
		"Land_PierLadder_F",
		"Land_BarGate_01_open_F",
		"Land_Mil_WiredFence_Gate_F",
		"Land_ClutterCutter_large_F",
		"Land_HighVoltageColumnWire_F",
		"Land_PowerWireBig_left_F",
		"B_HMG_01_F",
		"B_HMG_01_high_F",
		"B_HMG_01_A_F",
		"B_GMG_01_F",
		"B_GMG_01_high_F",
		"B_GMG_01_A_F",
		"B_static_AT_F",
		"B_static_AA_F",
		"B_Mortar_01_F",
		"ACE_friesAnchorBar",
		"ACE_friesGantryReverse",
		"ACE_friesGantry",
		"Land_CamoNet_NATO",
		"Land_CamoNetVar_NATO",
		"Land_CamoNetB_NATO"
	];

	private _collidingObjects = [];
	{
		if !(_x isKindOf "CAManBase" || {(typeOf _x) in _ignoreObjects || {_x isEqualTo _previewObject}}) then {
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