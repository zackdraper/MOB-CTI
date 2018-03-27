/*
  # HEADER #
	Script: 		Client\Functions\Client_PlacingDefense.sqf
	Alias:			CTI_CL_FNC_PlacingDefense
	Description:	Prepare the placement of a defense before the construction
	Author: 		Benny
	Creation Date:	20-09-2013
	Revision Date:	14-10-2013
	
  # PARAMETERS #
    0	[String]: The defense variable name
    1	[Object]: The center (construction center)
    2	[Number]: The construction radius
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[DEFENSE VARIABLE, CENTER, RADIUS] spawn CTI_CL_FNC_PlacingDefense
	
  # DEPENDENCIES #
	Client Function: CTI_CL_FNC_ChangePlayerFunds
	Client Function: CTI_CL_FNC_GetPlayerFunds
	Common Function: CTI_CO_FNC_GetDirTo
	Common Function: CTI_CO_FNC_NetSend
	
  # EXAMPLE #
    [_selected, CTI_P_SideJoined call CTI_CO_FNC_GetSideHQ, CTI_BASE_CONSTRUCTION_RANGE] spawn CTI_CL_FNC_PlacingDefense;
*/
private ["_pos","_save_pos","_areas","_dir"];

_var = _this select 0;
_center = _this select 1;
_center_distance = _this select 2;


if (profileNamespace getVariable "CTI_PERSISTENT_HINTS") then {
hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br /><t align='justify'>Is this your first time in the <t color='#74bbf2'>Construction Preview Mode</t>?<br /><br />
You may chose to <t color='#9CF863'>Place</t> or <t color='#F86363'>Cancel</t> the defense from your action menu.<br /><br />
Some of those Key Binding may help you during the placement:<br /><br />
- Rotate (<t color='#7bef15'>+1</t>): <t align='right'><t color='#f4cb38'>User1</t></t><br />
- Rotate (<t color='#7bef15'>+5</t>): <t align='right'><t color='#f4cb38'>Ctrl</t> + <t color='#f4cb38'>User1</t></t><br />
- Rotate (<t color='#7bef15'>+45</t>): <t align='right'><t color='#f4cb38'>Shift</t> + <t color='#f4cb38'>User1</t></t><br />
- Distance (<t color='#7bef15'>+1</t>): <t align='right'><t color='#f4cb38'>Alt</t> + <t color='#f4cb38'>User1</t></t><br /><br />
- Rotate (<t color='#ef5315'>-1</t>): <t align='right'><t color='#f4cb38'>User2</t></t><br />
- Rotate (<t color='#ef5315'>-5</t>): <t align='right'><t color='#f4cb38'>Ctrl</t> + <t color='#f4cb38'>User2</t></t><br />
- Rotate (<t color='#ef5315'>-45</t>): <t align='right'><t color='#f4cb38'>Shift</t> + <t color='#f4cb38'>User2</t></t><br />
- Distance (<t color='#ef5315'>-1</t>): <t align='right'><t color='#f4cb38'>Alt</t> + <t color='#f4cb38'>User2</t></t><br /><br />
- Reset to Default: <t align='right'><t color='#f4cb38'>User3</t></t><br /><br />
Note that those Keys are not binded by default, you may chose to bind them by going in the game <t color='#bd9df2'>Options</t> (not the mission!) and selecting <t color='#bd9df2'>Controls</t>.<br /><br />
Those Keys may be found after selecting <t color='#bd9df2'>Custom Controls</t> from the 'Show' filter.<br /><br />
</t>";
};
CTI_VAR_StructureCanceled = false;
CTI_VAR_StructureProhibit = false;
CTI_P_StructureRotate = 0;
CTI_P_StructureRotateMulti = 1;
CTI_P_PreBuilding = true;
CTI_P_PreBuilding_SafePlace = false;

CTI_P_KeyRotate = 0;
CTI_P_KeyDistance = 0;
CTI_P_KeyDistance_Min = -10;
CTI_P_KeyDistance_Max = 20;

_faction = player getVariable "CTI_PLAYER_FACTION";

_dehKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "nullReturn = _this spawn CTI_UI_KeyHandler_BuildMenu_KeyDown"];
_dehKeyUp = (findDisplay 46) displayAddEventHandler ["KeyUp", "nullReturn = _this spawn CTI_UI_KeyHandler_BuildMenu_KeyUp"];
_dehMouse = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "nullReturn = _this spawn CTI_UI_KeyHandler_BuildMenu_MouseButtonDown"];

_classname = _var select 1;
_local = _classname createVehicleLocal getPos player;
_direction_structure = 180 - (getdir player);
_distance_structure = 5;

