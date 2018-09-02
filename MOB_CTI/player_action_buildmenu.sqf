_mhq = _this select 0;
_params = _this select 3;
_force = _params select 0;

//player setVariable ["CTI_MHQ",_mhq];

CTI_KILL_CAMERA = True;
createDialog "CTI_RscBuildMenu";

waituntil{!dialog && CTI_KILL_CAMERA};

camDestroy CTI_ConstructionCamera;
CTI_ConstructionCamera = nil;

if(true)exitwith{};