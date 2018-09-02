/*

	save_loadout.sqf

	save unit load out when arsenal is exited.
	
*/
//////////////////////////////////////////////////////////////////////////////
//disableSerialization;
private ["_display","_layer"];

_mhq = player getvariable "CTI_PLAYER_MHQ";
_money = 0;		
_ammo = 0;

while {true} do {

	waituntil{!(isNull (uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ]))};

	_weapons_start = weapons player;
	_magazines_start = magazines player;
	_backpack_start = backpack player;
	_items_start = items player;
	_ass_items_start = assignedItems player;

	//player sidechat format ["%1 : %2 : %3",_weapons_start,_magazines_start,_backpack_start];

	//player sideChat "player in arsenal";

	[player, [player, "inventory_prebuy"]] call BIS_fnc_saveInventory;
	_layer = ("loadout_overlay" call BIS_fnc_rscLayer) cutRsc ["loadoutoverlay", "PLAIN", 1];
	_display = (uiNamespace getVariable 'LOADOUT_OVERLAY');

	while { !(isNull (uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ])) } do {
	
		_weapons_new = weapons player;
		_magazines_new = magazines player;
		_backpack_new = backpack player;
		_items_new = items player;
		_ass_items_new = assignedItems player;

		//new weapons
		_new_weapon = ({!(_x in _weapons_start)} count _weapons_new);
		_returned_weapon = ({!(_x in _weapons_new)} count _weapons_start);
		
		//surcharge launchers
		_new_launcher = ({!(_x in _weapons_start) && (_x isKindOf ["Launcher", configFile >> "CfgWeapons"])} count _weapons_new);
		_returned_launcher = ({!(_x in _weapons_new) && (_x isKindOf ["Launcher", configFile >> "CfgWeapons"])} count _weapons_start);

		_backpacks = ({_x != ""} count [_backpack_new]) - ({_x != ""} count [_backpack_start]);
		
		_items = count (_items_new) - count (_items_start);
		
		_ass_items = count (_ass_items_new) - count (_ass_items_start);
		
		_money = (50*_new_weapon)-(50*_returned_weapon)+(50*_new_launcher)-(50*_returned_launcher)+(50*_backpacks)+(1*_items)+(5*_ass_items);
		
		//new magazines
		_magazines = (count _magazines_new) - (count _magazines_start);
		
		//surcharge launchers
		_magazines_launcher = ({!(_x in _magazines_start) && (_x isKindOf ["CA_LauncherMagazine", configFile >> "CfgMagazines"])} count _magazines_new);
		_magazines_launcher_returned = ({!(_x in _magazines_new) && (_x isKindOf ["CA_LauncherMagazine", configFile >> "CfgMagazines"])} count _magazines_start);

		_ammo = _magazines + (_magazines_launcher * 9) - (_magazines_launcher_returned * 9);
		
		//player sidechat format ["Cost: %1, %2",_money,_ammo];	
		
		(_display displayCtrl 901) ctrlSetText (format [ "%1", _money]);
		(_display displayCtrl 902) ctrlSetText (format [ "%1", _ammo]);

		sleep 1;
		
	};
	
	_layer = ("loadout_overlay" call BIS_fnc_rscLayer) cutRsc ["blank", "PLAIN"];

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

};


if(true)exitwith{};