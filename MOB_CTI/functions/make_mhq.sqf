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

_pos = getPosATL _mhq;

_mhq_veh = (_class select 0) createVehicle _pos;
_mhq_veh setPosATL _pos;
_mhq_veh enableRopeAttach true;

//_mhq attachTo [_mhq_veh,[0,0,0]];

//R3F Logistics integration
_mhq_veh setVariable ["R3F_LOG_disabled", true, true];

//_mhq_veh addAction ["<t color='#FF0000'>Lock</t>","MOB_CTI\functions\veh_lock.sqf",[],99,false,false,""];

if (_air) then {
	//_mhq_veh setMass 100;
	[_mhq_veh,100] remoteExec ["setMass"];
};

_mhq_veh addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
	
	_dam = _unit getVariable ["CTI_MHQ_DAMAGE",0];
	_dam = _dam +_damage;
	
	if (!(alive _unit) || (_dam > 20)) then {

		_mhq = _unit getVariable "CTI_MHQ";
		_side = _mhq getVariable "CTI_SIDE";
		["MHQDestroyed",[_side]] remoteExec ["BIS_fnc_showNotification",_side];
		
		_unit removeAllEventHandlers "HandleDamage";
	};
	//player sidechat str _dam;
	_unit setVariable ["CTI_MHQ_DAMAGE",_dam];
}];

_mhq_veh setVariable ["CTI_MHQ",_mhq,true];
_mhq setVariable ["CTI_MHQ_VEH",_mhq_veh,true];

_mhq_veh;