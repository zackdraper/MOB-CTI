/*

	unit_cti_init.sqf

	start up a initial base either on land or on an aircraft carrier for a given faction
	
*/
//////////////////////////////////////////////////////////////////////////////

_mhq = _this select 0;
_faction = _this select 1;
_barracks = _this select 2;
_airfac = _this select 3;
_side = _this select 4;

_buildings = _mhq getVariable ["CTI_FACTORIES",[]];

//Give barracks an Arsenal
0 = ["AmmoboxInit",[_barracks,false]] spawn BIS_fnc_arsenal;
[_barracks,_faction] execVM "MOB_CTI\functions\arsenal_faction_weaponslist.sqf";

//Add marker and respawn
_markerstr = createMarker [format ["BuildingMkr%2%1",count _buildings,"BaseBarracks"],getpos _barracks];
[_markerstr,"ICON"] remoteExec ["setMarkerShape",_side];
[_markerstr, "b_inf"] remoteExec ["setMarkerType",_side];
[_markerstr, "ColorYellow"] remoteExec ["setMarkerColor",_side];

_markerstr = createMarker [format ["BuildingMkr%2%1",count _buildings,"BaseAirFac"],getpos _airfac];
[_markerstr,"ICON"] remoteExec ["setMarkerShape",_side];
[_markerstr, "b_air"] remoteExec ["setMarkerType",_side];
[_markerstr, "ColorYellow"] remoteExec ["setMarkerColor",_side];

[_side,getpos _barracks,"Barracks"] call BIS_fnc_addRespawnPosition;
[_side,getpos _airfac,"Aircraft Factory"] call BIS_fnc_addRespawnPosition;

//Add to buildings list

_barracks setVariable ["CTI_FACTORY_TYPE", "Barracks", true];
_airfac setVariable ["CTI_FACTORY_TYPE", "Aircraft Factory", true];

_buildings append [_barracks,_airfac];
_mhq setVariable ["CTI_FACTORIES", _buildings, true];

if(true)exitwith{};