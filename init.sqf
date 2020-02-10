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
CTI_CL_FNC_GetOrderLabel = compileFinal preprocessFile "MOB_CTI\functions\get_order_label.sqf";
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
starting_gear = compileFinal preprocessFile "MOB_CTI\functions\starting_gear.sqf";
make_mhq = compileFinal preprocessFile "MOB_CTI\functions\make_mhq.sqf";
define_cti_locations = compileFinal preprocessFile "MOB_CTI\functions\define_cti_locations.sqf";
remove_static_uav = compileFinal preprocessFile "MOB_CTI\functions\remove_static_uav.sqf";
building_marker_type = compileFinal preprocessFile "MOB_CTI\functions\building_marker_type.sqf";

subtract_funds = compileFinal preprocessFile "MOB_CTI\functions\subtract_funds.sqf";
capture_nearby_location = compileFinal preprocessFile "MOB_CTI\functions\capture_nearby_location.sqf";
capture_town = compileFinal preprocessFile "MOB_CTI\functions\capture_town.sqf";
ai_respawn = compileFinal preprocessFile "MOB_CTI\functions\ai_respawn.sqf";
issafezone = compileFinal preprocessFile "MOB_CTI\functions\issafezone.sqf";
reduce_fuel = compileFinal preprocessFile "MOB_CTI\functions\reduce_fuel.sqf";

F_swapInventory = compileFinal preprocessFile "MOB_CTI\functions\F_swapInventory.sqf";
F_getUnitPositionId = compileFinal preprocessFile "MOB_CTI\functions\F_getUnitPositionId.sqf";
F_getNearestCTIBuild = compileFinal preprocessFile "MOB_CTI\functions\F_getNearestCTIBuild.sqf";

special_actions = compileFinal preprocessFile "MOB_CTI\functions\special_actions.sqf";
client_earplugs = compileFinal preprocessFile "MOB_CTI\functions\client_earplugs.sqf";
client_jump = compileFinal preprocessFile "MOB_CTI\functions\client_jump.sqf";
client_repack_magazines = compileFinal preprocessFile "MOB_CTI\functions\client_repack_magazines.sqf";
zen_array_get_nested_index = compileFinal preprocessFile "MOB_CTI\functions\zen_arrayGetNestedIndex.sqf";

call compile preprocessFile "MOB_CTI\functions\functions_ui_keyhandlers.sqf";


/////////////////////////////////////////////////////////////////////////////////// Define Variables

CTI_P_WallsAutoAlign = False;
CTI_P_DefensesAutoManning = False;
CTI_BASE_CONSTRUCTION_RANGE = 200;
CTI_BASE_AREA_MAX = 2;
CTI_BASE_AREA_RANGE = 500;
CTI_BASE_WORKERS_PRICE = 300;
CTI_PLAYERS_GROUPSIZE = 10;
CTI_FACTORY_SLEEP = 10;

//--- Orders: ID (Unique)
CTI_ORDER_TAKETOWNS = 0; //--- AI: Take any towns (trigger CTI_ORDER_TAKETOWN_AUTO)
CTI_ORDER_TAKETOWN = 1; //--- AI: Take the assigned town, don't change target
CTI_ORDER_TAKETOWN_AUTO = 2; //--- AI: Take the assigned town, change target if there's any closer
CTI_ORDER_TAKEHOLDTOWNS = 3; //--- AI: Take and Hold any towns (trigger CTI_ORDER_TAKETOWN_AUTO)
CTI_ORDER_TAKEHOLDTOWN = 4; //--- AI: Take and hold the assigned town, don't change target
CTI_ORDER_TAKEHOLDTOWN_AUTO = 5; //--- AI: Take and hold the assigned town, change target if there's any closer
CTI_ORDER_HOLDTOWNSBASES = 6; //--- AI: Determine any hold location (Can be towns/base)
CTI_ORDER_HOLDTOWNSBASE = 7; //--- AI: Permanently hold a location (Can be towns/base)
CTI_ORDER_SAD = 8; //--- AI: Search and destroy the enemy base
CTI_ORDER_MOVE = 9; //--- AI: Move to a position

