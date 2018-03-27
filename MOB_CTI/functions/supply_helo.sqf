/*

	make_int_array.sqf

	read a faction array of units to find particular search pattern
	
*/
//////////////////////////////////////////////////////////////////////////////

_side = _this select 0;
_fac_fund = _this select 1;
_helo_class = _this select 2;
_pilot_class = _this select 3;
_pos = _this select 4;
_supplypoint = _this select 5;
_resup = _this select 6;
				
_helo = createVehicle [_helo_class, _pos, [], 0, "FLY"];
_helo setVehicleLock "LOCKED";
_grp = createGroup _side;
_pilot = _grp createUnit [_pilot_class, _pos, [], 0, "FLY"];
_pilot moveindriver _helo;
_pilot assignasdriver _helo;
			
_wp = _grp addWaypoint [getPos _supplypoint, 0];
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointType "MOVE";

sleep 3;

while { ( (alive _helo) && !(unitReady _helo) ) } do {
       sleep 2;
};

if (alive _helo) then {
       _helo land "GET IN";
};

sleep 3;

while { ( (alive _helo) && ((getposATL _helo select 2) > 1) ) } do {
       sleep 2;
};

sleep 3;

if (alive _helo) then {
	_funds = missionNamespace getvariable _fac_fund;
	_newfunds = [((_funds select 0) + (_resup select 0)),(_funds select 1),((_funds select 2) + (_resup select 1))];
	missionNamespace setvariable [_fac_fund,_newfunds,true];

	_wp2 = _grp addWaypoint [_pos, 0];
	_wp2 setWaypointBehaviour "CARELESS";
	_wp2 setWaypointCombatMode "BLUE";
	_wp2 setWaypointType "MOVE";

	_helo land "NONE";
};

sleep 3;

while { ( (alive _helo) && !(unitReady _helo) ) } do {
       sleep 2;
};

if (alive _helo) then {
	deleteVehicle _helo;
	deleteVehicle _pilot;
};

if(true)exitwith{};