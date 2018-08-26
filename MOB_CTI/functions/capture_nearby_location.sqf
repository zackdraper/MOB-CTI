/*

	capture_nearby_location.sqf

	captures a location that is near a group of units
	
*/
//////////////////////////////////////////////////////////////////////////////
<<<<<<< HEAD
private ["_unit","_side","_list","_list1","_list2","_logic","_cycle","_flag"];
_unit = _this select 0;
_side = side _unit;

_locations = _unit getVariable "MOB_CTI_Locations_AllMajorCities";

player sidechat "Capture Initiated";
sleep 5;
_cycle = 0;
while {alive _unit} do {

	_units = units (group _unit);
	
	_nearloc = _locations apply {[(getpos _unit) distance2D getpos (_x select 0),(_x select 0)]};
	_nearloc sort true;
	_nearlocdis = (_nearloc select 0) select 0;
	_nearloc = (_nearloc select 0) select 1;
	
	_logic = (getpos _nearloc) nearestObject "Logic";
	_flag = synchronizedObjects _logic;
	_flag = _flag select 0;

	//player sidechat format ["%1",_nearloc];

	if ((_unit distance _flag) < 75) then {
		if ([_side, side _nearloc] call BIS_fnc_sideIsEnemy) then {

			_list1 = (position _nearloc) nearEntities ["Man", 100];
			_list2 = (position _nearloc) nearEntities [["Car","Tank","Air"], 100];
			//hint format [" ----------- %1 ---------",_list1];

			_list2 = _list2 apply {crew _x};
			{_list1 append _x} forEach _list2;

			//player sidechat format ["Enemy Units: %1",count _list1];
			
			_list1 = _list1 apply {[_side, side _x] call BIS_fnc_sideIsEnemy};

			_list1 = {(_x)} count _list1;

			if (_unit == player) then {player sidechat format ["Enemy Units: %1",_list1]};
			
			if (_list1 < 3) then {
				if (_unit == player) then {player sidechat "CAPTURED LOCATION"};

				[_flag,_unit] spawn capture_town;
			};
			
=======
private ["_unit","_side","_list","_list1","_list2","_logic","_cycle"];
_unit = _this select 0;
_side = side _unit;

player sidechat "Capture Initiated";

waitUntil {!(isNil "MOB_CTI_Locations_AllMajorCities")};
_cycle = 0;
while {alive _unit} do {

	_nearloc1 = nearestLocation [getpos _unit, "NameCityCapital"];
	_nearloc2 = nearestLocation [getpos _unit, "NameVillage"];
	_nearloc3 = nearestLocation [getpos _unit, "NameCity"];
	_nearloc4 = nearestLocation [getpos _unit, "NameLocal"];
	_nearloc = [_nearloc1,_nearloc2,_nearloc3,_nearloc4];

	_nearloc = _nearloc apply {[(getpos _unit) distance2D (getpos _x),_x]};

	_nearloc sort true;
	_nearlocdis = (_nearloc select 0) select 0;
	_nearloc = (_nearloc select 0) select 1;

	player sidechat format ["%1",name _nearloc];

	if !(isNull _nearloc) then {
		
		_inlist = MOB_CTI_Locations_AllMajorCities apply { if ((_x select 0) == _nearloc) then {1} else {0}};
		_inlist = {_x == 1} count _inlist;

		if (_inlist > 0) then {
			//player sidechat format ["%1",_nearloc];
			//player sidechat format ["Near location distance: %1",_nearlocdis];
			if ([_side, side _nearloc] call BIS_fnc_sideIsEnemy) then {
				if ( _nearlocdis  < 100 ) then {
					sleep 30;
					_list1 = (position _nearloc) nearEntities ["Man", 350];
					_list2 = (position _nearloc) nearEntities [["Car","Tank","Air"], 350];
					//hint format [" ----------- %1 ---------",_list1];

					_list2 = _list2 apply {crew _x};
					{_list1 append _x} forEach _list2;

					//player sidechat format ["Enemy Units: %1",count _list1];
				
					_list1 = _list1 apply {[_side, side _x] call BIS_fnc_sideIsEnemy};

					_list1 = {(_x)} count _list1;

					//player sidechat format ["Enemy Units: %1",_list1];
					if (_list1 < 1) then {
						player sidechat "CAPTURED LOCATION";
						_logic = (getpos _nearloc) nearestObject "Logic";
						_flag = synchronizedObjects _logic;
						_flag = _flag select 0;
						[_flag,_unit] spawn capture_town; 
					};
				};
			};
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
		};
	};

	sleep 15;

};

if (true) exitwith {};