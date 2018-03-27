/*

	purchaseunit.sqf

	purchase a unit from a factory
	
*/
//////////////////////////////////////////////////////////////////////////////

private ["_classname", "_factory", "_seed", "_team", "_veh_infos","_class","_crew"];

_classname = _this select 0;
_factory = _this select 1;
_grp = _this select 2;
_veh_infos = _this select 3;
_cost = _this select 4;

_faction = (leader _grp) getVariable "CTI_PLAYER_FACTION";
_class = _faction call define_force_classnames;

_safepos = [getpos _factory, 12, 35, 5, 0, 10, 0] call BIS_fnc_findSafePos;

_seed = random 10000;

_queue = _factory getVariable "CTI_FACTORY_QUEUE";

if isNil{_queue} then {
	hint format ["factory queue : %1",[_seed]];
	_factory setVariable ["CTI_FACTORY_QUEUE",[_seed], true];
} else {
	_queue append [_seed];
	hint format ["factory queue : %1",_queue];
	_factory setVariable ["CTI_FACTORY_QUEUE", _queue, true];
};

while {true} do {
	sleep CTI_FACTORY_SLEEP + 5;

	_queue = _factory getVariable "CTI_FACTORY_QUEUE";
	hint format ["factory queue : %1",_queue];

	if isNil{_queue} exitwith{};
	if !(alive _factory) exitwith{};
	
	if (_queue select 0 == _seed) then {	
		if (_classname isKindOf "Man") then {
			_u = _grp createUnit [_classname, _safepos, [], 0, "NONE"];
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

			player sidechat format ["%1",_crew];

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
		};



		_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
		["UnitCreated",[_text]] remoteExec ["BIS_fnc_showNotification",_grp];
		sleep CTI_FACTORY_SLEEP;
		_queue deleteAt 0;
		_factory setVariable ["CTI_FACTORY_QUEUE",_queue, true];
	};

	if !(_seed in _queue) exitwith {};
};



if(true)exitwith{};