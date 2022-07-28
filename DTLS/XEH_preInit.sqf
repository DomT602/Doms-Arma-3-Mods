#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[["STR_DT_modCategory","STR_DTLS_modSubCategory"],"hintLives","STR_DTLS_showLives",{[] call DT_fnc_hintLives},"",[DIK_H,[false,false,false]]] call CBA_fnc_addKeybind;
[["STR_DT_modCategory","STR_DTLS_modSubCategory"],"openLifeMenu","STR_DTLS_openMenu",{if (dialog) exitWith {}; [] call DT_fnc_openLifeMenu},"",[DIK_H,[true,false,false]]] call CBA_fnc_addKeybind;

[
	"DT_defaultLives",
	"SLIDER",
	["STR_DTLS_defaultLives","STR_DTLS_defaultLivesDescription"],
	["STR_DT_modCategory","STR_DTLS_modSubCategory"],
	[1,100,5,0],
	1
] call CBA_fnc_addSetting;

[
	"DT_adminUIDs",
	"EDITBOX",
	["STR_DTLS_adminUIDs","STR_DTLS_adminUIDsDescription"],
	["STR_DT_modCategory","STR_DTLS_modSubCategory"],
	"[76561198071007604]",
	1
] call CBA_fnc_addSetting;

[
	"DT_transferOverrideUIDs",
	"EDITBOX",
	["STR_DTLS_transferUIDs","STR_DTLS_transferUIDsDescription"],
	["STR_DT_modCategory","STR_DTLS_modSubCategory"],
	"[]",
	1
] call CBA_fnc_addSetting;