/*
	File: fn_startBuild.sqf
	Author: Dom
	Description: Starts the building process
*/
private _display = findDisplay 9741;
private _tree = _display displayCtrl 1500;
private _selectionPath = tvCurSel _tree;

if (count _selectionPath isEqualTo 1) exitWith {["You haven't selected an item to build."] call DT_fnc_notify};
private _class = _tree tvData _selectionPath;

([_class] call DT_fnc_setupBuild) params ["_previewObject","_objectPreviewSpheres","_collisionZone","_actions"];

closeDialog 0;
[DT_fnc_buildLoop,0,[_previewObject,_objectPreviewSpheres,_collisionZone,_actions,_class]] call CBA_fnc_addPerFrameHandler;