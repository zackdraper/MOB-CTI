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

_com = missionNamespace getVariable format ["CTI_%1_COMMANDER",_faction];

_units = [];
{ 
	if (_x getvariable "CTI_PLAYER_FACTION" == _faction) then {
		_units pushBack _x;
	};
} forEach playableUnits; 

player sidechat format ["AI commander: %1",_com];
player sidechat format ["AI commander Subordinates: %1",_units];

//////// FSM to monitor and adapt to attacking forces

//waitUntil{!isNil MOB_CTI_Locations_AllMajorCities};

_handle = [_com,_units,_faction] execFSM "MOB_CTI\ai_commander_theatre_invader.fsm";

player sidechat format ["%1: FSM Handle",_handle];

if(true)exitwith{};