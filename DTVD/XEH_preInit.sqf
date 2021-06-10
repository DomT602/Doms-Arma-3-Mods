#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[
	"DT_viewDistanceEnabled",
	"CHECKBOX",
	["Enable View Distance Management","Allow the DT View Distance Manager to manage your view distance and terrain grid."],
	["Dom's Mods"],
	true,nil,
	{
		params ["_value"];
		[_value] call DT_fnc_initViewDistance;
	}
] call CBA_fnc_addSetting;
[["Dom's Mods","View Distance"],"openViewDistanceMenu","Open view distance menu",{[] call DT_fnc_openViewDistanceMenu},"",[DIK_BACKSLASH,[false,false,false]]] call CBA_fnc_addKeybind;