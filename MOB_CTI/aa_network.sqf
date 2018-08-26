/*

	aa_network.sqf

	Setup an AA network to defend the island

	Params:
		Faction
	
*/
/////////////////////////////////////////////////////////////////////////////////////////

<<<<<<< HEAD
private ["_crewclass","_aaclass"];

_faction = _this select 0;
_side = _this select 1;

_num = 5;
_numgrp = 3;
=======
_faction = _this select 0;

_num = 5;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
_i = 0;
_pos_last = [0,0,0];

_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
<<<<<<< HEAD
_center = getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition");

_class = _faction call define_force_classnames;

_aaclass =  [_class,0,"aa"] call read_twod_array_col;
_crewclass =  [_class,0,"crewman"] call read_twod_array_col;

_crewclass = _crewclass select 0; 

for [{_i=0}, {_i<(_num+1)}, {_i=_i+1}] do {

	_pos = [[_size/2-(_center select 0),_size/2-(_center select 1)], 0, _size, 15, 0, 0.2, 0] call BIS_fnc_findSafePos;
=======

while { _i != _num } do {

	_pos = [[_size/2,_size/2], 0, _size, 15, 0, 0.2, 0] call BIS_fnc_findSafePos;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

	if (!(_pos call issafezone) and ((_pos_last distance _pos) > 1000)) then {

		//Location Marker
<<<<<<< HEAD
		_markerstr = createMarkerLocal [("AA"+str _i),_pos];
		_markerstr setMarkerShapeLocal "ICON";
		_markerstr setMarkerTypeLocal "hd_dot";
		_markerstr setMarkerSizeLocal [0.7,0.7];
		_markerstr setMarkerColorLocal "ColorRed";
		_markerstr setMarkerTextLocal "AA Site";

		_grp = createGroup _side;

		
		for [{_j=0}, {_j<(_numgrp)}, {_j=_j+1}] do {
		
			_class = selectRandom _aaclass;

			_safepos = [_pos, 0, 35, 5, 0, 10, 0] call BIS_fnc_findSafePos;

			_veh = _class createVehicle _safepos;

			_u = _grp createUnit [_crewclass, _safepos, [], 0, "NONE"];

			_u moveinGunner _veh;

			_veh setDir (360/_numgrp)*_j;

		};

		_pos_last = _pos;

	};

=======
		_markerstr = createMarker [("AA"+str _i),_pos];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "hd_dot";
		_markerstr setMarkerSize [0.7,0.7];
		_markerstr setMarkerColor "ColorRed";
		_markerstr setMarkerText "AA Site";

		_pos_last = _pos;
		_i = _i + 1;
	};
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
};

if(true)exitwith{};