/*

	veh_lock.sqf

	locks/unlocks a vehicle
	
*/
//////////////////////////////////////////////////////////////////////////////

_veh = _this select 0;

if (locked _veh == 2) then {
	_veh lock False;
} else {
	_veh lock True;
};

if(true)exitwith{};