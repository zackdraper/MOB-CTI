/*

	profile_save_manager.sqf

	save mission information to profile for reload
	
*/
//////////////////////////////////////////////////////////////////////////////
private ["_fac","_def"];

_load_game = "load_game" call BIS_fnc_getParamValue;
_wipe_game = "wipe_game" call BIS_fnc_getParamValue;

_str = "";

if (_wipe_game == 1) then {
	profileNamespace setVariable [ "CTI_LOCATIONS",nil];
	profileNamespace setVariable [ "CTI_AREAS_LIST",nil];
	profileNamespace setVariable [ "CTI_FACTORIES_LIST",nil];
	profileNamespace setVariable [ "CTI_DEFENCES_LIST",nil];
	saveProfileNamespace;
	_str = _str + "Current Save Game Wiped\n";
} else {
	_str = _str + "Current Save Game Preserved\n";
};

_save_locations = profileNamespace getVariable ["CTI_LOCATIONS",nil];
_save_mhq_pos = profileNamespace getVariable ["CTI_MHQ_POS", nil];
_save_area_list = profileNamespace getVariable ["CTI_AREAS_LIST", nil];
_save_fac_list = profileNamespace getVariable ["CTI_FACTORIES_LIST", nil];
_save_def_list = profileNamespace getVariable ["CTI_DEFENCES_LIST", nil];
_save_funds_list = profileNamespace getVariable ["CTI_FUNDS_LIST", nil];

if (_load_game == 1) then {

	if !(isNil "_save_locations") then {
		//Load saved locations
		for [{_j=0}, {_j < (count (_save_locations)-1)}, {_j=_j+1}] do {
			
			_data = _save_locations select _j;
			
			_location = _data select 0;
			_side = _data select 1;
			_faction = _data select 2;
			
			_logic = (getpos _location) nearestObject "Logic";
			_flag = synchronizedObjects _logic;
			_flag = _flag select 0;
		
			_flag setVariable ["CTI_LOCATION_FACTION",_faction,true];
			_flag setVariable ["CTI_LOCATION_SIDE",_side,true];
			
			// Change Flag
			_class = _faction call define_force_classnames;
			_flagTexture = [_class,0,"flag"] call read_twod_array_col;
			[_flag,(_flagTexture select 0)] remoteExec ["setFlagTexture",_flag];
			_flag setVariable ["CTI_OCCUPYING_GROUPS",[],true];

			//Change Marker
			_markerstr = _flag getVariable ["CTI_LOCATION_MARKER",objNull];
			
			switch (_side) do {
				case west:{[_markerstr, "ColorBlue"] remoteExec ["setMarkerColorLocal", _side, true]};
				case east:{[_markerstr, "ColorRed"] remoteExec ["setMarkerColorLocal", _side, true]};
				case resistance:{[_markerstr, "ColorGreen"] remoteExec ["setMarkerColorLocal", _side, true]};
				case civilian:{[_markerstr, "ColorYellow"] remoteExec ["setMarkerColorLocal", _side, true]};
			};
			
		};
	};
	
	for [{_k=0}, {_k < (count (MOB_CTI_MHQS)-1)}, {_k=_k+1}] do {
		_mhq = MOB_CTI_MHQS select _k;
		_side = _mhq getVariable ["CTI_SIDE",nil];
		_faction = _mhq getVariable ["CTI_FACTION",nil];
		
		if !(isNil "_save_mhq_pos") then {
			_pos = _save_mhq_pos select _k;
		
			_mhq_veh = _mhq getVariable ["CTI_MHQ_VEH",nil];

			_mhq_veh setPos (_pos select 0);
			_mhq_veh setDir (_pos select 1);
		};
		
		if !(isNil "_save_funds_list") then {
			_funds = _save_funds_list select _k;
			
			_mhq setVariable ["CTI_FUNDS",(_funds select 0)];
			_mhq setVariable ["CTI_FUEL_MAX",(_funds select 1)];
		};
		
		if !(isNil "_save_area_list") then {
			_areas = _save_area_list select _k;
			_mhq setVariable ["CTI_AREAS",_areas];
		};
		
		if !(isNil "_save_fac_list") then {
			_facs_list = _save_fac_list select _k;
			_fac = [];
			if (count _facs_list > 0) then {
				{ 
					_f = (_x select 0) createVehicle (_x select 1);
					_f setDir (_x select 2);
					_fac = _fac + [_f];
					_f setVariable ["CTI_FACTORY_TYPE",(_x select 3)];
					
					_mtype = (_x select 3) call building_marker_type;
					
					_markerstr = createMarker [format ["BuildingMkr%2%1",_k,(_x select 3)],(_x select 1)];
					[_markerstr,"ICON"] remoteExec ["setMarkerShape",_side];
					[_markerstr, _mtype] remoteExec ["setMarkerType",_side];
					[_markerstr, "ColorYellow"] remoteExec ["setMarkerColor",_side];

					[_side,(_x select 1),(_x select 3)] call BIS_fnc_addRespawnPosition;
					
					_fac = _fac + [_f];
				} forEach _facs_list;
			};
			_mhq setVariable ["CTI_FACTORIES", _fac];
		};
		
		player sidechat str _save_def_list;
		if !(isNil "_save_def_list") then {
			_defs_list = _save_def_list select _k;
			_def = [];
			if (count _defs_list > 0) then {
				{ 
					_f = (_x select 0) createVehicle (_x select 1);
					_f setDir (_x select 2);
					_def = _def + [_f];
				} forEach _defs_list;
			};
			_mhq setVariable ["CTI_DEFENCES", _def];
		};
		
	};
	_str = _str + "Save Game Loaded\n";
} else {
	_str = _str + "Save Game Could Not Load\n";
};


