/*

	cost_affordable.sqf

	check if price tag is affordable given funds
	
*/
//////////////////////////////////////////////////////////////////////////////
private ["_return"];

_cost = _this select 0;
_funds = _this select 1;
_fmax = _this select 2;

<<<<<<< HEAD
if ( ( (_cost select 0) <= (_funds select 0) ) && ( (_cost select 1) <= (_funds select 1) ) && ( (_cost select 2) <= (_fmax  - (_funds select 2 )) ) ) then {
=======
if ( ( (_cost select 0) < (_funds select 0) ) && ( (_cost select 1) < (_funds select 1) ) && ( (_cost select 2) < (_fmax - (_funds select 2 ) ) ) ) then {
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
	_return = True;
} else {
	_return = False;
};

_return