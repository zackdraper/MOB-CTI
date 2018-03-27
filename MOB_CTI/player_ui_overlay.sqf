disableSerialization;

private [ "_display","_uiticks","_layer","_overlayshown", "_sectorcontrols", "_active_sectors_hint", "_uiticks", "_attacked_string", "_active_sectors_string", "_color_readiness", "_nearest_active_sector", "_zone_size", "_colorzone", "_bar", "_barwidth", "_first_iteration","_funds","_fmax"];

_faction = player getVariable "CTI_PLAYER_FACTION";
_mhq = player getVariable "CTI_PLAYER_MHQ";

_overlayshown = false;

_uiticks = 0;

//waitUntil { !isNil "synchro_done" };
//waitUntil { synchro_done };

while { true } do {

	if ( ( alive player || !dialog ) && !_overlayshown ) then {
		_layer = ("gui_overlay" call BIS_fnc_rscLayer) cutRsc ["statusoverlay", "PLAIN", 1];
		_overlayshown = true;
		player sidechat "overlay begun";
		
		_uiticks = 0;
	};
	//if ( ( !alive player || dialog ) && _overlayshown ) then {
	//	cutRsc["blank", "PLAIN", 0];
	//	_overlayshown = false;
	//	player sidechat "overlay killed";
	//};
	if ( _overlayshown ) then {
		

		if ( _uiticks % 5 == 0 ) then {
			//_display = findDisplay 6666;
			_display = (uiNamespace getVariable 'GUI_OVERLAY');

			_funds = _mhq getvariable "CTI_FUNDS";
			_fmax = _mhq getvariable "CTI_FUEL_MAX";

			//player sidechat format ["%1 : %2",_funds,_display];
			if ((!isNil "_funds") and (!isNil "_fmax")) then {
				(_display displayCtrl 101) ctrlSetText (format [ "%1", _funds select 0]);
				(_display displayCtrl 102) ctrlSetText (format [ "%1", _funds select 1]);
				(_display displayCtrl 103) ctrlSetText (format [ "%1 / %2", _funds select 2, _fmax ]);
			};

		};

		if ( _uiticks % 25 == 0 ) then {


		};

	};
	_uiticks = _uiticks + 1;
	if ( _uiticks > 1000 ) then { _uiticks = 0 };
	uiSleep 0.25;
};