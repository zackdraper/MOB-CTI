/*

	createbuildings.sqf

	create a building and handle its production given commander placement
	
*/
//////////////////////////////////////////////////////////////////////////////

private ["_buildings","_faction"];

_var = _this select 0;
_pos = _this select 1;
_dir = _this select 2;
_faction = _this select 3;
_side = _this select 4;
_mhq = _this select 5;

<<<<<<< HEAD

=======
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
_buildings = _mhq getVariable "CTI_FACTORIES";

_b = createVehicle [_var select 1, _pos, [], 0, "None"];
_b setdir _dir;

_b setVariable ["CTI_FACTORY_TYPE", _var select 0, true];

<<<<<<< HEAD
//Add external supply chain to ammo point
if ((_var select 0) != "Supply Point") then {

	if (isNil{_buildings}) then {
		_buildings = [_b];	
	} else {
		_buildings append [_b];
	};

	_mhq setVariable ["CTI_FACTORIES", _buildings, true];


} else {

	_mhq setVariable ["CTI_EXTERNAL_AMMO",_b,true];
	
};

CTI_P_LastStructurePreBuilt = _b;

_mtype = (_var select 0) call building_marker_type;

//Add arsenal to a barracks
if ((_var select 0) == "Barracks") then {
	0 = ["AmmoboxInit",[_b,false,{(_this distance _target) < 10}]] spawn BIS_fnc_arsenal;
	[_b,_faction] execVM "MOB_CTI\functions\arsenal_faction_weaponslist.sqf";
};


["BuildingConstructed",[_var select 0]] remoteExec ["BIS_fnc_showNotification",_side];

_markerstr = createMarker [format ["BuildingMkr%2%1%3",count _buildings,_var select 0,_faction],_pos];
=======
if (isNil{_buildings}) then {
	_buildings = [_b];	
} else {
	_buildings append [_b];
};

_mhq setVariable ["CTI_FACTORIES", _buildings, true];

CTI_P_LastStructurePreBuilt = _b;

_mtype = switch (_var select 0) do {
	case "Barracks": {"b_inf"};
	case "Light Factory": {"b_motor_inf"};
	case "Heavy Factory": {"b_armor"};
	case "Command Center": {"b_hq"};
	case "Aircraft Factory": {"b_air"};
	case "Service Depot": {"b_support"};
	case "Boat Dock": {"b_naval"};
	default {""};
};

//Add arsenal to a barracks
if ((_var select 0) == "Barracks") then {
	0 = ["AmmoboxInit",[_b,false]] spawn BIS_fnc_arsenal;
	[_b,_faction] execVM "MOB_CTI\functions\arsenal_faction_weaponslist.sqf";
};

["BuildingConstructed",[_var select 0]] remoteExec ["BIS_fnc_showNotification",_side];

_markerstr = createMarker [format ["BuildingMkr%2%1",count _buildings,_var select 0],_pos];
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
[_markerstr,"ICON"] remoteExec ["setMarkerShape",_side];
[_markerstr, _mtype] remoteExec ["setMarkerType",_side];
[_markerstr, "ColorYellow"] remoteExec ["setMarkerColor",_side];

[_side,_pos,(_var select 0)] call BIS_fnc_addRespawnPosition;

if(true)exitwith{};