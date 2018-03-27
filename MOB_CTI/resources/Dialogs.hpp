#include "Styles.hpp"

class CTI_RscBuildMenu {
	movingEnable = 0;
	idd = 100000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_buildmenu', _this select 0];['onLoad'] execVM 'MOB_CTI\player_events_ui_buildmenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_buildmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.615";
			h = "SafeZoneH * 0.65";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.615";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : RscText {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.23)";
			y = "SafeZoneY + (SafezoneH * 0.180)";
			w = "SafeZoneW * 0.595";
			h = "SafeZoneH * 0.037";

			text = "Building Construction";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_BuildingListFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.415)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.34";
		};
		class CTI_Menu_DefenseListFrame : CTI_Menu_BuildingListFrame {
			x = "SafeZoneX + (SafeZoneW * 0.535)";
		};
		class CTI_Menu_Info : CTI_Menu_BuildingListFrame {
			y = "SafeZoneY + (SafezoneH * 0.235)";
			h = "SafeZoneH * 0.06";
		};
		class CTI_Menu_Info_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.235)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.06";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
	};

	class controls {
		class CTI_Menu_Control_Undo : RscButton {
			idc = 100001;

			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafeZoneH * 0.77)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.04";

			text = "Undo Structure";
			action = "['onUndoStructure'] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};
		class CTI_Menu_Control_UndoDefense : CTI_Menu_Control_Undo {
			idc = 100010;

			x = "SafeZoneX + (SafeZoneW * 0.535)";

			text = "Undo Defense";
			action = "['onUndoDefense'] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};
		class CTI_Menu_Control_BuildStructure : CTI_Menu_Control_Undo {
			idc = 100002;

			y = "SafeZoneY + (SafeZoneH * 0.36)";

			text = "Build Structure";
			action = "['onBuildStructure', lnbCurSelRow 100006] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};
		class CTI_Menu_Control_AutoAlign : CTI_Menu_Control_Undo {
			idc = 100003;

			x = "SafeZoneX + (SafeZoneW * 0.535)";
			y = "SafeZoneY + (SafeZoneH * 0.3075)";

			text = "";
			action = "['onAutoAlign'] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};
		class CTI_Menu_Control_AutoManning : RscButton_Lesser {
			idc = 100011;

			x = "SafeZoneX + (SafeZoneW * 0.535)";
			y = "SafeZoneY + (SafeZoneH * 0.235)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.04";

			text = "";
			action = "['onAutoManning'] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};
		class CTI_Menu_Control_BuildDefense : CTI_Menu_Control_AutoAlign {
			idc = 100004;

			y = "SafeZoneY + (SafeZoneH * 0.36)";

			text = "Build Defense";
			action = "['onBuildDefense', lnbCurSelRow 100007] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};
		class CTI_Menu_Control_AddWorker : CTI_Menu_Control_Undo {
			idc = 100005;

			y = "SafeZoneY + (SafeZoneH * 0.3075)";

			text = "Add Worker";
			action = "['onAddWorker'] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};

		class CTI_Menu_Control_BuildingList : RscListNBox {
			idc = 100006;

			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.415)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.34";

			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			// columns[] = {0.001, 0.26};
			columns[] = {0.001, 0.18};

			onLBDblClick = "['onBuildStructure', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};
		class CTI_Menu_Control_DefenseList : CTI_Menu_Control_BuildingList {
			idc = 100007;

			x = "SafeZoneX + (SafeZoneW * 0.535)";

			onLBDblClick = "['onBuildDefense', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};
		class CTI_Menu_Control_Info : RscStructuredText {
			idc = 100008;

			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.235)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_InfoWorkers : CTI_Menu_Control_Info {
			idc = 100009;

			y = "SafeZoneY + (SafezoneH * 0.265)";
		};
		class CTI_Control_Exit : RscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.77)";
			y = "SafeZoneY + (SafezoneH * 0.18)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
	};
};

class CTI_RscPurchaseMenu {
	movingEnable = 0;
	idd = 110000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_purchasemenu', _this select 0];['onLoad'] execVM 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_purchasemenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.615";
			h = "SafeZoneH * 0.705";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.615";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : RscText {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.23)";
			y = "SafeZoneY + (SafezoneH * 0.180)";
			w = "SafeZoneW * 0.595";
			h = "SafeZoneH * 0.037";

			text = "Factory Menu";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_UnitsListFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.419)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.391";
		};
		class CTI_Menu_Info : CTI_Menu_UnitsListFrame {
			y = "SafeZoneY + (SafezoneH * 0.245)";
			h = "SafeZoneH * 0.064";
		};
		class CTI_Menu_Info_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.245)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.064";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_ResourcesInfo_Background : CTI_Menu_Info_Background {
			y = "SafeZoneY + (SafezoneH * 0.373)";
			h = "SafeZoneH * 0.030";
		};

		class CTI_Menu_SubInfo : CTI_Menu_Info {
			y = "SafeZoneY + (SafezoneH * 0.325)";
			h = "SafeZoneH * 0.078";
		};

		class CTI_Menu_ComboFrame : CTI_Menu_Info {
			x = "SafeZoneX + (SafeZoneW * 0.535)";
			h = "SafeZoneH * 0.1";
		};

		class CTI_Menu_TeamComboLabel : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.54)";
			y = "SafeZoneY + (SafezoneH * 0.257)";
			w = "SafeZoneW * 0.1";
			h = "SafeZoneH * 0.035";

			text = "Team :";
			// colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_FactoryComboLabel : CTI_Menu_TeamComboLabel {
			y = "SafeZoneY + (SafezoneH * 0.3)";

			text = "Factory :";
		};

		class CTI_Menu_MapFrame : CTI_Menu_ComboFrame {
			y = "SafeZoneY + (SafezoneH * 0.361)";
			h = "SafeZoneH * 0.235";
		};
		class CTI_Menu_Info_MapIntel : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.535)";
			y = "SafeZoneY + (SafezoneH * 0.361)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.2";

			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};

		class CTI_Menu_QueueFrame : CTI_Menu_MapFrame {
			y = "SafeZoneY + (SafezoneH * 0.612)";
			h = "SafeZoneH * 0.143";
		};
	};

	class controls {
		class CTI_Menu_Map : RscMapControl {
			idc = 110010;

			x = "SafeZoneX + (SafeZoneW * 0.535)";
			y = "SafeZoneY + (SafezoneH * 0.391)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.205";

			showCountourInterval = 1;
		};
		class CTI_Menu_Map_Info : RscStructuredText {
			idc = 110901;

			x = "SafeZoneX + (SafeZoneW * 0.535)";
			y = "SafeZoneY + (SafezoneH * 0.361)";
			w = "SafeZoneW * 0.1375";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

			class Attributes {
				font = "PuristaMedium";
				color = "#ffffff";
				align = "left";
				shadow = 1;
			};
		};
		class CTI_Menu_Group_Info : CTI_Menu_Map_Info {
			idc = 110902;

			x = "SafeZoneX + (SafeZoneW * 0.6725)";
		};
		class CTI_Icon_Barracks : RscActiveText {
			idc = 110001;
			style = ST_KEEP_ASPECT_RATIO;
			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.245)";
			w = "SafeZoneW * 0.035";
			h = "SafeZoneH * 0.064";

			color[] = {0.75,0.75,0.75,0.7};
			colorActive[] = {1,1,1,0.7};
			colorDisabled[] = {1,1,1,0.7};
			colorBackground[] = {0.6, 0.8392, 0.4706, 0.7};
			colorBackgroundSelected[] = {0.6, 0.8392, 0.4706, 0.7};
			colorFocused[] = {0.0, 0.0, 0.0, 0};

			text = "MOB_CTI\resources\Pictures\icon_wf_building_barracks.paa";
			action = "['onIconSet', 0] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Icon_Light : CTI_Icon_Barracks {
			idc = 110002;
			x = "SafeZoneX + (SafeZoneW * 0.26)";

			text = "MOB_CTI\resources\Pictures\icon_wf_building_lvs.paa";
			action = "['onIconSet', 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Icon_Heavy : CTI_Icon_Barracks {
			idc = 110003;
			x = "SafeZoneX + (SafeZoneW * 0.295)";

			text = "MOB_CTI\resources\Pictures\icon_wf_building_hvs.paa";
			action = "['onIconSet', 2] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Icon_Air : CTI_Icon_Barracks {
			idc = 110004;
			x = "SafeZoneX + (SafeZoneW * 0.33)";

			text = "MOB_CTI\resources\Pictures\icon_wf_building_air.paa";
			action = "['onIconSet', 3] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Icon_Repair : CTI_Icon_Barracks {
			idc = 110005;
			x = "SafeZoneX + (SafeZoneW * 0.365)";

			text = "MOB_CTI\resources\Pictures\icon_wf_building_repair.paa";
			action = "['onIconSet', 4] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		//class CTI_Icon_Ammo : CTI_Icon_Barracks {
		//	idc = 110006;
		//	x = "SafeZoneX + (SafeZoneW * 0.4)";

		//	text = "MOB_CTI\resources\Pictures\icon_wf_building_ammo.paa";
		//	action = "['onIconSet', 5, CTI_AMMO] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		//};
		class CTI_Icon_Naval : CTI_Icon_Barracks {
			idc = 110007;
			//x = "SafeZoneX + (SafeZoneW * 0.435)";
			x = "SafeZoneX + (SafeZoneW * 0.4)";

			text = "MOB_CTI\resources\Pictures\icon_wf_building_naval.paa";
			action = "['onIconSet', 5] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};

		class CTI_Icon_Driver : CTI_Icon_Barracks {
			idc = 110100;
			x = "SafeZoneX + (SafeZoneW * 0.34)";
			y = "SafeZoneY + (SafezoneH * 0.325)";
			w = "SafeZoneW * 0.03";
			h = "SafeZoneH * 0.048";

			color[] = {0.258823529, 0.713725490, 1, 1};
			colorActive[] = {1,1,1,0.7};
			colorBackground[] = {0.6, 0.8392, 0.4706, 0.7};
			colorBackgroundSelected[] = {0.6, 0.8392, 0.4706, 0.7};
			colorFocused[] = {0.0, 0.0, 0.0, 0};

			text = "MOB_CTI\resources\Pictures\i_driver.paa";
			action = "['onVehicleIconClicked', 'driver', 110100] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Icon_Gunner : CTI_Icon_Driver {
			idc = 110101;
			x = "SafeZoneX + (SafeZoneW * 0.37)";

			text = "MOB_CTI\resources\Pictures\i_gunner.paa";
			action = "['onVehicleIconClicked', 'gunner', 110101] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Icon_Commander : CTI_Icon_Driver {
			idc = 110102;
			x = "SafeZoneX + (SafeZoneW * 0.4)";

			text = "MOB_CTI\resources\Pictures\i_commander.paa";
			action = "['onVehicleIconClicked', 'commander', 110102] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Icon_Turrets : CTI_Icon_Driver {
			idc = 110103;
			x = "SafeZoneX + (SafeZoneW * 0.43)";

			text = "MOB_CTI\resources\Pictures\i_turrets.paa";
			action = "['onVehicleIconClicked', 'turrets', 110103] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Icon_Lock : CTI_Icon_Driver {
			idc = 110104;
			x = "SafeZoneX + (SafeZoneW * 0.47)";

			color[] = {1, 0.22745098, 0.22745098, 1};

			text = "MOB_CTI\resources\Pictures\i_lock.paa";
			action = "['onVehicleLockClicked'] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};


		class CTI_Menu_Control_UnitsList : RscListNBox {
			idc = 111007;

			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.419)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.391";

			rowHeight = "3.0 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			// rowHeight = "1.35 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			// columns[] = {0.001, 0.26};
			columns[] = {0.001, 0.35};

			onLBSelChanged = "['onUnitsLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
			onLBDblClick = "['onPurchase', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};

		class CTI_Menu_ComboTeam : RscCombo {
			idc = 110008;

			x = "SafeZoneX + (SafeZoneW * 0.6075)";
			y = "SafeZoneY + (SafezoneH * 0.257)";
			w = "SafeZoneW * 0.195";
			h = "SafeZoneH * 0.035";

			sizeEx = "0.8 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			onLBSelChanged = "['onGroupLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Menu_ComboFactory : CTI_Menu_ComboTeam {
			idc = 110009;

			y = "SafeZoneY + (SafezoneH * 0.3)";
			onLBSelChanged = "['onFactoryLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};

		class CTI_Menu_Control_Purchase : RscButton {
			idc = 100011;

			// x = "SafeZoneX + (SafeZoneW * 0.535)";
			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafeZoneH * 0.825)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.04";

			text = "Purchase";
			action = "['onPurchase', lnbCurSelRow 111007] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Menu_Control_CancelQueu : CTI_Menu_Control_Purchase {
			idc = 100012;

			x = "SafeZoneX + (SafeZoneW * 0.535)";
			y = "SafeZoneY + (SafeZoneH * 0.77)";

			text = "Cancel Queue";
			action = "['onQueueCancel', lbCurSel 110013] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Menu_Control_IndependentSalvager : CTI_Menu_Control_CancelQueu {
			idc = 100016;

			y = "SafeZoneY + (SafeZoneH * 3.825)";

			text = "Buy Independent Salvager";
			action = "['onIndependentSalvagerPressed'] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Menu_Control_QueueList : RscListBox {
			idc = 110013;

			x = "SafeZoneX + (SafeZoneW * 0.535)";
			y = "SafeZoneY + (SafezoneH * 0.612)";
			h = "SafeZoneH * 0.143";
			w = "SafeZoneW * 0.275";

			rowHeight = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};

			//onLBSelChanged = "['onUnitsLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
			onLBDblClick = "['onQueueCancel', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'";
		};
		class CTI_Menu_Control_Cost : RscStructuredText {
			idc = 110014;
			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.373)";
			w = "SafeZoneW * 0.1375";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_Resources : CTI_Menu_Control_Cost {
			idc = 110015;
			x = "SafeZoneX + (SafeZoneW * 0.3625)";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Control_Exit : RscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.77)";
			y = "SafeZoneY + (SafezoneH * 0.18)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
	};
};

class CTI_RscGearMenu {
	movingEnable = 0;
	idd = 70000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_gear', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_GearMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_gear', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH";

			colorBackground[] = {0, 0, 0, 0.7};
			moving = 0;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH * 0.06";

			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Background_Footer : CTI_Background {
			x = "SafeZoneX";
			y = "SafeZoneY + (SafezoneH * 0.96)";
			w = "SafeZoneW";
			h = "SafeZoneH * 0.04";

			colorBackground[] = {0, 0, 0, 0.3};
		};
		class CTI_Menu_Title : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.007)";
			y = "SafeZoneY + (SafezoneH * 0.01)";
			w = "SafeZoneW * 0.5";
			h = "SafeZoneH * 0.037";

			text = "Gear Purchase Menu :";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Background_Gear : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.4)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.6";
			h = "SafeZoneH * 0.9";

			colorBackground[] = {0.5, 0.5, 0.5, 0.15};
		};
		class CTI_Menu_Icons_Frame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			// x = "SafeZoneX + (SafeZoneW * 0.028)";
			y = "SafeZoneY + (SafezoneH * 0.07)";
			// w = "SafeZoneW * 0.344";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.08";
		};
		class CTI_Menu_Icons_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.07)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.08";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};

		class CTI_Menu_ComboTarget_Frame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.17)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.055";
		};
		class CTI_Menu_ComboTarget_Background : CTI_Menu_Icons_Background {
			y = "SafeZoneY + (SafezoneH * 0.17)";
			h = "SafeZoneH * 0.055";
		};
		class CTI_Menu_ComboTarget_Label : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.02)";
			y = "SafeZoneY + (SafezoneH * 0.18)";
			w = "SafeZoneW * 0.1";
			h = "SafeZoneH * 0.035";

			text = "Target :";

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_ShopList_Frame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.245)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.48";
		};
		class CTI_Menu_LinkedList_Frame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.745)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.2";
		};
		class CTI_Menu_ShopList_Background : CTI_Menu_ComboTarget_Background {
			y = "SafeZoneY + (SafezoneH * 0.245)";
			h = "SafeZoneH * 0.48";
		};
		class CTI_Menu_MagsList_Background : CTI_Menu_ComboTarget_Background {
			y = "SafeZoneY + (SafezoneH * 0.745)";
			h = "SafeZoneH * 0.2";
		};
	};

	class controls {
		//--- Interactive background controls
		class CTI_Gear_Container_Uniform : RscText {
			idc = 77001;

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.07)";
			w = "SafeZoneW * 0.09";
			h = "SafeZoneH * 0.112";

			colorBackground[] = {1, 1, 1, 0.15};
		};
		class CTI_Gear_Container_Vest : CTI_Gear_Container_Uniform {
			idc = 77002;

			x = "SafeZoneX + (SafeZoneW * 0.505)";
		};
		class CTI_Gear_Container_Backpack : CTI_Gear_Container_Uniform {
			idc = 77003;

			x = "SafeZoneX + (SafeZoneW * 0.60)";
		};
		class CTI_Gear_Container_Helm : CTI_Gear_Container_Uniform {
			idc = 77004;

			x = "SafeZoneX + (SafeZoneW * 0.70)";
			w = "SafeZoneW * 0.07";
			h = "SafeZoneH * 0.09";
		};
		class CTI_Gear_Container_Glasses : CTI_Gear_Container_Helm {
			idc = 77005;

			x = "SafeZoneX + (SafeZoneW * 0.774)";
		};
		class CTI_Gear_Container_NVGoggles : CTI_Gear_Container_Helm {
			idc = 77006;

			x = "SafeZoneX + (SafeZoneW * 0.847)";
		};
		class CTI_Gear_Container_Binoculars : CTI_Gear_Container_Helm {
			idc = 77007;

			x = "SafeZoneX + (SafeZoneW * 0.921)";
		};
		class CTI_Gear_Container_Map : CTI_Gear_Container_Uniform {
			idc = 77008;

			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.17)";
			w = "SafeZoneW * 0.056";
			h = "SafeZoneH * 0.07";
		};
		class CTI_Gear_Container_GPS : CTI_Gear_Container_Map {
			idc = 77009;

			x = "SafeZoneX + (SafeZoneW * 0.759)";
		};
		class CTI_Gear_Container_Radio : CTI_Gear_Container_Map {
			idc = 77010;

			x = "SafeZoneX + (SafeZoneW * 0.818)";
		};
		class CTI_Gear_Container_Compass : CTI_Gear_Container_Map {
			idc = 77011;

			x = "SafeZoneX + (SafeZoneW * 0.877)";
		};
		class CTI_Gear_Container_Clock : CTI_Gear_Container_Map {
			idc = 77012;

			x = "SafeZoneX + (SafeZoneW * 0.936)";
		};

		class CTI_Gear_Container_Primary : CTI_Gear_Container_Uniform {
			idc = 77013;

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.54)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.112";
		};
		class CTI_Gear_Container_Primary_Muzzle : CTI_Gear_Container_Map {
			idc = 77014;

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.657)";
			w = "SafeZoneW * 0.06775";
		};
		class CTI_Gear_Container_Primary_Flashlight : CTI_Gear_Container_Primary_Muzzle {
			idc = 77015;

			x = "SafeZoneX + (SafeZoneW * 0.48075)";
		};
		class CTI_Gear_Container_Primary_Optics : CTI_Gear_Container_Primary_Muzzle {
			idc = 77016;

			x = "SafeZoneX + (SafeZoneW * 0.5515)";
		};
		class CTI_Gear_Container_Primary_CurrentMagazine : CTI_Gear_Container_Primary_Muzzle {
			idc = 77901;

			x = "SafeZoneX + (SafeZoneW * 0.62225)";
		};

		class CTI_Gear_Container_Secondary : CTI_Gear_Container_Primary {
			idc = 77017;

			x = "SafeZoneX + (SafeZoneW * 0.71)";
		};
		class CTI_Gear_Container_Secondary_Muzzle : CTI_Gear_Container_Map {
			idc = 77018;

			x = "SafeZoneX + (SafeZoneW * 0.71)";
			y = "SafeZoneY + (SafezoneH * 0.657)";
			w = "SafeZoneW * 0.06775";
		};
		class CTI_Gear_Container_Secondary_Flashlight : CTI_Gear_Container_Secondary_Muzzle {
			idc = 77019;

			x = "SafeZoneX + (SafeZoneW * 0.78075)";
		};
		class CTI_Gear_Container_Secondary_Optics : CTI_Gear_Container_Secondary_Muzzle {
			idc = 77020;

			x = "SafeZoneX + (SafeZoneW * 0.8515)";
		};
		class CTI_Gear_Container_Secondary_CurrentMagazine : CTI_Gear_Container_Secondary_Muzzle {
			idc = 77902;

			x = "SafeZoneX + (SafeZoneW * 0.92225)";
		};

		class CTI_Gear_Container_Pistol : CTI_Gear_Container_Primary {
			idc = 77021;

			y = "SafeZoneY + (SafeZoneH * 0.756)";
		};
		class CTI_Gear_Container_Pistol_Muzzle : CTI_Gear_Container_Map {
			idc = 77022;

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.873)";
			w = "SafeZoneW * 0.06775";
		};
		class CTI_Gear_Container_Pistol_Flashlight : CTI_Gear_Container_Pistol_Muzzle {
			idc = 77023;

			x = "SafeZoneX + (SafeZoneW * 0.48075)";
		};
		class CTI_Gear_Container_Pistol_Optics : CTI_Gear_Container_Pistol_Muzzle {
			idc = 77024;

			x = "SafeZoneX + (SafeZoneW * 0.5515)";
		};
		class CTI_Gear_Container_Pistol_CurrentMagazine : CTI_Gear_Container_Pistol_Muzzle {
			idc = 77903;

			x = "SafeZoneX + (SafeZoneW * 0.62225)";
		};


		class CTI_Gear_Container_Items_Unit : CTI_Gear_Container_Pistol_Muzzle {
			idc = 77109;

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.25)";
			w = "SafeZoneW * 0.58";
			h = "SafeZoneH * 0.28";
		};

		//--- Actual controls
		class CTI_Gear_Control_Items_Purchase : RscListNBox {
			idc = 70108;

			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.245)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.48";

			rowHeight = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.26, 0.001};

			canDrag = 1;

			onLBDblClick = "['onShoppingListLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrag = "['onShoppingListLBDrag', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBSelChanged = "['onShoppingListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Linked_Items : CTI_Gear_Control_Items_Purchase {
			idc = 70601;

			y = "SafeZoneY + (SafezoneH * 0.745)";
			h = "SafeZoneH * 0.2";

			onLBDblClick = "['onLinkedListLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrag = "['onShoppingListLBDrag', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBSelChanged = "";
		};

		class CTI_Gear_Control_Items_Unit : RscListNBox {
			idc = 70109;

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.25)";
			w = "SafeZoneW * 0.58";
			h = "SafeZoneH * 0.28";

			rowHeight = "1.65 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			itemSpacing = 0.001;
			columns[] = {0.01, 0.2};

			onLBDblClick = "['onUnitItemsLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'ListItems', 77109, ((_this select 4) select 0) select 2, -1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};

		class CTI_Gear_Control_Uniform: RscActiveText {
			idc = 70001;

			style = ST_KEEP_ASPECT_RATIO;
			soundDoubleClick[] = {"",0.1,1};

			colorBackground[] = {0.6, 0.83, 0.47, 1};
			colorBackgroundSelected[] = {0.6, 0.83, 0.47, 1};
			colorFocused[] = {0, 0, 0, 0};
			color[] = {0.85, 0.85, 0.85, 1};
			colorText[] = {0.85, 0.85, 0.85, 1};
			colorActive[] = {1, 1, 1, 1};

			canDrag = 1;

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.07)";
			w = "SafeZoneW * 0.09";
			h = "SafeZoneH * 0.112";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa";
			action = "['onItemContainerClicked', 0, 77001] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onMouseButtonDown = "['onItemContainerMouseClicked', 0, 70001, _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onMouseButtonDblClick = "['onItemContainerMouseDblClicked', 0] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Container', 77001, ((_this select 4) select 0) select 2, 0] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Vest: CTI_Gear_Control_Uniform {
			idc = 70002;

			x = "SafeZoneX + (SafeZoneW * 0.505)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa";
			action = "['onItemContainerClicked', 1, 77002] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onMouseButtonDown = "['onItemContainerMouseClicked', 1, 70002, _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onMouseButtonDblClick = "['onItemContainerMouseDblClicked', 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Container', 77002, ((_this select 4) select 0) select 2, 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Backpack: CTI_Gear_Control_Uniform {
			idc = 70003;

			x = "SafeZoneX + (SafeZoneW * 0.60)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa";
			action = "['onItemContainerClicked', 2, 77003] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onMouseButtonDown = "['onItemContainerMouseClicked', 2, 70003, _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onMouseButtonDblClick = "['onItemContainerMouseDblClicked', 2] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Container', 77003, ((_this select 4) select 0) select 2, 2] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Helm: CTI_Gear_Control_Uniform {
			idc = 70004;

			x = "SafeZoneX + (SafeZoneW * 0.70)";
			w = "SafeZoneW * 0.07";
			h = "SafeZoneH * 0.09";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa";
			action = "['onAccessoryClicked', 0, 70004, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'HeadAsset', 77004, ((_this select 4) select 0) select 2, [2,0]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onMouseButtonDown = "";
			onMouseButtonDblClick = "";
		};
		class CTI_Gear_Control_Glasses: CTI_Gear_Control_Helm {
			idc = 70005;

			x = "SafeZoneX + (SafeZoneW * 0.774)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa";
			action = "['onAccessoryClicked', 1, 70005, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'HeadAsset', 77005, ((_this select 4) select 0) select 2, [2,1]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_NVGoggles: CTI_Gear_Control_Helm {
			idc = 70006;

			x = "SafeZoneX + (SafeZoneW * 0.847)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_nvg_gs.paa";
			action = "['onItemClicked', [0,0], 70006, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_nvg_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77006, ((_this select 4) select 0) select 2, [3,0,0]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Binoculars: CTI_Gear_Control_Helm {
			idc = 70007;

			x = "SafeZoneX + (SafeZoneW * 0.921)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa";
			action = "['onItemClicked', [0,1], 70007, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa', [3,1]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77007, ((_this select 4) select 0) select 2, [3,0,1]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Map: CTI_Gear_Control_Uniform {
			idc = 70008;

			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.17)";
			w = "SafeZoneW * 0.056";
			h = "SafeZoneH * 0.07";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_map_gs.paa";
			action = "['onItemClicked', [1,0], 70008, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_map_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77008, ((_this select 4) select 0) select 2, [3,1,0]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onMouseButtonDown = "";
			onMouseButtonDblClick = "";
		};
		class CTI_Gear_Control_GPS: CTI_Gear_Control_Map {
			idc = 70009;

			x = "SafeZoneX + (SafeZoneW * 0.759)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_gps_gs.paa";
			action = "['onItemClicked', [1,1], 70009, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_gps_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77009, ((_this select 4) select 0) select 2, [3,1,1]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Radio: CTI_Gear_Control_Map {
			idc = 70010;

			x = "SafeZoneX + (SafeZoneW * 0.818)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_radio_gs.paa";
			action = "['onItemClicked', [1,2], 70010, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_radio_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77010, ((_this select 4) select 0) select 2, [3,1,2]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Compass: CTI_Gear_Control_Map {
			idc = 70011;

			x = "SafeZoneX + (SafeZoneW * 0.877)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_compass_gs.paa";
			action = "['onItemClicked', [1,3], 70011, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_compass_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77011, ((_this select 4) select 0) select 2, [3,1,3]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Clock: CTI_Gear_Control_Map {
			idc = 70012;

			x = "SafeZoneX + (SafeZoneW * 0.936)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_watch_gs.paa";
			action = "['onItemClicked', [1,4], 70012, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_watch_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77012, ((_this select 4) select 0) select 2, [3,1,4]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};

		class CTI_Gear_Control_Primary: CTI_Gear_Control_Uniform {
			idc = 70013;

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.54)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.112";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa";
			action = "['onWeaponClicked', 0] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Weapon', 77013, ((_this select 4) select 0) select 2, 0] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onMouseButtonDown = "";
			onMouseButtonDblClick = "";
		};
		class CTI_Gear_Control_Primary_Muzzle: CTI_Gear_Control_Map {
			idc = 70014;

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.657)";
			w = "SafeZoneW * 0.06775";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			action = "['onWeaponAccessoryClicked', 0, 0, 70014, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77014, ((_this select 4) select 0) select 2, [0,0,1,0]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Primary_Side: CTI_Gear_Control_Primary_Muzzle {
			idc = 70015;

			x = "SafeZoneX + (SafeZoneW * 0.48075)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa";
			action = "['onWeaponAccessoryClicked', 0, 1, 70015, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77015, ((_this select 4) select 0) select 2, [0,0,1,1]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Primary_Optics: CTI_Gear_Control_Primary_Muzzle {
			idc = 70016;

			x = "SafeZoneX + (SafeZoneW * 0.5515)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
			action = "['onWeaponAccessoryClicked', 0, 2, 70016, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77016, ((_this select 4) select 0) select 2, [0,0,1,2]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Primary_CurrentMagazine: CTI_Gear_Control_Primary_Muzzle {
			idc = 70901;

			x = "SafeZoneX + (SafeZoneW * 0.62225)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
			action = "['onWeaponCurrentMagazineClicked', 0, 70901] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'CurrentMagazine', 77901, ((_this select 4) select 0) select 2, 0] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};

		class CTI_Gear_Control_Secondary: CTI_Gear_Control_Primary {
			idc = 70017;

			x = "SafeZoneX + (SafeZoneW * 0.71)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa";
			action = "['onWeaponClicked', 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Weapon', 77017, ((_this select 4) select 0) select 2, 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Secondary_Muzzle: CTI_Gear_Control_Map {
			idc = 70018;

			x = "SafeZoneX + (SafeZoneW * 0.71)";
			y = "SafeZoneY + (SafezoneH * 0.657)";
			w = "SafeZoneW * 0.06775";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			action = "['onWeaponAccessoryClicked', 1, 0, 70018, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77018, ((_this select 4) select 0) select 2, [0,1,1,0]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Secondary_Side: CTI_Gear_Control_Secondary_Muzzle {
			idc = 70019;

			x = "SafeZoneX + (SafeZoneW * 0.78075)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa";
			action = "['onWeaponAccessoryClicked', 1, 1, 70019, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77019, ((_this select 4) select 0) select 2, [0,1,1,1]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Secondary_Optics: CTI_Gear_Control_Secondary_Muzzle {
			idc = 70020;

			x = "SafeZoneX + (SafeZoneW * 0.8515)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
			action = "['onWeaponAccessoryClicked', 1, 2, 70020, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77020, ((_this select 4) select 0) select 2, [0,1,1,2]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Secondary_CurrentMagazine: CTI_Gear_Control_Secondary_Muzzle {
			idc = 70902;

			x = "SafeZoneX + (SafeZoneW * 0.92225)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
			action = "['onWeaponCurrentMagazineClicked', 1, 70902] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'CurrentMagazine', 77902, ((_this select 4) select 0) select 2, 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};

		class CTI_Gear_Control_Pistol: CTI_Gear_Control_Primary {
			idc = 70021;

			y = "SafeZoneY + (SafeZoneH * 0.756)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa";
			action = "['onWeaponClicked', 2] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Weapon', 77021, ((_this select 4) select 0) select 2, 2] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Pistol_Muzzle: CTI_Gear_Control_Map {
			idc = 70022;

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.873)";
			w = "SafeZoneW * 0.06775";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			action = "['onWeaponAccessoryClicked', 2, 0, 70022, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77022, ((_this select 4) select 0) select 2, [0,2,1,0]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Pistol_Side: CTI_Gear_Control_Pistol_Muzzle {
			idc = 70023;

			x = "SafeZoneX + (SafeZoneW * 0.48075)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa";
			action = "['onWeaponAccessoryClicked', 2, 1, 70023, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77023, ((_this select 4) select 0) select 2, [0,2,1,1]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Pistol_Optics: CTI_Gear_Control_Pistol_Muzzle {
			idc = 70024;

			x = "SafeZoneX + (SafeZoneW * 0.5515)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
			action = "['onWeaponAccessoryClicked', 2, 2, 70024, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77024, ((_this select 4) select 0) select 2, [0,2,1,2]] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Pistol_CurrentMagazine: CTI_Gear_Control_Pistol_Muzzle {
			idc = 70903;

			x = "SafeZoneX + (SafeZoneW * 0.62225)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
			action = "['onWeaponCurrentMagazineClicked', 2, 70903] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'CurrentMagazine', 77903, ((_this select 4) select 0) select 2, 2] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Combo_Target : RscCombo {
			idc = 70201;

			x = "SafeZoneX + (SafeZoneW * 0.15)";
			y = "SafeZoneY + (SafezoneH * 0.18)";
			w = "SafeZoneW * 0.235";
			h = "SafeZoneH * 0.037";

			onLBSelChanged = "['onUnitLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};

		class CTI_Gear_Uniform_Progress_Load : RscProgress {
			idc = 70301;

			style = 0;
			texture = "";
			textureExt = "";
			colorBar[] = {0.9,0.9,0.9,0.9};
			colorExtBar[] = {1,1,1,1};
			colorFrame[] = {1,1,1,1};

			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.183)";
			w = "SafeZoneW * 0.09";
			h = "SafeZoneH * 0.016";
		};
		class CTI_Gear_Vest_Progress_Load : CTI_Gear_Uniform_Progress_Load {
			idc = 70302;

			x = "SafeZoneX + (SafeZoneW * 0.505)";
		};
		class CTI_Gear_Backpack_Progress_Load : CTI_Gear_Uniform_Progress_Load {
			idc = 70303;

			x = "SafeZoneX + (SafeZoneW * 0.60)";
		};

		class CTI_Icon_Primary : RscActiveText {
			idc = 70501;
			style = ST_KEEP_ASPECT_RATIO;
			x = "SafeZoneX + (SafeZoneW * 0.028)";
			y = "SafeZoneY + (SafezoneH * 0.07)";
			w = "SafeZoneW * 0.043";
			h = "SafeZoneH * 0.08";

			color[] = {0.75,0.75,0.75,0.7};
			colorActive[] = {1,1,1,0.7};
			colorBackground[] = {0.6, 0.8392, 0.4706, 0.7};
			colorBackgroundSelected[] = {0.6, 0.8392, 0.4706, 0.7};
			colorFocused[] = {0.0, 0.0, 0.0, 0};

			text = "MOB_CTI\resources\Pictures\icon_wf_gear_primary.paa";
			action = "['onShoppingTabClicked', CTI_GEAR_TAB_PRIMARY] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Icon_Secondary : CTI_Icon_Primary {
			idc = 70502;
			x = "SafeZoneX + (SafeZoneW * 0.071)";

			text = "MOB_CTI\resources\Pictures\icon_wf_gear_secondary.paa";
			action = "['onShoppingTabClicked', CTI_GEAR_TAB_SECONDARY] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Icon_Handgun : CTI_Icon_Primary {
			idc = 70503;
			x = "SafeZoneX + (SafeZoneW * 0.114)";

			text = "MOB_CTI\resources\Pictures\icon_wf_gear_handgun.paa";
			action = "['onShoppingTabClicked', CTI_GEAR_TAB_HANDGUN] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Icon_Accessories : CTI_Icon_Primary {
			idc = 70504;
			x = "SafeZoneX + (SafeZoneW * 0.157)";

			text = "MOB_CTI\resources\Pictures\icon_wf_gear_accessories.paa";
			action = "['onShoppingTabClicked', CTI_GEAR_TAB_ACCESSORIES] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Icon_Ammunitions : CTI_Icon_Primary {
			idc = 70505;
			x = "SafeZoneX + (SafeZoneW * 0.2)";

			text = "MOB_CTI\resources\Pictures\icon_wf_gear_ammunition.paa";
			action = "['onShoppingTabClicked', CTI_GEAR_TAB_AMMO] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Icon_Misc : CTI_Icon_Primary {
			idc = 70506;
			x = "SafeZoneX + (SafeZoneW * 0.243)";

			text = "MOB_CTI\resources\Pictures\icon_wf_gear_miscellaneous.paa";
			action = "['onShoppingTabClicked', CTI_GEAR_TAB_MISC] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Icon_Equipment : CTI_Icon_Primary {
			idc = 70507;
			x = "SafeZoneX + (SafeZoneW * 0.286)";

			text = "MOB_CTI\resources\Pictures\icon_wf_gear_equipment.paa";
			action = "['onShoppingTabClicked', CTI_GEAR_TAB_EQUIPMENT] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Icon_Template : CTI_Icon_Primary {
			idc = 70508;
			x = "SafeZoneX + (SafeZoneW * 0.329)";

			text = "MOB_CTI\resources\Pictures\icon_wf_building_barracks.paa";
			action = "['onShoppingTabClicked', CTI_GEAR_TAB_TEMPLATES] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};

		class CTI_Gear_Control_CreateTemplate : RscButton {
			idc = 70401;

			x = "SafeZoneX + (SafeZoneW * 0.71)";
			y = "SafeZoneY + (SafezoneH * 0.756)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.04";

			text = "Create Template";
			tooltip = "Create a template of the current gear setup";
			action = "['onTemplateCreation'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_DeleteTemplate : CTI_Gear_Control_CreateTemplate {
			idc = 70402;

			y = "SafeZoneY + (SafezoneH * 0.806)";

			text = "Delete Template";
			tooltip = "Remove an existing template";
			action = "['onTemplateDeletion', lnbCurSelRow 70108] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Buy : CTI_Gear_Control_CreateTemplate {
			idc = 70403;

			y = "SafeZoneY + (SafezoneH * 0.903)";

			text = "Buy";
			tooltip = "Purchase the current gear setup";
			action = "['onPurchase'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Menu_Control_Info : RscStructuredText {
			idc = 70025;
			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.06";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Gear_Control_Clear : RscButton_Lesser {
			idc = 70028;
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.96)";
			w = "SafeZoneW * 0.185";
			h = "SafeZoneH * 0.04";

			text = "Clear";
			tooltip = "Clear the gear of the existing target";
			action = "['onInventoryClear'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Gear_Control_Reload : CTI_Gear_Control_Clear {
			idc = 70027;
			x = "SafeZoneX + (SafeZoneW * 0.205)";

			text = "Reload";
			tooltip = "Reload the last purchased gear for this target";
			action = "['onInventoryReload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
		};
		class CTI_Control_Exit : RscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.95)";
			y = "SafeZoneY + (SafezoneH * 0.01)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
	};
};

