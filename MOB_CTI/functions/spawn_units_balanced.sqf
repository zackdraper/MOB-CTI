/*

	spawn_units_balanced.sqf

	spawn units given a predefind force weight and consumables
	
*/
//////////////////////////////////////////////////////////////////////////////

private ["_side","_faction","_forcetype","_consumable","_pos","_grp","_unit","_split","_lqsqd","_slclass","_slcost","_menclass","_mencost","_grplist","_leader","_selunit","_sel"];

_side = _this select 0;
_faction = _this select 1;
_forcetype = _this select 2;
_consumable = _this select 3;
_pos = _this select 4;

_grplist = [];

player sideChat "executed";

switch (_forcetype) do {
	case "infantry":{

		_split = _consumable/2;
		_lgsqd = 1200;
		_smsqd = 400;

		_slclass = [_faction,0,"sl"] call read_twod_array_col;
		_slcost = [_faction,1,"sl"] call read_twod_array_col;

		_slcost = _slcost apply {(_x select 0)+2*(_x select 2)};

		//player sideChat format ["%1",_slcost];

		_menclass = [_faction,0,"men"] call read_twod_array_col;
		_mencost = [_faction,1,"men"] call read_twod_array_col;

		_mencount = count _menclass;

		_costlist = _mencost apply {(_x select 0)+2*(_x select 2)};
			
		_class_x_cost = (_mencount call make_int_array) apply {[_costlist select _x,_menclass select _x]};
		_class_x_cost sort true;
		
		//player sideChat format ["%1",_class_x_cost];
				
		//player sideChat format ["%1",_menclass];

		if (_split > _lgsqd) then {
			_nsqds = floor (_split/_lgsqd);
				
			player sideChat format ["%1 number fo large squads",_nsqds];

			for [{_i=0}, {_i < _nsqds}, {_i=_i+1}] do {

				_pos = [_pos, 0, 150, 3, 0, -1, 0] call BIS_fnc_findSafePos;
   					
				_grp = createGroup _side;
				_grplist append [_grp];

				_leader = _grp createUnit [(_slclass select 0), _pos, [], 0, "NONE"];
				[_leader] join _grp;
<<<<<<< HEAD
				sleep 1;
=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

				for [{_c=(_slcost select 0)}, {_c < _lgsqd}, {_c=_c+(_selunit select 0)}] do {
							
					_num = floor random [0,2,_mencount];

					_selunit = _class_x_cost select _num;																			

					_unit = _grp createUnit [(_selunit select 1), _pos, [], 0, "NONE"];
					[_unit] join _grp;
<<<<<<< HEAD
					sleep 1;
=======
						
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
				};
			};		

			_nsqds = floor ((_consumable-(_nsqds*_lgsqd))/_smsqd);

			player sideChat format ["%1 number fo small squads",_nsqds];

			for [{_i=0}, {_i < _nsqds}, {_i=_i+1}] do {

				_pos = [_pos, 0, 150, 3, 0, -1, 0] call BIS_fnc_findSafePos;
   				
				_grp = createGroup _side;
				_grplist append [_grp];

				_leader = _grp createUnit [(_slclass select 0), _pos, [], 0, "NONE"];
				[_leader] join _grp;
<<<<<<< HEAD
				sleep 1;
=======

>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
				for [{_c=(_slcost select 0)}, {_c < _smsqd}, {_c=_c+(_selunit select 0)}] do {
							
					_num = floor random [0,2,_mencount];

					_selunit = _class_x_cost select _num;																				

					_unit = _grp createUnit [(_selunit select 1), _pos, [], 0, "NONE"];
					[_unit] join _grp;
<<<<<<< HEAD
					sleep 1;
=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

				};
			};

		} else {
				
			_nsqds = floor (_consumable/_smsqd);

			player sideChat format ["%1 number fo small squads",_nsqds];

			for [{_i=0}, {_i < _nsqds}, {_i=_i+1}] do {

				_pos = [_pos, 0, 150, 3, 0, -1, 0] call BIS_fnc_findSafePos;
   				
				_grp = createGroup _side;
				_grplist append [_grp];

				_leader = _grp createUnit [(_slclass select 0), _pos, [], 0, "NONE"];
				[_leader] join _grp;
<<<<<<< HEAD
				sleep 1;
=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

				for [{_c=(_slcost select 0)}, {_c < _smsqd}, {_c=_c+(_selunit select 0)}] do {
							
					_num = floor random [0,2,_mencount];

					_selunit = _class_x_cost select _num;																				

					_unit = _grp createUnit [(_selunit select 1), _pos, [], 0, "NONE"];
					[_unit] join _grp;
<<<<<<< HEAD
					sleep 1;
				};	
=======

				};
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
			};

		};
		
	};	
	case "light":{

		_split = (_consumable)/3;
		_smsqd = 400;

		_slclass = [_faction,0,"sl"] call read_twod_array_col;
		_slcost = [_faction,1,"sl"] call read_twod_array_col;

		_slcost = _slcost apply {(_x select 0)+2*(_x select 2)};

		//player sideChat format ["%1",_slcost];

		_lightclass = [_faction,0,"light"] call read_twod_array_col;
		_lightcost = [_faction,1,"light"] call read_twod_array_col;

		_lightcount = count _lightclass;

		_costlist = _lightcost apply {(_x select 0)+2*(_x select 1)+2*(_x select 2)};
			
		_class_x_cost = (_lightcount call make_int_array) apply {[_costlist select _x,_lightclass select _x]};
		_class_x_cost sort true;

		for [{_spent=0}, {_spent < _split}, {_spent=_spent+(_sel select 0)}] do {

			_num = floor random _lightcount;

			_sel = _class_x_cost select _num;	

<<<<<<< HEAD
			_pos = [_pos, 0, 150, 7, 0, -1, 0] call BIS_fnc_findSafePos;
=======
			_pos = [_pos, 0, 150, 3, 0, -1, 0] call BIS_fnc_findSafePos;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

			_return = [_pos, 180, (_sel select 1), _side] call BIS_fnc_spawnvehicle;

			_grplist append [_return select 2];		 

		};

		_menclass = [_faction,0,"men"] call read_twod_array_col;
		_mencost = [_faction,1,"men"] call read_twod_array_col;

		_mencount = count _menclass;

		_costlist = _mencost apply {(_x select 0)+2*(_x select 2)};
			
		_class_x_cost = (_mencount call make_int_array) apply {[_costlist select _x,_menclass select _x]};
		_class_x_cost sort true;

		_nsqds = floor ((_consumable-_split)/_smsqd);

		player sideChat format ["%1 number fo small squads",_nsqds];

		for [{_i=0}, {_i < _nsqds}, {_i=_i+1}] do {

			_pos = [_pos, 0, 150, 7, 0, -1, 0] call BIS_fnc_findSafePos;
   				
			_grp = createGroup _side;
			_grplist append [_grp];

			_leader = _grp createUnit [(_slclass select 0), _pos, [], 0, "NONE"];
			[_leader] join _grp;
<<<<<<< HEAD
			sleep 1;
=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

			for [{_c=(_slcost select 0)}, {_c < _smsqd}, {_c=_c+(_selunit select 0)}] do {
							
				_num = floor random [0,2,_mencount];

				_selunit = _class_x_cost select _num;																				

				_unit = _grp createUnit [(_selunit select 1), _pos, [], 0, "NONE"];
				[_unit] join _grp;
<<<<<<< HEAD
				sleep 1;
=======

>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
			};
		};
	};
	case "heavy":{

		_split = (_consumable)/2;
		_smsqd = 400;

		_slclass = [_faction,0,"sl"] call read_twod_array_col;
		_slcost = [_faction,1,"sl"] call read_twod_array_col;

		_slcost = _slcost apply {(_x select 0)+2*(_x select 2)};

		//player sideChat format ["%1",_slcost];

		_heavyclass = [_faction,0,"heavy"] call read_twod_array_col;
		_heavycost = [_faction,1,"heavy"] call read_twod_array_col;

		_heavycount = count _heavyclass;

		_costlist = _heavycost apply {(_x select 0)+2*(_x select 1)+2*(_x select 2)};
			
		_class_x_cost = (_heavycount call make_int_array) apply {[_costlist select _x,_heavyclass select _x]};
		_class_x_cost sort true;

		for [{_spent=0}, {_spent < _split}, {_spent=_spent+(_sel select 0)}] do {

			_num = floor random _heavycount;

			_sel = _class_x_cost select _num;	

			_pos = [_pos, 0, 150, 7, 0, -1, 0] call BIS_fnc_findSafePos;

			_return = [_pos, 180, (_sel select 1), _side] call BIS_fnc_spawnvehicle;

			_grplist append [_return select 2];		 

		};

		_menclass = [_faction,0,"men"] call read_twod_array_col;
		_mencost = [_faction,1,"men"] call read_twod_array_col;

		_mencount = count _menclass;

		_costlist = _mencost apply {(_x select 0)+2*(_x select 2)};
			
		_class_x_cost = (_mencount call make_int_array) apply {[_costlist select _x,_menclass select _x]};
		_class_x_cost sort true;

		_nsqds = floor ((_consumable-_split)/_smsqd);

		player sideChat format ["%1 number fo small squads",_nsqds];

		for [{_i=0}, {_i < _nsqds}, {_i=_i+1}] do {

			_pos = [_pos, 0, 150, 3, 0, -1, 0] call BIS_fnc_findSafePos;
   				
			_grp = createGroup _side;
			_grplist append [_grp];

			_leader = _grp createUnit [(_slclass select 0), _pos, [], 0, "NONE"];
			[_leader] join _grp;
<<<<<<< HEAD
			sleep 1;
=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

			for [{_c=(_slcost select 0)}, {_c < _smsqd}, {_c=_c+(_selunit select 0)}] do {
							
				_num = floor random [0,2,_mencount];

				_selunit = _class_x_cost select _num;																				

				_unit = _grp createUnit [(_selunit select 1), _pos, [], 0, "NONE"];
				[_unit] join _grp;
<<<<<<< HEAD
				sleep 1;
=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

			};
		};
		
	};
	case "other":{
		
	};
	default{
		player sideChat "Bad Force Type";
		diag_log "spawn_units_balanced: Bad Force Type";
	};
};

//hint format ["%1",_grplist]; 

_grplist