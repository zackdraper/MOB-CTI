/*

	define_functions.sqf

	define factions for CTI
	
*/
//////////////////////////////////////////////////////////////////////////////

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
cost_affordable = compileFinal preprocessFile "MOB_CTI\functions\cost_affordable.sqf";
subtract_funds = compileFinal preprocessFile "MOB_CTI\functions\subtract_funds.sqf";
capture_nearby_location = compileFinal preprocessFile "MOB_CTI\functions\capture_nearby_location.sqf";
capture_town = compileFinal preprocessFile "MOB_CTI\functions\capture_town.sqf";
ai_respawn = compileFinal preprocessFile "MOB_CTI\functions\ai_respawn.sqf";
issafezone = compileFinal preprocessFile "MOB_CTI\functions\issafezone.sqf";

call compile preprocessFile "MOB_CTI\functions\functions_ui_keyhandlers.sqf";

CTI_P_WallsAutoAlign = False;
CTI_P_DefensesAutoManning = False;
CTI_BASE_CONSTRUCTION_RANGE = 200;
CTI_BASE_AREA_MAX = 2;
CTI_BASE_AREA_RANGE = 500;
CTI_BASE_WORKERS_PRICE = 300;
CTI_PLAYERS_GROUPSIZE = 10;
CTI_FACTORY_SLEEP = 10;