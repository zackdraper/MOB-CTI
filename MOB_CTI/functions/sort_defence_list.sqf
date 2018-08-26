/*

	sort_defence_list.sqf

	create the defence structure list for a given faction
	
*/
//////////////////////////////////////////////////////////////////////////////
_faction = _this;

_staticcost = [_faction,1,"static"] call read_twod_array_col;

_staticclass = [_faction,0,"static"] call read_twod_array_col;

<<<<<<< HEAD
_staticinit = [_faction,2,"static"] call read_twod_array_col;

=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
_return = [];

for [{_i=0}, {_i < (count _staticclass)}, {_i=_i+1}] do {

	_c = _staticclass select _i;
	_d = gettext (configfile >> "CfgVehicles" >> _c >> "displayName");

	_e = _staticcost select _i;
	_m = _e select 0;		
	_a = _e select 2;
<<<<<<< HEAD
	_s = _staticinit select _i;
		
	_return append [[_d,_c,_m,_a,_s]];
=======
		
	_return append [[_d,_c,_m,_a]];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
		
};

_return