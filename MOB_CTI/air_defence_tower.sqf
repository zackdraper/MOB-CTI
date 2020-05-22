_tower = _this select 0;
_number_patrol = _this select 1;
_pilot = _this select 2;
_fighter = _this select 3;
_side = _this select 4;

_tower_pos = getpos _tower;
_tower_dir = getdir _tower;
_distance = 75;

_spawn_pos = [_distance * sin(_tower_dir) + (_tower_pos select 0), _distance * cos(_tower_dir) + (_tower_pos select 1), (_tower_pos select 2)];

spawnAirWing = {
	_spawn_pos = _this select 0;
	_fighter = _this select 1;
	_pilot = _this select 2;
	_side = _this select 3;
	_dir = _this select 4;

	_pos1 = [_spawn_pos, 0, 50, 15, 0, 20, 0] call BIS_fnc_findSafePos;
	_veh1 = createVehicle [_fighter, _pos1, [], 0, "NONE"];
	_veh1 setDir _dir-90;
	_veh1 flyInHeight 700;
	
	_grp = createGroup _side;
	_p1 = _grp createUnit [_pilot, _spawn_pos, [], 0, "FORM"];
	_p1 moveinDriver _veh1;
	
	_grp;
};

createCAP = {
	_grp = _this select 0;
	_tower_pos = _this select 1;
	
	_radius = 3000;
	_pos1 = [_tower_pos select 0,(_tower_pos select 1)+_radius];
	_pos2 = [(_tower_pos select 0)-_radius,(_tower_pos select 1)];
	_pos3 = [_tower_pos select 0,(_tower_pos select 1)-_radius];
	_pos4 = [(_tower_pos select 0)+_radius,(_tower_pos select 1)];
	
	_wp1 = _grp addWaypoint [_pos1, 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointFormation "DIAMOND";
	_wp1 setWaypointCombatMode "RED";
	_wp1 setWaypointCompletionRadius 300;
	
	_wp2 = _grp addWaypoint [_pos2, 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointCompletionRadius 300;
	
	_wp3 = _grp addWaypoint [_pos3, 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointCompletionRadius 300;
	
	_wp4 = _grp addWaypoint [_pos4, 0];
	_wp4 setWaypointType "MOVE";
	_wp4 setWaypointCompletionRadius 300;
	
	_wp5 = _grp addWaypoint [_pos4, 0];
	_wp5 setWaypointType "CYCLE";
	_wp5 setWaypointCompletionRadius 300;
	
	//_markerstr = createMarkerLocal ["markername1",_pos1];
	//_markerstr setMarkerShapeLocal "ICON";
	//_markerstr setMarkerTypeLocal "mil_dot";
	//_markerstr = createMarkerLocal ["markername2",_pos2];
	//_markerstr setMarkerShapeLocal "ICON";
	//_markerstr setMarkerTypeLocal "mil_dot";
	//_markerstr = createMarkerLocal ["markername3",_pos3];
	//_markerstr setMarkerShapeLocal "ICON";
	//_markerstr setMarkerTypeLocal "mil_dot";
	//_markerstr = createMarkerLocal ["markername4",_pos4];
	//_markerstr setMarkerShapeLocal "ICON";
	//_markerstr setMarkerTypeLocal "mil_dot";
	
};

_markerstr = createMarkerLocal [str _tower, getpos _tower];
_markerstr setMarkerShapeLocal "ICON";
_markerstr setMarkerTypeLocal "o_air";
_markerstr setMarkerTextLocal "FW";
	
_grp = [_spawn_pos,_fighter,_pilot,_side,_tower_dir] call spawnAirWing;
[_grp,_tower_pos] call createCAP;
_number_patrol = _number_patrol - 1;

while {alive _tower} do {

	_alive_wing = {alive _x} count (units _grp);
	
	if ((_alive_wing < 1) and (_number_patrol > 0)) then {
		_grp = [_spawn_pos,_fighter,_pilot,_side,_tower_dir] call spawnAirWing;
		[_grp, _tower_pos] call createCAP;
		_number_patrol = _number_patrol - 1;
	};
	
	sleep 300;
};

if (true) exitWith {hint "Tower Destroyed"};


