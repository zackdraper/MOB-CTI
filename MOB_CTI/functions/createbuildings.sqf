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


_buildings = _mhq getVariable "CTI_FACTORIES";

_b = createVehicle [_var select 1, _pos, [], 0, "None"];
_b setdir _dir;
_b enableSimulationGlobal true;
_b allowdamage true;

_b setVariable ["CTI_FACTORY_TYPE", _var select 0, true];
_b setVariable ["CTI_FACTORY_MHQ", _mhq, true];

_mtype = (_var select 0) call building_marker_type;
_markerstr = createMarker [format ["BuildingMkr%2%1%3",count _buildings,_var select 0,_faction],_pos];
[_markerstr,"ICON"] remoteExec ["setMarkerShape",_side];
[_markerstr, _mtype] remoteExec ["setMarkerType",_side];
[_markerstr, "ColorYellow"] remoteExec ["setMarkerColor",_side];

_b setVariable ["CTI_FACTORY_MARKER", _markerstr, true];

//Add external supply chain to ammo point
if ((_var select 0) != "Supply Point") then {

	if (isNil{_buildings}) then {
		_buildings = [_b];	
	} else {
		_buildings append [_b];
	};

	_mhq setVariable ["CTI_FACTORIES", _buildings, true];
	
	_res = [_side,_pos,(_var select 0)] call BIS_fnc_addRespawnPosition;
	
	_b setVariable ["CTI_FACTORY_RESPAWN", _res, true];
	
	_b addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
		
		_dam = _unit getVariable ["CTI_FACTORY_DAMAGE",0];
		
		_dam = _dam +_damage;
		
		if (!(alive _unit) || (_dam > 20)) then {
			_mkr = _unit getVariable "CTI_FACTORY_MARKER";
			deleteMarker _mkr;
		
			_res = _unit getVariable "CTI_FACTORY_RESPAWN";
			_res call BIS_fnc_removeRespawnPosition;
			
			_mhq = _unit getVariable "CTI_FACTORY_MHQ";
			_buildings = _mhq getVariable "CTI_FACTORIES";
			_mhq setVariable ["CTI_FACTORIES", (_buildings - [_unit]), true];
			
			_type = _unit getVariable "CTI_FACTORY_TYPE";
			_side = _mhq getVariable "CTI_SIDE";
			["BuildingDestroyed",[_type]] remoteExec ["BIS_fnc_showNotification",_side];
			
			_unit removeAllEventHandlers "HandleDamage";
		};
		//player sidechat str _dam;
		_unit setVariable ["CTI_FACTORY_DAMAGE",_dam];
	}];
	
} else {

	_mhq setVariable ["CTI_EXTERNAL_AMMO",_b,true];
	
};

CTI_P_LastStructurePreBuilt = _b;

//Add arsenal to a barracks
if ((_var select 0) == "Barracks") then {
	0 = ["AmmoboxInit",[_b,false,{(_this distance _target) < 10}]] spawn BIS_fnc_arsenal;
	[_b,_faction] execVM "MOB_CTI\functions\arsenal_faction_weaponslist.sqf";
};

["BuildingConstructed",[_var select 0]] remoteExec ["BIS_fnc_showNotification",_side];

if(true)exitwith{};