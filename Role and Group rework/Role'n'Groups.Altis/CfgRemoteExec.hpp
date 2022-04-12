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

		F(DT_fnc_updateRoleMenu,CLIENT)

		F(DT_fnc_invitedToGroup,CLIENT)
		F(DT_fnc_leaveGroup,CLIENT)
		F(DT_fnc_updateMenuIfOpen,CLIENT)
	};

	class Commands {
		mode = 1;
		jip = 0;

		F(hint,CLIENT)
	};
};