//--- Orders: One-time orders (Doesn't count as a real order)
CTI_ORDER_EMBARKCOMMANDVEH = 10;
CTI_ORDER_DISEMBARKCOMMANDVEH = 11;
CTI_ORDER_EMBARKCARGOVEH = 12;
CTI_ORDER_DISEMBARKCARGOVEH = 13;

//--- Orders: list of orders which are only called once (one-time)
CTI_AI_ORDERS_ONETIMERS = [CTI_ORDER_EMBARKCOMMANDVEH, CTI_ORDER_DISEMBARKCOMMANDVEH, CTI_ORDER_EMBARKCARGOVEH, CTI_ORDER_DISEMBARKCARGOVEH];

//--- Orders: Parameters
CTI_AI_ORDER_HOLDTOWNSBASES_HOPS = 12; //--- Order: HOLD TOWNS BASE units may use up to x hops to patrol in town
CTI_AI_ORDER_HOLDTOWNSBASES_PATROL_RANGE = 240; //--- Order: HOLD TOWNS BASE units may patrol up to x meters
CTI_AI_ORDER_TAKEHOLDTOWNS_HOPS = 8; //--- Order: TAKE HOLD units may use up to x hops to patrol in town
CTI_AI_ORDER_TAKEHOLDTOWNS_PATROL_RANGE = 225; //--- Order: TAKE HOLD units may patrol up to x meters
CTI_AI_ORDER_TAKEHOLDTOWNS_TIME = 240; //--- Order: TAKE HOLD units may patrol x seconds in a town
CTI_AI_ORDER_TAKEHOLDTOWNS_RANGE = 800; //--- Order: TAKE HOLD units will attempt to patrol if within that range of a town

//--- Orders: Parameters (players)
CTI_PLAYER_ORDER_TAKEHOLDTOWNS_RANGE = 800; //--- Order: TAKE HOLD units will attempt to patrol if within that range of a town
CTI_PLAYER_ORDER_TAKEHOLDTOWNS_TIME = 200; //--- Order: TAKE HOLD units may patrol x seconds in a town
//-----------------------------------------------------------------------------------------------------------------------//


/////////////////////////////////////////////////////////////////////////////////// Modular Script Calls


//Logistics Integration

execVM (directory+"R3F_LOG\init.sqf");

//Field Repairs

[] execVM "MOB_CTI\functions\zlt_fieldrepair.sqf";

// CTI integration

_nul = execVM (directory+"functions\functions_ui_purchasemenu.sqf");
_nul = execVM (directory+"functions\functions_ui_mapcommanding.sqf");

// Weather Fast Time integration
[] execVM (directory+"real_weather.sqf");

//PF Furniture in buildings

//execVM"PF\init.sqf";


//////////////////////////////////////////////////////////////////////////////////////   Load Parameters

_hc = 0;
_hc = "headlessClient" call BIS_fnc_getParamValue;
if (isNil "_hc") then {_hc = 0};

_fac1destroyer = "faction1_destroyer" call BIS_fnc_getParamValue;
if (isNil "_fac1destroyer") then {_fac1destroyer = 0};

_fac1startpos = "faction1_random_pos" call BIS_fnc_getParamValue;
if (isNil "_fac1startpos") then {_fac1startpos = 0};

_fac2startpos = "faction2_random_pos" call BIS_fnc_getParamValue;
if (isNil "_fac2startpos") then {_fac2startpos = 0};

_faction1_halo = "faction1_halo" call BIS_fnc_getParamValue;
if (isNil "_faction1_halo") then {_faction1_halo = 0};

_faction2_halo = "faction2_halo" call BIS_fnc_getParamValue;
if (isNil "_faction2_halo") then {_faction2_halo = 0};

