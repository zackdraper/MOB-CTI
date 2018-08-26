/*

	player_mhq_init.sqf

	Creates an MHQ to use in battle.

	Put in init feild of unit along with force type.

	Optional:

	 	"halo"
		"fasttravel"
		"base"
		"arsenal"
		
*/
//////////////////////////////////////////////////////////////////////////////

<<<<<<< HEAD
_mhq = _this select 0;
_force = _this select 1;
_side = _this select 2;
_vehicle = _this select 3;

_mhq setvariable ["CTI_SIDE", _side, true];
_mhq setvariable ["CTI_FACTION", _force, true];
_mhq setVariable ["CTI_AREAS", [], true];

_mhq getVariable ["CTI_AREAS", []];
_mhq getVariable ["CTI_FACTORIES", []];

_mhq setVariable ["CTI_AREAS", [], true];
_mhq setVariable ["CTI_FACTORIES", [], true];

if (_vehicle iskindof "Static") then {
	[_side, getposATL _mhq, "HQ"] call BIS_fnc_addRespawnPosition;
} else {
	[_side, _mhq, "MHQ"] call BIS_fnc_addRespawnPosition;
=======
_vehicle = _this select 0;
_force = _this select 1;
_side = _this select 2;

_vehicle setvariable ["mhq_side", _side, true];
_vehicle setvariable ["mhq_force", _force, true];
_vehicle setVariable ["CTI_AREAS", [], true];

_vehicle getVariable ["CTI_AREAS", []];
_vehicle getVariable ["CTI_FACTORIES", []];

_vehicle setVariable ["CTI_AREAS", [], true];
_vehicle setVariable ["CTI_FACTORIES", [], true];

if (_vehicle iskindof "Static") then {
	[_side, getposATL _vehicle, "MHQ"] call BIS_fnc_addRespawnPosition;
} else {
	[_side, _vehicle, "MHQ"] call BIS_fnc_addRespawnPosition;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
};

// ----------- HALO
if ("halo" in _this) then {
<<<<<<< HEAD
	//_mhq addAction ["<t color='#ff9900'>HALO</t>", "MOB_CTI\ATM_airdrop\atm_airdrop.sqf"];
=======
	//_vehicle addAction ["<t color='#ff9900'>HALO</t>", "MOB_CTI\ATM_airdrop\atm_airdrop.sqf"];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
	[_vehicle, ['<t color="#ff9900">HALO</t>','MOB_CTI\ATM_airdrop\atm_airdrop.sqf',[],97] ] remoteExec ["addAction",_side,True];
};

// ----------- Fast Travel
if ("fasttravel" in _this) then {
	hint "fast";
};

// ----------- Base Build
if ("base" in _this) then {
<<<<<<< HEAD
	[_vehicle, ['<t color="#ff9900">Base Build</t>','MOB_CTI\player_action_buildmenu.sqf', [_force], 98, true, true, "", "_this getvariable 'CTI_COMMANDER'"] ] remoteExec ["addAction",_side,True];
=======
	[_vehicle , ['<t color="#ff9900">Base Build</t>','MOB_CTI\player_action_buildmenu.sqf', [_force], 98, true, true, "", "_this getvariable 'CTI_COMMANDER'"] ] remoteExec ["addAction",_side,True];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
};

// ----------- Aresenal
if ("openarsenal" in _this) then {
	0 = ["AmmoboxInit",[_vehicle,true]] spawn BIS_fnc_arsenal;
};

if ("factionarsenal" in _this) then {
<<<<<<< HEAD
	0 = ["AmmoboxInit",[_mhq,false]] spawn BIS_fnc_arsenal;
=======
	0 = ["AmmoboxInit",[_vehicle,false]] spawn BIS_fnc_arsenal;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
	[_vehicle,_force] execVM "MOB_CTI\functions\arsenal_faction_weaponslist.sqf";
};

if(true)exitwith{};