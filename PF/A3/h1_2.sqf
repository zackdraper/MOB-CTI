//Land_i_house_Big_01_V1_F
<<<<<<< HEAD
private _h=_this;
=======
private _house=_this;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff

private _bed=createSimpleObject["Land_WoodenBed_01_F",[0,0,0]];
private _sofa2=createSimpleObject["Land_ArmChair_01_F",[0,0,0]];
private _radio=createSimpleObject["Land_FMRadio_F",[0,0,0]];
<<<<<<< HEAD
=======

>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
private _dTable=createSimpleObject["Land_TableBig_01_F",[0,0,0]];
private _chairW1=createSimpleObject["Land_ChairWood_F",[0,0,0]];
private _chairW2=createSimpleObject["Land_ChairWood_F",[0,0,0]];
private _chairW3=createSimpleObject["Land_ChairWood_F",[0,0,0]];
private _desk1=createSimpleObject["Land_TableDesk_F",[0,0,0]];
private _desk2=createSimpleObject["Land_TableDesk_F",[0,0,0]];
private _desk3=createSimpleObject["Land_TableDesk_F",[0,0,0]];
private _sink=createSimpleObject["Land_Sink_F",[0,0,0]];
<<<<<<< HEAD
private _luggage=createVehicle["Land_LuggageHeap_01_F",[0,0,0],[],0,"can_collide"];_luggage enableSimulationGlobal false;
private _microW=createSimpleObject["Land_Microwave_01_F",[0,0,0]];
private _fridge=createSimpleObject["Fridge_01_closed_F",[0,0,0]];
private _desk4=createSimpleObject["OfficeTable_01_new_F",[0,0,0]];
private _shelf=createSimpleObject["Land_OfficeCabinet_01_F",[0,0,0]];
private _mCase=createSimpleObject["Land_PlasticCase_01_small_F",[0,0,0]];
private _pcCase=createSimpleObject["Land_PCSet_01_case_F",[0,0,0]];
private _pcChair=createSimpleObject["Land_OfficeChair_01_F",[0,0,0]];
private _pcScreen=createSimpleObject["Land_PCSet_01_screen_F",[0,0,0]];
private _shelfW=createSimpleObject["Land_ShelvesWooden_F",[0,0,0]];
private _plant=createSimpleObject["Land_FlowerPot_01_Flower_F",[0,0,0]];
private _printer=createSimpleObject["Land_Printer_01_F",[0,0,0]];
=======
private _microW=createSimpleObject["Land_Microwave_01_F",[0,0,0]];
private _fridge=createSimpleObject["Fridge_01_closed_F",[0,0,0]];

private _desk4=createSimpleObject["OfficeTable_01_new_F",[0,0,0]];
private _shelf=createSimpleObject["Land_OfficeCabinet_01_F",[0,0,0]];
private _pcCase=createSimpleObject["Land_PCSet_01_case_F",[0,0,0]];
private _pcScreen=createSimpleObject["Land_PCSet_01_screen_F",[0,0,0]];
private _printer=createSimpleObject["Land_Printer_01_F",[0,0,0]];
private _pcChair=createSimpleObject["Land_OfficeChair_01_F",[0,0,0]];

>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
private _sTable=createSimpleObject["Land_RattanTable_01_F",[0,0,0]];
private _stool=createSimpleObject["Land_Bench_F",[0,0,0]];
private _TV=createSimpleObject["Land_FlatTV_01_F",[0,0,0]];
private _sofa1=createSimpleObject["Land_Sofa_01_F",[0,0,0]];
private _rack=createSimpleObject["Land_Rack_F",[0,0,0]];
private _trash=createSimpleObject["Land_WheelieBin_01_F",[0,0,0]];
private _rug=selectRandom["Land_Rug_01_F","Land_Rug_01_Traditional_F"];
private _rug=createVehicle[_rug,[0,0,0],[],0,"can_collide"];_rug enableSimulationGlobal false;

