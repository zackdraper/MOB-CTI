//////////////////////////////////////////////////////////////////
//despawn_occupying_groups.sqf
//
//despawns occupying groups in towns if no enemy present
//////////////////////////////////////////////////////////////////

_trg = _this;

_flag = nearestObject [getPos _trg, "FlagPole_f"];

player sidechat format ["%1",_flag];

_grps = _flag getVariable "CTI_OCCUPYING_GROUPS";

player sidechat "Despawned Units";
player sidechat format ["%1",_grps];

for [{_i=0}, {_i< count _grps}, {_i=_i+1}] do{
	
	_g = _grps select _i;
		
	{deleteVehicle _x;} forEach units _g;
	deleteGroup _g;
};

_flag setVariable ["CTI_OCCUPYING_GROUPS",[],true];

if (true) exitWith{};