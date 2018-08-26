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

_sides = _thisList apply {
	if (_x isKindOf "Plane") then {
		_locside;
	} else {
		side _x;
	};
};
_fc = {_x isEqualTo _locsize} count _sides;
_sides_present = _sides call BIS_fnc_consolidateArray;

{
	if ([_locside, _x select 0] call BIS_fnc_sideIsEnemy) then { 
		_return = TRUE;
	};
} forEach _sides_present;

_return