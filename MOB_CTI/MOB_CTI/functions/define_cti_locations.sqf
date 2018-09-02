/*

	define_cti_locations.sqf

	define all CTI locations for economy and capture
	
*/
//////////////////////////////////////////////////////////////////////////////
private ["_size","_pos","_cost"];

_cost = _this select 0;

player sidechat format ["%1 : cock",_cost];

_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");

_MOB_CTI_Locations_AllMajorCities = [];

{_MOB_CTI_Locations_AllMajorCities pushBack [_x,(_cost select 0)]} forEach nearestLocations [[_size/2,_size/2], ["NameCityCapital"], sqrt(2*((_size/2)^2)) ];

{_MOB_CTI_Locations_AllMajorCities pushBack [_x,(_cost select 1)]} forEach nearestLocations [[_size/2,_size/2], ["NameCity"], sqrt(2*((_size/2)^2)) ];

{_MOB_CTI_Locations_AllMajorCities pushBack [_x,(_cost select 2)]} forEach nearestLocations [[_size/2,_size/2], ["NameVillage"], sqrt(2*((_size/2)^2)) ];

{
	_objs = nearestObjects [locationPosition _x, ["House", "Building"], 250];
	
	if (count _objs > 4) then {
		_MOB_CTI_Locations_AllMajorCities pushBack [_x, (_cost select 3)];
	};
		
} forEach nearestLocations [[_size/2,_size/2], ["NameLocal"], sqrt(2*((_size/2)^2)) ];

//if (_pos call issafezone) then {
//	player sidechat format ["%1 : cock",_i];
//	_MOB_CTI_Locations_AllMajorCities set [_i,""];
//}		
//_pos = getpos _location;
//(_MOB_CTI_Locations_AllMajorCities select _i) select 0

_MOB_CTI_Locations_AllMajorCities = _MOB_CTI_Locations_AllMajorCities apply { if ( (getpos (_x select 0)) call issafezone) then {""} else {_x} };
player sidechat format ["%1 : cock",_MOB_CTI_Locations_AllMajorCities];

_MOB_CTI_Locations_AllMajorCities = _MOB_CTI_Locations_AllMajorCities - [""];

_MOB_CTI_Locations_AllMajorCities;