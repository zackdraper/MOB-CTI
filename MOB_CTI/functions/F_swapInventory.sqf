params [ "_unit1", "_unit2" ];
private [ "_loadout" ];

[_unit1, [missionNamespace, "swapInv"]] call BIS_fnc_saveInventory;
[_unit2, [missionNamespace, "swapInv"]] call BIS_fnc_loadInventory;