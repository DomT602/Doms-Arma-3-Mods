/*
	File: fn_zoomEditChanged.sqf
	Author: Dom
	Description: Handles an update to the view distance options
*/
params ["_control","_text","_type"];

private _newValue = parseNumber ([_text,"0123456789"] call BIS_fnc_filterString);
_newValue = ((_newValue max 0) min 1000);

private _variableToUpdate = format ["DT_%1ViewDistance",_type];
private _viewVar = profileNamespace getVariable [_variableToUpdate,[5000,5000,25,0]];
_viewVar set [3,_newValue];

private _display = findDisplay 9439;
private _controlString = str _control;
private _startIndex = _controlString find "#";
private _controlID = parseNumber (_controlString select [(_startIndex + 1)]);
private _slider = _display displayCtrl (_controlID + 500);
_slider sliderSetPosition _newValue;
_control ctrlSetText str _newValue; //make sure correct value is returned in box