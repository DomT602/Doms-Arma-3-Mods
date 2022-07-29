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
			idc = -1;
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
			text = "$STR_DTLS_transfer";
			onButtonClick = "[""transfer""] call DT_fnc_alterLives";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenu_2401: RscButtonMenu_2400
		{
			idc = 2401;
			text = "$STR_DTLS_reset";
			onButtonClick = "[""reset""] call DT_fnc_alterLives";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
		};
		class RscButtonMenu_2402: RscButtonMenu_2400
		{
			idc = 2402;
			text = "$STR_DTLS_give";
			onButtonClick = "[""give""] call DT_fnc_alterLives";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
		};
		class RscButtonMenu_2403: RscButtonMenu_2400
		{
			idc = 2403;
			text = "$STR_DTLS_remove";
			onButtonClick = "[""remove""] call DT_fnc_alterLives";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
		};
		class RscButtonMenu_2404: RscButtonMenu_2401
		{
			idc = 2401;
			text = "$STR_DTLS_resetAll";
			onButtonClick = "[""resetAll""] call DT_fnc_alterLives";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
		};
	};
};