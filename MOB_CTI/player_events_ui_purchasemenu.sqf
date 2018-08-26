private ["_action"];
_action = _this select 0;

switch (_action) do {
	case "onLoad": {
		_faction = player getVariable "CTI_PLAYER_FACTION";
		_mhq = player getVariable "CTI_PLAYER_MHQ";	
		_factories = _mhq getVariable "CTI_FACTORIES";
<<<<<<< HEAD
		_commander = player getVariable "CTI_COMMANDER";
=======
		_commander = missionNamespace getVariable format ["CTI_%1_COMMANDER",_faction];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

		if(count _factories < 1)exitwith{hint "No Factories are available. Build one!";closedialog 0;};

		// cti_dialog_ui_purchasemenu_action
		_get = call CTI_UI_Purchase_GetFirstAvailableFactories;
		_factory = _get select 0;
		_factory_index = _get select 1;
		_factory_type = _get select 2;
		
		if (isNull _factory) exitWith { closeDialog 0; };
		// if (count _factories == 0) exitWith {  }; //debug
		
		{if (isNil {uiNamespace getVariable format ["cti_dialog_ui_purchasemenu_vehicon_%1", _x]}) then {uiNamespace setVariable [format ["cti_dialog_ui_purchasemenu_vehicon_%1", _x], true]}} forEach ['driver','gunner','commander','turrets','lock'];
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_unitcost", 90000]; //--- Muhahahah!
		
		call CTI_UI_Purchase_SetVehicleIconsColor;
		(_factory_index) call CTI_UI_Purchase_SetIcons;
		(_factory_index) call CTI_UI_Purchase_FillUnitsList;
		call CTI_UI_Purchase_OnUnitListLoad;
		
		(_factory_type) call CTI_UI_Purchase_LoadFactories;
		
<<<<<<< HEAD
		if (_factory_type != "Service Depot" || !(_commander)) then {((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 100016) ctrlShow false};
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 100016) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.535), SafeZoneY + (SafeZoneH * 0.825), SafeZoneW * 0.275, SafeZoneH * 0.04]; ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 100016) ctrlCommit 0;
		
		_groups = [group player];
		if (_commander) then {
			//_groups = if (missionNamespace getVariable "CTI_AI_TEAMS_ENABLED" == 1) then {(CTI_P_SideJoined) call CTI_CO_FNC_GetSideGroups} else {(CTI_P_SideJoined) call CTI_CO_FNC_GetSidePlayerGroups};
			_groups = playableUnits apply {if (side _x == side player) then {group _x} else {""}} ; // place holder
			_groups = _groups - [""];
			{
				_header_ai = if (isPlayer leader _x) then {""} else {"[AI]"};
				((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008) lbAdd format ["%3 (%2) %1", _header_ai, name leader _x, GroupID _x];
=======
		if (_factory_type != "Service Depot" || !(player == _commander)) then {((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 100016) ctrlShow false};
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 100016) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.535), SafeZoneY + (SafeZoneH * 0.825), SafeZoneW * 0.275, SafeZoneH * 0.04]; ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 100016) ctrlCommit 0;
		
		_groups = [group player];
		if (player == _commander) then {
			//_groups = if (missionNamespace getVariable "CTI_AI_TEAMS_ENABLED" == 1) then {(CTI_P_SideJoined) call CTI_CO_FNC_GetSideGroups} else {(CTI_P_SideJoined) call CTI_CO_FNC_GetSidePlayerGroups};
			_groups = [group player]; // place holder
			{
				_header_ai = if (isPlayer leader _x) then {""} else {"[AI]"};
				((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008) lbAdd format ["(%2) %1", _header_ai, name leader _x];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
				if (leader _x == player) then {((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008) lbSetCurSel _forEachIndex};
			} forEach (_groups);
		} else {
			((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008) lbAdd format ["%1 (%2)", group player, name player];
			((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008) lbSetCurSel 0;
		};
		
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_team", group player];
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_teams", _groups];
		
		//execVM "MOB_CTI\player_ui_purchasemenu.sqf";
	};
	case "onUnitsLBSelChanged": {
<<<<<<< HEAD
		hint "unit selected";
		_selected = _this select 1;
		_widgets = missionNamespace getVariable "CTI_CURRENT_WIDGETS";
		_info = _widgets select _selected;
		_classname = _info select 1;

		hint format ["%1",_info];

		_classname call CTI_UI_Purchase_UpdateVehicleIcons;
		
		_selected call CTI_UI_Purchase_UpdateCost;
=======
		//hint "unit selected";
		_changedTo = _this select 1;
		
		_var = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbData [_changedTo, 0];

		//hint format ["%1",_var];

		_var call CTI_UI_Purchase_UpdateVehicleIcons;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
	};
	case "onGroupLBSelChanged": {
		//hint "group selected";
		_changedTo = _this select 1;
		
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_team", (uiNamespace getVariable "cti_dialog_ui_purchasemenu_teams") select _changedTo];
	};
	case "onFactoryLBSelChanged": {
		//hint "factory selected";
		_changedTo = _this select 1;

		_factories = uiNamespace getVariable "cti_dialog_ui_purchasemenu_factories";		
		_factory = _factories select _changedTo;
<<<<<<< HEAD
		//hint format ["%1 : %2",_factories,_changedTo];
=======
		hint format ["%1 : %2",_factories,_changedTo];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
		
		if (alive _factory) then {
			[_factory, 2, .175] call CTI_UI_Purchase_CenterMap;
			uiNamespace setVariable ["cti_dialog_ui_purchasemenu_factory", _factory];
		} else {
			if ({alive _x} count (uiNamespace getVariable "cti_dialog_ui_purchasemenu_factories") > 0) then {
				(uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory_type") call CTI_UI_Purchase_LoadFactories;//reload.
			} else {
				['onLoad'] call compile preprocessFileLineNumbers 'MOB_CTI\player_events_ui_purchasemenu.sqf'
			};
		};
	};
	case "onIconSet": {
		//hint "icon selected";
		_factory_index = _this select 1;

		_factory_type = switch (_factory_index) do {
			case 0: {"Barracks"};
			case 1: {"Light Factory"};
			case 2: {"Heavy Factory"};
			case 3: {"Aircraft Factory"};
			case 4: {"Service Depot"};
			case 5: {"Boat Dock"};
			default {-1};
		};

		//hint _factory_type;
		
		_mhq = player getVariable "CTI_PLAYER_MHQ";
		_factories = _mhq getVariable "CTI_FACTORIES";

		_factories_types = _factories apply {_X getVariable "CTI_FACTORY_TYPE"};

		//hint format ["%1",(_factory_type in _factories_types)];

		if (_factory_type in _factories_types) then {
			(_factory_index) call CTI_UI_Purchase_SetIcons;
			(_factory_index) call CTI_UI_Purchase_FillUnitsList;
			call CTI_UI_Purchase_OnUnitListLoad;
			
			(_factory_type) call CTI_UI_Purchase_LoadFactories;
			if (call CTI_CL_FNC_IsPlayerCommander) then {((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 100016) ctrlShow (if (_factory_type == CTI_REPAIR) then {true} else {false})};
		
		};
	};
	case "onVehicleIconClicked": {
<<<<<<< HEAD
		//hint "vehicle icon selected";
=======
		hint "vehicle icon selected";
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
		_role = _this select 1;
		_idc = _this select 2;
		
		_var = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbData [lnbCurSelRow 111007, 0];
<<<<<<< HEAD
		//hint format ["%1",_var];
=======
		hint format ["%1",_var];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
		
		_toggle = if (uiNamespace getVariable format ["cti_dialog_ui_purchasemenu_vehicon_%1", _role]) then {false} else {true};
		uiNamespace setVariable [format ["cti_dialog_ui_purchasemenu_vehicon_%1", _role], _toggle];
		
		_color = if (_toggle) then {[0.258823529, 0.713725490, 1, 1]} else {[0.2, 0.2, 0.2, 1]};
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _idc) ctrlSetTextColor _color;
<<<<<<< HEAD
		//_selected call CTI_UI_Purchase_UpdateCost;
=======
		(_classname) call CTI_UI_Purchase_UpdateCost;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
	};
	case "onVehicleLockClicked": {
		_toggle = if (uiNamespace getVariable "cti_dialog_ui_purchasemenu_vehicon_lock") then {false} else {true};
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_vehicon_lock", _toggle];
		
		_color = if (uiNamespace getVariable "cti_dialog_ui_purchasemenu_vehicon_lock") then {[1, 0.22745098, 0.22745098, 1]} else {[0.2, 0.2, 0.2, 1]};
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110104) ctrlSetTextColor _color;
	};
	case "onPurchase": {
		_selected = _this select 1;
		
		if (_selected == -1) exitWith {}; //nothing selected.

		_mhq = player getVariable "CTI_PLAYER_MHQ";
		_funds = _mhq getVariable "CTI_FUNDS";
		_fmax = _mhq getVariable "CTI_FUEL_MAX";

		_widgets = missionNamespace getVariable "CTI_CURRENT_WIDGETS";

		_info = _widgets select _selected;
		_classname = _info select 1;
		//_classname = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbData [_selected, 0];

<<<<<<< HEAD
		//diag_log format ["%1",_info];
=======
		diag_log format ["%1",_info];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

		_display = _info select 0;
		_m_cost = _info select 2;
		_f_cost = _info select 3;
		_a_cost = _info select 4;
		_picture = _info select 5;

		_cost=[_m_cost,_a_cost,_f_cost];

		_cond = [_cost,_funds,_fmax] call cost_affordable;

		if (_cond) then {
			
			_selected_group = (uiNamespace getVariable "cti_dialog_ui_purchasemenu_teams") select (lbCurSel ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110008)); //todo Change that by combo value
			
<<<<<<< HEAD
			hint format ["%1",_selected_group];
			
=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
			_isEmpty = false;
			_veh_info = if (_classname isKindOf "Man") then { [] } else { call CTI_UI_Purchase_GetVehicleInfo };
			if (count _veh_info > 0) then {
				if !((_veh_info select 0) || (_veh_info select 1) || (_veh_info select 2) || (_veh_info select 3)) then { _isEmpty = true };
			};
			
			if (alive(uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory")) then {
				//_ai_enabled = missionNamespace getVariable "CTI_AI_TEAMS_ENABLED";
				_ai_enabled = 1; // place holder
				if (_ai_enabled == 1 || (isPlayer leader _selected_group && _ai_enabled == 0)) then {
					if ((count units _selected_group)+1 <= CTI_PLAYERS_GROUPSIZE || _isEmpty) then { //todo ai != player limit
						_proc_purchase = true;
						if (_isEmpty && _selected_group != group player) then { _proc_purchase = false; hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Empty vehicles may not be purchased for other groups."; };
						
						if (_proc_purchase) then {
							_picture = if (_picture != "") then {format["<img image='%1' size='2.5'/><br /><br />", _picture]} else {""};
							hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br />%2<t>A <t color='#ccffaf'>%1</t> is being built</t>", _display, _picture];
<<<<<<< HEAD
							[_classname, uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory", _selected_group, _veh_info, _cost, _display] spawn CTI_CL_FNC_PurchaseUnit;
=======
							[_classname, uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory", _selected_group, _veh_info, _cost] spawn CTI_CL_FNC_PurchaseUnit;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
							[_mhq,_cost] call subtract_funds;
						};
					} else {
						hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Your unit limit has been reached.";
					};
				} else {
					hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Units may not be purchased to AI groups while the AI Teams are disabled in the parameters.";
				};
			};
		} else {
			hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You do not have enough funds to perform this operations.";
		};
	};
	case "onIndependentSalvagerPressed": {
		if (isNil 'CTI_P_LastIndepSalvagerPurchased') then { CTI_P_LastIndepSalvagerPurchased = -600 }; 
		
		_in_use = (uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory") getVariable "cti_inuse";
		if (isNil '_in_use') then { _in_use = false };
		if !(_in_use) then {
			_funds = call CTI_CL_FNC_GetPlayerFunds;
			if (_funds >= CTI_VEHICLES_SALVAGER_PRICE) then {
				if (count(CTI_P_SideLogic getVariable "cti_salvagers") < CTI_VEHICLES_SALVAGE_INDEPENDENT_MAX) then { 
					if (time - CTI_P_LastIndepSalvagerPurchased > 5) then {
						CTI_P_LastIndepSalvagerPurchased = time;
						["SERVER", "Request_Purchase", [CTI_P_SideJoined, group player, CTI_P_SideJoined, format["CTI_Salvager_Independent_%1", CTI_P_SideJoined], uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory", [], (time + random 10000 - random 500 + diag_frameno)]] call CTI_CO_FNC_NetSend;
					} else {
						hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />Please wait a few seconds before performing this operation again.";
					};
				} else {
					hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />The Independent salvager limit has been reached.";
				};
			} else {
				hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You do not have enough funds to perform this operations.";
			};
		} else {
			hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />The factory shouldn't be in use in order to buy an independent salvager.";
		};
	};
	case "onQueueCancel": {
		_selected = _this select 1;
		
		if (_selected != -1) then {
			_classname = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110013) lbData _selected;
			_rounded_seed = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110013) lbValue _selected;
			
<<<<<<< HEAD
=======
			// player sidechat format ["trying to remove %1 %2", _classname, _rounded_seed];
			_is_present = false;
			_req_can_alter = true;
			_req_factory = objNull;
			_req_team = grpNull;
			_seed = -1;
			_index = -1;
			{
				if (round(_x select 0) == _rounded_seed && _x select 1 == _classname) exitWith {
					_is_present = true;
					_seed = _x select 0;
					_req_factory = _x select 3;
					_req_team = _x select 4;
					_req_can_alter = _x select 5;
					_index = _forEachIndex;
				};
			} forEach CTI_P_PurchaseRequests;
			
			if (_is_present) then {
				//--- Yes it's here, but can we alter it ?
				if (_req_can_alter) then {
					CTI_P_PurchaseRequests set [_index, "!nil!"];
					CTI_P_PurchaseRequests = CTI_P_PurchaseRequests - ["!nil!"];
					
					//--- Notify the server thread that our request has been canceled.
					["SERVER", "Request_PurchaseCancel", [_seed, _classname, _req_factory, _req_team, group player]] call CTI_CO_FNC_NetSend;
				} else {
					hint "commander assigned units may not be removed";
				};
			};
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
		};
	};
	case "onUnload": {
		uiNamespace setVariable ["cti_dialog_ui_purchasemenu_action", objNull];
	};
};
