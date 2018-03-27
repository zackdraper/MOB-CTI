/*

	random_start_position.sqf

	randomly place a factions MHQ and units
	
*/
//////////////////////////////////////////////////////////////////////////////
_mhq = _this select 0;
_faction = _this select 1;
_side = _this select 2;

_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
//_radius = sqrt(2*((_size/2)^2));
_radius = _size*0.4;
_center = [_size/2,_size/2];

_spawnpos = [_center, 0, _radius, 10, 0, 20, 0] call BIS_fnc_findSafePos;

_mhq setPos _spawnpos;

_mname = switch (_side) do {
	case west: {"respawn_west"};
	case east: {"respawn_east"};
	case resistance: {"respawn_guerrila"};
	case civilian: {"respawn_civilian"};
};

_markerstr = createMarker [_mname,_spawnpos];
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType "Empty";

[_faction,_spawnpos] spawn {
	{
		_fac = _x getVariable "CTI_PLAYER_FACTION";
		if (_fac == _this select 0) then {
			_spawnpos = [_this select 1, 5, 20, 10, 0, 0.5, 0] call BIS_fnc_findSafePos;
			[_x,_spawnpos] remoteExec ["setPos",_x];
		};
	} forEach playableUnits;
};

if(true)exitwith{};

