/*

	economy.sqf

	determine the economy type fro a given faction
	
*/
//////////////////////////////////////////////////////////////////////////////

private ["_econ","_init","_faction","_side","_helo","_pilot","_grp","_fac_funds","_mhq","_resup"];

_econ = _this select 0;
_init = _this select 1;
_faction = _this select 2;
_side = _this select 3;
_mhq = _this select 5;

//diag_log "ECONOMY";
//diag_log _mhq;

_mhq setvariable ["CTI_FUNDS",(_init select 0), true];
_mhq setvariable ["CTI_FUEL_MAX",(_init select 1), true];
 
switch (_econ) do {
	case "unlimited":{
		while {true} do {
			
			_mhq setvariable ["CTI_FUNDS",(_init select 0), true];
			_mhq setvariable ["CTI_FUEL_MAX",(_init select 1), true];

			sleep 60;
		};
	};
	case "occupation":{

		_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
		_MOB_CTI_Locations_AllMajorCities = [];
		{_MOB_CTI_Locations_AllMajorCities pushBack _x} forEach nearestLocations [[_size/2,_size/2], ["NameCityCapital"], sqrt(2*((_size/2)^2)) ];

		{_MOB_CTI_Locations_AllMajorCities pushBack _x} forEach nearestLocations [[_size/2,_size/2], ["NameCity"], sqrt(2*((_size/2)^2)) ];

		{_MOB_CTI_Locations_AllMajorCities pushBack _x} forEach nearestLocations [[_size/2,_size/2], ["NameVillage"], sqrt(2*((_size/2)^2)) ];

		{_MOB_CTI_Locations_AllMajorCities pushBack _x} forEach nearestLocations [[_size/2,_size/2], ["NameLocal"], sqrt(2*((_size/2)^2)) ];


		_resup = _this select 4;

		_funds = _mhq getvariable "CTI_FUNDS";

		diag_log _faction;
		diag_log _funds;
		while {true} do {

			//diag_log _MOB_CTI_Locations_AllMajorCities;
			_sides = _MOB_CTI_Locations_AllMajorCities apply {side _x};
			//diag_log _sides;
			_count = {_x == _side} count _sides;
			
			//player sidechat format ["%1 : Towns Occupied",_count];

			_funds = _mhq getvariable "CTI_FUNDS";
			_newfunds = [((_funds select 0) + (_resup select 0)*(_count)),((_funds select 1) + (_resup select 1)*(_count)),(_funds select 2)];
			diag_log _newfunds;
			_mhq setvariable ["CTI_FUNDS",_newfunds,true];

			sleep 10;
		};
	};
	case "externalsupply":{
		private "_fac_arr";
		
		_resup = _this select 4;

		_supplypoint = _mhq getVariable format ["CTI_%1_ECON_SUPPLYPOINT",_faction];

		_fac_arr = _faction call define_force_classnames;

		_helo_class = ([_fac_arr,0,"supply"] call read_twod_array_col) select 0;
		_pilot_class = ([_fac_arr,0,"pilot"] call read_twod_array_col) select 0;
		
		_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
		_radius = sqrt( ((_size/2)^2) );
		_center = [_size/2,_size/2];

		_fac_fund = format ["CTI_%1_FUNDS",_faction];

		hint format ["%1 : %2",_helo_class,_pilot_class];
				
		while {true} do {
			_pos = _center getpos [_radius, random 360];

			[_side,_fac_fund,_helo_class,_pilot_class,_pos,_supplypoint,_resup] spawn supply_helo;

			player sideChat "Supply Helo on the Way";

			_num = _this select 5;
			sleep _num;
		};
	};
	case "limited":{
		_mhq setvariable ["CTI_FUNDS",(_init select 0), true];
		_mhq setvariable ["CTI_FUEL_MAX",(_init select 1), true];
	};
};

if(true)exitwith{};