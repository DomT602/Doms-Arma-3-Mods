import RscDisplayTeamSwitch;

class DT_roleMenu : RscDisplayTeamSwitch
{
	idd = 9700;
	name = "DT_roleMenu";
	movingEnable = 0;
	onLoad = "";
	onUnload = "";
	class Controls : Controls
	{
		class Title : CA_TSTitle
		{
			text = "Role selection";
		};
		class RoleList : CA_TSRoles
		{
			idc = 1500;
			onLBSelChanged = "_this call DT_fnc_roleMenuLBChange";
		};
		class RoleInformation : RscStructuredText
		{
			idc = 1100;
			h = 20.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
			w = 22.5 * (((safezoneW / safezoneH) min 1.2) / 40);
			x = 16.3 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2);
			y = 2.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2);
		};
		class CancelBtn : CA_ButtonCancel
		{
			text = "Cancel";
		};
		class SelectRoleBtn : CA_ButtonContinue
		{
			idc = 2400;
			text = "Select Role";
			onButtonClick = "[] call DT_fnc_selectRole;";
		};
	};
};