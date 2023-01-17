/*
	File: fn_notify.sqf
	Author: Dom
	Description: Custom Notification System
	To-do: Make it custom!
*/
params [
	["_message","",[""]]
];
if (_message isEqualTo "") exitWith {};

systemChat _message;