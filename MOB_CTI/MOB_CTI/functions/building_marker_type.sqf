/*

	buildingmarkertype.sqf

	return marker type for a given building
	
*/
//////////////////////////////////////////////////////////////////////////////

private "_mtype";
_mtype = _this;

_mtype = switch (_mtype) do {
	case "Barracks": {"b_inf"};
	case "Light Factory": {"b_motor_inf"};
	case "Heavy Factory": {"b_armor"};
	case "Command Center": {"b_hq"};
	case "Aircraft Factory": {"b_air"};
	case "Service Depot": {"b_support"};
	case "Boat Dock": {"b_naval"};
	default {"b_unknown"};
};

_mtype