CTI_save_current_session = {

	// Save capturable locations
	_cti_locations = MOB_CTI_Locations_AllMajorCities apply {[(_x select 0),(side (_x select 0)),((synchronizedObjects ((getpos (_x select 0)) nearestObject "Logic")) select 0)]};
	_cti_locations = _cti_locations apply {[(_x select 0),(_x select 1),(_x select 2) getVariable "CTI_LOCATION_FACTION"]};
	
	profileNamespace setVariable [ "CTI_LOCATIONS", _cti_locations ];

	// Save base buildings and defences
	
	_mhq_pos = MOB_CTI_MHQS apply { [getPos (_x getvariable "CTI_MHQ_VEH"), getDir (_x getvariable "CTI_MHQ_VEH")] };
	_area_list = MOB_CTI_MHQS apply { _x getVariable ["CTI_AREAS", []] };
	_fact_list = MOB_CTI_MHQS apply { _x getVariable ["CTI_FACTORIES", []] };
	_defe_list = MOB_CTI_MHQS apply { _x getVariable ["CTI_DEFENCES", []] };
	
	for [{_k=0}, {_k < (count (MOB_CTI_MHQS)-1)}, {_k=_k+1}] do {
		_faction_list = _fact_list select _k;
		_faction_list = _faction_list apply {[ typeOf _x, getpos _x, getdir _x, _x getVariable "CTI_FACTORY_TYPE"]};
		_fact_list set [_k,_faction_list];
	};

	for [{_j=0}, {_j < (count (MOB_CTI_MHQS)-1)}, {_j=_j+1}] do {
		_faction_def_list = _defe_list select _j;
		_faction_def_list = _faction_def_list apply { [typeOf _x, getpos _x, getdir _x ] };
		_defe_list set [_j,_faction_def_list];
	};
	
	profileNamespace setVariable [ "CTI_MHQ_POS", _mhq_pos ];
	profileNamespace setVariable [ "CTI_AREAS_LIST", _area_list ];
	profileNamespace setVariable [ "CTI_FACTORIES_LIST", _fact_list ];
	profileNamespace setVariable [ "CTI_DEFENCES_LIST", _defe_list ];
	
	// Save money and supplies
	
	_funds = MOB_CTI_MHQS apply { [_x getVariable "CTI_FUNDS",_x getVariable "CTI_FUEL_MAX"]};
	
	profileNamespace setVariable [ "CTI_FUNDS_LIST", _funds ];
	
	saveProfileNamespace;
};

[_str] remoteExec ["hint",0];

while {true} do {
	sleep 600;
	
	call CTI_save_current_session;
};

if(true)exitwith{};