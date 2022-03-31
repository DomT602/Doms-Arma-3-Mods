class DT_groupMenu
{
	idd=9701;
	name="DT_groupMenu";
	movingEnable=0;
	onUnload = "DT_groupMenuSelection = nil;";
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
		class RscText_1000: DT_RscTextCentralised
		{
			idc = -1;
			text = "Group Management"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscTree_1500: RscTree
		{
			idc = 1500;
			onTreeSelChanged = "_this call DT_fnc_onTvSelectChange;";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.473 * safezoneH;
		};
		class RscButtonMenu_2400: DT_RscButtonGeneral
		{
			idc = 2400;
			onLoad="(_this select 0) ctrlShow false";
			//size = 1.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButtonMenu_2401: RscButtonMenu_2400
		{
			idc = 2401;
			y = 0.401 * safezoneH + safezoneY;
		};
		class RscButtonMenu_2402: RscButtonMenu_2400
		{
			idc = 2402;
			y = 0.445 * safezoneH + safezoneY;
		};
		class RscButtonMenu_2403: RscButtonMenu_2400
		{
			idc = 2403;
			y = 0.489 * safezoneH + safezoneY;
		};
		class RscButtonMenu_2404: RscButtonMenu_2400
		{
			idc = 2404;
			y = 0.533 * safezoneH + safezoneY;
		};
		class RscButtonMenu_2405: RscButtonMenu_2400
		{
			idc = 2405;
			y = 0.577 * safezoneH + safezoneY;
		};
		class RscButtonMenu_2406: RscButtonMenu_2400
		{
			idc = 2406;
			y = 0.621 * safezoneH + safezoneY;
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			text = "Group Name"; //--- ToDo: Localize;
			onKeyDown = "_this call DT_fnc_renameGroup;";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};