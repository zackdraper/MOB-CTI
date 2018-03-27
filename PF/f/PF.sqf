if(!isServer)exitWith{};
private["_towns","_townTypes","_town","_townName","_townPos","_townX","_townY","_townType","_townDir","_tArea"];
PF_WN=worldName;
PF_Houses=[
//Altis, Malden, Stratis
"Land_i_House_Small_01_V1_F",
"Land_i_House_Small_01_V2_F",
"Land_i_House_Small_01_V3_F",
"Land_i_House_Small_01_b_blue_F",
"Land_i_House_Small_01_b_pink_F",
"Land_i_House_Small_01_b_white_F",
"Land_i_House_Small_01_b_whiteblue_F",
"Land_i_House_Small_01_b_brown_F",
"Land_i_House_Small_01_b_yellow_F",
"Land_i_House_Small_02_V1_F",
"Land_i_House_Small_02_V2_F",
"Land_i_House_Small_02_V3_F",
"Land_i_House_Small_03_V1_F",
"Land_i_Stone_Shed_V1_F",
"Land_i_Stone_Shed_V2_F",
"Land_i_Stone_Shed_V3_F",
"Land_i_Stone_HouseSmall_V1_F",
"Land_i_Stone_HouseSmall_V2_F",
"Land_i_Stone_HouseSmall_V3_F",
"Land_Shed_08_brown_F",
"Land_Shed_08_grey_F",
"Land_i_Stone_Shed_01_b_clay_F",
"Land_i_Stone_Shed_01_b_raw_F",
"Land_i_Stone_Shed_01_b_white_F",
"Land_i_Stone_Shed_01_c_clay_F",
"Land_i_Stone_Shed_01_c_raw_F",
"Land_i_Stone_Shed_01_c_white_F",
"Land_Barn_01_brown_F",
"Land_Barn_01_grey_F",
"Land_i_Addon_02_V1_F",
"Land_CarService_F",
"Land_FuelStation_02_workshop_F",
"Land_i_Garage_V1_F",
"Land_i_Garage_V2_F",
"Land_i_Stone_HouseBig_V1_F",
"Land_i_Stone_HouseBig_V2_F",
"Land_i_Stone_HouseBig_V3_F",
"Land_i_Stone_House_Big_01_b_clay_F",
"Land_i_House_Big_01_V1_F",
"Land_i_House_Big_01_V2_F",
"Land_i_House_Big_01_V3_F",
"Land_i_House_Big_01_b_blue_F",
"Land_i_House_Big_01_b_whiteblue_F",
"Land_i_House_Big_01_b_pink_F",
"Land_i_House_Big_01_b_pink_F",
"Land_i_House_Big_01_b_white_F",
"Land_i_House_Big_01_b_brown_F",
"Land_i_House_Big_02_V1_F",
"Land_i_House_Big_02_V2_F",
"Land_i_House_Big_02_V3_F",
"Land_i_House_Big_02_b_blue_F",
"Land_i_House_Big_02_b_pink_F",
"Land_i_House_Big_02_b_white_F",
"Land_i_House_Big_02_b_whiteblue_F",
"Land_i_House_Big_02_b_brown_F",
"Land_i_House_Big_02_b_yellow_F",
"Land_i_Shop_01_V1_F",
"Land_i_Shop_01_V2_F",
"Land_i_Shop_01_V3_F",
"Land_i_Shop_02_V1_F",
"Land_i_Shop_02_V2_F",
"Land_i_Shop_02_V3_F",
"Land_i_Shop_02_b_blue_F",
"Land_i_Shop_02_b_pink_F",
"Land_i_Shop_02_b_white_F",
"Land_i_Shop_02_b_whiteblue_F",
"Land_i_Shop_02_b_brown_F",
"Land_i_Shop_02_b_yellow_F",
"Land_Offices_01_V1_F",

//Tanoa
"Land_House_Big_01_F",
"Land_House_Small_06_F"];

{if(!(_x in allMapMarkers))then{PF_Blacklist=PF_Blacklist-[_x];};}forEach PF_Blacklist;

