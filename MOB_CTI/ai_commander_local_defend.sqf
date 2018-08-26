/*

	ai_commander_local_defend.sqf

	Initialize the defense of a specific town or objective with a local AI commander to maintain control 


	Params:
		Side
		Force classnames
		Force weighting
		Consumables
		Objective Radius
		
	
*/
/////////////////////////////////////////////////////////////////////////////////////////

mob_cti_task_patrol = {
	_grp = _this select 0;	
	_pos = _this select 1;
	_rad = _this select 2;

	{deletewaypoint _x} forEach waypoints _grp;
	
	_grp setvariable ["ai_commander_status","patrol"];

	_wp = _grp addWaypoint [_pos, _rad];
	_wp setWaypointCombatMode "RED";
	_wp setWaypointFormation "LINE";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointType "MOVE";
	_wp setWaypointPosition [_pos, _rad];

	//_markerstr = createMarker [format ["%1",_grp]+"patrolpt1",waypointposition _wp];
	//_markerstr setMarkerShape "ICON";
	//_markerstr setMarkerType "hd_dot";

	_wp = _grp addWaypoint [_pos, _rad];
	_wp setWaypointCombatMode "RED";
	_wp setWaypointFormation "LINE";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointType "MOVE";
	_wp setWaypointPosition [_pos, _rad];

	//_markerstr = createMarker [format ["%1",_grp]+"patrolpt2",waypointposition _wp];
	//_markerstr setMarkerShape "ICON";
	//_markerstr setMarkerType "hd_dot";

	_wp = _grp addWaypoint [_pos, _rad];
	_wp setWaypointCombatMode "RED";
	_wp setWaypointFormation "LINE";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointType "MOVE";
	_wp setWaypointPosition [_pos, _rad];

	//_markerstr = createMarker [format ["%1",_grp]+"patrolpt3",waypointposition _wp];
	//_markerstr setMarkerShape "ICON";
	//_markerstr setMarkerType "hd_dot";

	_wp = _grp addWaypoint [_pos, _rad];
	_wp setWaypointCombatMode "RED";
	_wp setWaypointFormation "LINE";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointType "CYCLE";
	_wp setWaypointPosition [_pos, _rad];

};	

mob_cti_task_defend = {
	_grp = _this select 0;	
	_pos = _this select 1;
	_rad = _this select 2;
	_building = _this select 3;

	{deletewaypoint _x} forEach waypoints _grp;

	_grp setvariable ["ai_commander_status","defend"];


	_units = units _grp;

	_buildpos = [_building] call BIS_fnc_buildingPositions;
	_buildloc = getpos _building;

	{
		if (count _buildpos > 0) then {
			_gopos = selectRandom _buildpos;
			_buildpos = _buildpos - [_gopos];
			_x setpos _gopos;
			_x disableAI "PATH";
			commandstop _x;
		}else{
			_x doMove [(_buildloc select 0)-7.5+(random 15),(_buildloc select 1)-7.5+(random 15),_buildloc select 2];
			_x spawn {
				waitUntil{movetocompleted _this};
				_this disableAI "PATH";
				if(true)exitwith{};
			};
		};
	} forEach _units;

	//_markerstr = createMarker [format ["%1",_grp]+"strongpoint",getpos _building];
	//_markerstr setMarkerShape "ICON";
	//_markerstr setMarkerType "mil_triangle";
	//_markerstr setMarkerText "SP";

};

mob_cti_task_attack = {
	_pos = _this select 0;
	_grp = _this select 1;

	{deletewaypoint _x} forEach waypoints _grp;

	_grp setvariable ["ai_commander_status","counterattack"];

	_wp = _grp addWaypoint [_pos, 0];
	_wp setWaypointCombatMode "RED";
	_wp setWaypointFormation "LINE";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointType "MOVE";
	_wp setWaypointPosition [_pos, 0];
	_wp setWaypointCompletionRadius 100;

	_wp = _grp addWaypoint [_pos, 0];
	_wp setWaypointCombatMode "RED";
	_wp setWaypointFormation "LINE";
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointType "SAD";
	_wp setWaypointPosition [_pos, 0];

	//_markerstr = createMarker [format ["%1",_grp]+"attackpt3",_pos];
	//_markerstr setMarkerShape "ICON";
	//_markerstr setMarkerColor "ColorRed";
	//_markerstr setMarkerType "hd_warning";

};

_side = _this select 0;
_forcetype = _this select 1;
_consumables = _this select 2;
_pos = _this select 3;
_location = nearestLocation [_pos, ""];
_objrad = _this select 4;
_fpos = _this select 5;

_flag = nearestObject [_fpos,"FlagCarrier"];

player sidechat format ["%1",_flag];

_faction = _flag getVariable "CTI_LOCATION_FACTION";

_occ = _flag getVariable "CTI_OCCUPIED";

if (_occ == 1) exitwith {

	player sidechat "Exit without spawning";
};

_flag setVariable ["CTI_OCCUPIED",1,true];

_class = _faction call define_force_classnames;

//////// spawn forces

_grps = [_side,_class,_forcetype,_consumables,_pos] call spawn_units_balanced;
_flag setVariable ["CTI_OCCUPYING_GROUPS",_grps,true];

/////// setup groups with defense posture

//player sidechat format ["%1",_grps];

_counts = _grps apply {count units _x};
_counts sort true;

_mcut = _counts select (floor (count _counts)/2);

//player sidechat format ["%1",_mcut];

_buildings = nearestObjects [_pos, ["House"], (_objrad/2)];

_enterableBuildings = [];

{if([_x, 6] call BIS_fnc_isBuildingEnterable) then {_enterableBuildings append [_x]}} foreach _buildings;

{
	// detect vehicle groups

	if (leader _x != vehicle leader _x) then {
		[_x,_pos,_objrad] call mob_cti_task_patrol;
	};

	// divide responsibilities of infantry groups by median size
	if ((count units _x) <= _mcut) then { 
		// insert exception for no buildings
		
		// find defensive positions
		if (count _enterableBuildings != 0) then { 
			_building = selectRandom _buildings;
			_enterableBuildings = _enterableBuildings - [_building];
			[_x,_pos,_objrad,_building] call mob_cti_task_defend;

		} else {
			[_x,_pos,_objrad] call mob_cti_task_patrol;
		};
		//player sidechat format ["%1: Executing Defend Task",_x];

	} else {
		// patrol area
		
		[_x,_pos,_objrad] call mob_cti_task_patrol;
		
		//player sidechat format ["%1: Executing Patrol Task",_x];

	};

} forEach _grps;

//////// FSM to monitor and adapt to attacking forces

_handle = [_grps,_objrad,_pos] execFSM "MOB_CTI\ai_commander_local_defend.fsm";

player sidechat format ["%1: FSM Handle",_handle];

if(true)exitwith{}; 