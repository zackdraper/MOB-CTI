/*
  # HEADER #
	Script: 		Client\Functions\Client_PlacingBuilding.sqf
	Alias:			CTI_CL_FNC_PlacingBuilding
	Description:	Prepare the placement of a structure before the construction
	Author: 		Benny
	Creation Date:	19-09-2013
	Revision Date:	19-09-2013
	
  # PARAMETERS #
    0	[String]: The structure variable name
    1	[Object]: The center (construction center)
    2	[Number]: The construction radius
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[STRUCTURE VARIABLE, CENTER, RADIUS] spawn CTI_CL_FNC_PlacingBuilding
	
  # DEPENDENCIES #
	Client Function: CTI_CL_FNC_ChangePlayerFunds
	Client Function: CTI_CL_FNC_GetPlayerFunds
	Common Function: CTI_CO_FNC_GetDirTo
	Common Function: CTI_CO_FNC_NetSend
	
  # EXAMPLE #
    [_selected, CTI_P_SideJoined call CTI_CO_FNC_GetSideHQ, CTI_BASE_CONSTRUCTION_RANGE] spawn CTI_CL_FNC_PlacingBuilding;
*/
private ["_pos","_save_pos","_areas"];

_var = _this select 0;
_center = _this select 1;
_center_distance = _this select 2;


CTI_VAR_StructureCanceled = false;
CTI_VAR_StructureProhibit = false;
CTI_P_StructureRotate = 0;
CTI_P_StructureRotateMulti = 1;
CTI_P_PreBuilding = true;
CTI_P_PreBuilding_SafePlace = false;

_mhq = player getVariable "CTI_PLAYER_MHQ";
_mhq_veh = _mhq getVariable "CTI_MHQ_VEH";
_side = side player;
_faction = player getVariable "CTI_PLAYER_FACTION";

_local = (_var select 1) createVehicleLocal getPos player;
_local enableSimulation false;
[_local, _mhq_veh] remoteExecCall ["disableCollisionWith", 0, _local];
_direction_structure = 180 - (getdir player);
_distance_structure = 15;
_last_collision_update = -600;

_dehKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "nullReturn = _this spawn CTI_UI_KeyHandler_BuildMenu_KeyDown"];
_dehKeyUp = (findDisplay 46) displayAddEventHandler ["KeyUp", "nullReturn = _this spawn CTI_UI_KeyHandler_BuildMenu_KeyUp"];
_dehMouse = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "nullReturn = _this spawn CTI_UI_KeyHandler_BuildMenu_MouseButtonDown"];

_pos = [];
_dir = if (!isNil 'CTI_P_StructureLastDir') then {CTI_P_StructureLastDir} else {_direction_structure};
_helper = [];

_helperModel = "Sign_Arrow_Blue_F";
if (_helperModel != "") then {
	_helper = _helperModel createVehicleLocal getPos player;
	_helper enableSimulation false;
};

