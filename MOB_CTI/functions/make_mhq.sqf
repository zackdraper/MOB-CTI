/*

	make_mhq.sqf

	create new mhq based on faction
	
*/
//////////////////////////////////////////////////////////////////////////////
private ["_class","_mhq_veh"];


_mhq = _this select 0;
_faction = _this select 1;
_air = _this select 2;

_list = _faction call define_force_classnames;

if (_air) then {
	_class = [_list,0,"mhq_air"] call read_twod_array_col;
} else {
	_class = [_list,0,"mhq"] call read_twod_array_col;
};

_mhq enableRopeAttach true;
_pos = getPosATL _mhq;

_mhq_veh = (_class select 0) createVehicle _pos;
_mhq_veh setPosATL _pos;

_mhq attachTo [_mhq_veh,[0,0,0]];

//R3F Logistics integration
_mhq_veh setVariable ["R3F_LOG_disabled", true, true];

//_mhq_veh addAction ["<t color='#FF0000'>Lock</t>","MOB_CTI\functions\veh_lock.sqf",[],99,false,false,""];

if (_air) then {
	//_mhq_veh setMass 100;
	[_mhq_veh,100] remoteExec ["setMass"];
};

_mhq setVariable ["CTI_MHQ_VEH",_mhq_veh,true];

_mhq_veh;