_bluforcetypes = ["nato_gen",
					"nato_pacific",
					"fia_gen",
					"rhs_usarmy_wood",
					"rhs_usarmy_des",
					"rhs_usmc_wood",
					"rhs_usmc_des",
					"cup_racs_desert"];
_opforcetypes = ["csat_gen",
					"csat_pacific",
					"rhs_rus_wood",
					"rhs_rus_vdv_wood",
					"rhs_rus_vdv_des",
					"cup_racs_desert",
					"cup_sla_wood",
					"cup_sla_desert",
					"rhs_cdf_autumn"];
					
_indforcetypes = ["aaf_gen","cup_racs_desert","rhs_chdkz","rhs_cdf_autumn"];

_econtypes = ["occupation","externalammo_occupation","limited","unlimited"];

_faction1_type = _bluforcetypes select ("faction1_type" call BIS_fnc_getParamValue);
if (isNil "_faction1_type") then {_faction1_type = "nato_gen"};
_faction2_type = _opforcetypes select ("faction2_type" call BIS_fnc_getParamValue);
if (isNil "_faction2_type") then {_faction2_type = "csat_gen"};
_resistance_type = _indforcetypes select ("resistance_type" call BIS_fnc_getParamValue);
if (isNil "_resistance_type") then {_resistance_type = "aaf_gen"};

_faction1_aicom = "faction1_aicom" call BIS_fnc_getParamValue;
if (isNil "_faction1_aicom") then {_faction1_aicom= 1};
_faction2_aicom = "faction2_aicom" call BIS_fnc_getParamValue;
if (isNil "_faction2_aicom") then {_faction2_aicom= 1};

_resistance_spawn = "resistance_spawn" call BIS_fnc_getParamValue;
if (isNil "_resistance_spawn") then {_resistance_spawn = 1};
_resistance_force_mp = ("resistance_force_mp" call BIS_fnc_getParamValue);
if (isNil "_resistance_force_mp") then {_resistance_force_mp = 1};

_faction1_econ = _econtypes select ("faction1_econ" call BIS_fnc_getParamValue);
if (isNil "_faction1_econ") then {_faction1_econ = "occupation"};
_faction2_econ = _econtypes select ("faction2_econ" call BIS_fnc_getParamValue);
if (isNil "_faction2_econ") then {_faction2_econ = "occupation"};

_faction1_startfunds = ("faction1_startfunds" call BIS_fnc_getParamValue);
if (isNil "_faction1_startfunds") then {_faction1_startfunds = 10000};
_faction1_startammo = ("faction1_startammo" call BIS_fnc_getParamValue);
if (isNil "_faction1_startammo") then {_faction1_startammo = 100};
_faction1_maxfuel = ("faction1_maxfuel" call BIS_fnc_getParamValue);
if (isNil "_faction1_maxfuel") then {_faction1_maxfuel = 100};

_faction2_startfunds = ("faction2_startfunds" call BIS_fnc_getParamValue);
if (isNil "_faction2_startfunds") then {_faction2_startfunds = 10000};
_faction2_startammo = ("faction2_startammo" call BIS_fnc_getParamValue);
if (isNil "_faction2_startammo") then {_faction2_startammo = 100};
_faction2_maxfuel = ("faction2_maxfuel" call BIS_fnc_getParamValue);
if (isNil "_faction2_maxfuel") then {_faction2_maxfuel = 100};

_fac1_units = [us_1,us_2,us_3,us_4,us_5,us_6,us_7,us_8];
_fac2_units = [rus_1,rus_2,rus_3,rus_4,rus_5,rus_6,rus_7,rus_8];

{(group _x) setgroupid [(roleDescription _x)]} forEach _fac1_units;
{(group _x) setgroupid [(roleDescription _x)]} forEach _fac2_units;

_res_power = [0,0,0,0];
if (_resistance_spawn == 1) then {
	_res_power = [5000,3000,2000,1000] apply {_x*_resistance_force_mp};
} else {
	_res_power = [0,0,0,0];
};

