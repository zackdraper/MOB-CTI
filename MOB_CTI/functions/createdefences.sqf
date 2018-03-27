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

CTI_P_LastDefenseBuilt = _b;

if(true)exitwith{};