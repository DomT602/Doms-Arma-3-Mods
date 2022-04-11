class Dynamic_Groups {
	group_setup[] = {
		{"Alpha",{"squadlead","teamlead","medic","rifleman","rifleman","teamlead","engineer","rifleman","rifleman"},"true"},
		{"Bravo",{"squadlead","teamlead","medic","rifleman","rifleman","teamlead","engineer","rifleman","rifleman"},"true"},
		{"Charlie",{"squadlead","teamlead","medic","rifleman","rifleman","teamlead","engineer","rifleman","rifleman"},"count playableUnits > 10"},
		{"Talon",{"pilot","pilot"},"true"},
		{"Outlaw",{"pilot","pilot"},"count playableUnits > 10"},
		{"Hawkeye",{"sniper","spotter"},"true"}
	};
};