/*
	File: fn_initFocusedBoost.sqf
	Author: Dom
	Description: Starts or stops the focused zoom boost handler
*/
params [
	["_enable",true,[false]]
];

if (_enable) then {
	DT_viewDistance_zoomTempOn = addUserActionEventHandler ["zoomTemp","Activate",DT_fnc_focusedZoom];
	DT_viewDistance_zoomTempOff = addUserActionEventHandler ["zoomTemp","Deactivate",DT_fnc_focusedZoom];

	DT_viewDistance_zoomInOn = addUserActionEventHandler ["zoomIn","Activate",DT_fnc_focusedZoom];
	DT_viewDistance_zoomInOff = addUserActionEventHandler ["zoomIn","Deactivate",DT_fnc_focusedZoom];

	DT_viewDistance_zoomContInOn = addUserActionEventHandler ["zoomContIn","Activate",DT_fnc_focusedZoom];
	DT_viewDistance_zoomContInOff = addUserActionEventHandler ["zoomContIn","Deactivate",DT_fnc_focusedZoom];
} else {
	if (isNil "DT_viewDistance_zoomTempOn") exitWith {};
	removeUserActionEventHandler ["zoomTemp","Activate",DT_viewDistance_zoomTempOn];
	removeUserActionEventHandler ["zoomTemp","Deactivate",DT_viewDistance_zoomTempOff];
	removeUserActionEventHandler ["zoomIn","Activate",DT_viewDistance_zoomInOn];
	removeUserActionEventHandler ["zoomIn","Deactivate",DT_viewDistance_zoomInOff];
	removeUserActionEventHandler ["zoomContIn","Activate",DT_viewDistance_zoomContInOn];
	removeUserActionEventHandler ["zoomContIn","Deactivate",DT_viewDistance_zoomContInOff];

	DT_viewDistance_zoomTempOn = nil;
	DT_viewDistance_zoomTempOff = nil;
	DT_viewDistance_zoomInOn = nil;
	DT_viewDistance_zoomInOff = nil;
	DT_viewDistance_zoomContInOn = nil;
	DT_viewDistance_zoomContInOff = nil;
};