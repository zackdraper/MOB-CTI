private ["_player"];

_player = _this select 0;

_get_player_side_groups = {
	params ["_player"];
	private _player_side = side _player;
	private _player_side_groups = [];
	{
		if (side _x == _player_side) then {
			_player_side_groups pushBack _x;
		};
	} forEach allGroups;
	_player_side_groups;
};

_get_group_markers = {
	params ["_groups"];
	private _group_markers=[];
	{
		private _leader = leader _x;
		private _position = getpos _leader;
		private _marker = createMarkerLocal [format["%1", _x], _position];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "b_inf";
		_marker setMarkerTextLocal roleDescription _leader;
		_group_markers pushBack [_x, _marker];
	} forEach _groups;
	_group_markers;
};

_update_group_marker = {
	params["_group", "_marker"];
	private _leader_vehicle = vehicle leader _group;
	private _marker_type = switch (true) do {
		case (_leader_vehicle isKindOf "Plane"): {"b_plane"};
		case (_leader_vehicle isKindOf "Helicopter"): {"b_air"};
		case (_leader_vehicle isKindOf "Tank"): {"b_armor"};
		case (_leader_vehicle isKindOf "Car"): {"b_recon"};
		case (_leader_vehicle isKindOf "Truck"): {"b_motor_inf"};
		case (_leader_vehicle isKindOf "Tracked_APC"): {"b_mech_inf"};
		default {"b_inf"};
	};
	_marker_type;
};

_player_side_groups = [_player] call _get_player_side_groups;
_player_side_group_markers = [_player_side_groups] call _get_group_markers;
while {true} do {
	{
		_group = _x select 0;
		_marker = _x select 1;
		_marker_type = [_group, _marker] call _update_group_marker;
		_marker setMarkerTypeLocal _marker_type;
		_marker setMarkerPosLocal getpos leader _group;
	} forEach _player_side_group_markers;
	sleep 5;
};

if(true)exitwith{};
