class DT_talkMenu {
	idd=9743;
	name="DT_talkMenu";
	movingEnable=0;
	class controls {
		class Background: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.75)";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.418 * safezoneH;
		};
		class QuestionList: RscListbox
		{
			idc = 1500;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class ResponseArea: RscStructuredText
		{
			idc = 1100;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.231 * safezoneH;
			class Attributes {
				align = "center";
			};
		};
		class AskButton: DT_RscButtonGeneral
		{
			idc = 2400;
			text = "Ask"; //--- ToDo: Localize;
			onButtonClick = "[DT_talkingTarget,lbCurSel 1500] call DT_fnc_askQuestion";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RestrainButton: AskButton
		{
			idc = 2401;
			text = "$STR_ACE_Captives_CableTie";
			y = 0.577 * safezoneH + safezoneY;
		};
		class SearchButton: AskButton
		{
			idc = 2402;
			text = "$STR_3DEN_DISPLAY3DEN_MENUBAR_SEARCH_TEXT";
			onButtonClick = "[DT_talkingTarget] remoteExecCall ['DT_fnc_patDown',DT_talkingTarget]; closeDialog 0";
			y = 0.61 * safezoneH + safezoneY;
		};
		class MedicalMenuButton: AskButton
		{
			idc = 2403;
			text = "$STR_A3_CFGCHAINOFCOMMAND_TYPES_MEDICAL_NAMENEUTRAL";
			onButtonClick = " [{[_this] call ace_medical_gui_fnc_openMenu},DT_talkingTarget,0.1] call CBA_fnc_waitAndExecute; closeDialog 0";
			y = 0.643 * safezoneH + safezoneY;
		};
		class CloseButton: AskButton
		{
			idc = 2404;
			text = "$STR_DISP_CLOSE";
			onButtonClick = "closeDialog 0";
			y = 0.676 * safezoneH + safezoneY;
		};
	};
};
