//Land_i_house_Small_01_V1_F
<<<<<<< HEAD
private _h=_this;
=======
private _house=_this;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

private _chairW1=createSimpleObject["Land_ChairWood_F",[0,0,0]];
private _chairW2=createSimpleObject["Land_ChairWood_F",[0,0,0]];
private _desk1=createSimpleObject["Land_TableDesk_F",[0,0,0]];
private _microW=createSimpleObject["Land_Microwave_01_F",[0,0,0]];
private _fridge=createSimpleObject["Fridge_01_closed_F",[0,0,0]];
<<<<<<< HEAD
=======

>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
private _shelf=createSimpleObject["Land_OfficeCabinet_01_F",[0,0,0]];
private _stool=createSimpleObject["Land_Bench_F",[0,0,0]];
private _TV=createSimpleObject["Land_FlatTV_01_F",[0,0,0]];
private _sofa=createSimpleObject["Land_Sofa_01_F",[0,0,0]];
<<<<<<< HEAD
private _bed=createSimpleObject["Land_CampingTable_F",[0,0,0]];
private _blanket=selectRandom["Land_Sleeping_bag_F","Land_Sleeping_bag_blue_F","Land_Sleeping_bag_brown_F"];
private _blanket=createVehicle[_blanket,[0,0,0],[],0,"can_collide"];_blanket enableSimulationGlobal false;
private _rack=createSimpleObject["Land_Rack_F",[0,0,0]];
private _trash=createSimpleObject["Land_WheelieBin_01_F",[0,0,0]];
_trash attachTo[_h,[4.1,4.4,0.85]];_trash setDir 180;
_fridge attachTo[_h,[1,2.16,0.79]];_fridge setDir 180;
_sofa attachTo[_h,[-1.15,-3.8,0.76]];
_stool attachTo[_h,[-1,1.23,0.51]];_stool setDir 90;
_TV attachTo[_h,[-1.0,1.3,1.08]];
_desk1 attachTo[_h,[-0.3,2.16,0.57]];_desk1 setDir 180;
_microW attachTo[_h,[0.3,2.16,1.07]];_microW setDir 150;
_chairW1 attachTo[_h,[-1.4,2.08,0.1]];_chairW1 setDir 250;
_rack attachTo[_h,[-4.12,2.6,0.95]];
_shelf attachTo[_h,[-4.05,-4.1,1.08]];_shelf setDir 180;
_blanket attachTo[_h,[-3.5,1,0.77]];_blanket setDir 270;
_bed attachTo[_h,[-3.5,1,0.35]];_bed setDir 180;
_chairW2 attachTo[_h,[-0.6,2.36,1.52]];_chairW2 setVectorUp[0,0.1,-1];
if((dayTime<18)&&{(dayTime>5)})then{_TV setObjectTextureGlobal[0,(selectRandom["\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_pills_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_supermarket_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_maskrtnik_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_bluking_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_wine_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_plane_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_action_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_getlost_co.paa"])];};

if(PF_Optimize)then{
sleep .2;
{_x hideObjectGlobal true}forEach attachedObjects _H;};
=======
private _bed=createSimpleObject["Land_Sun_chair_green_F",[0,0,0]];
private _blanket=selectRandom["Land_Sleeping_bag_F","Land_Sleeping_bag_blue_F","Land_Sleeping_bag_brown_F"];
private _blanket=createVehicle[_blanket,[0,0,0],[],0,"can_collide"];_blanket enableSimulationGlobal false;

private _rack=createSimpleObject["Land_Rack_F",[0,0,0]];
private _trash=createSimpleObject["Land_WheelieBin_01_F",[0,0,0]];

_trash attachTo[_house,[4.1,4.4,0.85]];_trash setDir 180;
_fridge attachTo[_house,[1,2.16,0.79]];_fridge setDir 180;
_sofa attachTo[_house,[-1.15,-3.8,0.76]];
_stool attachTo[_house,[-0.9,1,0.51]];_stool setDir 90;
_TV attachTo[_house,[-1.0,0.9,1.08]];
_desk1 attachTo[_house,[-0.3,2.16,0.57]];_desk1 setDir 180;
_microW attachTo[_house,[0.3,2.16,1.07]];_microW setDir 150;
_chairW1 attachTo[_house,[-1.4,2.08,0.1]];_chairW1 setDir 250;
_rack attachTo[_house,[-4.12,2.6,0.95]];
_shelf attachTo[_house,[-4.05,-4.1,1.08]];_shelf setDir 180;
//_sofa attachTo[_house,[0.45,6.75,4.35]];_sofa setDir 180;
_blanket attachTo[_house,[-3.3,1,0.63]];_blanket setDir 270;
_bed attachTo[_house,[-3.3,1,0.44]];_bed setDir 90;
_chairW2 attachTo[_house,[-0.6,2.36,1.52]];_chairW2 setVectorUp[0,0.1,-1];

if(dayTime>18 || dayTime<5)then{
	sleep 5;
	private _guyHome=_house nearEntities["Man",6];
	if(count _guyHome>0)then{
	private _light=createVehicle["#lightpoint",[0,0,0],[],0,"can_collide"];
	_light attachTo[_house,[-2,4,1.5]];
	_light setLightColor[1,1,1];  
	_light setLightAmbient[1,1,1];  
	_light setLightBrightness 0.1;};
	};

sleep 1;

_house enableSimulationGlobal false;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
