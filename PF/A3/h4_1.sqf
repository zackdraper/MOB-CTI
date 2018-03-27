//Land_i_Garage_V1_F
private _house=_this;
private _housePos=getPosATL _this;

switch(round(random 3))do{
case 1:{private _car=createSimpleObject["C_Hatchback_01_F",[0,0,0]];sleep 1;_car attachTo[_house,[0,-1.3,1.46]];_car setDir(random 10)+90;};
case 2:{private _jeep=createSimpleObject["C_Offroad_02_unarmed_F",[0,0,0]];sleep 1;_jeep attachTo[_house,[0,-1.3,1.55]];_jeep setDir(random 10)+90;};
case 3:{private _4x4=createSimpleObject["C_Offroad_01_F",[0,0,0]];sleep 1;_4x4 attachTo[_house,[0.2,-1.3,1.67]];_4x4 setDir(random 10)+90;};
case 4:{private _car=createSimpleObject["C_Hatchback_01_sport_F",[0,0,0]];sleep 1;_car attachTo[_house,[0,-1.3,1.46]];_car setDir(random 10)+90;};};
private _bike=createSimpleObject["C_Quadbike_01_F",[0,0,0]];
private _trash=createSimpleObject["Land_WheelieBin_01_F",[0,0,0]];

_trash attachTo[_house,[-3,2.3,0.64]];_trash setDir(random -20);
_bike attachTo[_house,[-1,2,1.5]];_bike setDir(random 10)+90;

sleep 1;

_house enableSimulationGlobal false;