_mhq = player getVariable "CTI_PLAYER_MHQ";
_side = side player;

// {_local disableCollisionWith _x} forEach (_center nearEntities (_center_distance+500));

_last_collision_update = -600;
_condition = {true};
//{if (_x select 0 == "Condition") exitWith {_condition = _x select 1}} forEach (_var select 5);

_action = player addAction ["<t color='#9CF863'>Place Defense</t>", "MOB_CTI\functions\action_buildingplace.sqf"];
_action2 = player addAction ["<t color='#F86363'>Cancel Defense</t>", "MOB_CTI\functions\action_buildingplace_cancel.sqf"];

_dir = 0;
_pos = [];

while {!CTI_VAR_StructurePlaced && !CTI_VAR_StructureCanceled && alive player} do {
	_pos = screenToWorld [0.5,0.5];
	_save_pos = _pos;
	
	if (!alive _center) exitWith {CTI_VAR_StructureCanceled = true};
	
	{
		_local disableCollisionWith _x;
	} forEach (_center nearObjects CTI_BASE_CONSTRUCTION_RANGE);

	CTI_P_PreBuilding_SafePlace = if (!surfaceIsWater _pos && !(count(_pos nearObjects ["Building", 10] - [_local]) > 1) && !(count(_pos nearEntities [['Man','Car','Motorcycle','Tank','Air','Ship'], 10]) > 0) ) then {true} else {false};
	
	_test = !(count(_pos nearEntities [['Man','Car','Motorcycle','Tank','Air','Ship'], 10]) > 0);
	//player sidechat format ["%1 %2",_pos, _test];

	if (_center distance _local > _center_distance || !CTI_P_PreBuilding_SafePlace) then {
		_local hideObject true;
		CTI_VAR_StructureProhibit = true;
	} else { 
		CTI_VAR_StructureProhibit = false;
		_local hideObject false;
	};
	
	_dir = _dir + (CTI_P_StructureRotate * CTI_P_StructureRotateMulti);
	CTI_P_StructureLastDir = _dir;
	_local setDir _dir;
	
	_pos set [2, 0];
	_local setPos _pos;
	
	_canCollide = if (CTI_P_PreBuilding_SafePlace) then {"<t color='#7bef15'>No</t>"} else {"<t color='#ff0000'>Yes</t>"};
	_inRange = if (_center distance _local <= _center_distance) then {"<t color='#7bef15'>Yes</t>"} else {"<t color='#ff0000'>No</t>"};
	
	if (profileNamespace getVariable "CTI_PERSISTENT_HINTS") then {
		hintSilent parseText format ["<t size='1.3' color='#2394ef'>Information</t> <br /><br /><t align='justify'>Is this your first time in the <t color='#74bbf2'>Construction Preview Mode</t>? <br /><br />The dummy unit shows where the units which may be purchased from that structure will spawn at. <br /><br />Some of these controls may help you during the placement: <br /><br />- Left click: <t color='#9CF863'>Place</t> building. <br />- Right click: <t color='#F86363'>Cancel</t> building. <br />- Left Ctrl: <t color='#f4cb38'>Rotate</t> clockwise. <br />- Left Alt: <t color='#f4cb38'>Rotate</t> anti-clockwise. <br />- Left Shift: <t color='#f4cb38'>Rotate</t> faster <br /> <br /><br />The building must be placed in the area boundary and cannot be placed if colliding with another object. Use these warnings to help: <br /><br />Building colliding: %1 <br />Building in range: %2 <br /></t>", _canCollide, _inRange];
	} else {
		hintSilent parseText format ["<t size='1.3' color='#2394ef'>Information</t> <br /><br /><t align='justify'>Building colliding: %1 <br />Building in range: %2 <br /></t>", _canCollide, _inRange];
	};
	
	sleep .01;
};

player removeAction _action;
player removeAction _action2;


CTI_P_PreBuilding = false;
deleteVehicle _local;
hintSilent "";

(findDisplay 46) displayRemoveEventHandler ["KeyDown", _dehKeyDown];
(findDisplay 46) displayRemoveEventHandler ["KeyUp", _dehKeyUp];
(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _dehMouse];

_funds = _mhq getVariable "CTI_FUNDS";
_cost = [_var select 2,_var select 3,0];

if !(CTI_VAR_StructureCanceled) then {
	_bool = [_cost,_funds,9999] call cost_affordable;
	player sidechat format ["%1",_bool];
	if (_bool) then {
		[_mhq,_cost] call subtract_funds; 
		[_var,_pos,_dir,_faction,_side,_mhq] call CTI_CREATEDEFENCES;
	} else {
		hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br />You do not have enough funds to place that structure.";
	};
};

CTI_KILL_CAMERA = True;