class CTI_RscRespawnMenu {
	movingEnable = 0;
	idd = 120000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_respawnmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_RespawnMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_respawnmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_RespawnMenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.15)";
			y = "SafeZoneY + (SafezoneH * 0.15)";
			w = "SafeZoneW * 0.7";
			h = "SafeZoneH * 0.7";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.15)";
			y = "SafeZoneY + (SafezoneH * 0.15)";
			w = "SafeZoneW * 0.7";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : RscText {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.17)";
			y = "SafeZoneY + (SafezoneH * 0.155)";
			w = "SafeZoneW * 0.68";
			h = "SafeZoneH * 0.037";

			text = "Respawn Menu";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_MapFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.16)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.40";
			h = "SafeZoneH * 0.58";
		};
		class CTI_Menu_InfoFrame : CTI_Menu_MapFrame {
			y = "SafeZoneY + (SafezoneH * 0.8)";
			w = "SafeZoneW * 0.40";
			h = "SafeZoneH * 0.04";
		};
		class CTI_Menu_ListLabelFrame : CTI_Menu_MapFrame {
			x = "SafeZoneX + (SafeZoneW * 0.57)";
			w = "SafeZoneW * 0.27";
			h = "SafeZoneH * 0.04";
		};
		class CTI_Menu_ListFrame : CTI_Menu_ListLabelFrame {
			y = "SafeZoneY + (SafezoneH * 0.26)";
			h = "SafeZoneH * 0.58";
		};
		class CTI_Menu_ListInfo_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.57)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.27";
			h = "SafeZoneH * 0.04";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_ListInfo_Text : RscText {
			style = ST_CENTER;

			x = "SafeZoneX + (SafeZoneW * 0.57)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.27";
			h = "SafeZoneH * 0.04";

			text = "Available locations";
			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
	};

	class controls {
		class CTI_Menu_Map : RscMapControl {
			idc = 120001;

			x = "SafeZoneX + (SafeZoneW * 0.16)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.40";
			h = "SafeZoneH * 0.58";

			showCountourInterval = 1;

			onMouseMoving = "mouseX = (_this select 1);mouseY = (_this select 2)";
			onMouseButtonDown = "mouseButtonDown = _this select 1;";
			onMouseButtonUp = "mouseButtonUp = _this select 1;";
		};
		class CTI_Menu_Control_LocationList : RscListBox {
			idc = 120002;

			x = "SafeZoneX + (SafeZoneW * 0.57)";
			w = "SafeZoneW * 0.27";
			y = "SafeZoneY + (SafezoneH * 0.26)";
			h = "SafeZoneH * 0.58";

			rowHeight = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};

			onLBSelChanged = "['onSpawnLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_RespawnMenu.sqf'";
			// onLBDblClick = "['onBuildStructureLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};
		class CTI_Menu_Respawn_Info : RscStructuredText {
			idc = 120003;

			x = "SafeZoneX + (SafeZoneW * 0.16)";
			y = "SafeZoneY + (SafezoneH * 0.805)";
			w = "SafeZoneW * 0.40";
			h = "SafeZoneH * 0.035";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
	};
};

