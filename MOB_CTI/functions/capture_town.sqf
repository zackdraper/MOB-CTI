/*

	capture_town.sqf

	take over a location
	
*/
//////////////////////////////////////////////////////////////////////////////

private ["_markerstr"];

_flag = _this select 0;
_man = _this select 1;

_side = side _man;

//Change faction and side

_location = nearestLocation [getpos _flag,""];

if (side _location == _side) exitwith {};

_location setside _side;

_faction = _man getVariable "CTI_PLAYER_FACTION";

_flag setVariable ["CTI_LOCATION_FACTION",_faction,true];


// Change Flag
_class = _faction call define_force_classnames;

_flagTexture = [_class,0,"flag"] call read_twod_array_col;

[_flag,(_flagTexture select 0)] remoteExec ["setFlagTexture",_flag];

_flag setVariable ["CTI_OCCUPYING_GROUPS",[],true];


//Change Marker

_markerstr = _flag getVariable ["CTI_LOCATION_MARKER",objNull];

switch (_side) do {
	case west:{[_markerstr, "ColorBlue"] remoteExec ["setMarkerColorLocal", _side, true]};
	case east:{[_markerstr, "ColorRed"] remoteExec ["setMarkerColorLocal", _side, true]};
	case resistance:{[_markerstr, "ColorGreen"] remoteExec ["setMarkerColorLocal", _side, true]};
	case civilian:{[_markerstr, "ColorYellow"] remoteExec ["setMarkerColorLocal", _side, true]};
};

["TownCapture",[text _location]] remoteExec ["BIS_fnc_showNotification", side player];

if(true)exitwith{};