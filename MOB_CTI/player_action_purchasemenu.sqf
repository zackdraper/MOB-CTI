_faction = player getVariable "CTI_PLAYER_FACTION";
_mhq = player getVariable "CTI_PLAYER_MHQ";

_factories = _mhq getVariable "CTI_FACTORIES";

if(count _factories < 1)exitwith{hint "No Factories are available. Build one!"};

createDialog "CTI_RscPurchaseMenu";

if(true)exitwith{};