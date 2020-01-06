/*

	arsenal_faction_weaponlist.sqf

	get weapons from the factions infantry list to add to arsenal
	
*/
//////////////////////////////////////////////////////////////////////////////
_vehicle = _this select 0;
_faction = _this select 1;

_class = _faction call define_force_classnames;

["AmmoboxInit",[ _vehicle, false]] spawn BIS_fnc_arsenal;

// get all infantry from faction class list

_staticclass = [_class,0,"men"] call read_twod_array_col;
_staticclass append ([_class,0,"sl"] call read_twod_array_col);
_staticclass append ([_class,0,"pilot"] call read_twod_array_col);
_staticclass append ([_class,0,"crewman"] call read_twod_array_col);

hint format ["Faction: %1",_faction];

// query units for gear

_weapons = [];
_magazines = [];
_items = [];
_backpacks = [];

{
	_w = getArray (configfile >> "CfgVehicles" >> _x >> "weapons");
	_m = getArray (configfile >> "CfgVehicles" >> _x >> "magazines");
	_i = getArray (configfile >> "CfgVehicles" >> _x >> "items");
	_li = getArray (configfile >> "CfgVehicles" >> _x >> "linkedItems");
	_u = getText (configfile >> "CfgVehicles" >> _x >> "uniformClass");
	_b = getText (configfile >> "CfgVehicles" >> _x >> "backpack");

	_weapons append _w;
	_magazines append _m;
	_items append _i;
	_items append _li;
	_items append [_u];
	_backpacks append [_b];

} forEach _staticclass;

// find only unique gear

_weapons = _weapons call BIS_fnc_consolidateArray;
_weapons = _weapons apply {_x select 0};
_weapons = _weapons - ["Throw","Put"];

_magazines = _magazines call BIS_fnc_consolidateArray;
_magazines = _magazines apply {_x select 0};
_magazines = _magazines - [""];

_items = _items call BIS_fnc_consolidateArray;
_items = _items apply {_x select 0};
_items = _items - [""];

_backpacks = _backpacks call BIS_fnc_consolidateArray;
_backpacks = _backpacks apply {_x select 0};
_backpacks = _backpacks - [""];

//player sidechat format ["%1",_backpacks];

//{_nul = _backpacks pushBack _x} forEach _backpacks;

_side = getNumber (configfile >> "CfgVehicles" >> (_staticclass select 0) >> "side");

switch (_side) do {
	case 1:{
		_test = [_vehicle, ["B_UavTerminal"], true, false] call BIS_fnc_addVirtualItemCargo;
	};
	case 2:{
		_test = [_vehicle, ["O_UavTerminal"], true, false] call BIS_fnc_addVirtualItemCargo;
	};
	case 3:{
		_test = [_vehicle, ["I_UavTerminal"], true, false] call BIS_fnc_addVirtualItemCargo;
	};
};

_test = [_vehicle, ["%ALL"], true, false] call BIS_fnc_addVirtualBackpackCargo;
_test = [_vehicle, _magazines, true, false] call BIS_fnc_addVirtualMagazineCargo;
_test = [_vehicle, _items, true, false] call BIS_fnc_addVirtualItemCargo;
_test = [_vehicle, _weapons, true, false] call BIS_fnc_addVirtualWeaponCargo;

//player sidechat format ["%1",_test];

if(true)exitWith{};