while {!CTI_VAR_StructurePlaced && !CTI_VAR_StructureCanceled && alive player} do {
	_pos = screenToWorld [0.5,0.5];
	_save_pos = _pos;
	
	if (!alive _center) exitWith {CTI_VAR_StructureCanceled = true};
	
	{
		[_local, _x] remoteExecCall ["disableCollisionWith", 0, _local];
		if (_helperModel != "") then {_helper disableCollisionWith _x};
	} forEach (_center nearObjects CTI_BASE_CONSTRUCTION_RANGE);

	CTI_P_PreBuilding_SafePlace = if (!surfaceIsWater _pos && !(count(_pos nearObjects ["Building", 10] - [_local]) > 1) && !(count(_pos nearEntities [['Man','Car','Motorcycle','Tank','Air','Ship'], 10]) > 0) ) then {true} else {false};
	
	_test = !(count(_pos nearEntities [['Man','Car','Motorcycle','Tank','Air','Ship'], 10]) > 0);
	//player sidechat format ["%1 %2",_pos, _test];

	if (_center distance _local > _center_distance || !CTI_P_PreBuilding_SafePlace) then {
		_local hideObject true;
		CTI_VAR_StructureProhibit = true;
		if (_helperModel != "") then {_helper hideObject true};
	} else { 
		CTI_VAR_StructureProhibit = false;
		_local hideObject false;
		if (_helperModel != "") then {_helper hideObject false};
	};
	
	_dir = _dir + (CTI_P_StructureRotate * CTI_P_StructureRotateMulti);
	CTI_P_StructureLastDir = _dir;
	_local setDir _dir;
	
	_pos set [2, 0];
	_local setPos _pos;

	if (_helperModel != "") then {
		_helper_pos = _local modelToWorld [(sin (360 -_direction_structure) * _distance_structure), (cos (360 -_direction_structure) * _distance_structure), 0];
		_helper_pos set [2, 0];
		_helper setPos _helper_pos;
		_helper setDir _dir;
	};
	
	_canCollide = if (CTI_P_PreBuilding_SafePlace) then {"<t color='#7bef15'>No</t>"} else {"<t color='#ff0000'>Yes</t>"};
	_inRange = if (_center distance _local <= _center_distance) then {"<t color='#7bef15'>Yes</t>"} else {"<t color='#ff0000'>No</t>"};
	
	if (profileNamespace getVariable "CTI_PERSISTENT_HINTS") then {
		hintSilent parseText format ["<t size='1.3' color='#2394ef'>Information</t> <br /><br /><t align='justify'>Is this your first time in the <t color='#74bbf2'>Construction Preview Mode</t>? <br /><br />The dummy unit shows where the units which may be purchased from that structure will spawn at. <br /><br />Some of these controls may help you during the placement: <br /><br />- Left click: <t color='#9CF863'>Place</t> building. <br />- Right click: <t color='#F86363'>Cancel</t> building. <br />- Left Ctrl: <t color='#f4cb38'>Rotate</t> clockwise. <br />- Left Alt: <t color='#f4cb38'>Rotate</t> anti-clockwise. <br />- Left Shift: <t color='#f4cb38'>Rotate</t> faster <br /> <br /><br />The building must be placed in the area boundary and cannot be placed if colliding with another object. Use these warnings to help: <br /><br />Building colliding: %1 <br />Building in range: %2 <br /></t>", _canCollide, _inRange];
	} else {
		hintSilent parseText format ["<t size='1.3' color='#2394ef'>Information</t> <br /><br /><t align='justify'>Building colliding: %1 <br />Building in range: %2 <br /></t>", _canCollide, _inRange];
	};
	
	sleep .01;
};

CTI_P_PreBuilding = false;

if (_helperModel != "") then {
	detach _helper;
	deleteVehicle _helper;
};

deleteVehicle _local;
hintSilent "";

_pos = _save_pos;

(findDisplay 46) displayRemoveEventHandler ["KeyDown", _dehKeyDown];
(findDisplay 46) displayRemoveEventHandler ["KeyUp", _dehKeyUp];
(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _dehMouse];

//--- First check if the surface is water based
if (surfaceIsWater _pos) exitWith {hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />The structure may not be placed here."};

//--- Check the distance 2D between our position and the potential areas
_in_area = false;
_areas = _mhq getVariable "CTI_AREAS";

//player sidechat format ["%1",_areas];

if (count _areas > 0) then { 
	{if ([_pos select 0, _pos select 1] distance [_x select 0, _x select 1] <= CTI_BASE_AREA_RANGE) exitWith {_in_area = true}} forEach _areas;
};

//--- Maybe we have no area in range?
if !(_in_area) then {
	//--- If we have none, then have we reached our limit?
	if ((count _areas) >= CTI_BASE_AREA_MAX) then {
		CTI_VAR_StructureCanceled = true;
		hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />The base area limit has been reached.";
	};
};

//todo: structure 'build' mode expires > check areas for other structures + buildings (if 0 then remove)

_funds = _mhq getVariable "CTI_FUNDS";

//--- If there's no problems then we place it.
if !(CTI_VAR_StructureCanceled) then {
	if (_funds select 0 >= _var select 2) then {
		//--- We create a new area if we still have room for areas and of course, we allow the construction
		if (count _areas > 0) then { 
			_areas append [[_pos select 0, _pos select 1]];
		} else {
			_areas = [[_pos select 0, _pos select 1]];
		};
		_mhq setVariable ["CTI_AREAS", _areas, true];
		[_mhq,[(_var select 2),0,0]] call subtract_funds; 
		[_var,_pos,_dir,_faction,_side,_mhq] call CTI_CREATEBUILDINGS;
	} else {
		hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You do not have enough funds to place that structure.";
	};
};

CTI_KILL_CAMERA = True;

if (true) exitWith {};