_towns=configFile>>"CfgWorlds">>PF_WN>>"Names";
_townTypes=[
	//A3
	"Airport","CityCenter","Hill","NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage","VegetationBroadleaf","VegetationVineyard","Viewpoint",
	//CUP
	"FlatArea","FlatAreaCity","FlatAreaCitySmall","NameCity","NameCityCapital","NameLocal","NameVillage","StrongpointArea","VegatationFir"];

for"_x"from 0 to(count _towns-1)do{
_town=_towns select _x;

_townName=getText(_town>>"name");
_townPos=getArray(_town>>"position");
_townX=getNumber(_town>>"radiusA");
_townY=getNumber(_town>>"radiusB");
_townType=getText(_town>>"type");
_townDir=getNumber(_town>>"angle");

	if(_townType in _townTypes)then{
	_tArea=0;
	if(_townX>_townY)then{_tArea=_townX;_tArea}else{_tArea=_townY;_tArea};
		
	
	if(count(nearestObjects[_townPos,PF_Houses,_tArea])>0)then{
	private _m=createMarker[format["m--%1",_townPos],_townPos];
	_m setMarkerShape"RECTANGLE";
	_m setMarkerBrush"SolidBorder";
	_m setMarkerSize[_tArea,_tArea];
	_m setMarkerAlpha 0.4;if(!PF_Dbug)then{_m setMarkerAlpha 0;};
	_m setMarkerColor"ColorCiv";
	_m setMarkerDir _townDir;
	
	_t=createTrigger["EmptyDetector",_townPos,false];
	_t setTriggerArea[_tArea,_tArea,_townDir,true,99];
	_t setTriggerTimeout[2,2,2,true];
	_t setTriggerActivation["ANYPLAYER","PRESENT",TRUE];

sleep .02;

	_t setTriggerStatements[
	//TRIGGER CONDITION
	"{isPlayer _x}count thisList>0",

	//TRIGGER ACTIVATION
	"if(PF_Dbug)then{systemChat'Trigger Activated';};
	private _tPos=getPosATL thisTrigger;
	
	private _nearH=nearestObjects[_tPos,PF_Houses,((triggerArea thisTrigger)select 0)+40,true];
	if(PF_Dbug)then{systemChat format['%1 houses found',count _nearH];};

		{if(PF_Chance>floor random 100)then{
		if((isObjectHidden _x)||(damage _x>0.5))exitWith{};

		_isBL=false;
		if(!(PF_Blacklist isEqualTo[])||{(PF_Blacklist isEqualTo[''])})then{_house=_x;{_isBL=_house inArea _x;if(_isBL)exitWith{};}count PF_Blacklist;};
		if(_isBL)exitWith{};
		_hPads=_x nearObjects['Land_HelipadEmpty_F',2];
		if(count _hPads>0)exitWith{};
		private _tempH=createVehicle['Land_HelipadEmpty_F',getPosATL _x,[],0,'can_collide'];
		_tempH setDir(getDir _x);
		[_tempH,_x]call PF_spawn;};
		}forEach _nearH;",

	//TRIGGER DEACTIVATION
	"if(PF_Dbug)then{systemChat'Trigger Deactivated';};
	{	_isBL2=false;
		if(!(PF_Blacklist isEqualTo[])||{(PF_Blacklist isEqualTo[''])})then{_furn=_x;{_isBL2=_furn inArea _x;if(_isBL2)exitWith{};}count PF_Blacklist;};
		if(_isBL2)exitWith{};
		
		if(typeOf _x in['Land_HelipadEmpty_F','Fireplace_burning_F','MetalBarrel_burning_F'])then{
			if(!simulationEnabled _x)then{{deleteVehicle _x}count attachedObjects _x;};deleteVehicle _x;};

	}forEach nearestObjects[getPosATL thisTrigger,['Land_HelipadEmpty_F','Fireplace_burning_F','MetalBarrel_burning_F'],((triggerArea thisTrigger)select 0)+40,true];"];};
	};
};


addMissionEventHandler["buildingChanged",{
private _b=_this select 1;
if(!(typeOf _b in["House_F","HouseBase","House_EP1"]))exitWith{};
if(count(_b buildingPos -1)<2)exitWith{};
private _pad=(_b nearObjects["Land_HelipadEmpty_F",2])select 0;
if(!simulationEnabled _pad)then{{deleteVehicle _x}forEach attachedObjects _pad;deleteVehicle _pad;};}];