/*

	sort_service_list.sqf

	create the service vehicle list for a given faction
	
*/
//////////////////////////////////////////////////////////////////////////////
_faction = _this;

_staticcost_r = [_faction,1,"repair"] call read_twod_array_col;
_staticclass_r = [_faction,0,"repair"] call read_twod_array_col;

_staticcost_f = [_faction,1,"fuel"] call read_twod_array_col;
_staticclass_f = [_faction,0,"fuel"] call read_twod_array_col;

_staticcost_a = [_faction,1,"ammo"] call read_twod_array_col;
_staticclass_a = [_faction,0,"ammo"] call read_twod_array_col;

_staticcost_m = [_faction,1,"medic"] call read_twod_array_col;
_staticclass_m = [_faction,0,"medic"] call read_twod_array_col;

_staticcost = [_staticcost_r select 0,_staticcost_f select 0,_staticcost_a select 0,_staticcost_m select 0];
_staticclass = [_staticclass_r select 0,_staticclass_f select 0,_staticclass_a select 0,_staticclass_m select 0];

//player sidechat format ["%1",_staticcost];
_return = [];

for [{_i=0}, {_i < (count _staticclass)}, {_i=_i+1}] do {

	_c = _staticclass select _i;

	_d = (configfile >> "CfgVehicles" >> _c >> "displayName") call BIS_fnc_getCfgData;

	_e = _staticcost select _i;
	
	_p = gettext (configfile >> "CfgVehicles" >> _c >> "editorPreview");
		
	_return append [[_d,_c, (_e select 0), (_e select 1), (_e select 2), _p]];
		
};

_return