<<<<<<< HEAD
_plant attachTo[_h,[2.8,0.4,1.25]];
_mCase attachTo[_h,[2.24,-5.3,4.03]];
_luggage attachTo[_h,[4.29,-3.73,4.385]];_luggage setDir 180;
_trash attachTo[_h,[-3,0,0.85]];_trash setDir 30;
_fridge attachTo[_h,[-2.3,6.9,0.95]];
_sofa1 attachTo[_h,[1.4,-2,0.95]];
_shelfW attachTo[_h,[4.18,-6.845,0.965]];_shelfW setDir 90;
_stool attachTo[_h,[1.45,0.85,0.7]];_stool setDir 90;
_TV attachTo[_h,[1.45,0.9,1.27]];
_sink attachTo[_h,[-3.9,5.5,0.95]];_sink setDir 90;
_desk1 attachTo[_h,[0.66,7,0.74]];
_desk2 attachTo[_h,[-3.5,7,0.74]];
_desk3 attachTo[_h,[-1.1,7,0.74]];
_microW attachTo[_h,[-1,6.85,1.24]];
_bed attachTo[_h,[3.5,-5.3,4.33]];_bed setDir 90;
_dTable attachTo[_h,[1,3.7,0.74]];
_chairW1 attachTo[_h,[2.27,3.7,0.45]];_chairW1 setDir 90;
_chairW2 attachTo[_h,[-0.3,3.5,0.45]];_chairW2 setDir 250;
_chairW3 attachTo[_h,[1,4.4,0.45]];_chairW3 setDir 14;
_rug attachTo[_h,[-0.5,-6.2,0.46]];_rug setDir 90;
_desk4 attachTo[_h,[4.3,-2.25,4.33]];_desk4 setDir 90;
_pcChair attachTo[_h,[3.7,-2,4.5]];_pcChair setDir 285;
_pcScreen attachTo[_h,[4.3,-2,4.99]];_pcScreen setDir 90;
_printer attachTo[_h,[4.4,-2.67,4.92]];_printer setDir 90;
_pcCase attachTo[_h,[4.3,-1.45,4.14]];_pcCase setDir 90;
_rack attachTo[_h,[-4.12,1.92,0.95]];
_shelf attachTo[_h,[1.5,7.06,4.65]];
_sofa2 attachTo[_h,[0.45,6.75,4.35]];_sofa2 setDir 180;
_sTable attachTo[_h,[-0.7,6.75,4.28]];
_radio attachTo[_h,[-0.5,6.75,4.74]];_radio setDir 150;

if((dayTime<18)&&{(dayTime>5)})then{_TV setObjectTextureGlobal[0,(selectRandom["\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_pills_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_supermarket_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_maskrtnik_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_bluking_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_wine_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_plane_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_action_co.paa","\A3\Structures_F_Argo\Commercial\Billboards\Data\Advertisements\bill_getlost_co.paa"])];};

if(PF_Optimize)then{
sleep .2;
{_x hideObjectGlobal true}forEach attachedObjects _H;};
=======
_trash attachTo[_house,[-3,0,0.85]];_trash setDir 30;
_fridge attachTo[_house,[-2.3,6.9,0.95]];
_sofa1 attachTo[_house,[1.4,-2,0.95]];
_stool attachTo[_house,[1.45,0.85,0.7]];_stool setDir 90;
_TV attachTo[_house,[1.45,0.9,1.27]];
_sink attachTo[_house,[-3.9,5.5,0.95]];_sink setDir 90;
_desk1 attachTo[_house,[0.66,7,0.74]];
_desk2 attachTo[_house,[-3.5,7,0.74]];
_desk3 attachTo[_house,[-1.1,7,0.74]];
_microW attachTo[_house,[-1,6.85,1.24]];
_bed attachTo[_house,[3.5,-5.3,4.33]];_bed setDir 90;
_dTable attachTo[_house,[1,3.7,0.74]];
_chairW1 attachTo[_house,[2.27,3.7,0.45]];_chairW1 setDir 90;
_chairW2 attachTo[_house,[-0.3,3.5,0.45]];_chairW2 setDir 250;
_chairW3 attachTo[_house,[1,4.4,0.45]];_chairW3 setDir 14;
_rug attachTo[_house,[-0.5,-6.2,0.46]];_rug setDir 90;
_desk4 attachTo[_house,[4.3,-2.25,4.33]];_desk4 setDir 90;
_pcChair attachTo[_house,[3.7,-2,4.5]];_pcChair setDir 285;
_pcScreen attachTo[_house,[4.3,-2,4.99]];_pcScreen setDir 90;
_printer attachTo[_house,[4.4,-2.67,4.92]];_printer setDir 90;
_pcCase attachTo[_house,[4.3,-1.45,4.14]];_pcCase setDir 90;
_rack attachTo[_house,[-4.12,1.92,0.95]];
_shelf attachTo[_house,[1.5,7.06,4.65]];
_sofa2 attachTo[_house,[0.45,6.75,4.35]];_sofa2 setDir 180;
_sTable attachTo[_house,[-0.7,6.75,4.28]];
_radio attachTo[_house,[-0.5,6.75,4.74]];_radio setDir 150;

sleep 1;

_house enableSimulationGlobal false;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
