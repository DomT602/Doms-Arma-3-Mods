class Dynamic_Groups {
	group_filterWords[] = {"shit","fuc","piss","adolf","hitler","nigg"};

	class interactions {
		class join {
			title = "Join";
			action = "DT_groupMenuSelection call DT_fnc_joinGroup";
			condition = "count DT_groupMenuSelection isEqualTo 1 && {!(player in (units (DT_groupMenuSelection select 0))) && {!((DT_groupMenuSelection select 0) getVariable ['DT_groupLocked',false]) || {((DT_groupMenuSelection select 0) getVariable ['DT_groupInvited',false])}}}";
		};
		class leave {
			title = "Leave";
			action = "[false] call DT_fnc_leaveGroup";
			condition = "true";
		};
		class create {
			title = "Create";
			action = "[] call DT_fnc_createGroup";
			condition = "true";
		};
		class invite {
			title = "Invite";
			action = "[] call DT_fnc_inviteToGroup";
			condition = "(count DT_groupMenuSelection) isEqualTo 2 && {leader (DT_groupMenuSelection select 0) isNotEqualTo player}";
		};
		class kick {
			title = "Kick";
			action = "DT_groupMenuSelection call DT_fnc_kickFromGroup";
			condition = "(count DT_groupMenuSelection) isEqualTo 2 && {leader (DT_groupMenuSelection select 0) isEqualTo player && {(DT_groupMenuSelection select 1) isNotEqualTo player}}";
		};
		class promote {
			title = "Promote";
			action = "DT_groupMenuSelection call DT_fnc_promoteNewLeader";
			condition = "(count DT_groupMenuSelection) isEqualTo 2 && {leader (DT_groupMenuSelection select 0) isEqualTo player && {(DT_groupMenuSelection select 1) isNotEqualTo player}}";
		};
		class disband {
			title = "Disband";
			action = "[group player] call DT_fnc_disbandGroup";
			condition = "(leader (group player)) isEqualTo player";
		};
		class lock {
			title = "Lock";
			action = "[group player,true] call DT_fnc_lockGroup";
			condition = "(leader (group player)) isEqualTo player && {!((group player) getVariable ['DT_groupLocked',false])}";
		};
		class unlock {
			title = "Unlock";
			action = "[group player,false] call DT_fnc_lockGroup";
			condition = "(leader (group player)) isEqualTo player && {((group player) getVariable ['DT_groupLocked',false])}";
		};
	};
};