//PF Furniture in buildings

execVM"PF\init.sqf";

directory = "MOB_CTI\";

//CTI Setup Settings ////////////////////////////////////////////////////////////////////////////////

fcti_debug = False;

/////////////////////////////////////////////////////////////////////////////////// Define Functions

cost_affordable = compileFinal preprocessFile "MOB_CTI\functions\cost_affordable.sqf";

CTI_CL_FNC_PlacingBuilding = compileFinal preprocessFile "MOB_CTI\functions\placingbuildings.sqf";
CTI_CL_FNC_PlacingDefense = compileFinal preprocessFile "MOB_CTI\functions\placingdefences.sqf";
CTI_CL_FNC_PurchaseUnit = compileFinal preprocessFile "MOB_CTI\functions\purchaseunit.sqf";
CTI_UI_KeyHandler_BuildMenu = compileFinal preprocessFile "MOB_CTI\functions\keyhandler_buildmenu.sqf";
CTI_CREATEBUILDINGS = compileFinal preprocessFile "MOB_CTI\functions\createbuildings.sqf";
CTI_CREATEDEFENCES = compileFinal preprocessFile "MOB_CTI\functions\createdefences.sqf";
CTI_CO_FNC_GetSideStructuresByType = compileFinal preprocessFile "MOB_CTI\functions\getsidestructuresbytype.sqf";
CTI_CO_FNC_GetClosestTown = compileFinal preprocessFile "MOB_CTI\functions\getclosesttown.sqf";
CTI_CL_FNC_CreateCamera = compileFinal preprocessFile "MOB_CTI\player_createcamera.sqf";
save_loadout = compileFinal preprocessFile "MOB_CTI\functions\save_loadout.sqf";
read_twod_array_col = compileFinal preprocessFile "MOB_CTI\functions\read_twod_array_col.sqf";
make_int_array = compileFinal preprocessFile "MOB_CTI\functions\make_int_array.sqf";

sort_build_list = compileFinal preprocessFile "MOB_CTI\functions\sort_build_list.sqf";
sort_defence_list = compileFinal preprocessFile "MOB_CTI\functions\sort_defence_list.sqf";
sort_infantry_list = compileFinal preprocessFile "MOB_CTI\functions\sort_infantry_list.sqf";
sort_light_list = compileFinal preprocessFile "MOB_CTI\functions\sort_light_list.sqf";
sort_heavy_list = compileFinal preprocessFile "MOB_CTI\functions\sort_heavy_list.sqf";
sort_air_list = compileFinal preprocessFile "MOB_CTI\functions\sort_air_list.sqf";
sort_service_list = compileFinal preprocessFile "MOB_CTI\functions\sort_service_list.sqf";
sort_naval_list = compileFinal preprocessFile "MOB_CTI\functions\sort_naval_list.sqf";
supply_helo = compileFinal preprocessFile "MOB_CTI\functions\supply_helo.sqf";
despawn_occupying_groups = compileFinal preprocessFile "MOB_CTI\functions\despawn_occupying_groups.sqf";
location_trigger_condition = compileFinal preprocessFile "MOB_CTI\functions\location_trigger_condition.sqf";
spawn_units_balanced = compileFinal preprocessFile "MOB_CTI\functions\spawn_units_balanced.sqf";
define_force_classnames = compileFinal preprocessFile "MOB_CTI\functions\define_force_classnames.sqf";
blufor_tracker = compileFinal preprocessFile "MOB_CTI\functions\blufor_tracker.sqf";

subtract_funds = compileFinal preprocessFile "MOB_CTI\functions\subtract_funds.sqf";
capture_nearby_location = compileFinal preprocessFile "MOB_CTI\functions\capture_nearby_location.sqf";
capture_town = compileFinal preprocessFile "MOB_CTI\functions\capture_town.sqf";
ai_respawn = compileFinal preprocessFile "MOB_CTI\functions\ai_respawn.sqf";
issafezone = compileFinal preprocessFile "MOB_CTI\functions\issafezone.sqf";
reduce_fuel = compileFinal preprocessFile "MOB_CTI\functions\reduce_fuel.sqf";

call compile preprocessFile "MOB_CTI\functions\functions_ui_keyhandlers.sqf";

CTI_P_WallsAutoAlign = False;
CTI_P_DefensesAutoManning = False;
CTI_BASE_CONSTRUCTION_RANGE = 200;
CTI_BASE_AREA_MAX = 2;
CTI_BASE_AREA_RANGE = 500;
CTI_BASE_WORKERS_PRICE = 300;
CTI_PLAYERS_GROUPSIZE = 10;
CTI_FACTORY_SLEEP = 10;

/////////////////////////////////////////////////////////////////////////////////// Define Variables



/////////////////////////////////////////////////////////////////////////////////// Modular Script Calls


//Logistics Integration

execVM (directory+"R3F_LOG\init.sqf");

//Field Repairs

[] execVM "MOB_CTI\functions\zlt_fieldrepair.sqf";

// CTI integration

_nul = execVM (directory+"functions\functions_ui_purchasemenu.sqf");

// Weather/Fast Time integration
[] execVM (directory+"real_weather.sqf");


//////////////////////////////////////////////////////////////////////////////////////   End State

