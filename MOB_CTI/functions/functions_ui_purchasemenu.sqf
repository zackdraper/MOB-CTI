CTI_UI_Purchase_SetIcons = {
	private ["_IDCs", "_index", "_selected"];
	_index = _this;
	
	_IDCs = [110001, 110002, 110003, 110004, 110005, 110007];
	_selected = _IDCs select _index;
	_IDCS = _IDCS - [_selected];
	
	{
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _x) ctrlSetTextColor [0.4, 0.4, 0.4, 1];
	} forEach _IDCs;
	// ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _selected) ctrlSetTextColor [1, 1, 1, 1];
	((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _selected) ctrlSetTextColor [0.258823529, 0.713725490, 1, 1];
};

//--- Get the best factory (the closest).
CTI_UI_Purchase_GetFirstAvailableFactories = {
	_nearfac = objNull;
	_index = -1;
	_type = "";
	
	_mhq = player getVariable "CTI_PLAYER_MHQ";
	_factories = _mhq getVariable "CTI_FACTORIES";
	
	//hint format ["%1",_factories];

	_distances = _factories apply {[player distance _x,_x]};
	_distances sort true;

	if (count _factories > 0) then {
		_nearfac = (_distances select 0) select 1;
	};

	

	_type = _nearfac getvariable "CTI_FACTORY_TYPE";

	//hint format ["%1",_type];

	_index = switch (_type) do {
		case "Barracks": {0};
		case "Light Factory": {1};
		case "Heavy Factory": {2};
		case "Aircraft Factory": {3};
		case "Service Depot": {4};
		case "Boat Dock": {5};
		default {-1};
	};
	
	[_nearfac, _index, _type];
};

CTI_UI_Purchase_FillUnitsList = {
	private ["_type", "_var","_widgets","_faction"];

	_faction = player getVariable "CTI_PLAYER_FACTION";

	diag_log format ["INF : %1",player getVariable "CTI_INFANTRY"];
	diag_log format ["LV : %1",player getVariable "CTI_LIGHT"];
	diag_log format ["HVY : %1",player getVariable "CTI_HEAVY"];
	diag_log format ["AIR : %1",player getVariable "CTI_AIR"];
	diag_log format ["SRV : %1",player getVariable "CTI_SERVICE"];

	diag_log format ["faction test : %1",_faction];
	_widgets = switch (_this) do {
		case 0: {player getVariable "CTI_INFANTRY"};
		case 1: {player getVariable "CTI_LIGHT"};
		case 2: {player getVariable "CTI_HEAVY"};
		case 3: {player getVariable "CTI_AIR"};
		case 4: {player getVariable "CTI_SERVICE"};
		case 5: {player getVariable "CTI_NAVAL"};
		default {-1};
	};
	diag_log format ["Unit List : %1",_widgets];
		

	lnbClear 111007;

	{
		_row = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbAddRow [format ["$%1   F:%2    A:%3 ", _x select 2, _x select 3, _x select 4], format ["                    %1",_x select 0]];
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbSetData [[_row, 0], _x select 1];
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbSetPicture [[_row, 0], _x select 5];
	} forEach _widgets;

	missionNameSpace setVariable ["CTI_CURRENT_WIDGETS",_widgets];
};

CTI_UI_Purchase_CenterMap = {
	private ["_delay", "_position", "_zoom"];
	_position = _this select 0;
	_delay = _this select 1;
	_zoom = _this select 2;
	
	ctrlMapAnimClear ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110010);
	((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110010) ctrlMapAnimAdd [_delay, _zoom, _position];
	ctrlMapAnimCommit ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110010);
};

CTI_UI_Purchase_UpdateVehicleIcons = {
	private ["_classname", "_IDCs", "_showArray", "_turrets", "_var"];
	_classname = _this;

	_IDCs = [110100, 110101, 110102, 110103];
	
	if (_classname isKindOf "Man") then {
		// {
			// ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _x) ctrlShow false; 
		// } forEach (_IDCs + [110104]);
		call CTI_UI_Purchase_HideVehicleIcons;
	} else {
		_var = _classname call BIS_fnc_vehicleRoles;

		//hint format ["%1",_var];
		
		_showArray = [true, false, false, false];

		if ((_var select 1) select 0 == "Turret") then {
			_showArray set [1,true];
		};

		if (count _var > 2) then {
			if (count ((_var select 2) select 1) > 1) then {
				_showArray set [2,true];
			};
		};

		_roles = _var apply {_x select 0};
		_cnt = ({_x == "Turret"} count _roles);

		if (_cnt > 2) then {
			_showArray set [3,true];
		};
		
		for '_i' from 0 to (count _IDCs)-1 do {
			((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl (_IDCs select _i)) ctrlShow (_showArray select _i);  //--- Lock
		};
		
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110104) ctrlShow true;  //--- Lock
	};
	
	//(_classname) call CTI_UI_Purchase_UpdateCost;
};

