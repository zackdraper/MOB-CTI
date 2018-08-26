/*

	end_trigger.sqf
	
	create the ending triggers for a given side
*/
//////////////////////////////////////////////////////////////////////////////
_w_mhq = _this select 0;
_e_mhq = _this select 1;

_cond = true;

while {_cond} do {

	if !(alive _w_mhq) then {	
		_cond = false;
	};

	if !(alive _e_mhq) then {
		_cond = false;
	}; 
	
	sleep 15;

};

if(true)exitwith{"SideScore" call BIS_fnc_endMissionServer};