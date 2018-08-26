/*

	createdefences.sqf

	create a static defense, add gunner if applicable to bas defense
	
*/
//////////////////////////////////////////////////////////////////////////////

_var = _this select 0;
_pos = _this select 1;
_dir = _this select 2;

//hint format ["%1",_var];

_b = createVehicle [_var select 1, _pos, [], 0, "None"];
_b setdir _dir;

<<<<<<< HEAD
_init = _var select 5;

_buildings = _mhq getVariable ["CTI_DEFENCES",nil];

if (isNil{_buildings}) then {
	_buildings = [_b];	
} else {
	_buildings append [_b];
};

_mhq setVariable ["CTI_DEFENCES", _buildings, true];

switch {_init} do {
	case "west_eng_crate": {
		[_b, 100, west, "LIGHT"] execVM "MOB_CTI\R3F_LOG\USER_FUNCT\init_creation_factory.sqf";
	};
	case "east_eng_crate": {
		[_b, 100, east, "LIGHT"] execVM "MOB_CTI\R3F_LOG\USER_FUNCT\init_creation_factory.sqf";
	};
	default{};
};

if (CTI_P_DefensesAutoManning) then {

	_inf_list = player getVariable "CTI_INFANTRY";
	_first_man = _inf_list select 0;

	//hint format ["%1",_first_man];

	_mhq = player getVariable "CTI_PLAYER_MHQ";

	_grp = createGroup (side player);
	_safepos = [getpos _mhq, 12, 35, 5, 0, 10, 0] call BIS_fnc_findSafePos;

	_u = _grp createUnit [(_first_man select 1), _safepos, [], 0, "NONE"];

	_u assignAsGunner _b;
	[_u] orderGetIn true;

};

=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
CTI_P_LastDefenseBuilt = _b;

if(true)exitwith{};