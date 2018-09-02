_unit = _this select 0;
_factory_type = _this select 1;
private [ "_nearfac" ];

_mhq = player getVariable "CTI_PLAYER_MHQ";
_factories = _mhq getVariable "CTI_FACTORIES";

_distances = _factories apply { if (_X getVariable "CTI_FACTORY_TYPE" == _factory_type) then {[_unit distance _x, _x]} else {""}};
_distances = _distances - [""];
_distances sort true;

hint format ["%1",_distances];

_nearfac = (_distances select 0) select 1;

_nearfac
