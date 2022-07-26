class RscButtonMenu;
class RscPicture;
class RscListbox;

class DT_lifeMenu
{
	idd=9700;
	name="DT_lifeMenu";
	movingEnable=0;
	class controls
	{
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0,0,0,0.7)";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			onLBSelChanged = "_this call DT_fnc_lifeMenuLbChange";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class RscButtonMenu_2400: RscButtonMenu
		{
			idc = 2400;
			text = "Transfer"; //--- ToDo: Localize;
			onButtonClick = "[""transfer""] call DT_fnc_alterLives";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2401: RscButtonMenu
		{
			idc = 2401;
			text = "Reset"; //--- ToDo: Localize;
			onButtonClick = "[""reset""] call DT_fnc_alterLives";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2402: RscButtonMenu
		{
			idc = 2402;
			text = "Give"; //--- ToDo: Localize;
			onButtonClick = "[""give""] call DT_fnc_alterLives";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2403: RscButtonMenu
		{
			idc = 2403;
			text = "Remove"; //--- ToDo: Localize;
			onButtonClick = "[""remove""] call DT_fnc_alterLives";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};