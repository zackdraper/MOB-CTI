/*
//////////////////////////////////////////////////////////////////////////////
//	island_spawner.sqf
//	
//	Spawn resisting forces across entire island
*/
//////////////////////////////////////////////////////////////////////////////

private ["_trg","_locations"];

_side = _this select 0;
_faction = _this select 1;
_locations = _this select 2;

_logicCenter = createCenter sideLogic;
_logicGroup = createGroup _logicCenter;

_side2 = _side;
if (_side == resistance) then {_side2 = "resistance"};

//player sidechat format ["%1",_locations];

_class = _faction call define_force_classnames;
_flagTexture = [_class,0,"flag"] call read_twod_array_col;

for [{_i=0}, {_i< count _locations}, {_i=_i+1}] do {

	//Location Properties	
	_location = (_locations select _i) select 0;

	_pos = getpos _location;
	
	_cost = (_locations select _i) select 1; 
	_size = size _location;	
	[_location,_side] remoteExec ["setSide",0];

	//Flag Pole
	_dis = if (surfaceIsWater _pos) then {150} else {15}; 

	_kRandSpawnPos = [_pos, 0, _dis, 0.2, 0, 20, 0] call BIS_fnc_findSafePos;
	while {isOnRoad _kRandSpawnPos} do {
		_kRandSpawnPos = [_pos, 0, _dis, 0.2, 0, 20, 0] call BIS_fnc_findSafePos;
	};

	// handle flag pos failure
	_flagPos = if (count _kRandSpawnPos > 2) then {_pos} else {_kRandSpawnPos};

	_flag = createVehicle ["Flag_FD_Orange_F",_flagPos,[],0,"NONE"];

	_logic = _logicGroup createUnit ["Logic", getpos _location, [], 0, "NONE"];

	_logic synchronizeObjectsAdd [_flag];

	_flag setFlagTexture (_flagTexture select 0);
	_str = "flag" + (str _i);

	//_flag setVehicleVarName _str;
	[_flag, _str] remoteExecCall ["setVehicleVarName", 0, True];
	
	//player sidechat format ["%1",_str];

	_flag setVariable ["CTI_OCCUPIED",0,true];
	_flag setVariable ["CTI_LOCATION_FACTION",_faction,true];
	_flag setVariable ["CTI_LOCATION_SIDE",_side,true];
	_flag setVariable ["CTI_LOCATION",_location,true];

	[_flag,["Capture Location","MOB_CTI\functions\capture_town.sqf"]] remoteExec ["addAction",0,true];

	//decide on type of force based on _town_cost
	_forcetype = selectRandom ["infantry","infantry","light","light","heavy"];

	//decide based on town size
	_list = _pos nearObjects ["House", 250];
	_town_cost = (count _list)*50;
	
	//Location Marker
	_markerstr = createMarker [_str,_flagPos];
	_markerstr setMarkerShape "ICON";
	_markerstr setMarkerType "c_unknown";
	_markerstr setMarkerSize [0.7,0.7];
	_markerstr setMarkerColor "ColorGreen";

	if (fcti_debug) then {
		_mstr = _forcetype + format [" : %1",_town_cost];
		_markerstr setMarkerText _mstr;
	};
	
	_flag setVariable ["CTI_LOCATION_MARKER",_markerstr,true];

	if (_cost != 0) then {
		//Location Trigger
		_trg = createTrigger ["EmptyDetector", getPos _location, true];
		_trg setTriggerArea [600, 600, 0, true];
		_trg setTriggerActivation ["ANY", "PRESENT", true];
		//_trg setTriggerTimeout [5, 5, 5, true];

		_activation = format ["null = [%1, '%2', %3, %4, %5, %6] execVM 'MOB_CTI\ai_commander_local_defend.sqf'", _side2, _forcetype, _town_cost, getpos _location, (_size select 0) max (_size select 1),_flagpos];
		if (_i == 5) then {diag_log _activation};
		_trg setTriggerStatements ["[thisList,thisTrigger] call location_trigger_condition", _activation,  "thisTrigger call despawn_occupying_groups"];
	}

};

//ALL_CTI_LOCATIONS = _locations apply {_x select 0};
//publicVariable "ALL_CTI_LOCATIONS";
//player sidechat format ["%1",ALL_CTI_LOCATIONS];
//missionNamespace setVariable ["ALL_CTI_LOCATIONS",_locations,true];

// setup AA network

if ("AA" in _this) then {

	//[_faction] execVM "MOB_CTI\aa_network.sqf";

};