//MHQs are destroyed
//[MHQ] spawn compile preprocessFile (directory+"end_trigger.sqf");

_hc = 0;
_hc = "headlessClient" call BIS_fnc_getParamValue;
if (isNil "_hc") then {_hc = 0};

//////////////////////////////////////////////////////////////////////////////////// Server Side Scripts

if (isServer and (isNil "ServerStart")) then {

	createCenter independent;
	west setFriend [independent, 0];
	independent setFriend [west, 0];
	east setFriend [independent, 0];
	independent setFriend [east, 0];

	// MHQ
	nul = [MHQ,"rhs_usarmy_wood",west,"base","factionarsenal","halo"] execVM "MOB_CTI\player_mhq_init.sqf";
	nul = [MHQ2,"cup_racs_desert",resistance,"base","factionarsenal"] execVM "MOB_CTI\player_mhq_init.sqf";

// Global Economy
	["occupation",[[10000,200,0],100],"rhs_usarmy_wood",west,[10,1],MHQ] execVM (directory+"economy.sqf");
	["occupation",[[50000,2500,0],250],"cup_racs_desert",resistance,[10,1],MHQ2] execVM (directory+"economy.sqf");

//Initial Spawn Locations for Invader Factions
	[MHQ2,"cup_racs_desert",resistance] execVM (directory+"random_start_position.sqf");

//Take over for HC if not connected 

	if (_hc == 0) then {
		//Local Island Resistance
		[resistance,"cup_racs_desert",[10000,5000,3000,2000],"AA"] execVM (directory+"island_spawner.sqf");
		//Start up theatre AI commanders
		["cup_racs_desert","mechanized","AA"] execVM (directory+"ai_commander_theatre_defender.sqf");

		[["Default",["HC","Server Taking Over HC Duties"]],BIS_fnc_showNotification] remoteExec ["call"];

	} else {
		[["Default",["HC","Server Passing Baton to HC"]],BIS_fnc_showNotification] remoteExec ["call"];
	};

	ServerStart = True;
	publicVariable "ServerStart";
};

//////////////////////////////////////////////////////////////////////////////////// Headless Client Scripts


if (!(isServer or hasinterface) and (_hc == 1) and (isNil "ServerStart")) then {
	HC_active = True;
	publicVariable "HC_active";

	[["Default",["HC","Headless Client Active"]],BIS_fnc_showNotification] remoteExec ["call"];

	//Local Island Resistance
	[resistance,"cup_racs_desert",[10000,5000,3000,2000],"AA"] execVM (directory+"island_spawner.sqf");

	//Start up theatre AI commanders
	["cup_racs_desert"] execVM (directory+"ai_commander_theatre_defender.sqf");

};

//////////////////////////////////////////////////////////////////////////////////// Client Side Scripts

if (hasinterface) then {

	waitUntil {!(isNull player)};

	showWaypoints false;

//Establish Faction Type

	_faction = player getVariable "CTI_PLAYER_FACTION";
	_class = _faction call define_force_classnames;

	[] spawn compile preprocessFile (directory+"player_ui_overlay.sqf");

	_inf = _class call sort_infantry_list;
	_lgt = _class call sort_light_list;
	_hvy = _class call sort_heavy_list;
	_air = _class call sort_air_list;
	_srv = _class call sort_service_list;
	_nav = _class call sort_naval_list;

	player setVariable ["CTI_INFANTRY", _inf];
	player setVariable ["CTI_LIGHT", _lgt];
	player setVariable ["CTI_HEAVY", _hvy];
	player setVariable ["CTI_AIR", _air];
	player setVariable ["CTI_SERVICE", _srv];
	player setVariable ["CTI_NAVAL", _nav];

	player setVariable ["CTI_STRUCTURES", _class call sort_build_list];
	player setVariable ["CTI_DEFENCES", _class call sort_defence_list];

	player addEventHandler ["Respawn", {
		_unit = _this select 0;
		_killed = _this select 1;

		//Purchase Menu
		_unit addaction ["<t color='#1C8A1F'>Purchase Menu</t>","MOB_CTI\player_action_purchasemenu.sqf",[],99,true,true,"","_target == _this"];
		
		//Loadout
		hint format ["%1",missionNamespace getvariable "Var_SavedInventory"];

		[_unit, [_unit, "Var_SavedInventory"]] call BIS_fnc_loadInventory;
		[_unit, [_unit, "Var_SavedInventory"]] call BIS_fnc_saveInventory;

		//if (leader _grp == player) then {
		//	[_new_unit,_grp] remoteExec ["setLeader",groupOwner _grp];
		//};
		
		//Respawn Control
		[_unit] spawn capture_nearby_location;
	}];


//Zone Capture

	[player] spawn capture_nearby_location;

//Orderly Parajump
	[0] execVM "MOB_CTI\functions\para_eject.sqf";

//Purchase Menu

	player addaction ["<t color='#1C8A1F'>Purchase Menu</t>","MOB_CTI\player_action_purchasemenu.sqf",[],99,true,true,"","_target == _this"];

//BLUFOR Tracker

	[player] spawn blufor_tracker;

//Loadout on respawn
	player spawn save_loadout;

};