MOB_CTI_Locations_AllMajorCities = [_res_power] call define_cti_locations;

MOB_CTI_MHQS = [MHQ1,MHQ2];

{
	_x setvariable ["CTI_PLAYER_FACTION",_faction1_type,true];
	_x setvariable ["CTI_PLAYER_MHQ",MHQ1,true];
	_x setVariable ["CTI_COMMANDER",false,true];
	_x setVariable ["MOB_CTI_Locations_AllMajorCities",MOB_CTI_Locations_AllMajorCities];
} forEach _fac1_units;

missionNamespace setVariable [format ["CTI_%1_COMMANDER",_faction1_type], (_fac1_units select 0), false];
(_fac1_units select 0) setVariable ["CTI_COMMANDER",true,false];
(_fac1_units select 0) setVariable ["NOAI",1,false];
(_fac1_units select 0) setVariable ["VCOM_NOPATHING_Unit",1,false];	

{
	_x setvariable ["CTI_PLAYER_FACTION",_faction2_type,true];
	_x setvariable ["CTI_PLAYER_MHQ",MHQ2,true];
	_x setVariable ["CTI_COMMANDER",false,true];
	_x setVariable ["MOB_CTI_Locations_AllMajorCities",MOB_CTI_Locations_AllMajorCities];
} forEach _fac2_units;

missionNamespace setVariable [format ["CTI_%1_COMMANDER",_faction2_type], (_fac2_units select 0), false];
(_fac2_units select 0) setVariable ["CTI_COMMANDER",true,false];
(_fac2_units select 0) setVariable ["NOAI",1,false];
(_fac2_units select 0) setVariable ["VCOM_NOPATHING_Unit",1,false];

//Help Briefing
0 = [] execVM "MOB_CTI\briefing.sqf";

//////////////////////////////////////////////////////////////////////////////////// Server Side Scripts

