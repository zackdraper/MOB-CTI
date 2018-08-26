disableSerialization;

private [ "_display","_uiticks","_layer","_overlayshown", "_sectorcontrols", "_active_sectors_hint", "_uiticks", "_attacked_string", "_active_sectors_string", "_color_readiness", "_nearest_active_sector", "_zone_size", "_colorzone", "_bar", "_barwidth", "_first_iteration","_funds","_fmax"];

_faction = player getVariable "CTI_PLAYER_FACTION";
_mhq = player getVariable "CTI_PLAYER_MHQ";

<<<<<<< HEAD
_locations = player getVariable "MOB_CTI_Locations_AllMajorCities";

_side = side player;

_first_iteration = true;

_overlayshown = false;

_sectorcontrols = [201,202,203,244,205];

=======
_overlayshown = false;

>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
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
<<<<<<< HEAD
	
	if ( ( !alive player || dialog ) && !_overlayshown) then {
		cutRsc["blank", "PLAIN", 0];
		_overlayshown = false;
	};
=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
	//if ( ( !alive player || dialog ) && _overlayshown ) then {
	//	cutRsc["blank", "PLAIN", 0];
	//	_overlayshown = false;
	//	player sidechat "overlay killed";
	//};
	if ( _overlayshown ) then {
<<<<<<< HEAD
=======
		
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

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
<<<<<<< HEAD
		
			_nearloc = _locations apply {[(getpos player) distance2D getpos (_x select 0),(_x select 0)]};
			_nearloc sort true;
			_nearlocdis = (_nearloc select 0) select 0;
			_nearloc = (_nearloc select 0) select 1;
		
			if ( _nearlocdis < 250 ) then {
			
				_list1 = (position _nearloc) nearEntities [["Man","Car","Tank","Air"], 150];
				
				_listEnemy = _list1 apply {[_side, side _x] call BIS_fnc_sideIsEnemy};
				_listFriend = _list1 apply {[_side, side _x] call BIS_fnc_sideIsFriendly};

				_listEnemy = ({(_x)} count _listEnemy)+1;
				_listFriend = ({(_x)} count _listFriend)+1;
				
				_ratio = _listFriend/_listEnemy;
				
				_barwidth = 0.084 * safezoneW * _ratio;
				//hint format ["%1",_barwidth];
				_bar = _display displayCtrl (244);
				_bar ctrlSetPosition [(ctrlPosition _bar) select 0,(ctrlPosition _bar) select 1,_barwidth,(ctrlPosition _bar) select 3];
				_bar ctrlCommit 2;

				(_display displayCtrl (205)) ctrlSetText (text _nearloc);
				{ ( (uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (_x) ) ctrlShow true; } foreach  _sectorcontrols;
				if ( side _nearloc == _side) then {
					(_display displayCtrl (205)) ctrlSetTextColor [0,0.3,1.0,1];
				} else {
					(_display displayCtrl (205)) ctrlSetTextColor [0.85,0,0,1];
				};
				

			} else {
				{ ( (uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (_x) ) ctrlShow false; } foreach  _sectorcontrols;
				//(_display displayCtrl (205)) ctrlSetText "";
			};
=======

>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

		};

	};
	_uiticks = _uiticks + 1;
	if ( _uiticks > 1000 ) then { _uiticks = 0 };
	uiSleep 0.25;
};