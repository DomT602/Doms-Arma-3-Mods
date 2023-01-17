class DT_talkMenu {
	idd=9743;
	name="DT_talkMenu";
	movingEnable=0;
	class controls {
		class RscPicture_1200: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.75)";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.352 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.165 * safezoneH;
			class Attributes {
				align = "center";
			};
		};
		class RscButtonMenu_2400: DT_RscButtonGeneral
		{
			idc = 2400;
			text = "ASK"; //--- ToDo: Localize;
			onButtonClick = "[DT_talkingTarget,lbCurSel 1500] call DT_fnc_askQuestion";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2401: DT_RscButtonGeneral
		{
			idc = 2401;
			text = "RESTRAIN"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2402: DT_RscButtonGeneral
		{
			idc = 2402;
			text = "SEARCH"; //--- ToDo: Localize;
			onButtonClick = "[DT_talkingTarget] remoteExecCall ['DT_fnc_patDown',DT_talkingTarget]; closeDialog 0";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2403: DT_RscButtonGeneral
		{
			idc = 2403;
			text = "MEDICAL"; //--- ToDo: Localize;
			onButtonClick = " [{[_this] call ace_medical_gui_fnc_openMenu},DT_talkingTarget,0.1] call CBA_fnc_waitAndExecute; closeDialog 0";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2404: DT_RscButtonGeneral
		{
			idc = 2404;
			text = "CLOSE"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
