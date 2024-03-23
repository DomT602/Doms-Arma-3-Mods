class RscPicture;
class RscText;
class RscXSliderH;
class RscEdit;
class RscCombo;

class DT_viewDistanceMenu {
	idd = 9439;
	name="DT_viewDistanceMenu";
	movingEnable=0;
	class controls {
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0,0,0,0.75)";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.114 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.704 * safezoneH;
		};
		class RscSlider_1900: RscXSliderH
		{
			idc = 1900;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "[_this,'foot',0] call DT_fnc_viewSliderChanged";
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "$STR_DTVD_menuTitle";
			style = 0x02;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.114 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "$STR_DTVD_foot";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.147 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "$STR_DTVD_view";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "$STR_DTVD_object";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.213 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			text = "$STR_DTVD_terrain";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.246 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			text = "12000";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			maxChars = 5;
			onKeyUp = "[_this select 0,'foot',0] call DT_fnc_viewEditChanged";
		};
		class RscSlider_1901: RscXSliderH
		{
			idc = 1901;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.213 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "[_this,'foot',1] call DT_fnc_viewSliderChanged";
		};
		class RscEdit_1401: RscEdit
		{
			idc = 1401;
			text = "12000";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.213 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			maxChars = 5;
			onKeyUp = "[_this select 0,'foot',1] call DT_fnc_viewEditChanged";
		};
		class RscCombo_2100: RscCombo
		{
			idc = 2100;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.246 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "[_this,'foot'] call DT_fnc_terrainGridChanged";
		};
		class RscText_1005: RscText
		{
			idc = 1005;
			text = "$STR_DTVD_ship";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1006: RscText
		{
			idc = 1006;
			text = "$STR_DTVD_view";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.323 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1007: RscText
		{
			idc = 1007;
			text = "$STR_DTVD_object";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.356 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1008: RscText
		{
			idc = 1008;
			text = "$STR_DTVD_terrain";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.389 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1009: RscText
		{
			idc = 1009;
			text = "$STR_DTVD_car";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.422 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1010: RscText
		{
			idc = 1010;
			text = "$STR_DTVD_view";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.455 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1011: RscText
		{
			idc = 1011;
			text = "$STR_DTVD_object";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.488 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1012: RscText
		{
			idc = 1012;
			text = "$STR_DTVD_terrain";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.521 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1013: RscText
		{
			idc = 1013;
			text = "$STR_DTVD_rotary";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.554 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1014: RscText
		{
			idc = 1014;
			text = "$STR_DTVD_view";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.587 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1015: RscText
		{
			idc = 1015;
			text = "$STR_DTVD_object";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1016: RscText
		{
			idc = 1016;
			text = "$STR_DTVD_terrain";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1017: RscText
		{
			idc = 1017;
			text = "$STR_DTVD_air";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1018: RscText
		{
			idc = 1018;
			text = "$STR_DTVD_view";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1019: RscText
		{
			idc = 1019;
			text = "$STR_DTVD_object";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1020: RscText
		{
			idc = 1020;
			text = "$STR_DTVD_terrain";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscSlider_1902: RscXSliderH
		{
			idc = 1902;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.323 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "[_this,'ship',0] call DT_fnc_viewSliderChanged";
		};
		class RscSlider_1903: RscXSliderH
		{
			idc = 1903;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.356 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "[_this,'ship',1] call DT_fnc_viewSliderChanged";
		};
		class RscSlider_1904: RscXSliderH
		{
			idc = 1904;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.455 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "[_this,'car',0] call DT_fnc_viewSliderChanged";
		};
		class RscSlider_1905: RscXSliderH
		{
			idc = 1905;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.488 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "[_this,'car',1] call DT_fnc_viewSliderChanged";
		};
		class RscSlider_1906: RscXSliderH
		{
			idc = 1906;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.587 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "[_this,'rotary',0] call DT_fnc_viewSliderChanged";
		};
		class RscSlider_1907: RscXSliderH
		{
			idc = 1907;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "[_this,'rotary',1] call DT_fnc_viewSliderChanged";
		};
		class RscSlider_1908: RscXSliderH
		{
			idc = 1908;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "[_this,'air',0] call DT_fnc_viewSliderChanged";
		};
		class RscSlider_1909: RscXSliderH
		{
			idc = 1909;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "[_this,'air',1] call DT_fnc_viewSliderChanged";
		};
		class RscCombo_2101: RscCombo
		{
			idc = 2101;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.389 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "[_this,'ship'] call DT_fnc_terrainGridChanged";
		};
		class RscCombo_2102: RscCombo
		{
			idc = 2102;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.521 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "[_this,'car'] call DT_fnc_terrainGridChanged";
		};
		class RscCombo_2103: RscCombo
		{
			idc = 2103;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "[_this,'rotary'] call DT_fnc_terrainGridChanged";
		};
		class RscCombo_2104: RscCombo
		{
			idc = 2104;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.022 * safezoneH;
			onLBSelChanged = "[_this,'air'] call DT_fnc_terrainGridChanged";
		};
		class RscEdit_1402: RscEdit
		{
			idc = 1402;
			text = "12000";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.323 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			maxChars = 5;
			onKeyUp = "[_this select 0,'ship',0] call DT_fnc_viewEditChanged";
		};
		class RscEdit_1403: RscEdit
		{
			idc = 1403;
			text = "12000";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.356 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			maxChars = 5;
			onKeyUp = "[_this select 0,'ship',1] call DT_fnc_viewEditChanged";
		};
		class RscEdit_1404: RscEdit
		{
			idc = 1404;
			text = "12000";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.455 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			maxChars = 5;
			onKeyUp = "[_this select 0,'car',0] call DT_fnc_viewEditChanged";
		};
		class RscEdit_1405: RscEdit
		{
			idc = 1405;
			text = "12000";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.488 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			maxChars = 5;
			onKeyUp = "[_this select 0,'car',1] call DT_fnc_viewEditChanged";
		};
		class RscEdit_1406: RscEdit
		{
			idc = 1406;
			text = "12000";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.587 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			maxChars = 5;
			onKeyUp = "[_this select 0,'rotary',0] call DT_fnc_viewEditChanged";
		};
		class RscEdit_1407: RscEdit
		{
			idc = 1407;
			text = "12000";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			maxChars = 5;
			onKeyUp = "[_this select 0,'rotary',1] call DT_fnc_viewEditChanged";
		};
		class RscEdit_1408: RscEdit
		{
			idc = 1408;
			text = "12000";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			maxChars = 5;
			onKeyUp = "[_this select 0,'air',0] call DT_fnc_viewEditChanged";
		};
		class RscEdit_1409: RscEdit
		{
			idc = 1409;
			text = "12000";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			maxChars = 5;
			onKeyUp = "[_this select 0,'air',1] call DT_fnc_viewEditChanged";
		};
	};
};