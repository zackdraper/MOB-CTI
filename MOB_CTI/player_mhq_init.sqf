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

[_side, _vehicle, "MHQ"] call BIS_fnc_addRespawnPosition;

// ----------- HALO
if ("halo" in _this) then {
	//_mhq addAction ["<t color='#ff9900'>HALO</t>", "MOB_CTI\ATM_airdrop\atm_airdrop.sqf"];
	[_vehicle, ['<t color="#ff9900">HALO</t>','MOB_CTI\ATM_airdrop\atm_airdrop.sqf',[],97] ] remoteExec ["addAction",_side,True];
};

// ----------- Fast Travel
if ("fasttravel" in _this) then {
	hint "fast";
};

// ----------- Base Build
if ("base" in _this) then {
	[_vehicle, ['<t color="#ff9900">Base Build</t>','MOB_CTI\player_action_buildmenu.sqf', [_force], 98, true, true, "", "_this getvariable 'CTI_COMMANDER'"] ] remoteExec ["addAction",_side,True];
};

// ----------- Aresenal
if ("openarsenal" in _this) then {
	0 = ["AmmoboxInit",[_vehicle,true]] spawn BIS_fnc_arsenal;
};

if ("factionarsenal" in _this) then {
	0 = ["AmmoboxInit",[_mhq,false]] spawn BIS_fnc_arsenal;
	[_vehicle,_force] execVM "MOB_CTI\functions\arsenal_faction_weaponslist.sqf";
};

if(true)exitwith{};