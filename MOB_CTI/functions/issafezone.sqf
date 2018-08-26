/*

	issafezone.sqf

	find out if its in a safe zone marker
	
*/
//////////////////////////////////////////////////////////////////////////////

_pos = _this;

_markers = allMapMarkers;

_markers = _markers apply {if ("safezone" isEqualTo ((_x splitstring "_") select 0)) then {_x} else {""}};
_markers = _markers - [""];

_inmarker = _markers apply {[_x, _pos] call BIS_fnc_inTrigger};


if (True in _inmarker) then {True} else {False};