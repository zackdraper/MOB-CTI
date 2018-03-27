/*

	save_loadout.sqf

	save unit load out when arsenal is exited.
	
*/
//////////////////////////////////////////////////////////////////////////////

while {true} do {

	waituntil{!(isNull (uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ]))};

	//player sideChat "player in arsenal";

	waituntil{(isNull (uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ]))};

	[player, [player, "Var_SavedInventory"]] call BIS_fnc_saveInventory;

	//player sideChat "loadout saved";

	["Arsenal_SaveLoadout"] call bis_fnc_showNotification;


};


if(true)exitwith{};