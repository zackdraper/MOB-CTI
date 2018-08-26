/*

<<<<<<< HEAD
	supply_helo.sqf

	send supply helo to drop ammo supplies
=======
	make_int_array.sqf

	read a faction array of units to find particular search pattern
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
	
*/
//////////////////////////////////////////////////////////////////////////////

_side = _this select 0;
<<<<<<< HEAD
_mhq = _this select 1;
=======
_fac_fund = _this select 1;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
_helo_class = _this select 2;
_pilot_class = _this select 3;
_pos = _this select 4;
_supplypoint = _this select 5;
_resup = _this select 6;
<<<<<<< HEAD

_markerstr = createMarker ["SupplyMkr",_pos];
[_markerstr,"ICON"] remoteExec ["setMarkerShape",_side];
[_markerstr, "mil_start"] remoteExec ["setMarkerType",_side];
[_markerstr, "ColorGreen"] remoteExec ["setMarkerColor",_side];

_supply_pos = getPos _supplypoint;
				
_helo = createVehicle [_helo_class, _pos , [], 0, "FLY"];
_helo setVehicleLock "LOCKED";

_mhq setvariable ["CTI_SUPPLY_HELO",true];

_grp = createGroup _side;
_pilot = _grp createUnit [_pilot_class, _pos , [], 0, "FLY"];
_pilot moveindriver _helo;
_pilot assignasdriver _helo;
			
_wp = _grp addWaypoint [_supply_pos, 0];
=======
				
_helo = createVehicle [_helo_class, _pos, [], 0, "FLY"];
_helo setVehicleLock "LOCKED";
_grp = createGroup _side;
_pilot = _grp createUnit [_pilot_class, _pos, [], 0, "FLY"];
_pilot moveindriver _helo;
_pilot assignasdriver _helo;
			
_wp = _grp addWaypoint [getPos _supplypoint, 0];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
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
<<<<<<< HEAD
	_funds = _mhq getvariable "CTI_FUNDS";
	_resup = _mhq getvariable ["CTI_AMMO_CACHE",0];

	_newfunds = [(_funds select 0),(_funds select 1) + _resup,(_funds select 2)];
	diag_log _newfunds;
	_mhq setvariable ["CTI_FUNDS",_newfunds,true];
=======
	_funds = missionNamespace getvariable _fac_fund;
	_newfunds = [((_funds select 0) + (_resup select 0)),(_funds select 1),((_funds select 2) + (_resup select 1))];
	missionNamespace setvariable [_fac_fund,_newfunds,true];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

	_wp2 = _grp addWaypoint [_pos, 0];
	_wp2 setWaypointBehaviour "CARELESS";
	_wp2 setWaypointCombatMode "BLUE";
	_wp2 setWaypointType "MOVE";

	_helo land "NONE";
};

sleep 3;

while { ( (alive _helo) && !(unitReady _helo) ) } do {
<<<<<<< HEAD
       	sleep 2;
=======
       sleep 2;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
};

if (alive _helo) then {
	deleteVehicle _helo;
	deleteVehicle _pilot;
};

<<<<<<< HEAD
_mhq setvariable ["CTI_AMMO",0,true];
_mhq setvariable ["CTI_SUPPLY_HELO",false];
_markerstr remoteExec ["deleteMarker",_side];

if(true)exitwith{};
=======
if(true)exitwith{};
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