if (isServer and (isNil "ServerStart")) then {

	//spawn units as their faction type

	MHQ1_veh = [MHQ1,_faction1_type,(_fac1startpos == 1)] call make_mhq;
	MHQ2_veh = [MHQ2,_faction2_type,(_fac2startpos == 1)] call make_mhq;

	[_faction1_type,_fac1_units] call starting_gear;
	[_faction2_type,_fac2_units] call starting_gear;
	
	{[[_x],capture_nearby_location] remoteExec ["spawn",_x,True]} forEach _fac1_units;
	{[[_x],capture_nearby_location] remoteExec ["spawn",_x,True]} forEach _fac2_units;

	createCenter independent;
	west setFriend [independent, 0];
	independent setFriend [west, 0];
	east setFriend [independent, 0];
	independent setFriend [east, 0];

	// MHQ
	_mhq1_init = [MHQ1,_faction1_type,west,MHQ1_veh,"base","factionarsenal"];
	if (_faction1_halo == 1) then {_mhq1_init append ["halo"]};

	nul = _mhq1_init execVM "MOB_CTI\player_mhq_init.sqf";
	
	_mhq2_init = [MHQ2,_faction2_type,east,MHQ2_veh,"base","factionarsenal"];
	if (_faction2_halo == 1) then {_mhq2_init append ["halo"]};

	nul = _mhq2_init execVM "MOB_CTI\player_mhq_init.sqf";

// Global Economy
	[_faction1_econ,[[_faction1_startfunds,_faction1_startammo,0],_faction1_maxfuel],_faction1_type,west,[20,5],MHQ1,MOB_CTI_Locations_AllMajorCities] execVM (directory+"economy.sqf");
	[_faction2_econ,[[_faction2_startfunds,_faction2_startammo,0],_faction2_maxfuel],_faction2_type,east,[20,5],MHQ2,MOB_CTI_Locations_AllMajorCities] execVM (directory+"economy.sqf");

//Initial Spawn Locations for Invader Factions
	if ((_fac1startpos == 0) && (_fac2startpos == 0)) then {
		[MHQ1_veh,_faction1_type,west,MHQ2_veh,_faction2_type,east] execVM (directory+"random_start_position.sqf");
		
	} else {
	
		if (_fac1startpos == 0) then {
			[MHQ1_veh,_faction1_type,west] execVM (directory+"random_start_position.sqf");
		} else {
			[MHQ1,_faction1_type,us_barracks,us_airfac,west] execVM (directory+"init_starting_base.sqf");
		};

		if (_fac2startpos == 0) then {
			[MHQ2_veh,_faction2_type,east] execVM (directory+"random_start_position.sqf");
		} else {
			[MHQ2,_faction2_type,rus_barracks,rus_airfac,east] execVM (directory+"init_starting_base.sqf");
		};
	};

//Take over for HC if not connected 

	if (_hc == 0) then {
		//Local Island Resistance
		[resistance,_resistance_type,MOB_CTI_Locations_AllMajorCities] execVM (directory+"island_spawner.sqf");	
	
		//Start up theatre AI commanders
		switch (_faction2_aicom) do {
			case 1:{
				[_faction2_type,"combined_arms"] execVM (directory+"ai_commander_theatre_invader.sqf");
			};
			case 2:{
				east setFriend [independent, 1];
				independent setFriend [east, 1];
				[_faction2_type,"mechanized","AA"] execVM (directory+"ai_commander_theatre_defender.sqf");
			};
			default{};
		};

		switch (_faction1_aicom) do {
			case 1:{
				[_faction1_type,"combined_arms]"] execVM (directory+"ai_commander_theatre_invader.sqf");
			};
			case 2:{
				west setFriend [independent, 1];
				independent setFriend [west, 1];
				[_faction1_type,"mechanized","AA"] execVM (directory+"ai_commander_theatre_defender.sqf");
			};
			default{};
		};

		[["Default",["HC","Server Taking Over HC Duties"]],BIS_fnc_showNotification] remoteExec ["call"];

	} else {
		[["Default",["HC","Server Passing Baton to HC"]],BIS_fnc_showNotification] remoteExec ["call"];
	};

	//MHQs are destroyed
	[MHQ1,MHQ2] spawn compile preprocessFile (directory+"end_trigger.sqf");
	
	{
		_x addMPEventHandler ["MPRespawn", {
			_unit = _this select 0;
			_killed = _this select 1;
			
			_name = vehicleVarName _killed;
			_group = group _unit;
			
			[_unit] joinSilent _group;
			_group selectleader _unit;
			//deleteVehicle _killed;
			_unit setVehicleVarName _name;
			[_unit] joinSilent _group;
			_group selectleader _unit;
			
			[_unit] spawn capture_nearby_location;
			
			_comvar = _killed getVariable ["CTI_COMMANDER",false];
			_unit setVariable ["CTI_COMMANDER",_comvar];
			
			//hint format ["respawned: %1 : %2 : %3 : %4 : %5 ",_group,_name,_killed,_unit];
		}];
	} forEach playableUnits;
	
	//enable faction destroyer
	if (_fac1destroyer == 1) then {
		deleteVehicle liberty_gun;
		deleteVehicle liberty_vls;
		deleteVehicle liberty_1;
		deleteVehicle liberty_2;
		deleteVehicle liberty_3;
		deleteVehicle liberty;
	} else {
		_fac1_units call remove_static_uav;
	};
	
	[] execVM (directory+"profile_save_manager.sqf");

	ServerStart = True;
	publicVariable "ServerStart";

};

//////////////////////////////////////////////////////////////////////////////////// Headless Client Scripts


