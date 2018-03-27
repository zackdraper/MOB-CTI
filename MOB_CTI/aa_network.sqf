/*

	aa_network.sqf

	Setup an AA network to defend the island

	Params:
		Faction
	
*/
/////////////////////////////////////////////////////////////////////////////////////////

_faction = _this select 0;

_num = 5;
_i = 0;
_pos_last = [0,0,0];

_size = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");

while { _i != _num } do {

	_pos = [[_size/2,_size/2], 0, _size, 15, 0, 0.2, 0] call BIS_fnc_findSafePos;

	if (!(_pos call issafezone) and ((_pos_last distance _pos) > 1000)) then {

		//Location Marker
		_markerstr = createMarker [("AA"+str _i),_pos];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "hd_dot";
		_markerstr setMarkerSize [0.7,0.7];
		_markerstr setMarkerColor "ColorRed";
		_markerstr setMarkerText "AA Site";

		_pos_last = _pos;
		_i = _i + 1;
	};
};

if(true)exitwith{};