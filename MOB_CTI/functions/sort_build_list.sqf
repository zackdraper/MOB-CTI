/*

	sort_build_list.sqf

	create the building list for a given faction
	
*/
//////////////////////////////////////////////////////////////////////////////
_faction = _this;

_barrackscost = [_faction,1,"barracks"] call read_twod_array_col;
_lightfaccost = [_faction,1,"lightfac"] call read_twod_array_col;
_heavyfaccost = [_faction,1,"heavyfac"] call read_twod_array_col;
_airfaccost = [_faction,1,"airfac"] call read_twod_array_col;
_servicecost = [_faction,1,"service"] call read_twod_array_col;
_boatdockcost = [_faction,1,"boatdock"] call read_twod_array_col;
_controlcencost = [_faction,1,"controlcen"] call read_twod_array_col;
_supplypointcost = [_faction,1,"supplypoint"] call read_twod_array_col;

_barracksclass = [_faction,0,"barracks"] call read_twod_array_col;
_lightfacclass = [_faction,0,"lightfac"] call read_twod_array_col;
_heavyfacclass = [_faction,0,"heavyfac"] call read_twod_array_col;
_airfacclass = [_faction,0,"airfac"] call read_twod_array_col;
_serviceclass = [_faction,0,"service"] call read_twod_array_col;
_boatdockclass = [_faction,0,"boatdock"] call read_twod_array_col;
_controlcenclass = [_faction,0,"controlcen"] call read_twod_array_col;
_supplypointclass = [_faction,0,"supplypoint"] call read_twod_array_col;

_buildlist = [];

if (count _barracksclass > 0) then { _buildlist append [["Barracks",_barracksclass select 0,(_barrackscost select 0) select 0]] };

if (count _lightfacclass > 0) then {_buildlist append [["Light Factory",_lightfacclass select 0,(_lightfaccost select 0) select 0]]};

if (count _heavyfacclass > 0) then {_buildlist append [["Heavy Factory",_heavyfacclass select 0,(_heavyfaccost select 0) select 0]]};

if (count _airfacclass > 0) then {_buildlist append [["Aircraft Factory",_airfacclass select 0,(_airfaccost select 0) select 0]]};

if (count _serviceclass > 0) then {_buildlist append [["Service Depot",_serviceclass select 0,(_servicecost select 0) select 0]]};

if (count _boatdockclass > 0) then {_buildlist append [["Boat Dock",_boatdockclass select 0,(_boatdockcost select 0) select 0]]};

if (count _controlcenclass > 0) then {_buildlist append [["Command Center",_controlcenclass select 0,(_controlcencost select 0) select 0]]};

if (count _supplypointclass > 0) then {_buildlist append [["Supply Point",_supplypointclass select 0,(_supplypointcost select 0) select 0]]};


//hint format ["%1",_buildlist];

_buildlist