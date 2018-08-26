/*

	make_int_array.sqf

	read a faction array of units to find particular search pattern
	
*/
//////////////////////////////////////////////////////////////////////////////
_return = [];
for [{_i=0}, {_i < _this}, {_i=_i+1}] do {
	_return append [_i];
};
_return