/*

	sort_air_list.sqf

	create the aircraft list for a given faction
	
*/
//////////////////////////////////////////////////////////////////////////////
_faction = _this;

_staticcost = [_faction,1,"air"] call read_twod_array_col;

_staticclass = [_faction,0,"air"] call read_twod_array_col;

_return = [];

for [{_i=0}, {_i < (count _staticclass)}, {_i=_i+1}] do {

	_c = _staticclass select _i;

<<<<<<< HEAD
	_d = gettext (configfile >> "CfgVehicles" >> _c >> "displayName");
=======
	_d = [(configfile >> "CfgVehicles" >> _c >> "displayName"),1,false] call BIS_fnc_returnChildren;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

	_e = _staticcost select _i;
	
	_p = gettext (configfile >> "CfgVehicles" >> _c >> "editorPreview");
		
	_return append [[_d,_c, (_e select 0), (_e select 1), (_e select 2), _p]];
		
};

_return