CTI_UI_Purchase_HideVehicleIcons = {
	private ["_IDCs"];
	_IDCs = [110100, 110101, 110102, 110103, 110104];
	{ ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _x) ctrlShow false } forEach _IDCs;
};

CTI_UI_Purchase_OnUnitListLoad = {
	private ["_classname"];
	if (lnbCurSelRow 111007 > -1) then {
		_classname = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbData [lnbCurSelRow 111007, 0];
		if (_classname != "") then {
			(_classname) call CTI_UI_Purchase_UpdateVehicleIcons;
		} else {
			call CTI_UI_Purchase_HideVehicleIcons;
			("") call CTI_UI_Purchase_UpdateCost;
		};
	} else {
		call CTI_UI_Purchase_HideVehicleIcons;
		("") call CTI_UI_Purchase_UpdateCost;
	};
};

CTI_UI_Purchase_LoadFactories = {
	private ["_closest", "_fetched", "_structures", "_structure_text", "_type", "_var"];
	_type = _this;
	_fetched = objNull;
	
	_mhq = player getVariable "CTI_PLAYER_MHQ";
	_factories = _mhq getVariable "CTI_FACTORIES";

	_found = [];
	{
		_structure_type = if (isNil{_x getVariable "CTI_FACTORY_TYPE"}) then {""} else {_x getVariable "CTI_FACTORY_TYPE"};
		if (_structure_type == _type) then { _found append [_x] };
	} forEach _factories;
	_found = _found apply {[_x distance player,_x]};
	_found sort true;
	_found = _found apply {_x select 1};	
	
	lbClear ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110009);
	
	{
		_closest = nearestLocation [ getPos player, "NameCity"];
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110009) lbAdd format ["%1 - %2 (%3m)", _type, text _closest, round((getpos _closest) distance (getpos _x))];
	} forEach _found;
	
	uiNamespace setVariable ["cti_dialog_ui_purchasemenu_factory", _found select 0];
	uiNamespace setVariable ["cti_dialog_ui_purchasemenu_factory_type", _type];
	uiNamespace setVariable ["cti_dialog_ui_purchasemenu_factories", _found];
	
	if (count _found > 0) then {
		[_found select 0, 2, .175] call CTI_UI_Purchase_CenterMap;
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110009) lbSetCurSel 0;
	};
};

CTI_UI_Purchase_SetVehicleIconsColor = {
	private ["_color", "_idc"];
	_idc = 110100;
	{
		_color = if (uiNamespace getVariable format ["cti_dialog_ui_purchasemenu_vehicon_%1", _x]) then {[0.258823529, 0.713725490, 1, 1]} else {[0.2, 0.2, 0.2, 1]};
		
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl (_idc + _forEachIndex)) ctrlSetTextColor _color;
	} forEach ['driver','gunner','commander','turrets'];
	
	_color = if (uiNamespace getVariable "cti_dialog_ui_purchasemenu_vehicon_lock") then {[1, 0.22745098, 0.22745098, 1]} else {[0.2, 0.2, 0.2, 1]};
	((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110104) ctrlSetTextColor _color;
};

CTI_UI_Purchase_GetVehicleInfo = {
	private ["_idc", "_returned", "_selected"];
	_idc = 110100;
	_returned = [false, false, false, false, false];
	
	{
		_selected = uiNamespace getVariable format ["cti_dialog_ui_purchasemenu_vehicon_%1", _x];
		if (_selected && ctrlShown ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl (_idc + _forEachIndex))) then {_returned set [_forEachIndex, true]};
	} forEach ['driver','gunner','commander','turrets'];
	
	if (uiNamespace getVariable "cti_dialog_ui_purchasemenu_vehicon_lock") then {_returned set [4, true]};
	
	_returned
};

CTI_UI_Purchase_UpdateCost = {
	private ["_cost"];
	_selected = _this call BIS_fnc_parseNumber;
	
	if (_selected >= 0) then {
		hint format ["%1",_this];
		_widgets = missionNamespace getVariable "CTI_CURRENT_WIDGETS";
		//hint format ["%1",_widgets];
		_info = _widgets select _selected;

		_m_cost = _info select 2;
		_f_cost = _info select 3;
		_a_cost = _info select 4;

		_cost = format ["COST: %1  FUEL: %2  AMMO: %3",_m_cost,_f_cost,_a_cost];
		hint format ["%1",_cost];
		
		
	} else {
		_cost = "COST: 0 FUEL: 0  AMMO: 0"; 
	};
	((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110014) ctrlSetStructuredText (parseText _cost);
};