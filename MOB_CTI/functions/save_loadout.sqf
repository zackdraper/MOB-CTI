/*

	save_loadout.sqf

	save unit load out when arsenal is exited.
	
*/
//////////////////////////////////////////////////////////////////////////////

<<<<<<< HEAD
_mhq = player getvariable "CTI_PLAYER_MHQ";
_money = 0;		
_ammo = 0;

=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
while {true} do {

	waituntil{!(isNull (uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ]))};

<<<<<<< HEAD
	_weapons_start = weapons player;
	_magazines_start = magazines player;
	_backpack_start = backpack player;

	player sidechat format ["%1 : %2 : %3",_weapons_start,_magazines_start,_backpack_start];

	//player sideChat "player in arsenal";

	[player, [player, "inventory_prebuy"]] call BIS_fnc_saveInventory;

	while { !(isNull (uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ])) } do {

		_weapons_new = weapons player;
		_magazines_new = magazines player;
		_backpack_new = backpack player;

		_money = 50*({!(_x in _weapons_start)} count _weapons_new);
		_money = _money+50*({!(_x in _weapons_start) && (_x isKindOf ["Launcher", configFile >> "CfgWeapons"])} count _weapons_new);

		_ammo = ({!(_x in _magazines_start)} count _magazines_new);
		_ammo = _ammo+10*({!(_x in _magazines_start) && (_x isKindOf ["CA_LauncherMagazine", configFile >> "CfgMagazines"])} count _magazines_new);

		//player sidechat format ["Cost: %1, %2",_money,_ammo];	

		sleep 1;
	};

	_funds = _mhq getVariable "CTI_FUNDS";

	if ([[_money,_ammo,0],_funds,100000] call cost_affordable) then {
		[_mhq,[_money,_ammo,0]] call subtract_funds;
		["Arsenal_SaveLoadout"] call bis_fnc_showNotification;
		
		[player, [player, "Var_SavedInventory"]] call BIS_fnc_saveInventory;
		
		[player] call remove_static_uav;
	} else {
		[player, [player, "inventory_prebuy"]] call BIS_fnc_loadInventory;
		player sidechat "You cant afford that loadout";
	};

	//waituntil{(isNull (uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ]))};
=======
	//player sideChat "player in arsenal";

	waituntil{(isNull (uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ]))};

	[player, [player, "Var_SavedInventory"]] call BIS_fnc_saveInventory;

	//player sideChat "loadout saved";

	["Arsenal_SaveLoadout"] call bis_fnc_showNotification;

>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

};


if(true)exitwith{};