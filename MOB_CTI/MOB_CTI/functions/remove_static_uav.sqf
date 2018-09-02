/*

	remove_static_uav.sqf

	removes UAVs from player terminal
	
*/
//////////////////////////////////////////////////////////////////////////////

_units = _this;

_staticuav = [liberty_1,liberty_2,liberty_3,freedom_1,freedom_2,freedom_3,freedom_4,freedom_5,freedom_6,freedom_7];
_alive_staticuav = _staticuav apply {if !(alive _x) then {""} else {_x}};
_alive_staticuav = _alive_staticuav - [""];

for "_i" from 0 to (count _units)-1 do {
	_u = _units select _i;
	{_u disableUAVConnectability [_x,true] } forEach _staticuav;
};

if(true)exitwith{};