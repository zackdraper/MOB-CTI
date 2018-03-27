/*

	sort_infantry_list.sqf

	create the infantry list for a given faction
	
*/
//////////////////////////////////////////////////////////////////////////////
_faction = _this;

_staticcost = [_faction,1,"men"] call read_twod_array_col;

_staticclass = [_faction,0,"men"] call read_twod_array_col;

_return = [];

for [{_i=0}, {_i < (count _staticclass)}, {_i=_i+1}] do {

	_c = _staticclass select _i;

	_d = gettext (configfile >> "CfgVehicles" >> _c >> "displayName");

	_e = _staticcost select _i;
	
	_p = gettext (configfile >> "CfgVehicles" >> _c >> "editorPreview");
		
	_return append [[_d,_c, (_e select 0), (_e select 1), (_e select 2), _p]];
		
};

_return