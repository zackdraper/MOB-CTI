/*

	find_locations.sqf

	Find and sort all locations to generate missions objectives.

	Locations can be defined in the editor with createLocations, if they are not inserted into the map already.

	Current location arrays:

		MOB_CTI_Locations_AllMajorCities: All proper cities with black names big and small
		MOB_CTI_Locations_MinorLocal: Small villages as well as remote regions or islands with buildings nearby
		MOB_CTI_Locations_Airports: Locations of airports (Altis needs them inserted specifically)
		MOB_CTI_Locations_Hills: Peaks of Mountains
	
*/
//////////////////////////////////////////////////////////////////////////////

_debug = false;

private ["_size"];

_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");

_markername = 0;


/*

allLocationTypes = [];

"allLocationTypes pushBack configName _x" configClasses (configFile >> "CfgLocationTypes");

{

	if (_debug) then {
		_markerstr = createMarker [format ["%1",_markername],locationPosition _x];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "hd_dot";
		_markername = _markername + 1;
	};
	

} forEach nearestLocations [[_size/2,_size/2], allLocationTypes, sqrt(2*((_size/2)^2)) ];

*/


// Find all cities and villages, A3 islands

_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");

MOB_CTI_Locations_AllMajorCities = [];
{MOB_CTI_Locations_AllMajorCities pushBack [_x,(_cost select 0)]} forEach nearestLocations [[_size/2,_size/2], ["NameCityCapital"], sqrt(2*((_size/2)^2)) ];

{MOB_CTI_Locations_AllMajorCities pushBack [_x,(_cost select 1)]} forEach nearestLocations [[_size/2,_size/2], ["NameCity"], sqrt(2*((_size/2)^2)) ];

{MOB_CTI_Locations_AllMajorCities pushBack [_x,(_cost select 2)]} forEach nearestLocations [[_size/2,_size/2], ["NameVillage"], sqrt(2*((_size/2)^2)) ];

{
	_objs = nearestObjects [locationPosition _x, ["House", "Building"], 100];
	
	if (count _objs > 5) then {
		MOB_CTI_Locations_AllMajorCities pushBack [_x, (_cost select 3)];
	};
		
} forEach nearestLocations [[_size/2,_size/2], ["NameLocal"], sqrt(2*((_size/2)^2)) ];

//player sidechat format ["%1",MOB_CTI_Locations_AllMajorCities];

// Find smaller objectives and make sure they are worth assaulting by building counts, A3 islands

MOB_CTI_Locations_MinorLocal = [];
{

	_objs = nearestObjects [locationPosition _x, ["House", "Building"], 200];

	
	if (count _objs > 2) then {
	
		if (_debug) then {
			_markerstr = createMarker [format ["%1",_markername], locationPosition _x];
			_markerstr setMarkerShape "ICON";
			_markerstr setMarkerType "hd_objective";
			_markerstr setMarkerColor "ColorRed";
			_markername = _markername + 1;
		};
	};
	
	MOB_CTI_Locations_MinorLocal pushBack _x;

} forEach nearestLocations [[_size/2,_size/2], ["NameLocal"], sqrt(2*((_size/2)^2)) ];

// find hill peaks

MOB_CTI_Locations_Hills = [];

{

	if (_debug) then {
		_markerstr = createMarker [format ["%1",_markername], locationPosition _x];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "hd_objective";
		_markerstr setMarkerColor "ColorGreen";
		_markername = _markername + 1;
	};	

	MOB_CTI_Locations_Hills pushBack _x;

} forEach nearestLocations [[_size/2,_size/2], ["Hill"], sqrt(2*((_size/2)^2)) ];

// find airports

MOB_CTI_Locations_Airports = [];

{

	if (_debug) then {
		_markerstr = createMarker [format ["%1",_markername], locationPosition _x];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "hd_objective";
		_markerstr setMarkerColor "ColorBlue";
		_markername = _markername + 1;
	};	

	MOB_CTI_Locations_Airports pushBack _x;

} forEach nearestLocations [[_size/2,_size/2], ["Airport"], sqrt(2*((_size/2)^2)) ];


if(true)exitwith{};