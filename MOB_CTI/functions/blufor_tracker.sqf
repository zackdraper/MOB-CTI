private ["_player","_side","_grps","_grps_mkrs"];

_player = _this select 0;

_side = side _player;

_grps = [];
{	
	if (side _x == _side) then {
		_grps pushBack _x;
	};
	
} forEach allGroups;

//diag_log ["BLUFOR TRACKER:",_grps];

_grps_mkrs=[];
{
	_ldr = leader _x;
	_pos = getpos _ldr;
	_mkr = createMarkerLocal [format["%1",_x],_pos];
	_mkr setMarkerShapeLocal "ICON";
	_mkr setMarkerTypeLocal "b_inf";
<<<<<<< HEAD
	//_mkr setMarkerTextLocal groupId _x;
	_mkr setMarkerTextLocal roleDescription leader _x;
=======
	_mkr setMarkerTextLocal groupId _x;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

	_grps_mkrs pushBack [_x,_mkr];

} forEach _grps;

//diag_log ["BLUFOR TRACKER:",_grps_mkrs];

while {true} do {

	{

		_mkr = _x select 1;
		_grp = _x select 0;

		_veh = vehicle leader _grp;

		_mkrtype = switch (true) do {
			case (_veh isKindOf "Plane"):{"b_plane"};
			case (_veh isKindOf "Helicopter"):{"b_air"};	
			case (_veh isKindOf "Tank"):{"b_armor"};
			case (_veh isKindOf "Car"):{"b_recon"};
			case (_veh isKindOf "Truck"):{"b_motor_inf"};
			case (_veh isKindOf "Tracked_APC"):{"b_mech_inf"};
			default {"b_inf"};
		};

		_mkr setMarkerTypeLocal _mkrtype;
		_mkr setMarkerPos getpos leader _grp;

	} forEach _grps_mkrs;

	sleep 5;

};

if(true)exitwith{};