class CTI_RscOptionsMenu {
	movingEnable = 0;
	idd = 130000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_optionsmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_OptionsMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_optionsmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.3";
			h = "SafeZoneH * 0.7";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.3";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : RscText {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.037";

			text = "Options & Info";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_InfoListFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.15";
		};
		class CTI_Menu_Info_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.15";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
	};

	class controls {
		class CTI_Menu_Options_Info1 : RscStructuredText {
			idc = 130001;

			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			// text = "Victory: Destroy Enemy";
		};
		class CTI_Menu_Options_Info2 : CTI_Menu_Options_Info1 {
			idc = 130002;

			y = "SafeZoneY + (SafezoneH * 0.305)";

			// text = "Player Pool: 30%";
		};
		class CTI_Menu_Options_Info3 : CTI_Menu_Options_Info1 {
			idc = 130003;

			y = "SafeZoneY + (SafezoneH * 0.335)";

			// text = "Award Pool: 30%";
		};
		class CTI_Menu_Options_Info4 : CTI_Menu_Options_Info1 {
			idc = 130004;

			y = "SafeZoneY + (SafezoneH * 0.365)";

			// text = "Resources: $23125 (+$510/min)";
		};
		class CTI_Menu_Options_Info5 : CTI_Menu_Options_Info1 {
			idc = 130005;

			y = "SafeZoneY + (SafezoneH * 0.395)";

			// text = "Towns Held: 0/23";
		};
		class CTI_Menu_Options_OnlineHelp : RscButton {
			idc = 130006;

			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.445)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.04";

			text = "Online Help";
			action = "['onOnlineHelpPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_Video : CTI_Menu_Options_OnlineHelp {
			idc = 130007;

			y = "SafeZoneY + (SafezoneH * 0.495)";

			text = "Video Settings";
			action = "['onVideoSettingsPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_Music : CTI_Menu_Options_OnlineHelp {
			idc = 130008;

			y = "SafeZoneY + (SafezoneH * 0.545)";

			text = "Play Music: Off";
			action = "['onMusicPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_TransferFunds : CTI_Menu_Options_OnlineHelp {
			idc = 130009;

			y = "SafeZoneY + (SafezoneH * 0.595)";

			text = "Transfer Resources";
			action = "['onTransferResourcesPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_Unflip : CTI_Menu_Options_OnlineHelp {
			idc = 130010;

			y = "SafeZoneY + (SafezoneH * 0.645)";

			text = "Unflip Nearest Vehicle";
			action = "['onUnflipPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_Service : CTI_Menu_Options_OnlineHelp {
			idc = 130011;

			y = "SafeZoneY + (SafezoneH * 0.695)";

			text = "Service Menu";
			action = "['onServicePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_AIMicro : CTI_Menu_Options_OnlineHelp {
			idc = 130014;

			y = "SafeZoneY + (SafezoneH * 0.745)";

			text = "AI Management";
			action = "['onAIMicroPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_UnitsCam : CTI_Menu_Options_OnlineHelp { //--- Render out
			idc = 130012;

			y = "SafeZoneY + (SafezoneH * 3.795)";

			text = "Units Camera";
			action = "['onUnitsCamPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_SatCam : CTI_Menu_Options_OnlineHelp { //--- Render out
			idc = 130013;

			y = "SafeZoneY + (SafezoneH * 3.845)";

			text = "Satellite Camera";
			action = "['onSatCamPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Control_Exit : RscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.45)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
	};
};

