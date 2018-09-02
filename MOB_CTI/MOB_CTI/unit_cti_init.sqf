/*

	unit_cti_init.sqf

	define faction specific variables to the player to be used in CTI module
	
*/
//////////////////////////////////////////////////////////////////////////////

_unit = _this select 0;
_faction = _this select 1;
_mhq = _this select 2;

_unit setvariable ["CTI_PLAYER_FACTION",_faction,true];
_unit setvariable ["CTI_PLAYER_MHQ",_mhq,true];
_unit setVariable ["CTI_COMMANDER",false,true];

if ("commander" in _this) then {
	missionNamespace setVariable [format ["CTI_%1_COMMANDER",_faction], _unit, true];
	_unit setVariable ["CTI_COMMANDER",true,true];
	_unit setVariable ["NOAI",1,false];
	_unit setVariable ["VCOM_NOPATHING_Unit",1,false];	
};

[player, [missionNamespace, "Var_SavedInventory"]] call BIS_fnc_saveInventory;

if(true)exitwith{};