/*

	subtract_funds.sqf

	apply cost to funds pool
	
*/
//////////////////////////////////////////////////////////////////////////////
private ["_return"];

_mhq = _this select 0;
_cost = _this select 1;

_funds = _mhq getVariable "CTI_FUNDS";

_funds = [(_funds select 0)-(_cost select 0),(_funds select 1)-(_cost select 1),(_funds select 2)+(_cost select 2)];

_mhq setVariable ["CTI_FUNDS",_funds,true];

if (true) exitwith {};