/*

	random_start_position.sqf

	randomly place a factions MHQ and units
	
*/
//////////////////////////////////////////////////////////////////////////////
private ["_l1","_l2","_mhq2","_faction2","_side2","_second"];

_mhq = _this select 0;
_faction = _this select 1;
_side = _this select 2;

_load_game = "load_game" call BIS_fnc_getParamValue;

if (_load_game == 1) exitwith {
	[_faction,_mhq] spawn {
		{
			_fac = _x getVariable "CTI_PLAYER_FACTION";
			if (_fac == (_this select 0)) then {
				_spawnpos = [getPos (_this select 1), 5, 20, 10, 0, 5, 0] call BIS_fnc_findSafePos;
				[_x,_spawnpos] remoteExec ["setPos",_x];
			};
		} forEach playableUnits;
	};
};

_second = False;
if (count _this > 3) then {
	_mhq2 = _this select 3;
	_faction2 = _this select 4;
	_side2 = _this select 5;
	_second = True;
};

_minimum = 3000;

_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
//_radius = sqrt(2*((_size/2)^2));
_radius = sqrt( ((_size/2)^2) );
_center = getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition");
_cx = _center select 0;
_cy = _center select 1;

_spawnpos = [[(_size/2)-_cx,(_size/2)-_cy], 0, _radius, 10, 0, 20, 0] call BIS_fnc_findSafePos;
_mhq setPos _spawnpos;

_markerstr = createMarkerLocal ["markernametest1",_spawnpos];
_markerstr setMarkerShapeLocal "ICON";
_markerstr setMarkerTypeLocal "mil_objective";
_markerstr setMarkerColorLocal "ColorRed";

if (count _spawnpos < 3) then {_spawnpos append [0]};

//Side #1

_mname = switch (_side) do {
	case west: {"respawn_west"};
	case east: {"respawn_east"};
	case resistance: {"respawn_guerrila"};
	case civilian: {"respawn_civilian"};
};

_markerstr_res1 = createMarker [_mname,_spawnpos];
_markerstr_res1 setMarkerShape "ICON";
_markerstr_res1 setMarkerType "Empty";

//Going to assume heirarchy in light vehicles
_class = _faction call define_force_classnames;
_lightclass =  [_class,0,"light"] call read_twod_array_col;

_l1 = _lightclass select 0;
_l2 = _lightclass select 1;

[_faction,_spawnpos,_l1,_l2] spawn {

	//sleep 1;
	{
		_fac = _x getVariable "CTI_PLAYER_FACTION";
		if (_fac == _this select 0) then {
			_spawnpos = [_this select 1, 5, 20, 10, 0, 5, 0] call BIS_fnc_findSafePos;
			[_x,_spawnpos] remoteExec ["setPos",_x];
		};
	} forEach playableUnits;

	_safepos = [_this select 1, 5, 20, 10, 0, 5, 0] call BIS_fnc_findSafePos;
	_veh = (_this select 2) createVehicle _safepos;

	_safepos = [_this select 1, 5, 20, 10, 0, 5, 0] call BIS_fnc_findSafePos;
	_veh = (_this select 3) createVehicle _safepos;

};

//Side #2
if (_second) then {
	_spawnpos2 = [[(_size/2)-_cx,(_size/2)-_cy], 0, _radius, 10, 0, 20, 0, [[_spawnpos,_minimum]], [_center,[-1*_cx,-1*_cy,0],0], _center] call BIS_fnc_findSafePos;
	_mhq2 setPos _spawnpos2;

	//Test Markers

	_markerstr2 = createMarkerLocal ["markernametest2",_spawnpos2];
	_markerstr2 setMarkerShapeLocal "ICON";
	_markerstr2 setMarkerTypeLocal "mil_objective";
	_markerstr2 setMarkerColorLocal "ColorBlue";

	_mname2 = switch (_side2) do {
		case west: {"respawn_west"};
		case east: {"respawn_east"};
		case resistance: {"respawn_guerrila"};
		case civilian: {"respawn_civilian"};
	};

	_markerstr_res2 = createMarker [_mname2,_spawnpos2];
	_markerstr_res2 setMarkerShape "ICON";
	_markerstr_res2 setMarkerType "Empty";

	//Going to assume heirarchy in light vehicles
	_class = _faction2 call define_force_classnames;
	_lightclass =  [_class,0,"light"] call read_twod_array_col;

	_l1 = _lightclass select 0;
	_l2 = _lightclass select 1;

	[_faction2,_spawnpos2,_l1,_l2] spawn {

		//sleep 1;
		{
			_fac = _x getVariable "CTI_PLAYER_FACTION";
			if (_fac == _this select 0) then {
				_spawnpos = [_this select 1, 5, 20, 10, 0, 5, 0] call BIS_fnc_findSafePos;
				[_x,_spawnpos] remoteExec ["setPos",_x];
			};
		} forEach playableUnits;

		_safepos = [_this select 1, 5, 20, 10, 0, 5, 0] call BIS_fnc_findSafePos;
		_veh = (_this select 2) createVehicle _safepos;

		_safepos = [_this select 1, 5, 20, 10, 0, 5, 0] call BIS_fnc_findSafePos;
		_veh = (_this select 3) createVehicle _safepos;

	};
};

if(true)exitwith{};

