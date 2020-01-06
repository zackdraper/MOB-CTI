/*

	purchaseunit.sqf

	purchase a unit from a factory
	
*/
//////////////////////////////////////////////////////////////////////////////

private ["_classname", "_factory", "_seed", "_team", "_veh_infos","_class","_crew","_safepos","_display"];

_classname = _this select 0;
_factory = _this select 1;
_grp = _this select 2;
_veh_infos = _this select 3;
_cost = _this select 4;
if (count _this > 5) then {_display = _this select 5} else {_display = ""};

_faction = (leader _grp) getVariable "CTI_PLAYER_FACTION";
_class = _faction call define_force_classnames;

_pos = getposATL _factory;
_dir = getDir _factory;
//hint format ["%1 : %2",_pos,_safepos];
if (surfaceIsWater _pos) then {
	_dir = getdir _factory;

	_safepos = [(_pos select 0)-30*sin(_dir),(_pos select 1)-30*cos(_dir),(_pos select 2)+3];
		
	//Pre-ARMA update fix
	//_poszS = (getposASL _factory) select 2;
	//_test = "HeliHEmpty" createVehicle _safepos;
	//_poszS2 = (getposASL _test) select 2;
	//deleteVehicle _test;
	//_test = nil;
	//_safepos = [(_pos select 0)-30*sin(_dir),(_pos select 1)-30*cos(_dir),(_poszS-_poszS2)+0.5];

	//hint format ["WATER POS: %1 : %2",_pos,_safepos];

} else {
	_safepos = [_pos, 12, 35, 5, 0, 10, 0] call BIS_fnc_findSafePos;
	_safepos append [0];
}; 

_seed = random 10000;

_queue = _factory getVariable "CTI_FACTORY_QUEUE";
_queue_str = _factory getVariable "CTI_FACTORY_QUEUE_STR";

if isNil{_queue} then {
	//hint format ["factory queue : %1",[_seed]];
	_factory setVariable ["CTI_FACTORY_QUEUE",[_seed], true];
} else {
	_queue append [_seed];
	//hint format ["factory queue : %1",_queue];
	_factory setVariable ["CTI_FACTORY_QUEUE", _queue, true];
};

if isNil{_queue} then {
	_factory setVariable ["CTI_FACTORY_QUEUE_STR",[_display], true];
} else {
	_queue_str append [_display];
	_factory setVariable ["CTI_FACTORY_QUEUE_STR", _queue_str, true];
};

_queue_str = _factory getVariable "CTI_FACTORY_QUEUE_STR";

while {true} do {
	sleep CTI_FACTORY_SLEEP + 5;

	_queue = _factory getVariable "CTI_FACTORY_QUEUE";
	_queue_str = _factory getVariable "CTI_FACTORY_QUEUE_STR";
	//hint format ["factory queue : %1",_queue];

	if isNil{_queue} exitwith{};
	if !(alive _factory) exitwith{};
	
	if (_queue select 0 == _seed) then {	
		if (_classname isKindOf "Man") then {
			_u = _grp createUnit [_classname, _safepos, [], 0, "NONE"];
			_u setposATL _safepos;
			[_u] join _grp;
			
		} else {
			_crew = "";
			switch (true) do {
				case(_classname isKindOf "Tank"):{
					_crew = ([_class,0,"crewman"] call read_twod_array_col) select 0;
				};
				case(_classname isKindOf "Air"):{
					_crew = ([_class,0,"pilot"] call read_twod_array_col) select 0;
				};
				default{
					_crew = ([_class,0,"men"] call read_twod_array_col) select 0;
				};
			};

			_veh = createVehicle [_classname, _safepos, [], 0, "NONE"];
			_veh setDir (_dir - 90);

			//player sidechat format ["%1",_crew];

			if (_veh_infos select 0) then {
				_u = _grp createUnit [_crew, _safepos, [], 0, "NONE"];
				[_u] join _grp;
				_u assignAsDriver _veh;
				_u moveinDriver _veh;
				if (vehicle _u != _veh) then {deleteVehicle _u};
			};

			if (_veh_infos select 1) then {
				_u = _grp createUnit [_crew, _safepos, [], 0, "NONE"];
				[_u] join _grp;
				_u assignAsGunner _veh;
				_u moveinGunner _veh;
				if (vehicle _u != _veh) then {deleteVehicle _u};
			};

			if (_veh_infos select 2) then {
				_u = _grp createUnit [_crew, _safepos, [], 0, "NONE"];
				[_u] join _grp;
				_u assignAsCommander _veh;
				_u moveinCommander _veh;
				if (vehicle _u != _veh) then {deleteVehicle _u};
			};

			if (_veh_infos select 3) then {

			};

			if (_veh_infos select 4) then {

				_veh lock True;

			};

			_veh addAction ["<t color='#FF0000'>Lock</t>","MOB_CTI\functions\veh_lock.sqf",[],99,false,false,""];
			
			_fuel = _cost select 2;
			_veh setVariable ["CTI_FUEL",_fuel];
			
			_veh addMPEventHandler ["MPKilled",reduce_fuel];	
			_veh enableRopeAttach true;
			
			(driver _veh) doMove (getpos leader _grp);
			_grp addVehicle _veh;
			
			if (_veh isKindOf "Air") then {
				_add = _veh spawn GOM_fnc_addAircraftLoadoutToObject;
			};
		};



		_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
		["UnitCreated",[_text]] remoteExec ["BIS_fnc_showNotification",_grp];
		sleep CTI_FACTORY_SLEEP;
		_queue deleteAt 0;
		_queue_str deleteAt 0;
		_factory setVariable ["CTI_FACTORY_QUEUE",_queue, true];
	};

	if !(_seed in _queue) exitwith {};
};



if(true)exitwith{};