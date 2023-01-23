class DT_Core {
	tag = "DT";

	class Groups {
		file = "Groups";
		class assignPlayer {};
		class handleDisconnect {};
		class initGroupMenu {};
		class onGroupMenuTvSelectChange {};
		class onRespawn {};
		class removeFromGroup {};
		class selectPosition {};
		class setupPlayer {};
		class updateGroups {};
	};

	//server
	class Functions {
		file = "Functions";
		class adjustKarma {};
		class areaIsClear {};
		class assignZeus {};
		class calculateEnemySquads {};
		class createAceInteractions {};
		class createBluforMarkers {}; //client
		class createConvoy {};
		class createMines {};
		class createMortar {};
		class createPatrols {};
		class createSquad {};
		class createStatic {};
		class createUnit {};
		class createVehicle {};
		class defuseNuke {};
		class deleteGroup {};
		class downloadUAVIntel {};
		class fetchDetails {};
		class forceCreateFactionCrew {};
		class getBuildings {};
		class getClosestTown {};
		class getConfigSide {};
		class getKarma {}; //client
		class getRandomName {};
		class initPatrol {};
		class isNight {};
		class mainLoop {};
		class notify {}; //client
		class onInventoryOpened {};
		class rigToExplode {};
		class setupLocations {};
		class setupUAV {};
		class spawnAmbientOpfor {};
		class spawnAmbushOpfor {};
		class spawnAssault {};
		class spawnAttackHelicopters {};
		class zeusLocalityChanged {};
	};

	class Civilians {
		file = "Civilians";
		class askQuestion {};
		class callToStop {};
		class civilianHit {};
		class civilianKilled {};
		class civilianWalking {};
		class detonateCarBomb {};
		class initTalkMenu {};
		class markMines {};
		class patDown {};
		class setupSuicideBomber {};
		class spawnAmbientCiv {};
		class spawnCivilians {};
	};

	class Command {
		file = "Command";
		class initEnvironmentMenu {};
		class initSupportMenu {};
		class onMapPress {};
		class startSupport {};
		class onSupportMenuTvChange {};
		class updateEnvironment {};
	};

	//server
	class Missions {
		file = "Missions";
		class captureCommander {};
		class civHostage {};
		class clearTown {};
		class defendTown {};
		class destroyAA {};
		class destroyAirbase {};
		class destroyCache {};
		class destroyConvoy {};
		class destroyJammer {};
		class endMission {};
		class killCommander {};
		class secureIntel {};
		class secureUAV {};
		class secureNuke {};
		class startNewMission {};
		class startSideMission {};
	};

	class Logistics {
		file = "Logistics";
		class buildLoop {};
		class buildMenuTvChange {};
		class clearCargo {};
		class createSupplyCrate {};
		class initBuildMenu {};
		class initSupplyCrateMenu {};
		class setupBuild {};
		class startBuild {};
		class supplyCrateTvChange {};
	};
};