if (!(isServer or hasinterface) and (_hc == 1) and (isNil "ServerStart")) then {
	HC_active = True;
	publicVariable "HC_active";

	//Local Island Resistance
	[resistance,_resistance_type,MOB_CTI_Locations_AllMajorCities] execVM (directory+"island_spawner.sqf");	
	
	//Start up theatre AI commanders
	switch (_faction2_aicom) do {
		case 1:{
			[_faction2_type,"mechanized"] execVM (directory+"ai_commander_theatre_defender.sqf");
		};
		case 2:{
			east setFriend [independent, 1];
			independent setFriend [east, 1];
			[_faction2_type,"mechanized","AA"] execVM (directory+"ai_commander_theatre_defender.sqf");
		};
		default{};
	};

	switch (_faction1_aicom) do {
		case 1:{
			[_faction1_type,"mechanized"] execVM (directory+"ai_commander_theatre_defender.sqf");
		};
		case 2:{
			west setFriend [independent, 1];
			independent setFriend [west, 1];
			[_faction1_type,"mechanized","AA"] execVM (directory+"ai_commander_theatre_defender.sqf");
		};
		default{};
	};


	[["Default",["HC","Headless Client Active"]],BIS_fnc_showNotification] remoteExec ["call"];
};

//////////////////////////////////////////////////////////////////////////////////// Client Side Scripts

if (hasinterface) then {

	waitUntil {!(isNull player)};
	waitUntil {!isNull findDisplay 46};

	(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call special_actions"];

	showWaypoints false;

//Establish Faction Type

	_faction = "";
	if (player in _fac1_units) then {
		_faction = _faction1_type;
	};

	if (player in _fac2_units) then {
		_faction = _faction2_type;
	};
	
	[_faction,player] call starting_gear;
	[player, [player, "Var_SavedInventory"]] call BIS_fnc_saveInventory;

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
		
		//_name = vehicleVarName _killed;
		
		//Purchase Menu
		_unit addaction ["<t color='#1C8A1F'>Purchase Menu</t>","MOB_CTI\player_action_purchasemenu.sqf",[],99,false,true,"","_target == _this"];

		//Squad Manager
		_unit addaction ["<t color='#ebf442'>Squad Manager</t>","MOB_CTI\player_ui_squad_manager.sqf",[],99,false,true,"","vehicle _target == vehicle _this"];
		
		//Command Menu
		_commander = _unit getVariable ["CTI_COMMANDER",false];
		if (_commander) then {
			_unit addaction ["<t color='#FFA500'>Command Menu</t>","MOB_CTI\player_action_commandmenu.sqf",[],99,false,true,"","_target == _this"];
		};
		
		//Loadout
		//hint format ["%1",missionNamespace getvariable "Var_SavedInventory"];
		[_unit, [_killed, "Var_SavedInventory"]] call BIS_fnc_loadInventory;

		//Bad fix for respawn on carrier
		_unit spawn {
			_unit = _this;
			//sleep 3;
			if (surfaceIsWater (getpos _unit)) then {
				_unit setPosATL [(getposATL _unit) select 0,(getposATL _unit) select 1,((getposATL _unit) select 2)+25];
			};
		};
		
		[_unit] call remove_static_uav;
		//deleteVehicle _killed;
		//[_unit, _name] remoteExec [setVehicleVarName,0];
	}];

//Orderly Parajump
	[0] execVM "MOB_CTI\functions\para_eject.sqf";

//Purchase Menu
	player addaction ["<t color='#1C8A1F'>Purchase Menu</t>","MOB_CTI\player_action_purchasemenu.sqf",[],99,false,true,"","_target == _this"];

//Squad Manager
	player addaction ["<t color='#ebf442'>Squad Manager</t>","MOB_CTI\player_ui_squad_manager.sqf",[],99,false,true,"","vehicle _target == vehicle _this"];

//Command Menu	
	_commander = player getVariable ["CTI_COMMANDER",false];
	if (_commander) then {
		player addaction ["<t color='#FFA500'>Command Menu</t>","MOB_CTI\player_action_commandmenu.sqf",[],99,false,true,"","_target == _this"];
	};
		
//BLUFOR Tracker
	[player] spawn blufor_tracker;

//Loadout on respawn
	player spawn save_loadout;

};



//////////////////////////////////////////////////////////////////////////////////////   End State

