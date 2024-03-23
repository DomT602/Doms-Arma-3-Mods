class CfgPatches {
    class DTVD {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.14;
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
            class getUavControlPosition {};
            class getInMan {};
            class getOutMan {};
            class initViewDistance {};
            class openViewDistanceMenu {};
            class terrainGridChanged {};
            class viewEditChanged {};
            class viewSliderChanged {};
        };
    };
};

#include "CfgEventHandlers.hpp"
#include "DT_viewDistanceMenu.hpp"