/*

	capture_nearby_location.sqf

	captures a location that is near a group of units
	
*/
//////////////////////////////////////////////////////////////////////////////
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
			
		};
	};

	sleep 15;

};

if (true) exitwith {};