class CTI_RscTransferResourcesMenu {
	movingEnable = 0;
	idd = 140000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_transferresourcesmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_transferresourcesmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.6";
			h = "SafeZoneH * 0.47";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.6";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : RscText {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.58";
			h = "SafeZoneH * 0.037";

			text = "Resources Menu";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_InfoListFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.29";
			h = "SafeZoneH * 0.38";
		};
		class CTI_Menu_InfoResourcesFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.06";
		};
		class CTI_Menu_TransferFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.35)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.1";
		};
		class CTI_Menu_IncomeFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.465)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.06";
		};
		class CTI_Menu_Info_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.06";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_CommanderFrame : CTI_Menu_InfoResourcesFrame {
			y = "SafeZoneY + (SafezoneH * 0.54)";
			h = "SafeZoneH * 0.115";
		};
		class CTI_Menu_Commander_Background : CTI_Menu_Info_Background {
			y = "SafeZoneY + (SafezoneH * 0.54)";
			h = "SafeZoneH * 0.115";
		};
		class CTI_Menu_Transfer_Background : CTI_Menu_Info_Background {
			y = "SafeZoneY + (SafezoneH * 0.35)";
			h = "SafeZoneH * 0.1";
		};
		class CTI_Menu_Income_Background : CTI_Menu_Info_Background {
			y = "SafeZoneY + (SafezoneH * 0.465)";
			h = "SafeZoneH * 0.06";
		};

		class CTI_Menu_Info_EditBackground : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.71)";
			y = "SafeZoneY + (SafezoneH * 0.36)";
			w = "SafeZoneW * 0.065";
			h = "SafeZoneH * 0.03";
			colorBackground[] = {0, 0, 0, 0.8};
		};

		class CTI_Menu_Players_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.29";
			h = "SafeZoneH * 0.38";
			colorBackground[] = {0.5, 0.5, 0.5, 0.10};
		};
		class CTI_Menu_PlayerPoolLabel : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.55)";
			w = "SafeZoneW * 0.16";
			h = "SafeZoneH * 0.035";

			text = "Player Resources %";

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_AwardPoolLabel : CTI_Menu_PlayerPoolLabel {
			y = "SafeZoneY + (SafezoneH * 0.605)";

			text = "Award Pool %";
		};
	};

	class controls {
		class CTI_Menu_Funds_GroupsList : RscListNBox {
			idc = 140001;

			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.29";
			h = "SafeZoneH * 0.38";

			rowHeight = "1.22 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			// columns[] = {0.001, 0.26};
			columns[] = {0.001, 0.3};

			onLBDblClick = "['onGivePlayerPressed', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
			onLBSelChanged = "['onGroupLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		};
		class CTI_Menu_Funds_MyResources : RscStructuredText {
			idc = 140002;

			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			// text = "Your Resources: $8000";
		};
		class CTI_Menu_Funds_TargetResources : CTI_Menu_Funds_MyResources {
			idc = 140003;

			y = "SafeZoneY + (SafezoneH * 0.305)";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			// text = "Player Resources: $8000";
		};
		class CTI_Menu_Funds_Slider : RscXSliderH {
			idc = 140008;

			x = "SafeZoneX + (SafeZoneW * 0.525)";
			y = "SafeZoneY + (SafezoneH * 0.36)";
			w = "SafeZoneW * 0.18";
			h = "SafeZoneH * 0.03";

			onSliderPosChanged = "['onFundSliderChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		};
		class CTI_Menu_Funds_Box : RscEdit {
			idc = 140009;

			x = "SafeZoneX + (SafeZoneW * 0.71)";
			y = "SafeZoneY + (SafezoneH * 0.36)";
			w = "SafeZoneW * 0.065";
			h = "SafeZoneH * 0.03";

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			text = "0";
		};
		class CTI_Menu_Funds_GivePlayer : RscButton {
			idc = 140004;

			x = "SafeZoneX + (SafeZoneW * 0.525)";
			y = "SafeZoneY + (SafezoneH * 0.4)";
			w = "SafeZoneW * 0.25";
			h = "SafeZoneH * 0.04";

			text = "Give Player";
			action = "['onGivePlayerPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		};
		class CTI_Menu_Funds_Commander : RscStructuredText {
			idc = 140010;

			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.465)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Funds_Players : CTI_Menu_Funds_Commander {
			idc = 140011;

			y = "SafeZoneY + (SafezoneH * 0.495)";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Funds_ResourcesPool : RscCombo {
			idc = 140006;

			x = "SafeZoneX + (SafeZoneW * 0.7)";
			y = "SafeZoneY + (SafezoneH * 0.55)";
			w = "SafeZoneW * 0.07";
			h = "SafeZoneH * 0.04";

			onLBSelChanged = "['onResourcesPoolLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Funds_AwardPool : CTI_Menu_Funds_ResourcesPool {
			idc = 140007;

			y = "SafeZoneY + (SafezoneH * 0.605)";

			onLBSelChanged = "['onAwardPoolLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		};
		class CTI_Control_Exit : RscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.74)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.695)";

			text = "<<";
			action = "['onGoBack'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		};
	};
};

class CTI_RscDefenseMenu {
	movingEnable = 0;
	idd = 200000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_defensemenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_DefenseMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_defensemenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_DefenseMenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.305";
			h = "SafeZoneH * 0.65";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.305";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : RscText {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.23)";
			y = "SafeZoneY + (SafezoneH * 0.180)";
			w = "SafeZoneW * 0.295";
			h = "SafeZoneH * 0.037";

			text = "Defense Construction";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_DefenseListFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.415)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.34";
		};
		class CTI_Menu_Info : CTI_Menu_DefenseListFrame {
			y = "SafeZoneY + (SafezoneH * 0.235)";
			h = "SafeZoneH * 0.06";
		};
		class CTI_Menu_Info_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.235)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.06";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
	};

	class controls {
		class CTI_Menu_Control_Undo : RscButton {
			idc = 200001;

			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafeZoneH * 0.77)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.04";

			text = "Undo Structure";
			action = "['onUndoDefense'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_DefenseMenu.sqf'";
		};
		class CTI_Menu_Control_BuildStructure : CTI_Menu_Control_Undo {
			idc = 200002;

			y = "SafeZoneY + (SafeZoneH * 0.36)";

			text = "Build Defense";
			action = "['onBuildDefense', lnbCurSelRow 200007] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_DefenseMenu.sqf'";
		};
		class CTI_Menu_Control_AutoAlign : CTI_Menu_Control_Undo {
			idc = 200003;

			y = "SafeZoneY + (SafeZoneH * 0.3075)";

			text = "";
			action = "['onAutoAlign'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_DefenseMenu.sqf'";
		};

		class CTI_Menu_Control_BuildingList : RscListNBox {
			idc = 200007;

			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.415)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.34";

			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			// columns[] = {0.001, 0.26};
			columns[] = {0.001, 0.18};

			onLBDblClick = "['onBuildDefense', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_DefenseMenu.sqf'";
		};
		class CTI_Menu_Control_Info : RscStructuredText {
			idc = 200008;

			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.235)";
			w = "SafeZoneW * 0.275";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_InfoWorkers : CTI_Menu_Control_Info {
			idc = 200009;

			y = "SafeZoneY + (SafezoneH * 0.265)";
		};
		class CTI_Control_Exit : RscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.46)";
			y = "SafeZoneY + (SafezoneH * 0.18)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
	};
};

