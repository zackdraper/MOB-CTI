/*

	end_trigger.sqf
	
	create the ending triggers for a given side
*/
//////////////////////////////////////////////////////////////////////////////
_w_mhq_virt = _this select 0;
_e_mhq_virt = _this select 1;

_w_mhq = _w_mhq_virt getVariable ["CTI_MHQ_VEH",objNull];
_e_mhq = _e_mhq_virt getVariable ["CTI_MHQ_VEH",objNull];

while {true} do {

	if !(alive _w_mhq) then {	
		_w_fac = _w_mhq_virt getVariable ["CTI_FACTORIES",[]];
		if(count _w_fac < 1)exitwith{"EastWon" call BIS_fnc_endMissionServer};
	};

	if !(alive _e_mhq) then {
		_e_fac = _e_mhq_virt getVariable ["CTI_FACTORIES",[]];
		if(count _e_fac < 1)exitwith{"WestWon" call BIS_fnc_endMissionServer};
	}; 
	
	sleep 20;

};

if(true)exitwith{};