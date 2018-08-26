/*

	read_twod_array_col.sqf

	read a faction array of units to find particular search pattern
	
*/
//////////////////////////////////////////////////////////////////////////////
_array = _this select 0;
_col = _this select 1;
_rowcond = _this select 2;
_return = [];

//player sidechat format ["%1",_this];

if (isNil{_array}) exitwith{};

if (typeName _array == "Array") then {
	for [{_i=0}, {_i < count _array}, {_i=_i+1}] do {
		_r = _array select _i;
		if (_rowcond in _r) then {
			_return append [(_r select _col)];
		};
	};
};

_return