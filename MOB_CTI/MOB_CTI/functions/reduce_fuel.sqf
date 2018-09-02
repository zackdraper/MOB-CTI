/*

	reduce_fuel.sqf

	reduce fuel when vehicle is killed
	
*/
//////////////////////////////////////////////////////////////////////////////

_unit = _this select 0;

_mhq = player getvariable "CTI_PLAYER_MHQ";
_funds = _mhq getvariable "CTI_FUNDS";

_fuel = _unit getVariable "CTI_FUEL";

hint format ["%1",_fuel];

if !(alive _unit) then {

	_mhq setvariable ["CTI_FUNDS",[_funds select 0,_funds select 1,(_funds select 2)-(_fuel)], true];
};

if(true)exitwith{};