class CTI_RscCommandMenu {
	movingEnable = 0;
	idd = 210000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_commandmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_CommandMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_commandmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.3";
			h = "SafeZoneH * 0.42";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.3";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : RscText {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.037";

			text = "Command Menu";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
	};

	class controls {
		class CTI_Control_Resources : RscButton {
			idc = 210002;

			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.27)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.04";

			text = "Resources";
			action = "['onResourcesPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_Teams : CTI_Control_Resources {
			idc = 210003;

			y = "SafeZoneY + (SafezoneH * 3.32)"; //--- Render out

			text = "Teams";
			action = "['onTeamsPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_Map : CTI_Control_Resources {
			idc = 210004;

			y = "SafeZoneY + (SafezoneH * 3.37)"; //--- Render out

			text = "Map Commanding";
			action = "['onMapPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_Upgrades : CTI_Control_Resources {
			idc = 210005;

			y = "SafeZoneY + (SafezoneH * 3.42)"; //--- Render out

			text = "Upgrades";
			action = "['onUpgradesPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_Workers : CTI_Control_Resources {
			idc = 210006;

			y = "SafeZoneY + (SafezoneH * 3.47)"; //--- Render out

			text = "Base Management";
			action = "['onWorkersPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_RequestMenu : CTI_Control_Resources {
			idc = 210008;

			y = "SafeZoneY + (SafezoneH * 3.52)"; //--- Render out

			text = "Team Requests";
			action = "['onRequestMenuPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_ArtilleryMenu : CTI_Control_Resources {
			idc = 210009;

			y = "SafeZoneY + (SafezoneH * 3.57)"; //--- Render out

			text = "Artillery";
			action = "['onArtilleryMenuPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_Exit : RscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.45)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
	};
};

