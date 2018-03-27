/*

	define_force_classnames.sqf

	define the class names of opposing and firendly forces alike into a common framework

	3 element array related to economy system of the force, cash, fuel, ammo

	"classname",[cash,fuel,ammo],"unit init","type"

	type = ["men","light","heavy","air"]


	
*/

/////////////////////////////////////////////////////////////////////////////////////////	
private ["_return"];

_return = switch (_this) do {
	case "csat_gen":{
	
		[
		
		["O_Soldier_SL_F",[100,0,1],"","sl"],
		["O_helipilot_F",[250,0,1],"","pilot"],
		["O_crew_F",[250,0,1],"","crewman"],

		["O_Soldier_F",[75,0,1],"","men"],
		["O_Soldier_A_F",[75,0,1],"","men"],
		["O_Soldier_GL_F",[100,0,3],"","men"],
		["O_Soldier_LAT_F",[100,0,3],"","men"],
		["O_Soldier_AT_F",[150,0,10],"","men"],
		["O_Soldier_AR_F",[100,0,3],"","men"],
		["O_HeavyGunner_F",[150,0,5],"","men"],
		["O_Soldier_AA_F",[150,0,10],"","men"],
		["O_soldier_M_F",[150,0,10],"","men"],
		["O_sniper_F",[250,0,10],"","men"],
		["O_medic_F",[200,0,3],"","men"],
		["O_engineer_F",[200,0,5],"","men"],

		// Light Vehicles
		["O_Quadbike_01_F",[25,1,0],"","light"],
		["O_MRAP_02_F",[150,5,0],"","light"],
		["O_MRAP_02_hmg_F",[300,5,20],"","light"],
		["O_MRAP_02_gmg_F",[300,5,20],"","light"],
		["O_Truck_03_transport_F",[250,5,0],"","light"],
		["O_Truck_03_covered_F",[250,5,0],"","light"],
		["O_APC_Wheeled_02_rcws_F",[500,10,20],"","light"],

		// Support
		["O_Truck_03_repair_F",[300,5,0],"","repair"],
		["O_Truck_03_ammo_F",[300,5,0],"","ammo"],
		["O_Truck_03_fuel_F",[300,5,0],"","fuel"],
		["O_Truck_03_medical_F",[300,5,0],"","medic"],

		// Tanks
		["O_APC_Tracked_02_cannon_F",[1000,30,50],"","heavy"],
		["O_APC_Tracked_02_AA_F",[2500,30,75],"","heavy","aa"],
		["O_MBT_02_cannon_F",[3000,40,100],"","heavy"],
		["O_MBT_02_arty_F",[4000,30,150],"","heavy"],

		// Aircraft
		["O_Heli_Light_02_F",[3000,75,200],"","air"],
		["O_Heli_Light_02_unarmed_F",[3000,75,0],"","air"],
		["O_Heli_Transport_04_F",[4000,100,0],"","air"],
		["O_Heli_Transport_04_covered_F",[4000,100,0],"","air","supply"],
		["O_Heli_Attack_02_F",[10000,150,200],"","air"],
		["O_UAV_02_F",[2000,20,200],"","air"],
		["O_UAV_02_CAS_F",[2000,20,100],"","air"],
		["O_Plane_CAS_02_F",[10000,150,200],"","air"],

		// Naval
		["O_Boat_Transport_01_F",[100,1,0],"","boat"],
		["O_SDV_01_F",[250,5,0],"","boat"],
		["O_Boat_Armed_01_hmg_F",[250,5,20],"","boat"],

		// Static
		["O_HMG_01_F",[100,0,25],"","static"],
		["O_HMG_01_high_F",[100,0,25],"","static"],
		["O_GMG_01_F",[100,0,25],"","static"],
		["O_GMG_01_high_F",[100,0,25],"","static"],
		["O_Mortar_01_F",[500,0,50],"","static"],
		["O_static_AA_F",[300,0,25],"","static"],
		["O_static_AT_F",[300,0,25],"","static"],

		// Base Buildings
		["Land_Cargo_HQ_V3_F",[1000,0,0],"","barracks"],
		["Land_Dome_Small_F",[2000,0,0],"","lightfac"],
		["Land_Bunker_F",[3000,0,0],"","heavyfac"],
		["Land_Cargo_Tower_V3_F",[4000,0,0],"","airfac"],
		["Land_Cargo_House_V3_F",[1000,0,0],"","service"],
		["Land_Lighthouse_Small_F",[1000,0,0],"","boatdock"],
		["Land_Research_house_V1_F",[3000,0,0],"","controlcen"],
	
		// Flag
		["\A3\Data_F\Flags\Flag_CSAT_CO.paa",[0,0,0],"","flag"]
		];
			
	};
	
	case "csat_rec":{
	
		[
		
		// Men
		["O_Soldier_SL_F",[100,0,1],"","sl"],
		["O_helipilot_F",[250,0,1],"","pilot"],
		["O_crew_F",[250,0,1],"","crewman"],

		["O_Soldier_F",[75,0,1],"","men"],
		["O_Soldier_A_F",[75,0,1],"","men"],
		["O_Soldier_GL_F",[100,0,3],"","men"],
		["O_Soldier_LAT_F",[100,0,3],"","men"],
		["O_Soldier_AT_F",[150,0,10],"","men"],
		["O_Soldier_AR_F",[100,0,3],"","men"],
		["O_HeavyGunner_F",[150,0,5],"","men"],
		["O_Soldier_AA_F",[150,0,10],"","men"],
		["O_soldier_M_F",[150,0,10],"","men"],
		["O_sniper_F",[250,0,10],"","men"],
		["O_medic_F",[200,0,3],"","men"],
		["O_engineer_F",[200,0,5],"","men"],

		// Light Vehicles
		["O_Quadbike_01_F",[25,1,0],"","light"],
		["O_MRAP_02_F",[150,5,0],"","light"],
		["O_MRAP_02_hmg_F",[300,5,20],"","light"],
		["O_MRAP_02_gmg_F",[300,5,20],"","light"],
		["O_Truck_03_transport_F",[250,5,0],"","light"],
		["O_Truck_03_covered_F",[250,5,0],"","light"],
		["O_APC_Wheeled_02_rcws_F",[500,10,20],"","light"],

		// Support
		["O_Truck_03_repair_F",[300,5,0],"","repair"],
		["O_Truck_03_ammo_F",[300,5,0],"","ammo"],
		["O_Truck_03_fuel_F",[300,5,0],"","fuel"],
		["O_Truck_03_medical_F",[300,5,0],"","medic"],

		// Aircraft
		["O_Heli_Light_02_F",[3000,75,200],"","air"],
		["O_Heli_Light_02_unarmed_F",[3000,75,0],"","air"],
		["O_Heli_Transport_04_F",[4000,100,0],"","air"],
		["O_Heli_Transport_04_covered_F",[4000,100,0],"","air"],
		["O_Heli_Transport_04_box_F",[4000,100,0],"","supply"],
		["O_Heli_Attack_02_F",[10000,150,200],"","air"],
		["O_UAV_02_F",[2000,20,200],"","air"],
		["O_UAV_02_CAS_F",[2000,20,100],"","air"],
		["O_Plane_CAS_02_F",[10000,150,200],"","air"],

		// Naval
		["O_Boat_Transport_01_F",[100,1,0],"","boat"],
		["O_SDV_01_F",[250,5,0],"","boat"],
		["O_Boat_Armed_01_hmg_F",[250,5,20],"","boat"],

		// Static
		["O_HMG_01_F",[100,0,25],"","static"],
		["O_HMG_01_high_F",[100,0,25],"","static"],
		["O_GMG_01_F",[100,0,25],"","static"],
		["O_GMG_01_high_F",[100,0,25],"","static"],
		["O_Mortar_01_F",[500,0,50],"","static"],
		["O_static_AA_F",[300,0,25],"","static"],
		["O_static_AT_F",[300,0,25],"","static"],

		// Base Buildings
		["Land_Cargo_HQ_V3_F",[1000,0,0],"","barracks"],
		["Land_Cargo_House_V3_F",[2000,0,0],"","lightfac"],
		["Land_Cargo_Tower_V3_F",[4000,0,0],"","airfac"],
		["Land_Cargo_House_V3_F",[1000,0,0],"","service"],
		["Land_Lighthouse_Small_F",[1000,0,0],"","boatdock"],
		
		// Flag
		["\A3\Data_F\Flags\Flag_CSAT_CO.paa",[0,0,0],"","flag"]
			
		];	
	};

	case "nato_gen":{
	
		[
		
		["B_Soldier_SL_F",[100,0,1],"","sl"],
		["B_helipilot_F",[250,0,1],"","pilot"],
		["B_crew_F",[250,0,1],"","crewman"],

		["B_Soldier_F",[75,0,1],"","men"],
		["B_Soldier_A_F",[75,0,1],"","men"],
		["B_Soldier_GL_F",[100,0,3],"","men"],
		["B_Soldier_LAT_F",[100,0,3],"","men"],
		["B_Soldier_AT_F",[150,0,10],"","men"],
		["B_Soldier_AR_F",[100,0,3],"","men"],
		["B_HeavyGunner_F",[150,0,5],"","men"],
		["B_Soldier_AA_F",[150,0,10],"","men"],
		["B_soldier_M_F",[150,0,10],"","men"],
		["B_sniper_F",[250,0,10],"","men"],
		["B_medic_F",[200,0,3],"","men"],
		["B_engineer_F",[200,0,5],"","men"],

		// Light Vehicles
		["B_Quadbike_01_F",[25,1,0],"","light"],
		["B_MRAP_01_F",[150,5,0],"","light"],
		["B_MRAP_01_hmg_F",[300,5,20],"","light"],
		["B_MRAP_01_gmg_F",[300,5,20],"","light"],
		["B_Truck_01_transport_F",[250,5,0],"","light"],
		["B_Truck_01_covered_F",[250,5,0],"","light"],
		["B_APC_Wheeled_01_cannon_F",[500,10,20],"","light"],

		// Support
		["B_Truck_01_repair_F",[300,5,0],"","repair"],
		["B_Truck_01_ammo_F",[300,5,0],"","ammo"],
		["B_Truck_01_fuel_F",[300,5,0],"","fuel"],
		["B_Truck_01_medical_F",[300,5,0],"","medic"],

		// Tanks
		["B_APC_Tracked_01_rcws_F",[1000,30,50],"","heavy"],
		["B_APC_Tracked_02_AA_F",[2500,30,75],"","heavy","aa"],
		["B_MBT_01_cannon_F",[3000,40,100],"","heavy"],
		["B_MBT_01_arty_F",[4000,30,150],"","heavy"],

		// Aircraft
		["B_Heli_Light_01_F",[3000,75,200],"","air"],
		["B_Heli_Light_01_armed_F",[3000,75,0],"","air"],
		["B_Heli_Transport_01_F",[4000,100,0],"","air"],
		["B_Heli_Attack_01_F",[10000,150,200],"","air"],
		["B_UAV_02_F",[2000,20,200],"","air"],
		["B_UAV_02_CAS_F",[2000,20,100],"","air"],
		["B_Plane_CAS_01_F",[10000,150,200],"","air"],

		// Naval
		["B_G_Boat_Transport_01_F",[100,1,0],"","boat"],
		["B_SDV_01_F",[250,5,0],"","boat"],
		["B_Boat_Armed_01_minigun_F",[250,5,20],"","boat"],

		// Static
		["B_HMG_01_F",[100,0,25],"","static"],
		["B_HMG_01_high_F",[100,0,25],"","static"],
		["B_GMG_01_F",[100,0,25],"","static"],
		["B_GMG_01_high_F",[100,0,25],"","static"],
		["B_Mortar_01_F",[500,0,50],"","static"],
		["B_static_AA_F",[300,0,25],"","static"],
		["B_static_AT_F",[300,0,25],"","static"],

		// Base Buildings
		["Land_Cargo_HQ_V3_F",[1000,0,0],"","barracks"],
		["Land_Dome_Small_F",[2000,0,0],"","lightfac"],
		["Land_Bunker_F",[3000,0,0],"","heavyfac"],
		["Land_Cargo_Tower_V1_F",[4000,0,0],"","airfac"],
		["Land_Cargo_House_V1_F",[1000,0,0],"","service"],
		["Land_Lighthouse_Small_F",[1000,0,0],"","boatdock"],
		["Land_Research_house_V1_F",[3000,0,0],"","controlcen"],
		
		// Flag
		["\A3\Data_F\Flags\Flag_nato_CO.paa",[0,0,0],"","flag"]
		
		];
	};
	
	case "aaf_gen":{
	
		[
		
		["I_Soldier_SL_F",[100,0,1],"","sl"],
		["I_helipilot_F",[250,0,1],"","pilot"],
		["I_crew_F",[250,0,1],"","crewman"],

		["I_Soldier_F",[75,0,1],"","men"],
		["I_Soldier_A_F",[75,0,1],"","men"],
		["I_Soldier_GL_F",[100,0,3],"","men"],
		["I_Soldier_LAT_F",[100,0,3],"","men"],
		["I_Soldier_AT_F",[150,0,10],"","men"],
		["I_Soldier_AR_F",[100,0,3],"","men"],
		["I_HeavyGunner_F",[150,0,5],"","men"],
		["I_Soldier_AA_F",[150,0,10],"","men"],
		["I_soldier_M_F",[150,0,10],"","men"],
		["I_sniper_F",[250,0,10],"","men"],
		["I_medic_F",[200,0,3],"","men"],
		["I_engineer_F",[200,0,5],"","men"],

		// Light Vehicles
		["I_G_Quadbike_01_F",[25,1,0],"","light"],
		["I_MRAP_03_F",[150,5,0],"","light"],
		["I_MRAP_03_hmg_F",[300,5,20],"","light"],
		["I_MRAP_03_gmg_F",[300,5,20],"","light"],
		["I_Truck_02_transport_F",[250,5,0],"","light"],
		["I_Truck_02_covered_F",[250,5,0],"","light"],
		["I_APC_Wheeled_03_cannon_F",[500,10,20],"","light"],

		// Support
		["I_Truck_02_box_F",[300,5,0],"","repair"],
		["I_Truck_02_ammo_F",[300,5,0],"","ammo"],
		["I_Truck_02_fuel_F",[300,5,0],"","fuel"],
		["I_Truck_02_medical_F",[300,5,0],"","medic"],

		// Aircraft
		["I_Heli_light_03_F",[3000,75,200],"","air"],
		["I_Heli_light_03_unarmed_F",[3000,75,0],"","air"],
		["I_Heli_Transport_02_F",[4000,100,0],"","air"],
		["I_UAV_02_F",[2000,20,200],"","air"],
		["I_UAV_02_CAS_F",[2000,20,100],"","air"],
		["I_Plane_Fighter_03_CAS_F",[10000,150,200],"","air"],

		// Naval
		["I_Boat_Transport_01_F ",[100,1,0],"","boat"],
		["I_SDV_01_F",[250,5,0],"","boat"],
		["I_Boat_Armed_01_minigun_F",[250,5,20],"","boat"],

		// Static
		["I_HMG_01_F",[100,0,25],"","static"],
		["I_HMG_01_high_F",[100,0,25],"","static"],
		["I_GMG_01_F",[100,0,25],"","static"],
		["I_GMG_01_high_F",[100,0,25],"","static"],
		["I_Mortar_01_F",[500,0,50],"","static"],
		["I_static_AA_F",[300,0,25],"","static"],
		["I_static_AT_F",[300,0,25],"","static"],

		// Base Buildings
		["Land_Cargo_HQ_V1_F",[1000,0,0],"","barracks"],
		["Land_Dome_Small_F",[2000,0,0],"","lightfac"],
		["Land_Bunker_F",[3000,0,0],"","heavyfac"],
		["Land_Cargo_Tower_V1_F",[4000,0,0],"","airfac"],
		["Land_Cargo_House_V1_F",[1000,0,0],"","service"],
		["Land_Lighthouse_Small_F",[1000,0,0],"","boatdock"],
		["Land_Research_house_V1_F",[3000,0,0],"","controlcen"],
		
		// Flag
		["\A3\Data_F\Flags\Flag_AAF_CO.paa",[0,0,0],"","flag"]

		];
	};
	
	case "fia_gen":{
		[
		["B_G_Soldier_SL_F",[100,0,1],"","sl"],
		["b_g_soldier_unarmed_f",[250,0,1],"","crewman"],

		["B_G_Soldier_F",[75,0,1],"","men"],
		["B_G_Soldier_A_F",[75,0,1],"","men"],
		["B_G_Soldier_GL_F",[100,0,3],"","men"],
		["B_G_Soldier_LAT_F",[100,0,3],"","men"],
		["B_G_Soldier_AR_F",[100,0,3],"","men"],
		["B_G_Soldier_M_F",[150,0,10],"","men"],
		["B_G_Sharpshooter_F",[250,0,10],"","men"],
		["B_G_medic_F",[200,0,3],"","men"],
		["B_G_engineer_F",[200,0,5],"","men"],

		// Light Vehicles
		["B_G_Quadbike_01_F",[25,1,0],"","light"],
		["B_G_Offroad_01_F",[25,1,0],"","light"],
		["B_G_Offroad_01_armed_F",[25,1,0],"","light"],
		["I_MRAP_03_F",[150,5,0],"","light"],
		["I_MRAP_03_hmg_F",[300,5,20],"","light"],
		["I_MRAP_03_gmg_F",[300,5,20],"","light"],
		["I_Truck_02_transport_F",[250,5,0],"","light"],
		["I_Truck_02_covered_F",[250,5,0],"","light"],
		["I_APC_Wheeled_03_cannon_F",[500,10,20],"","light"],

		// Support
		["B_G_Offroad_01_repair_F",[300,5,0],"","repair"],
		["I_Truck_02_ammo_F",[300,5,0],"","ammo"],
		["B_G_Van_01_fuel_F",[300,5,0],"","fuel"],
		["I_Truck_02_medical_F",[300,5,0],"","medic"],

		// Naval
		["I_Boat_Transport_01_F ",[100,1,0],"","boat"],

		// Static
		["I_HMG_01_F",[100,0,25],"","static"],
		["I_HMG_01_high_F",[100,0,25],"","static"],
		["I_GMG_01_F",[100,0,25],"","static"],
		["I_GMG_01_high_F",[100,0,25],"","static"],
		["I_Mortar_01_F",[500,0,50],"","static"],
		["I_static_AA_F",[300,0,25],"","static"],
		["I_static_AT_F",[300,0,25],"","static"],

		// Base Buildings
		["Land_Cargo_HQ_V1_F",[1000,0,0],"","barracks"],
		["Land_Cargo_House_V1_F",[2000,0,0],"","lightfac"],
		["Land_Bunker_F",[3000,0,0],"","heavyfac"],
		["Land_Cargo_House_V1_F",[1000,0,0],"","service"],
		["Land_Lighthouse_Small_F",[1000,0,0],"","boatdock"],
		
		// Flag
		["\A3\Data_F\Flags\Flag_FIA_CO.paa",[0,0,0],"","flag"]
		];
	};

	case "rhs_rus_wood":{
		[
		["rhs_msv_sergeant",[100,0,1],"","sl"],
		["rhs_msv_armoredcrew",[250,0,1],"","crewman"],
		["rhs_pilot_combat_heli",[250,0,1],"","pilot"],

		["rhs_msv_rifleman",[75,0,1],"","men"],
		["rhs_msv_efreitor",[100,0,1],"","men"],
		["rhs_msv_grenadier",[100,0,3],"","men"],
		["rhs_msv_grenadier_rpg",[100,0,3],"","men"],
		["rhs_msv_arifleman",[100,0,3],"","men"],
		["rhs_msv_machinegunner",[125,0,5],"","men"],
		["rhs_msv_machinegunner_assitant",[125,0,5],"","men"],
		["rhs_msv_at",[250,0,10],"","men"],
		["rhs_msv_aa",[250,0,10],"","men"],
		["rhs_msv_marksman",[150,0,10],"","men"],
		["rhs_msv_medic",[200,0,1],"","men"],
		["rhs_msv_engineer",[200,0,2],"","men"],

		// Light Vehicles
		["rhs_tigr_msv",[50,1,0],"","light"],
		["rhs_tigr_sts_msv",[75,1,10],"","light"],
		["rhs_uaz_open_msv_01",[25,1,0],"","light"],

		["rhs_btr80_msv",[350,15,5],"","light"],
		["rhs_btr80_msv",[350,15,10],"","light"],

		["rhs_bmd1",[750,15,15],"","light"],
		["rhs_bmd2",[750,15,15],"","light"],

		["RHS_Ural_MSV_01",[100,5,0],"","light"],
		["RHS_Ural_Open_MSV_01",[100,5,0],"","light"],
		["RHS_BM21_MSV_01",[2000,5,30],"","light"],

		// Tanks
		["rhs_bmp2k_msv",[1000,30,50],"","heavy"],
		["rhs_bmp3_msv",[1500,30,75],"","heavy"],
		["rhs_bmp3_late_msv",[2000,30,75],"","heavy"],
		["rhs_zsu234_aa",[2000,30,75],"","heavy","aa"],
		["rhs_t72ba_tv",[4000,40,100],"","heavy"],
		["rhs_t72bd_tv",[5000,40,150],"","heavy"],
		["rhs_t80u",[6000,40,150],"","heavy"],
		["rhs_2s3_tv",[4000,30,150],"","heavy"],

		// Support
		["rhs_gaz66_repair_msv",[300,5,0],"","repair"],
		["rhs_gaz66_ammo_msv",[300,5,0],"","ammo"],
		["RHS_Ural_Fuel_MSV_01",[300,5,0],"","fuel"],
		["rhs_gaz66_ap2_msv",[300,5,0],"","medic"],

		// Aircraft
		["RHS_Mi8MTV3_UPK23_vvsc",[2000,75,15],"","air"],
		["RHS_Mi8MTV3_vvsc",[2000,75,20],"","air"],
		["RHS_Mi24P_vvsc",[8000,100,30],"","air"],
		["RHS_Ka52_vvsc",[8000,100,30],"","air"],
		["RHS_Su25SM_vvsc",[12000,200,30],"","air"],
		
		// Naval
		["B_Boat_Transport_01_F ",[100,1,0],"","boat"],
		["B_SDV_01_F",[250,5,0],"","boat"],
		["B_Boat_Armed_01_minigun_F",[250,5,20],"","boat"],

		// Static
		["RHS_M2StaticMG_MiniTripod_WD",[100,0,5],"","static"],
		["RHS_M2StaticMG_WD",[100,0,5],"","static"],
		["RHS_MK19_Tripod_WD",[100,0,5],"","static"],
		["RHS_M252_WD",[500,0,50],"","static"],
		["RHS_Stinger_AA_pod",[300,0,5],"","static"],
		["RHS_TOW_Tripod_WD",[300,0,5],"","static"],
		["RHS_M119_WD",[2000,0,20],"","static"],

		// Base Buildings
		["RU_WarfareBBarracks",[1000,0,0],"","barracks"],
		["RU_WarfareBLightFactory",[2000,0,0],"","lightfac"],
		["RU_WarfareBHeavyFactory",[3000,0,0],"","heavyfac"],
		["RU_WarfareBAirFactory",[4000,0,0],"","airfac"],
		["RU_WarfareBVehicleServicePoint",[1000,0,0],"","service"],
		["PowGen_Big",[1000,0,0],"","boatdock"],
		["RU_WarfareBUAVTerminal",[3000,0,0],"","controlcen"],
		
		// Flag
		["\A3\Data_F\Flags\Flag_us_CO.paa",[0,0,0],"","flag"]
		];
	};

	case "rhs_usarmy_wood":{
		[
		["rhsusf_army_ocp_squadleader",[100,0,1],"","sl"],
		["rhsusf_army_ocp_crewman",[250,0,1],"","crewman"],
		["rhsusf_army_ocp_helipilot",[250,0,1],"","pilot"],

		["rhsusf_army_ocp_rifleman",[75,0,1],"","men"],
		["rhsusf_army_ocp_teamleader",[100,0,1],"","men"],
		["rhsusf_army_ocp_grenadier",[100,0,3],"","men"],
		["rhsusf_army_ocp_riflemanat",[100,0,3],"","men"],
		["rhsusf_army_ocp_autorifleman",[100,0,3],"","men"],
		["rhsusf_army_ocp_autoriflemana",[100,0,3],"","men"],
		["rhsusf_army_ocp_machinegunner",[125,0,5],"","men"],
		["rhsusf_army_ocp_machinegunnera",[125,0,5],"","men"],
		["rhsusf_army_ocp_javelin",[250,0,10],"","men"],
		["rhsusf_army_ocp_aa",[250,0,10],"","men"],
		["rhsusf_army_ocp_marksman",[150,0,10],"","men"],
		["rhsusf_army_ocp_sniper",[250,0,10],"","men"],
		["rhsusf_army_ocp_medic",[200,0,1],"","men"],
		["rhsusf_army_ocp_engineer",[200,0,2],"","men"],
		["rhsusf_army_ocp_uav",[250,0,3],"","men"],
		["rhsusf_army_ocp_explosives",[250,0,5],"","men"],
		["rhsusf_army_ocp_rifleman_m590",[75,0,1],"","men"],

		// Light Vehicles
		["rhsusf_m1025_w",[50,1,0],"","light"],
		["rhsusf_m1025_w_m2",[75,1,5],"","light"],
		["rhsusf_m1025_w_mk19",[75,1,5],"","light"],
		["rhsusf_m998_w_2dr_halftop",[75,1,0],"","light"],

		["rhsusf_m1117_w",[150,5,0],"","light"],
		["rhsusf_rg33_m2_wd",[150,5,5],"","light"],
		["rhsusf_rg33_wd",[150,5,10],"","light"],

		["rhsusf_m113_usarmy_unarmed",[350,15,0],"","light"],
		["rhsusf_m113_usarmy",[350,15,5],"","light"],
		["rhsusf_m113_usarmy_M240",[350,15,5],"","light"],
		["rhsusf_m113_usarmy_MK19",[350,15,5],"","light"],

		["rhsusf_M1078A1P2_B_wd_fmtv_usarmy",[100,5,0],"","light"],
		["rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy",[100,5,0],"","light"],

		// Tanks
		["RHS_M2A2_wd",[1000,30,50],"","heavy"],
		["RHS_M2A3_wd",[1500,30,75],"","heavy"],
		["RHS_M2A3_BUSKIII_wd",[2000,30,75],"","heavy"],
		["RHS_M6_wd",[2000,30,75],"","heavy","aa"],
		["rhsusf_m1a1aimwd_usarmy",[4000,40,100],"","heavy"],
		["rhsusf_m1a2sep1wd_usarmy",[5000,40,150],"","heavy"],
		["rhsusf_m1a2sep1tuskiiwd_usarmy",[6000,40,150],"","heavy"],
		["rhsusf_m109_usarmy",[4000,30,150],"","heavy"],

		// Support
		["rhsusf_M977A4_REPAIR_usarmy_wd",[300,5,0],"","repair"],
		["rhsusf_M977A4_AMMO_usarmy_wd",[300,5,0],"","ammo"],
		["rhsusf_M978A4_usarmy_wd",[300,5,0],"","fuel"],
		["rhsusf_m113_usarmy_medical",[300,5,0],"","medic"],

		// Aircraft
		["RHS_UH60M",[2000,75,15],"","air"],
		["RHS_CH_47F",[3000,100,15],"","air"],
		["RHS_AH64D_wd_GS",[8000,100,30],"","air"],
		["RHS_AH64D_wd_AA",[8000,100,30],"","air"],
		["RHS_A10",[12000,200,30],"","air"],
		
		// Naval
		["B_Boat_Transport_01_F ",[100,1,0],"","boat"],
		["B_SDV_01_F",[250,5,0],"","boat"],
		["B_Boat_Armed_01_minigun_F",[250,5,20],"","boat"],

		// Static
		["RHS_M2StaticMG_MiniTripod_WD",[100,0,5],"","static"],
		["RHS_M2StaticMG_WD",[100,0,5],"","static"],
		["RHS_MK19_Tripod_WD",[100,0,5],"","static"],
		["RHS_M252_WD",[500,0,50],"","static"],
		["RHS_Stinger_AA_pod",[300,0,5],"","static"],
		["RHS_TOW_Tripod_WD",[300,0,5],"","static"],
		["RHS_M119_WD",[2000,0,20],"","static"],

		// Base Buildings
		["USMC_WarfareBBarracks",[1000,0,0],"","barracks"],
		["USMC_WarfareBLightFactory",[2000,0,0],"","lightfac"],
		["USMC_WarfareBHeavyFactory",[3000,0,0],"","heavyfac"],
		["USMC_WarfareBAircraftFactory",[4000,0,0],"","airfac"],
		["USMC_WarfareBVehicleServicePoint",[1000,0,0],"","service"],
		["PowGen_Big",[1000,0,0],"","boatdock"],
		["USMC_WarfareBUAVTerminal",[3000,0,0],"","controlcen"],
		
		// Flag
		["\A3\Data_F\Flags\Flag_us_CO.paa",[0,0,0],"","flag"]
		];
	};

	case "rhs_chdkz":{
		[
		["rhsgref_ins_g_squadleader",[100,0,1],"","sl"],
		["rhsgref_ins_g_crew",[250,0,1],"","crewman"],

		["rhsgref_ins_g_rifleman_akm",[75,0,1],"","men"],
		["rhsgref_ins_g_specialist_aa",[75,0,1],"","men"],
		["rhsgref_ins_g_grenadier",[100,0,3],"","men"],
		["rhsgref_ins_g_grenadier_rpg",[100,0,3],"","men"],
		["rhsgref_ins_g_machinegunner",[100,0,3],"","men"],
		["rhsgref_ins_g_sniper",[150,0,10],"","men"],
		["rhsgref_ins_g_medic",[200,0,3],"","men"],
		["rhsgref_ins_g_engineer",[200,0,5],"","men"],

		// Light Vehicles
		["rhsgref_ins_g_uaz",[25,1,0],"","light"],
		["rhsgref_ins_g_uaz_ags",[25,1,3],"","light"],
		["rhsgref_ins_g_uaz_dshkm_chdkz",[25,1,3],"","light"],
		["rhsgref_BRDM2_ins_g",[300,5,20],"","light"],
		["rhsgref_BRDM2_ATGM_ins_g",[300,5,20],"","light"],
		["rhsgref_ins_g_ural_Zu23",[200,7,20],"","light"],

		// Support
		["B_G_Offroad_01_repair_F",[300,5,0],"","repair"],
		["I_Truck_02_ammo_F",[300,5,0],"","ammo"],
		["B_G_Van_01_fuel_F",[300,5,0],"","fuel"],
		["I_Truck_02_medical_F",[300,5,0],"","medic"],

		// Naval
		["I_Boat_Transport_01_F ",[100,1,0],"","boat"],

		// Static
		["I_HMG_01_F",[100,0,25],"","static"],
		["I_HMG_01_high_F",[100,0,25],"","static"],
		["I_GMG_01_F",[100,0,25],"","static"],
		["I_GMG_01_high_F",[100,0,25],"","static"],
		["I_Mortar_01_F",[500,0,50],"","static"],
		["I_static_AA_F",[300,0,25],"","static"],
		["I_static_AT_F",[300,0,25],"","static"],

		// Base Buildings
		["Land_Cargo_HQ_V1_F",[1000,0,0],"","barracks"],
		["Land_Cargo_House_V1_F",[2000,0,0],"","lightfac"],
		["Land_Bunker_F",[3000,0,0],"","heavyfac"],
		["Land_Cargo_House_V1_F",[1000,0,0],"","service"],
		["Land_Lighthouse_Small_F",[1000,0,0],"","boatdock"],
		
		// Flag
		["\A3\Data_F\Flags\Flag_FIA_CO.paa",[0,0,0],"","flag"]
		];
	};

	case "projopfor_sla":{
		[
		["LOP_SLA_Infantry_SL",[100,0,1],"","sl"],
		["LOP_SLA_Infantry_Crewman",[250,0,1],"","crewman"],
		["LOP_SLA_Infantry_Pilot",[250,0,1],"","pilot"],

		["LOP_SLA_Infantry_Rifleman",[75,0,1],"","men"],
		["LOP_SLA_Infantry_TL",[100,0,1],"","men"],
		["LOP_SLA_Infantry_GL",[100,0,3],"","men"],
		["LOP_SLA_Infantry_AT_Asst",[100,0,3],"","men"],
		["LOP_SLA_Infantry_Rifleman_2",[75,0,3],"","men"],
		["LOP_SLA_Infantry_MG",[125,0,5],"","men"],
		["LOP_SLA_Infantry_MG_Asst",[125,0,5],"","men"],
		["LOP_SLA_Infantry_AT",[250,0,10],"","men"],
		["LOP_SLA_Infantry_AA",[250,0,10],"","men"],
		["LOP_SLA_Infantry_Marksman",[150,0,10],"","men"],
		["LOP_SLA_Infantry_Corpsman",[200,0,1],"","men"],
		["LOP_SLA_Infantry_Engineer",[200,0,2],"","men"],

		// Light Vehicles
		["LOP_SLA_UAZ",[50,1,0],"","light"],
		["LOP_SLA_UAZ_Open",[50,1,0],"","light"],
		["LOP_SLA_UAZ_DshKM",[50,1,10],"","light"],
		["LOP_SLA_UAZ_AGS",[75,1,10],"","light"],
		["LOP_SLA_UAZ_SPG",[75,1,10],"","light"],

		["LOP_SLA_BTR60",[250,15,5],"","light"],
		["LOP_SLA_BTR60",[350,15,5],"","light"],

		["LOP_SLA_Ural",[100,5,0],"","light"],
		["LOP_SLA_Ural_Open",[100,5,0],"","light"],
		["LOP_SLA_BM21",[2000,5,30],"","light"],

		// Tanks
		["LOP_SLA_BMP1",[1000,30,50],"","heavy"],
		["LOP_SLA_BMP1D",[1500,30,75],"","heavy"],
		["LOP_SLA_BMP2",[2000,30,75],"","heavy"],
		["LOP_SLA_BMP2D",[2000,30,75],"","heavy"],
		["LOP_SLA_ZSU234",[2000,30,75],"","heavy"],
		["LOP_SLA_T72BA",[4000,40,100],"","heavy"],
		["LOP_SLA_T72BB",[5000,40,150],"","heavy"],

		// Support
		["rhs_gaz66_repair_msv",[300,5,0],"","repair"],
		["rhs_gaz66_ammo_msv",[300,5,0],"","ammo"],
		["RHS_Ural_Fuel_MSV_01",[300,5,0],"","fuel"],
		["rhs_gaz66_ap2_msv",[300,5,0],"","medic"],

		// Aircraft
		["LOP_SLA_Mi8MT_Cargo",[2000,75,15],"","air"],
		["LOP_SLA_Mi8MTV3_FAB",[2000,75,20],"","air"],
		["LOP_SLA_Mi8MTV3_UPK23",[2000,75,20],"","air"],
		
		// Naval
		["B_Boat_Transport_01_F ",[100,1,0],"","boat"],

		// Static
		["RHS_M2StaticMG_MiniTripod_WD",[100,0,5],"","static"],
		["RHS_M2StaticMG_WD",[100,0,5],"","static"],
		["RHS_MK19_Tripod_WD",[100,0,5],"","static"],
		["RHS_M252_WD",[500,0,50],"","static"],
		["RHS_Stinger_AA_pod",[300,0,5],"","static"],
		["RHS_TOW_Tripod_WD",[300,0,5],"","static"],
		["RHS_M119_WD",[2000,0,20],"","static"],

		// Base Buildings
		["RU_WarfareBBarracks",[1000,0,0],"","barracks"],
		["RU_WarfareBLightFactory",[2000,0,0],"","lightfac"],
		["RU_WarfareBHeavyFactory",[3000,0,0],"","heavyfac"],
		["RU_WarfareBAircraftFactory",[4000,0,0],"","airfac"],
		["RU_WarfareBVehicleServicePoint",[1000,0,0],"","service"],
		["PowGen_Big",[1000,0,0],"","boatdock"],
		["RU_WarfareBUAVTerminal",[3000,0,0],"","controlcen"],
		
		// Flag
		["\po_main\data\fac\cfgfactionclasses_sla_ca.paa",[0,0,0],"","flag"]
		];
	};

	case "cup_racs_desert":{
		[
		["CUP_I_RACS_SL",[100,0,1],"","sl"],
		["CUP_I_RACS_Crew",[250,0,1],"","crewman"],
		["CUP_I_RACS_Pilot",[250,0,1],"","pilot"],

		["CUP_I_RACS_Soldier",[75,0,1],"","men"],
		["CUP_I_RACS_SL",[100,0,1],"","men"],
		["CUP_I_RACS_GL",[100,0,3],"","men"],
		["CUP_I_RACS_Soldier_MAT",[150,0,3],"","men"],
		["CUP_I_RACS_MMG",[125,0,5],"","men"],
		["CUP_I_RACS_Soldier_HAT",[250,0,10],"","men"],
		["CUP_I_RACS_Soldier_AA",[250,0,10],"","men"],
		["CUP_I_RACS_Sniper",[150,0,10],"","men"],
		["CUP_I_RACS_Medic",[200,0,1],"","men"],
		["CUP_I_RACS_Engineer",[200,0,2],"","men"],

		// Light Vehicles
		["CUP_I_LR_Transport_RACS",[50,1,0],"","light"],
		["CUP_I_LR_MG_RACS",[50,1,10],"","light"],
		["CUP_I_LR_Ambulence_RACS",[75,1,0],"","light"],
		["CUP_I_M113_RACS",[350,15,5],"","light"],

		// Tanks
		["CUP_I_AAV_RACS",[2000,30,75],"","heavy"],
		["CUP_I_M163_RACS",[2000,30,75],"","heavy","aa"],
		["CUP_I_T72_RACS",[4000,40,100],"","heavy"],

		// Support
		["CUP_B_MTVR_Repair_USA",[300,5,0],"","repair"],
		["CUP_B_MTVR_Ammo_USA",[300,5,0],"","ammo"],
		["CUP_B_MTVR_Refuel_USA",[300,5,0],"","fuel"],
		["CUP_I_M113_Med_RACS",[300,5,0],"","medic"],

		// Aircraft
		["CUP_I_SA330_Puma_HC1_RACS",[2000,75,15],"","air"],
		["CUP_I_CH47F_RACS",[3000,100,15],"","air"],
		["CUP_I_C130J_RACS",[2000,75,0],"","air"],
		
		// Naval
		["B_Boat_Transport_01_F",[100,1,0],"","boat"],

		// Static
		["RHS_M2StaticMG_MiniTripod_WD",[100,0,5],"","static"],
		["RHS_M2StaticMG_WD",[100,0,5],"","static"],
		["RHS_MK19_Tripod_WD",[100,0,5],"","static"],
		["RHS_M252_WD",[500,0,50],"","static"],
		["RHS_Stinger_AA_pod",[300,0,5],"","static","aa"],
		["RHS_TOW_Tripod_WD",[300,0,5],"","static"],
		["RHS_M119_WD",[2000,0,20],"","static"],

		// Base Buildings
		["RU_WarfareBBarracks",[1000,0,0],"","barracks"],
		["RU_WarfareBLightFactory",[2000,0,0],"","lightfac"],
		["RU_WarfareBHeavyFactory",[3000,0,0],"","heavyfac"],
		["RU_WarfareBAircraftFactory",[4000,0,0],"","airfac"],
		["RU_WarfareBVehicleServicePoint",[1000,0,0],"","service"],
		["PowGen_Big",[1000,0,0],"","boatdock"],
		["RU_WarfareBUAVTerminal",[3000,0,0],"","controlcen"],
		
		// Flag
		["\po_main\data\fac\cfgfactionclasses_racs_ca.paa",[0,0,0],"","flag"]
		];
	};
};
_return