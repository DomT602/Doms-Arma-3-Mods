class CfgPatches {
	class DTLS {
		units[] = {};
		weapons[] = {};
		requiredVersion = 2.00;
		requiredAddons[] = {"cba_common"};
		author = "DomT602";
	};
};

class CfgFunctions {
	class DT {
		tag = "DT";
		class lifeSystem {
			file = "\DTLS\functions";
			class alterLives {};
			class findPlayerByUID {};
			class hintLives {};
			class lifeMenuLbChange {};
			class openLifeMenu {};
			class setColourAndIcon {};
		};
	};
};

#include "CfgEventHandlers.hpp"
#include "lifeMenu.hpp"