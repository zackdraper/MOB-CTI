/*

	ai_commander_theatre_invader.sqf

	Initialize the defense of a specific town or objective with a local AI commander to maintain control 


	Params:
		Side
		Force classnames
		Force weighting
		Consumables
		Objective Radius
		
	
*/
/////////////////////////////////////////////////////////////////////////////////////////

_faction = _this select 0;
<<<<<<< HEAD
_force_type = _this select 1;
_com = _this select 2;
=======

_com = missionNamespace getVariable format ["CTI_%1_COMMANDER",_faction];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

_units = [];
{ 
	if (_x getvariable "CTI_PLAYER_FACTION" == _faction) then {
		_units pushBack _x;
	};
} forEach playableUnits; 

<<<<<<< HEAD
//{_x addEventHandler['OnRespawn',{hint format ['%1',_this] } ] } foreach _units;

_com = missionNamespace getVariable format ["CTI_%1_COMMANDER",_faction];

player sidechat format ["AI commander: %1",_com];
player sidechat format ["AI commander Subordinates: %1",_units];

if ("AA" in _this) then {
	[_faction,side _com] execVM "MOB_CTI\aa_network.sqf";
};

//////// FSM to monitor and adapt to attacking forces

waitUntil{!isNil "MOB_CTI_Locations_AllMajorCities"};

sleep 15;

_handle = [_com,_units,_force_type] execFSM "MOB_CTI\ai_commander_theatre_invader.fsm";

_com setVariable ["CTI_forceType",_force_type];

_com addEventHandler ["Respawn", {
	_unit = _this select 0;
	_killed = _this select 1;
	
	_units = _killed getVariable "CTI_COM_UNITS";
	_force_type = _killed getVariable "CTI_forceType";
	
	_handle = [_unit,_units,_force_type] execFSM "MOB_CTI\ai_commander_theatre_invader.fsm";
}];
=======
player sidechat format ["AI commander: %1",_com];
player sidechat format ["AI commander Subordinates: %1",_units];

//////// FSM to monitor and adapt to attacking forces

//waitUntil{!isNil MOB_CTI_Locations_AllMajorCities};

_handle = [_com,_units,_faction] execFSM "MOB_CTI\ai_commander_theatre_invader.fsm";
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

player sidechat format ["%1: FSM Handle",_handle];

if(true)exitwith{};