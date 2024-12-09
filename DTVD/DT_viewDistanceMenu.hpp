class RscPicture;
class RscText;
class RscXSliderH;
class RscEdit;
class RscCombo;
class RscButtonMenu;

#define GUI_GRID_CENTER_W			(((safezoneW / safezoneH) min 1.2)/ 40)
#define GUI_GRID_CENTER_H			((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25)
#define GUI_GRID_CENTER_X			(safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2)) / 2)
#define GUI_GRID_CENTER_Y			(safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2)) / 2)

class DT_viewDistanceMenu {
	idd = 9439;
	name="DT_viewDistanceMenu";
	movingEnable=0;
	class controls {
		class Background: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.75)";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 1 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 40 * GUI_GRID_CENTER_W;
			h = 17.5 * GUI_GRID_CENTER_H;
		};
		class MenuText: RscText
		{
			idc = -1;
			style = 2;
			text = "$STR_DTVD_menuTitle";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 0 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 40 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
		};
		class FootViewSlider: RscXSliderH
		{
			idc = 1900;
			onSliderPosChanged = "[_this select 0,_this select 1,'foot',0] call DT_fnc_viewSliderChanged";
			x = 5.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 2 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootText: RscText
		{
			idc = -1;
			text = "$STR_DTVD_foot";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 1 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 19 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootView: RscText
		{
			idc = -1;
			text = "$STR_DTVD_view";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 2 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootObject: RscText
		{
			idc = -1;
			text = "$STR_DTVD_object";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 3 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootTerrain: RscText
		{
			idc = -1;
			text = "$STR_DTVD_terrain";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootViewEdit: RscEdit
		{
			idc = 1400;
			maxChars = 5;
			onEditChanged = "[_this select 0,_this select 1,'foot',0] call DT_fnc_viewEditChanged";
			x = 15.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 2 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootObjectSlider: RscXSliderH
		{
			idc = 1901;
			onSliderPosChanged = "[_this select 0,_this select 1,'foot',1] call DT_fnc_viewSliderChanged";
			x = 5.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 3 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootObjectEdit: RscEdit
		{
			idc = 1401;
			maxChars = 5;
			onEditChanged = "[_this select 0,_this select 1,'foot',1] call DT_fnc_viewEditChanged";
			x = 15.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 3 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootTerrainCombo: RscCombo
		{
			idc = 2100;
			onLBSelChanged = "[_this,'foot'] call DT_fnc_terrainGridChanged";
			x = 5.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootZoom: RscText
		{
			idc = -1;
			text = "$STR_DTVD_zoom";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 4 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootZoomSlider: RscXSliderH
		{
			idc = 1950;
			onSliderPosChanged = "[_this select 0,_this select 1,'foot'] call DT_fnc_zoomSliderChanged";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 5.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 4 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class FootZoomEdit: RscEdit
		{
			idc = 1450;
			maxChars = 4;
			onEditChanged = "[_this select 0,_this select 1,'foot'] call DT_fnc_zoomEditChanged";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 15.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 4 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarText: RscText
		{
			idc = -1;
			text = "$STR_DTVD_car";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 7 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 19 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarView: RscText
		{
			idc = -1;
			text = "$STR_DTVD_view";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 8 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarViewSlider: RscXSliderH
		{
			idc = 1904;
			onSliderPosChanged = "[_this select 0,_this select 1,'car',0] call DT_fnc_viewSliderChanged";
			x = 5.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 8 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarViewEdit: RscEdit
		{
			idc = 1404;
			maxChars = 5;
			onEditChanged = "[_this select 0,_this select 1,'car',0] call DT_fnc_viewEditChanged";
			x = 15.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 8 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarObject: RscText
		{
			idc = -1;
			text = "$STR_DTVD_object";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarObjectSlider: RscXSliderH
		{
			idc = 1905;
			onSliderPosChanged = "[_this select 0,_this select 1,'car',1] call DT_fnc_viewSliderChanged";
			x = 5.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarObjectEdit: RscEdit
		{
			idc = 1405;
			maxChars = 5;
			onEditChanged = "[_this select 0,_this select 1,'car',1] call DT_fnc_viewEditChanged";
			x = 15.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarZoom: RscText
		{
			idc = -1;
			text = "$STR_DTVD_zoom";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarZoomSlider: RscXSliderH
		{
			idc = 1952;
			onSliderPosChanged = "[_this select 0,_this select 1,'car'] call DT_fnc_zoomSliderChanged";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 5.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarZoomEdit: RscEdit
		{
			idc = 1452;
			maxChars = 4;
			onEditChanged = "[_this select 0,_this select 1,'car'] call DT_fnc_zoomEditChanged";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 15.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarTerrain: RscText
		{
			idc = -1;
			text = "$STR_DTVD_terrain";
			x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 11 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CarTerrainCombo: RscCombo
		{
			idc = 2102;
			onLBSelChanged = "[_this,'car'] call DT_fnc_terrainGridChanged";
			x = 5.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 11 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryText: RscText
		{
			idc = -1;
			text = "$STR_DTVD_rotary";
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 1 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 19 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryViewEdit: RscEdit
		{
			idc = 1406;
			maxChars = 5;
			onEditChanged = "[_this select 0,_this select 1,'rotary',0] call DT_fnc_viewEditChanged";
			x = 36.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 2 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryViewSlider: RscXSliderH
		{
			idc = 1906;
			onSliderPosChanged = "[_this select 0,_this select 1,'rotary',0] call DT_fnc_viewSliderChanged";
			x = 26.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 2 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryView: RscText
		{
			idc = -1;
			text = "$STR_DTVD_view";
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 2 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryObject: RscText
		{
			idc = -1;
			text = "$STR_DTVD_object";
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 3 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryZoom: RscText
		{
			idc = -1;
			text = "$STR_DTVD_zoom";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 4 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryTerrain: RscText
		{
			idc = -1;
			text = "$STR_DTVD_terrain";
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryObjectSlider: RscXSliderH
		{
			idc = 1907;
			onSliderPosChanged = "[_this select 0,_this select 1,'rotary',1] call DT_fnc_viewSliderChanged";
			x = 26.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 3 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryObjectEdit: RscEdit
		{
			idc = 1407;
			maxChars = 5;
			onEditChanged = "[_this select 0,_this select 1,'rotary',1] call DT_fnc_viewEditChanged";
			x = 36.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 3 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryZoomSlider: RscXSliderH
		{
			idc = 1953;
			onSliderPosChanged = "[_this select 0,_this select 1,'rotary'] call DT_fnc_zoomSliderChanged";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 26.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 4 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryZoomEdit: RscEdit
		{
			idc = 1453;
			maxChars = 4;
			onEditChanged = "[_this select 0,_this select 1,'rotary'] call DT_fnc_zoomEditChanged";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 36.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 4 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class RotaryTerrainCombo: RscCombo
		{
			idc = 2103;
			onLBSelChanged = "[_this,'rotary'] call DT_fnc_terrainGridChanged";
			x = 26.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirText: RscText
		{
			idc = -1;
			text = "$STR_DTVD_air";
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 7 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 19 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirView: RscText
		{
			idc = -1;
			text = "$STR_DTVD_view";
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 8 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirObject: RscText
		{
			idc = -1;
			text = "$STR_DTVD_object";
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirZoom: RscText
		{
			idc = -1;
			text = "$STR_DTVD_zoom";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirTerrain: RscText
		{
			idc = -1;
			text = "$STR_DTVD_terrain";
			x = 21 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 11 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirViewEdit: RscEdit
		{
			idc = 1408;
			maxChars = 5;
			onEditChanged = "[_this select 0,_this select 1,'air',0] call DT_fnc_viewEditChanged";
			x = 36.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 8 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirObjectEdit: RscEdit
		{
			idc = 1409;
			maxChars = 5;
			onEditChanged = "[_this select 0,_this select 1,'air',1] call DT_fnc_viewEditChanged";
			x = 36.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirZoomEdit: RscEdit
		{
			idc = 1454;
			maxChars = 4;
			onEditChanged = "[_this select 0,_this select 1,'air'] call DT_fnc_zoomEditChanged";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 36.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirViewSlider: RscXSliderH
		{
			idc = 1908;
			onSliderPosChanged = "[_this select 0,_this select 1,'air',0] call DT_fnc_viewSliderChanged";
			x = 26.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 8 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirObjectSlider: RscXSliderH
		{
			idc = 1909;
			onSliderPosChanged = "[_this select 0,_this select 1,'air',1] call DT_fnc_viewSliderChanged";
			x = 26.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirZoomSlider: RscXSliderH
		{
			idc = 1954;
			onSliderPosChanged = "[_this select 0,_this select 1,'air'] call DT_fnc_zoomSliderChanged";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 26.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class OtherAirTerrainCombo: RscCombo
		{
			idc = 2104;
			onLBSelChanged = "[_this,'air'] call DT_fnc_terrainGridChanged";
			x = 26.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 11 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipText: RscText
		{
			idc = -1;
			text = "$STR_DTVD_ship";
			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 13 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 19 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipView: RscText
		{
			idc = -1;
			text = "$STR_DTVD_view";
			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 14 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipObject: RscText
		{
			idc = -1;
			text = "$STR_DTVD_object";
			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 15 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipZoom: RscText
		{
			idc = -1;
			text = "$STR_DTVD_zoom";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 16 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipTerrain: RscText
		{
			idc = -1;
			text = "$STR_DTVD_terrain";
			x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 17 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipViewEdit: RscEdit
		{
			idc = 1402;
			maxChars = 5;
			onEditChanged = "[_this select 0,_this select 1,'ship',0] call DT_fnc_viewEditChanged";
			x = 25.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 14 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipObjectEdit: RscEdit
		{
			idc = 1403;
			maxChars = 5;
			onEditChanged = "[_this select 0,_this select 1,'ship',1] call DT_fnc_viewEditChanged";
			x = 25.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 15 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipZoomEdit: RscEdit
		{
			idc = 1451;
			maxChars = 4;
			onEditChanged = "[_this select 0,_this select 1,'ship'] call DT_fnc_zoomEditChanged";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 25.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 16 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipViewSlider: RscXSliderH
		{
			idc = 1902;
			onSliderPosChanged = "[_this select 0,_this select 1,'ship',0] call DT_fnc_viewSliderChanged";
			x = 15.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 14 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipObjectSlider: RscXSliderH
		{
			idc = 1903;
			onSliderPosChanged = "[_this select 0,_this select 1,'ship',1] call DT_fnc_viewSliderChanged";
			x = 15.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 15 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipZoomSlider: RscXSliderH
		{
			idc = 1951;
			onSliderPosChanged = "[_this select 0,_this select 1,'ship'] call DT_fnc_zoomSliderChanged";
			tooltip = "$STR_DTVD_zoomTooltip";
			x = 15.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 16 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class ShipTerrainCombo: RscCombo
		{
			idc = 2101;
			onLBSelChanged = "[_this,'ship'] call DT_fnc_terrainGridChanged";
			x = 15.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 17 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 9.5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
		class CloseButton: RscButtonMenu
		{
			idc = -1;
			text = "$STR_DISP_CLOSE";
			onButtonClick = "closeDialog 0;";
			x = 35 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = 18.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5 * GUI_GRID_CENTER_W;
			h = 1 * GUI_GRID_CENTER_H;
		};
	};
};