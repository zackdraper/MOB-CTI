private ["_alt", "_control", "_key", "_shift"];
_key = _this select 1;
_shift = _this select 2;
_control = _this select 3;
_alt = _this select 4;
	
switch (true) do {
	case (_key in actionKeys "User1"): {
		if (_alt) then {
			CTI_P_KeyDistance = CTI_P_KeyDistance + 1;
			if (CTI_P_KeyDistance >= CTI_P_KeyDistance_Max) then { CTI_P_KeyDistance = CTI_P_KeyDistance_Max };
		} else {
			_rotate = switch (true) do { case (_shift): {45}; case (_control): {5};	default {1} };
			CTI_P_KeyRotate = CTI_P_KeyRotate + _rotate;
		};
	};
	case (_key in actionKeys "User2"): {
		if (_alt) then {
			CTI_P_KeyDistance = CTI_P_KeyDistance - 1;
			if (CTI_P_KeyDistance <= CTI_P_KeyDistance_Min) then { CTI_P_KeyDistance = CTI_P_KeyDistance_Min };
		} else {
			_rotate = switch (true) do { case (_shift): {45}; case (_control): {5};	default {1} };
				CTI_P_KeyRotate = CTI_P_KeyRotate - _rotate;
		};
	};
	case (_key in actionKeys "User3"): {
		CTI_P_KeyRotate = 0;
		CTI_P_KeyDistance = 0;
	};
};

if(true)exitwith{};