class CTI_RscServiceMenu {
	movingEnable = 0;
	idd = 230000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_servicemenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_ServiceMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_servicemenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.55";
			h = "SafeZoneH * 0.48";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.55";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : RscText {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.53";
			h = "SafeZoneH * 0.037";

			text = "Service Menu";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_ListFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.27)";
			w = "SafeZoneW * 0.53";
			h = "SafeZoneH * 0.3";
		};
		class CTI_Menu_ListHeaders_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.27)";
			w = "SafeZoneW * 0.53";
			h = "SafeZoneH * 0.04";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_Repair_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafeZoneH * 0.58)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.26";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_Rearm_Background : CTI_Menu_Repair_Background {
			y = "SafeZoneY + (SafeZoneH * 0.63)";
		};
		class CTI_Menu_Refuel_Background : CTI_Menu_Repair_Background {
			x = "SafeZoneX + (SafeZoneW * 0.48)";
			y = "SafeZoneY + (SafeZoneH * 0.58)";
		};
		class CTI_Menu_Heal_Background : CTI_Menu_Refuel_Background {
			y = "SafeZoneY + (SafeZoneH * 0.63)";
		};

		class CTI_Menu_Header_Unit : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.215)";
			y = "SafeZoneY + (SafezoneH * 0.27)";
			w = "SafeZoneW * 0.1";
			h = "SafeZoneH * 0.04";

			colorText[] = {0.678431373, 0.815686275, 1};
			text = "Unit";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class CTI_Menu_Header_Damage : CTI_Menu_Header_Unit {
			x = "SafeZoneX + (SafeZoneW * 0.48)";

			text = "Damage";
		};
		class CTI_Menu_Header_Fuel : CTI_Menu_Header_Unit {
			x = "SafeZoneX + (SafeZoneW * 0.558)";

			text = "Fuel";
		};
		class CTI_Menu_Header_Health : CTI_Menu_Header_Unit {
			x = "SafeZoneX + (SafeZoneW * 0.638)";

			text = "Health";
		};
	};

	class controls {
		class CTI_Menu_Control_Repair : RscButton {
			idc = 230001;

			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafeZoneH * 0.58)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.16";

			text = "Repair";
			action = "['onRepairPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";
		};
		class CTI_Menu_Control_Rearm : CTI_Menu_Control_Repair {
			idc = 230002;

			y = "SafeZoneY + (SafeZoneH * 0.63)";

			text = "Rearm";
			action = "['onRearmPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";
		};
		class CTI_Menu_Control_Refuel : CTI_Menu_Control_Repair {
			idc = 230003;

			x = "SafeZoneX + (SafeZoneW * 0.48)";
			y = "SafeZoneY + (SafeZoneH * 0.58)";

			text = "Refuel";
			action = "['onRefuelPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";
		};
		class CTI_Menu_Control_Heal : CTI_Menu_Control_Refuel {
			idc = 230004;

			y = "SafeZoneY + (SafeZoneH * 0.63)";

			text = "Heal";
			action = "['onHealPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";
		};

		class CTI_Menu_RepairCost : RscStructuredText {
			idc = 230011;

			x = "SafeZoneX + (SafeZoneW * 0.37)";
			y = "SafeZoneY + (SafeZoneH * 0.585)";
			h = "SafeZoneH * 0.03";
			w = "SafeZoneW * 0.1";

			text = "";

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Rearm : CTI_Menu_RepairCost {
			idc = 230012;

			y = "SafeZoneY + (SafeZoneH * 0.635)";

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Refuel : CTI_Menu_RepairCost {
			idc = 230013;

			x = "SafeZoneX + (SafeZoneW * 0.64)";

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Heal : CTI_Menu_RepairCost {
			idc = 230014;

			y = "SafeZoneY + (SafeZoneH * 0.635)";
			x = "SafeZoneX + (SafeZoneW * 0.64)";

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_Control_EntityList : RscListNBox {
			idc = 230005;

			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.31)";
			w = "SafeZoneW * 0.53";
			h = "SafeZoneH * 0.26";

			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001, 0.50, 0.65, 0.80};

			onLBSelChanged = "['onEntityListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";
			// onLBDblClick = "['onBuildStructure', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};

		class CTI_Control_Exit : RscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.7)";
			y = "SafeZoneY + (SafeZoneH * 0.21)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.655)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_RscOptionsMenu';";
		};
	};
};

