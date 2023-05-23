#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[
	"DT_viewDistanceEnabled",
	"CHECKBOX",
	["STR_DTVD_enableOption","STR_DTVD_enableOptionDescription"],
	["STR_DT_modCategory","STR_DTVD_modSubCategory"],
	true,nil,
	DT_fnc_initViewDistance
] call CBA_fnc_addSetting;
[["STR_DT_modCategory","STR_DTVD_modSubCategory"],"openViewDistanceMenu","STR_DTVD_openMenu",DT_fnc_openViewDistanceMenu,"",[DIK_BACKSLASH,[false,false,false]]] call CBA_fnc_addKeybind;

[
	"DT_automaticObjectSync",
	"CHECKBOX",
	["STR_DTVD_objectSync","STR_DTVD_objectSyncDescription"],
	["STR_DT_modCategory","STR_DTVD_modSubCategory"],
	true
] call CBA_fnc_addSetting;

[
	"DT_viewDistanceMax",
	"SLIDER",
	["STR_DTVD_maxDistance","STR_DTVD_maxDistanceDescription"],
	["STR_DT_modCategory","STR_DTVD_modSubCategory"],
	[200,40000,12000,0],
	1
] call CBA_fnc_addSetting;

[
	"DT_terrainGridMax",
	"LIST",
	["STR_DTVD_maxTerrainGrid","STR_DTVD_maxTerrainGridDescription"],
	["STR_DT_modCategory","STR_DTVD_modSubCategory"],
	[[50,25,12.5,6.25,3.125],["STR_DTVD_terrainGrid50","STR_DTVD_terrainGrid25","STR_DTVD_terrainGrid12.5","STR_DTVD_terrainGrid6.25","STR_DTVD_terrainGrid3.125"],0],
	1
] call CBA_fnc_addSetting;

[
	"DT_viewDistanceHotkey1",
	"SLIDER",
	["STR_DTVD_viewDistanceHotkey1","STR_DTVD_viewDistanceHotkeyDescription"],
	["STR_DT_modCategory","STR_DTVD_modSubCategory"],
	[200,DT_viewDistanceMax,3000 min DT_viewDistanceMax,0]
] call CBA_fnc_addSetting;
[["STR_DT_modCategory","STR_DTVD_modSubCategory"],"viewHotkey1","STR_DTVD_hotkey1",{[DT_viewDistanceHotkey1] call DT_fnc_changeViewByHotkey},"",[DIK_BACKSLASH,[true,false,false]]] call CBA_fnc_addKeybind;

[
	"DT_viewDistanceHotkey2",
	"SLIDER",
	["STR_DTVD_viewDistanceHotkey2","STR_DTVD_viewDistanceHotkeyDescription"],
	["STR_DT_modCategory","STR_DTVD_modSubCategory"],
	[200,DT_viewDistanceMax,6000 min DT_viewDistanceMax,0]
] call CBA_fnc_addSetting;
[["STR_DT_modCategory","STR_DTVD_modSubCategory"],"viewHotkey2","STR_DTVD_hotkey2",{[DT_viewDistanceHotkey2] call DT_fnc_changeViewByHotkey},"",[DIK_BACKSLASH,[false,true,false]]] call CBA_fnc_addKeybind;

[
	"DT_viewDistanceHotkey3",
	"SLIDER",
	["STR_DTVD_viewDistanceHotkey3","STR_DTVD_viewDistanceHotkeyDescription"],
	["STR_DT_modCategory","STR_DTVD_modSubCategory"],
	[200,DT_viewDistanceMax,9000 min DT_viewDistanceMax,0]
] call CBA_fnc_addSetting;
[["STR_DT_modCategory","STR_DTVD_modSubCategory"],"viewHotkey3","STR_DTVD_hotkey3",{[DT_viewDistanceHotkey3] call DT_fnc_changeViewByHotkey},"",[DIK_BACKSLASH,[false,false,true]]] call CBA_fnc_addKeybind;