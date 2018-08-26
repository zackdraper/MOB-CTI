/*

	location_trigger_condition.sqf

	create boolean whether to activate a location trigger
	
*/
//////////////////////////////////////////////////////////////////////////////
_return = FASLE;
private ["_return"];

_thisList = _this select 0;
_thisTrig = _this select 1;

_location = nearestLocation [getpos _thisTrig,""];
_locside = side _location;

<<<<<<< HEAD
_sides = _thisList apply {
	if (_x isKindOf "Plane") then {
		_locside;
	} else {
		side _x;
	};
};
_fc = {_x isEqualTo _locsize} count _sides;
=======
_sides = _thisList apply {side _x};
_fc = {_x == _locsize} count _sides;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
_sides_present = _sides call BIS_fnc_consolidateArray;

{
	if ([_locside, _x select 0] call BIS_fnc_sideIsEnemy) then { 
		_return = TRUE;
	};
<<<<<<< HEAD
=======
	
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
} forEach _sides_present;

_return