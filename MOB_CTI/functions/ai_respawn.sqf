/*

	ai_respawn.sqf

	given a respawn template, get AI to respawn

	this addEventHandler ["killed", "MOB_CTI/functions/ai_respawn.sqf"];
	
*/
//////////////////////////////////////////////////////////////////////////////

private ["_new_unit"];
_unit = _this select 0;

if !(isPlayer _unit) then {

	_mhq = _unit getVariable "CTI_PLAYER_MHQ";
	_faction = _unit getVariable "CTI_PLAYER_FACTION";

	waituntil{playerRespawnTime == 0};

	_new_unit = group _unit createUnit [typeOf _unit, getpos _mhq, [], 0, "FORM"];

	player sidechat "FUUUUUUUUUUUUUUUUUUUUUUCK";

	deleteVehicle _unit;

	_new_unit addEventHandler ["killed", "MOB_CTI/functions/ai_respawn.sqf"];

	_commander = missionNamespace getVariable (format ["CTI_%1_COMMANDER",_faction]);

	if (_commander == _unit) then {
		nul = [_new_unit,_faction,_mhq,"commander"] execVM  "MOB_CTI\unit_cti_init.sqf";
	} else {
		nul = [_new_unit,_faction,_mhq] execVM  "MOB_CTI\unit_cti_init.sqf";
	};

	[_grp,_new_unit] remoteExec ["setLeader",groupOwner _grp];

	[_new_unit] spawn capture_nearby_location;
};


if(true)exitwith{}; 