class CfgPatches {
    class DTVD {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.00;
        requiredAddons[] = {"cba_main"};
        author = "DomT602";
    };
};

class CfgFunctions {
    class DT {
        tag = "DT";
        class viewDistance {
            file = "\DTVD\functions";
            class changeSingleValue {};
            class changeViewByHotkey {};
            class focusedZoom {};
            class getActiveUAV {};
            class getInMan {};
            class getOutMan {};
            class getVarByVehicle {};
            class incrementDistance {};
            class initFocusedBoost {};
            class initViewDistance {};
            class initZoomBoost {};
            class openViewDistanceMenu {};
            class opticsSwitch {};
            class terrainGridChanged {};
            class viewEditChanged {};
            class viewSliderChanged {};
            class zoomEditChanged {};
            class zoomSliderChanged {};
        };
    };
};

#include "CfgEventHandlers.hpp"
#include "DT_viewDistanceMenu.hpp"