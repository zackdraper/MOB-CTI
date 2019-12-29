private ["_action"];
_action = _this select 0;

switch (_action) do {
	case "onLoad": {
		//execVM "MOB_CTI\player_ui_buildmenu.sqf";
		_mhq = player getVariable "CTI_PLAYER_MHQ";
		_mhq_veh = _mhq getVariable "CTI_MHQ_VEH";
		
		if (surfaceIsWater getpos _mhq_veh) exitWith {
			CTI_KILL_CAMERA = False;
			closeDialog 0;
			hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You cannot build on water.";
		};
		
		if (isNil 'CTI_ConstructionCamera') then {[_mhq_veh, CTI_BASE_CONSTRUCTION_RANGE, 50] call CTI_CL_FNC_CreateCamera};

		if (CTI_P_WallsAutoAlign) then { ctrlSetText [100003, "Auto-Align Walls: On"] } else { ctrlSetText [100003, "Auto-Align Walls: Off"] };
		if (CTI_P_DefensesAutoManning) then { ctrlSetText [100011, "Defenses Auto-Manning: On"] } else { ctrlSetText [100011, "Defenses Auto-Manning: Off"] };
		
		{
			_row = ((uiNamespace getVariable "cti_dialog_ui_buildmenu") displayCtrl 100006) lnbAddRow [_x select 0, format ["                                   $ %1", _x select 2] ];
			((uiNamespace getVariable "cti_dialog_ui_buildmenu") displayCtrl 100006) lnbSetData [[_row, 0], _x];

		} forEach (player getVariable "CTI_STRUCTURES");
		
		if !(isNil {uiNamespace getVariable "cti_dialog_ui_buildmenu_lastbsel"}) then {((uiNamespace getVariable "cti_dialog_ui_buildmenu") displayCtrl 100006) lnbSetCurSelRow (uiNamespace getVariable "cti_dialog_ui_buildmenu_lastbsel")};
		
		{
			_row = ((uiNamespace getVariable "cti_dialog_ui_buildmenu") displayCtrl 100007) lnbAddRow [_x select 0, format ["                                   $ %1      A: %2", _x select 2,_x select 3]];
			((uiNamespace getVariable "cti_dialog_ui_buildmenu") displayCtrl 100007) lnbSetData [[_row, 0], _x];

		} forEach (player getVariable "CTI_DEFENCES");
		
		if !(isNil {uiNamespace getVariable "cti_dialog_ui_buildmenu_lastdsel"}) then {((uiNamespace getVariable "cti_dialog_ui_buildmenu") displayCtrl 100007) lnbSetCurSelRow (uiNamespace getVariable "cti_dialog_ui_buildmenu_lastdsel")};
		
		//--- Set the worker price
		((uiNamespace getVariable "cti_dialog_ui_buildmenu") displayCtrl 100005) ctrlSetText format ["Add Worker ($%1)", CTI_BASE_WORKERS_PRICE];
		// CTI_BASE_WORKERS_LIMIT
		// 100005
	};
	case "onBuildStructure": {
		_selected = _this select 1;
		
		if (_selected != -1) then {
			_selected = (player getVariable "CTI_STRUCTURES") select _selected;

			_mhq = player getVariable "CTI_PLAYER_MHQ";
			_mhq_veh = _mhq getVariable "CTI_MHQ_VEH";
			_funds = _mhq getVariable "CTI_FUNDS";

			if (_funds select 0 >= _selected select 2) then { //--- Check if we have enough funds to go in the construction mode.
				CTI_VAR_StructurePlaced = false;
				[_selected, _mhq_veh, CTI_BASE_CONSTRUCTION_RANGE] spawn CTI_CL_FNC_PlacingBuilding;
				CTI_KILL_CAMERA = False;
				closeDialog 0;
			} else {
				hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You do not have enough funds to place that structure.";
			};
		};
	};
	case "onBuildDefense": {
		_selected = _this select 1;
		
		if (_selected != -1) then {
			_selected = (player getVariable "CTI_DEFENCES") select _selected;

			_mhq = player getVariable "CTI_PLAYER_MHQ";
			_funds = _mhq getVariable "CTI_FUNDS";	

			_costs = _selected select 2;
			//hint format ["%1",_selected];
			
			if ((_funds select 0 > _selected select 2) and (_funds select 1 > _selected select 3)) then { //--- Check if we have enough funds to go in the construction mode.
				CTI_VAR_StructurePlaced = false;
				[_selected, _mhq, CTI_BASE_CONSTRUCTION_RANGE] spawn CTI_CL_FNC_PlacingDefense;
				CTI_KILL_CAMERA = False;
				closeDialog 0;
			} else {
				hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You do not have enough funds to place that defense.";
			};
		};
	};
	case "onAutoAlign": {
		// CTI_P_WallsAutoAlign = if (CTI_P_WallsAutoAlign) then {false} else {true};
		CTI_P_WallsAutoAlign = !CTI_P_WallsAutoAlign;
		if (CTI_P_WallsAutoAlign) then { ctrlSetText [100003, "Auto-Align Walls: On"] } else { ctrlSetText [100003, "Auto-Align Walls: Off"] };
	};
	case "onAutoManning": {
		CTI_P_DefensesAutoManning = !CTI_P_DefensesAutoManning;
		if (CTI_P_DefensesAutoManning) then { ctrlSetText [100011, "Defenses Auto-Manning: On"] } else { ctrlSetText [100011, "Defenses Auto-Manning: Off"] };
	};
	case "onAddWorker": {
		//--- Check the worker limit
		_workers = CTI_P_SideLogic getVariable "cti_workers";
		
		_count = 0;
		{
			switch (typeName _x) do {
				case "STRING": { _count = _count + 1 };
				case "OBJECT": { if (alive _x) then { _count = _count + 1 } };
			};
		} forEach _workers;
		
		if (_count < CTI_BASE_WORKERS_LIMIT) then {
			_funds = call CTI_CL_FNC_GetPlayerFunds;
			if (_funds >= CTI_BASE_WORKERS_PRICE) then {
				-(CTI_BASE_WORKERS_PRICE) call CTI_CL_FNC_ChangePlayerFunds;
				CTI_P_SideLogic setVariable ["cti_workers", _workers + [""], true];
				
				["SERVER", "Request_Worker", [CTI_P_SideJoined]] call CTI_CO_FNC_NetSend;
			} else {
				hint "not enough funds dude";
			};
		} else {
			hint "worker limit reached";
		};
	};
	case "onUndoDefense": {
		if !(isNull CTI_P_LastDefenseBuilt) then {
			deleteVehicle CTI_P_LastDefenseBuilt;
		};
	};
	case "onUndoStructure": {
		if !(isNull CTI_P_LastStructurePreBuilt) then {
			deleteVehicle CTI_P_LastStructurePreBuilt;
		};
	};
	case "onUnload": {
		//--- Memorize
		_curSelBuilding = lnbCurSelRow 100006;
		_curSelDefense = lnbCurSelRow 100007;
		
		if (_curSelBuilding > -1) then {uiNamespace setVariable ["cti_dialog_ui_buildmenu_lastbsel", _curSelBuilding]};
		if (_curSelDefense > -1) then {uiNamespace setVariable ["cti_dialog_ui_buildmenu_lastdsel", _curSelDefense]};
	};
};
