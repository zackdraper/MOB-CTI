/*

	economy.sqf

	determine the economy type fro a given faction
	
*/
//////////////////////////////////////////////////////////////////////////////

private ["_econ","_init","_faction","_side","_helo","_pilot","_grp","_fac_funds","_mhq","_resup","_locations"];

_econ = _this select 0;
_init = _this select 1;
_faction = _this select 2;
_side = _this select 3;
_mhq = _this select 5;
_locations = _this select 6;

diag_log "ECONOMY";
diag_log _mhq;

_mhq setvariable ["CTI_FUNDS",(_init select 0), true];
_mhq setvariable ["CTI_FUEL_MAX",(_init select 1), true];
 
switch (_econ) do {
	case "unlimited":{
		player sideChat format ["Economy %1: Initiated",_econ];
		while {true} do {
			
			_mhq setvariable ["CTI_FUNDS",[1000000,1000000,0], true];
			_mhq setvariable ["CTI_FUEL_MAX", 1000000, true];

			sleep 60;
		};
	};
	case "occupation":{
		player sideChat format ["Economy %1: Initiated",_econ];

		//diag_log _faction;
		//diag_log _funds;

		_resup = _this select 4;
		_fuel = _mhq getvariable "CTI_FUEL_MAX";
		
		while {true} do {
			_sides = _locations apply { [_side, side (_x select 0)] call BIS_fnc_sideIsFriendly };
			_count = {_x} count _sides;

			//player sidechat format ["%1 : Towns Occupied",_count];
			
			_f_multi = 1+(0.1*_count);

			_funds = _mhq getvariable "CTI_FUNDS";
			
			_newfunds = [((_funds select 0) + (_resup select 0)*(_count)),(_funds select 1) + (_resup select 1)*(_count),(_funds select 2)];
			_newfuel = floor(_fuel * _f_multi);
			//diag_log _newfunds;
			_mhq setvariable ["CTI_FUNDS",_newfunds,true];
			_mhq setvariable ["CTI_FUEL_MAX",_newfuel,true];

			sleep 60;
		};
	};
	case "externalammo_occupation":{
		player sideChat format ["Economy %1: Initiated",_econ];

		_funds = _mhq getvariable "CTI_FUNDS";

		//diag_log _faction;
		//diag_log _funds;
		_resup = _this select 4;

		_fac_arr = _faction call define_force_classnames;

		_helo_class = ([_fac_arr,0,"supply"] call read_twod_array_col) select 0;
		_pilot_class = ([_fac_arr,0,"pilot"] call read_twod_array_col) select 0;
		
		_radius = sqrt( ((_size/2)^2) );
		_center = getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition");
		_cx = _center select 0;
		_cy = _center select 1;

		player sidechat format ["%1 : %2",_helo_class,_pilot_class];

		_mhq setVariable ["CTI_EXTERNAL_AMMO",true,true];
		_fuel = _mhq getvariable "CTI_FUEL_MAX";

		while {true} do {

			//diag_log _MOB_CTI_Locations_AllMajorCities;
			_sides = _locations apply { [_side, side (_x select 0)] call BIS_fnc_sideIsFriendly };
			//diag_log _sides;
			_count = {_x} count _sides;
			
			_f_multi = 1+(0.1*_count);
			
			player sidechat format ["%1 : Towns Occupied",_count];

			_funds = _mhq getvariable "CTI_FUNDS";
			
			_newfunds = [((_funds select 0) + (_resup select 0)*(_count)),(_funds select 1),(_funds select 2)];
			_newfuel = floor(_fuel * _f_multi);
			//diag_log _newfunds;
			_mhq setvariable ["CTI_FUNDS",_newfunds,true];
			_mhq setvariable ["CTI_FUEL_MAX",_newfuel,true];

			sleep 15;

			_supply = _mhq getVariable ["CTI_EXTERNAL_AMMO",false];

			//player sidechat format [":: %1",_supply];

			if (!(_supply isEqualTo true) and !(_supply isEqualTo false)) then {

				_helo = _mhq getvariable ["CTI_SUPPLY_HELO",false];
				
				if !(_helo) then {

					_near_pos = [[0,0],[0,_size],[_size,0],[_size,_size],[_size/2,0],[_size/2,_size],[_size,_size/2],[0,_size/2]];

					_near_pos apply {[(_x select 0)-cx,(_x select 1)-cy]};

					_near_pos = _near_pos apply {[_x distance2d _supply,_x]};
					_near_pos sort true;
					_pos = (_near_pos select 0) select 1;

					//player sideChat format ["%1",_pos];

					[_side,_mhq,_helo_class,_pilot_class,_pos,_supply] spawn supply_helo;

					//player sideChat "Supply Helo on the Way";

				};

				_cache = _mhq getvariable ["CTI_AMMO_CACHE",0];
				_mhq setvariable ["CTI_AMMO_CACHE",_cache+(_resup select 1)];
				
			};

		};

		

	};
	case "limited":{
		player sideChat format ["Economy %1: Initiated",_econ];
		_mhq setvariable ["CTI_FUNDS",(_init select 0), true];
		_mhq setvariable ["CTI_FUEL_MAX",(_init select 1), true];
	};
	case default{
		player sideChat "ECONOMY NOT INITIATED";
	};
};

if(true)exitwith{};