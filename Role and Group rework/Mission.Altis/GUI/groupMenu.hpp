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
		class RscText_1000: RscText
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
		class RscButtonMenu_2400: RscButtonMenu
		{
			idc = 2400;
			onLoad="(_this select 0) ctrlShow false";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscButtonMenu_2401: RscButtonMenu
		{
			idc = 2401;
			onLoad="(_this select 0) ctrlShow false";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscButtonMenu_2402: RscButtonMenu
		{
			idc = 2402;
			onLoad="(_this select 0) ctrlShow false";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscButtonMenu_2403: RscButtonMenu
		{
			idc = 2403;
			onLoad="(_this select 0) ctrlShow false";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscButtonMenu_2404: RscButtonMenu
		{
			idc = 2404;
			onLoad="(_this select 0) ctrlShow false";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscButtonMenu_2405: RscButtonMenu
		{
			idc = 2405;
			onLoad="(_this select 0) ctrlShow false";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscButtonMenu_2406: RscButtonMenu
		{
			idc = 2406;
			onLoad="(_this select 0) ctrlShow false";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
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