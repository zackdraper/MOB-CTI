/*

	para_eject.sqf

	determine if player can eject cargo AI/players, and provide action
	
*/
//////////////////////////////////////////////////////////////////////////////
private ["_param"];

_param = _this;
if (count _this > 3) then {_param = _this select 3};

//player sideChat format ["%1",_this];
ParaSafeLand = {
	_unit = _this select 0;
	_unit action ["openParachute", _unit];
	sleep 1;
	[_unit, "B_Parachute"] remoteExec ["addBackpack", _unit];
	[_unit, true] remoteExec ["allowdamage", 0];
	waitUntil { isTouchingGround _unit || (position _unit select 2) < 1 };
	_unit action ["eject", vehicle _unit];
	sleep 1;
	_unit setUnitLoadout (_unit getVariable ["Para_Saved_Loadout",[]]);
};


if (_param select 0 == 1) exitWith {
	_plane = vehicle player;

	_list = fullCrew [_plane, "cargo"];

	_dir = getdir _plane;

	{
		//player sideChat format ["%1",_x];

		_unit = _x select 0;

		_unit setVariable ["Para_Saved_Loadout",getUnitLoadout _unit,true];

		removeBackpack _unit;

		[_unit, "B_Parachute"] remoteExec ["addBackpack", _unit];

		[_unit, false] remoteExec ["allowdamage", 0];

		[_unit, _plane] remoteExec ["disableCollisionWith", _unit];

		_unit remoteExecCall ["moveOut", _unit];

		_unit remoteExec ["unassignVehicle",0];

		[_unit, (_dir + 90)] remoteExecCall ["setDir", _unit];

		[_unit, [0,0,-5]] remoteExecCall ["setVelocity", _unit];

		sleep 0.5;

    		[[_unit],ParaSafeLand] remoteExec ["spawn", _unit];
	
	} forEach _list;
};

while {alive player} do {

	_plane = vehicle player;

	//player sideChat format ["%1",_plane];

	if (_plane != player) then {
		if (_plane iskindof "Air") then {
			if ( (leader (group player) == player) or !(isPlayer (leader (group player)) ) ) then {
				_id = _plane addAction ["<t color='#FF0000'>Orderly Paradrop</t>", "MOB_CTI\functions\para_eject.sqf", [1], 99 ];
				waituntil{vehicle player == player};
				_plane removeAction _id;
			};
		};

	};

	sleep 5;

};

if(true)exitWith{};