#define F(NAME,TARGET) class NAME { \
	allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec {
	class Functions {
		mode = 1;
		jip = 0;

		F(DT_fnc_assignPlayer,SERVER)
		F(DT_fnc_setupPlayer,CLIENT)
		F(DT_fnc_updateGroups,CLIENT)
	};

	class Commands {
		mode = 1;
		jip = 0;

		F(hint,CLIENT)
		F(selectLeader,CLIENT)
	};
};