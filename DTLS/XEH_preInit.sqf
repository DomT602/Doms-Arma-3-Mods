#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[["Dom's Mods","Life System"],"hintLives","Hint Current Lives",{[] call DT_fnc_hintLives},"",[DIK_H,[false,false,false]]] call CBA_fnc_addKeybind;
[["Dom's Mods","Life System"],"openLifeMenu","Open Life Menu",{if (dialog) exitWith {}; [] call DT_fnc_openLifeMenu},"",[DIK_H,[true,false,false]]] call CBA_fnc_addKeybind;

[
	"DT_defaultLives",
	"SLIDER",
	["Default lives","Number of lives given on initial spawn or on admin reset."],
	["Dom's Mods","Life System"],
	[1,100,5,0],
	2
] call CBA_fnc_addSetting;

[
	"DT_adminUIDs",
	"EDITBOX",
	["Admin UIDs","UIDs who can access the admin buttons on the life menu."],
	["Dom's Mods","Life System"],
	"[76561198071007604]",
	2
] call CBA_fnc_addSetting;

[
	"DT_transferOverrideUIDs",
	"EDITBOX",
	["Transfer UIDs","UIDs who can access the transfer button on the life menu without being a medic."],
	["Dom's Mods","Life System"],
	"[]",
	2
] call CBA_fnc_addSetting;