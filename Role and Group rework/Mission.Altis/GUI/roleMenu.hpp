class DT_roleMenu
{
	idd=9700;
	name="DT_roleMenu";
	movingEnable=0;
	class controls {
		class RscPicture_1200: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.75)";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class RscText_1000: RscText
		{
			idc = -1;
			text = "Role Selection"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			onLBSelChanged = "_this call DT_fnc_roleMenuLBChange";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.473 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			x = 0.489688 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class RscButtonMenu_2400: RscButtonMenu
		{
			idc = 2400;
			text = "Select Role"; //--- ToDo: Localize;
			onButtonClick = "[] call DT_fnc_selectRole;";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};