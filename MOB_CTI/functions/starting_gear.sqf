/*

	starting_gear.sqf

	loads units starting gear based on faction type
	
*/
//////////////////////////////////////////////////////////////////////////////

_faction = _this select 0;
_units = _this select 1;

_list = _faction call define_force_classnames;

_class = [_list,0,"sl"] call read_twod_array_col;

if (typeName _units == "OBJECT") then {
	_units = [_units];
};

for [{_i=0}, {_i < (count _units)}, {_i=_i+1}] do
{

	_u = _units select _i;

	//get naked

   	removeAllWeapons _u;
	removeBackpack _u;
	removeAllItems _u;
	removeAllAssignedItems _u;
	removeHeadgear _u;
	removeVest _u;
	removeUniform _u;

	// add weapons from class config

	loadout = [_u,configfile >> "CfgVehicles" >> (_class select 0)] call BIS_fnc_loadInventory;
	

};


if (true) exitwith {};