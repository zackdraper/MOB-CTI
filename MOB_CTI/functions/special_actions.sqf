/*

	special_actions.sqf

	handle key down events for special actions
	
*/
//////////////////////////////////////////////////////////////////////////////

_key = _this select 1; 
private _c = FALSE; 
//player setVariable ['QS_client_afkTimeout',time,FALSE]; 
//hint "Hit a Key";

if (_key in [197,207]) then {
	[] call client_earplugs;
};

if (_key in (actionKeys 'GetOver')) then {
	if (isNull (objectParent player)) then {
		if (({((!isNull _x) && (!(_x isKindOf 'Sign_Sphere10cm_F')))} count (attachedObjects player)) isEqualTo 0) then {
			if (_this select 2) then {
				_c = TRUE;
				_this call client_jump;
			};
		} else {
			_c = TRUE;
		};
	};
};

if (_key in (actionKeys 'ReloadMagazine')) then {
	if (_this select 3) then {
		if ((isNull (objectParent player)) || {(!(player isEqualTo (driver (vehicle player))))}) then {
			if (({((!isNull _x) && (!(_x isKindOf 'Sign_Sphere10cm_F')))} count (attachedObjects player)) isEqualTo 0) then {
				player spawn client_repack_magazines;
				_c = TRUE;
			};
		};
	};
};

_c;