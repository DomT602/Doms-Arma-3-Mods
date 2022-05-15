class Dynamic_Groups { //format: {"Group Name",{"Group","Roles","Matching","Role","Configs"},"Conditions for the group to be shown"}
	faction_name = "CTRG";
	group_setup[] = {
		{"Command",{"officer"},"true"},
		{"Alpha",{"squadlead","teamlead","medic","rifleman","rifleman","teamlead","engineer","rifleman","rifleman"},"true"},
		{"Bravo",{"squadlead","teamlead","medic","rifleman","rifleman","teamlead","engineer","rifleman","rifleman"},"true"},
		{"Charlie",{"squadlead","teamlead","medic","rifleman","rifleman","teamlead","engineer","rifleman","rifleman"},"count playableUnits > 10"},
		{"Talon",{"pilot","pilot"},"true"},
		{"Outlaw",{"pilot","pilot"},"count playableUnits > 10"},
		{"Pegasus",{"teamlead","paratrooper","paratrooper","paratrooper","paratrooper"},"true"},
		{"Wildboar",{"crewman","crewman","crewman"},"true"},
		{"Hawkeye",{"sniper","spotter"},"true"},
		{"Nemo",{"diver","diver","diver"},"true"}
	};
};

#include "Config_Roles.hpp"