class CTI_RscUpgradeMenu {
	movingEnable = 0;
	idd = 250000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_upgrademenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_UpgradeMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_upgrademenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UpgradeMenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.615";
			h = "SafeZoneH * 0.705";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.615";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : RscText {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.23)";
			y = "SafeZoneY + (SafezoneH * 0.180)";
			w = "SafeZoneW * 0.595";
			h = "SafeZoneH * 0.037";

			text = "Upgrade Menu";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_UpgradeListFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.24)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.625";
		};
		class CTI_Menu_UpgradeInfoFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.5225)";
			y = "SafeZoneY + (SafezoneH * 0.24)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.525";
		};
		class CTI_Menu_UpgradeRunningFrame : CTI_Menu_UpgradeInfoFrame {
			y = "SafeZoneY + (SafezoneH * 0.78)";
			h = "SafeZoneH * 0.03";
		};
		class CTI_Menu_UpgradeInfo_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.5225)";
			y = "SafeZoneY + (SafezoneH * 0.24)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.525";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_UpgradeRunning_Background : CTI_Menu_UpgradeInfo_Background {
			y = "SafeZoneY + (SafezoneH * 0.78)";
			h = "SafeZoneH * 0.03";
		};
	};

	class controls {
		class CTI_Control_Upgrade : RscButton {
			idc = 250001;

			x = "SafeZoneX + (SafeZoneW * 0.5225)";
			y = "SafeZoneY + (SafezoneH * 0.825)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.04";

			text = "Upgrade";
			action = "['onUpgradePressed', lnbCurSelRow 250002] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UpgradeMenu.sqf'";
		};
		class CTI_Menu_Control_UpgradeList : RscListNBox {
			idc = 250002;

			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.24)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.625";

			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			// columns[] = {0.001, 0.26};
			columns[] = {0.001, 0.18};

			onLBDblClick = "['onUpgradePressed', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UpgradeMenu.sqf'";
			onLBSelChanged = "['onUpgradeListSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UpgradeMenu.sqf'";
		};
		class CTI_Menu_Upgrade_Label : RscText {
			idc = 250003;

			x = "SafeZoneX + (SafeZoneW * 0.5375)";
			y = "SafeZoneY + (SafezoneH * 0.24)";
			w = "SafeZoneW * 0.2775";
			h = "SafeZoneH * 0.05";

			colorText[] = {0.258823529, 0.713725490, 1, 1};
			size = "1.2 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Upgrade_Info : RscStructuredText {
			idc = 250004;

			x = "SafeZoneX + (SafeZoneW * 0.5275)";
			y = "SafeZoneY + (SafezoneH * 0.29)";
			w = "SafeZoneW * 0.2825";
			h = "SafeZoneH * 0.10";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Upgrade_DepLabel : CTI_Menu_Upgrade_Label {
			idc = 250005;

			y = "SafeZoneY + (SafezoneH * 0.39)";
		};
		class CTI_Menu_Upgrade_DepInfo : CTI_Menu_Upgrade_Info {
			idc = 250006;

			y = "SafeZoneY + (SafezoneH * 0.44)";
			h = "SafeZoneH * 0.10";
		};
		class CTI_Menu_Upgrade_DescLabel : CTI_Menu_Upgrade_Label {
			idc = 250007;

			y = "SafeZoneY + (SafezoneH * 0.54)";
		};
		class CTI_Menu_Upgrade_DescInfo : CTI_Menu_Upgrade_Info {
			idc = 250008;

			y = "SafeZoneY + (SafezoneH * 0.59)";
			h = "SafeZoneH * 0.175";
		};
		class CTI_Menu_Upgrade_RunInfo : RscStructuredText {
			idc = 250009;

			x = "SafeZoneX + (SafeZoneW * 0.5225)";
			y = "SafeZoneY + (SafezoneH * 0.78)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.03";

			size = "0.85 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Control_Exit : RscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.775)";
			y = "SafeZoneY + (SafezoneH * 0.18)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.73)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_RscCommandMenu';";
		};
	};
};

