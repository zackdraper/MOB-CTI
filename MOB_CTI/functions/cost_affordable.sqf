/*

	cost_affordable.sqf

	check if price tag is affordable given funds
	
*/
//////////////////////////////////////////////////////////////////////////////
private ["_return"];

_cost = _this select 0;
_funds = _this select 1;
_fmax = _this select 2;

if ( ( (_cost select 0) < (_funds select 0) ) && ( (_cost select 1) < (_funds select 1) ) && ( (_cost select 2) < (_fmax - (_funds select 2 ) ) ) ) then {
	_return = True;
} else {
	_return = False;
};

_return