class CTI_RscWorkersMenu {
	movingEnable = 0;
	idd = 260000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_workersmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_WorkersMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_workersmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_WorkersMenu.sqf'";

	class controlsBackground {
		class CTI_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.6";
			h = "SafeZoneH * 0.47";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.6";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : RscText {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.58";
			h = "SafeZoneH * 0.037";

			text = "Base Management";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_InfoListFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.38";
		};
		class CTI_Menu_InfoResourcesFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.1825";
		};
		class CTI_Menu_Info_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.1825";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_CommanderFrame : CTI_Menu_InfoResourcesFrame {
			y = "SafeZoneY + (SafezoneH * 0.4725)";
			h = "SafeZoneH * 0.1825";
		};
		class CTI_Menu_Commander_Background : CTI_Menu_Info_Background {
			y = "SafeZoneY + (SafezoneH * 0.4725)";
			h = "SafeZoneH * 0.1825";
		};

	};

	class controls {
		class CTI_Menu_Map : RscMapControl {
			idc = 260001;

			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.38";

			showCountourInterval = 0;
			onMouseButtonDown = "['onMapButtonDown', _this] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_WorkersMenu.sqf'";
		};
		class CTI_Menu_Control_WorkersList : RscListNBox {
			idc = 260002;

			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.1825";

			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001, 0.35};

			onLBSelChanged = "['onWorkersListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_WorkersMenu.sqf'";
			// onLBDblClick = "['onBuildStructure', _this select 1] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_buildmenu.sqf'";
		};
		class CTI_Menu_Control_Disband : RscButton {
			idc = 260003;

			x = "SafeZoneX + (SafeZoneW * 0.53)";
			y = "SafeZoneY + (SafezoneH * 0.4825)";
			w = "SafeZoneW * 0.24";
			h = "SafeZoneH * 0.04";

			text = "Disband Worker";
			action = "['onWorkerDisbandPressed', lnbCurSelRow 260002] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_WorkersMenu.sqf'";
		};
		class CTI_Menu_Control_Sell : CTI_Menu_Control_Disband {
			idc = 260004;

			y = "SafeZoneY + (SafezoneH * 0.5325)";

			text = "Sell Structure";
			action = "['onStructureSellPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_WorkersMenu.sqf'";
		};
		class CTI_Control_Exit : RscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.74)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.695)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_RscCommandMenu';";
		};
	};
};
