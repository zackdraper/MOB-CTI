//Land_Offices_01_V1_F
<<<<<<< HEAD
private _h=_this;

private _bucket=createSimpleObject["Land_Bucket_F",[0,0,0]];
=======
private _house=_this;

>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
private _cashier=createSimpleObject["Land_Bucket_F",[0,0,0]];
private _cashier=createSimpleObject["Land_CashDesk_F",[0,0,0]];
private _chair1=createSimpleObject["Land_CampingChair_V2_F",[0,0,0]];
private _chair2=createSimpleObject["Land_CampingChair_V2_F",[0,0,0]];
private _cup=createSimpleObject["Land_Tableware_01_cup_F",[0,0,0]];
private _desk0=createSimpleObject["OfficeTable_01_new_F",[0,0,0]];
private _desk1=createSimpleObject["OfficeTable_01_new_F",[0,0,0]];
private _desk2=createSimpleObject["OfficeTable_01_new_F",[0,0,0]];
private _desk3=createSimpleObject["OfficeTable_01_new_F",[0,0,0]];
private _desk4=createSimpleObject["OfficeTable_01_new_F",[0,0,0]];
private _desk5=createSimpleObject["OfficeTable_01_new_F",[0,0,0]];
private _desk6=createSimpleObject["OfficeTable_01_new_F",[0,0,0]];
private _desk7=createSimpleObject["OfficeTable_01_new_F",[0,0,0]];
private _desk8=createSimpleObject["Land_TableDesk_F",[0,0,0]];
private _desk9=createSimpleObject["Land_TableDesk_F",[0,0,0]];
private _paper=createSimpleObject["Leaflet_05_New_F",[0,0,0]];
private _papers=createSimpleObject["Leaflet_05_Stack_F",[0,0,0]];
private _pcChair1=createSimpleObject["Land_OfficeChair_01_F",[0,0,0]];
private _pcChair2=createSimpleObject["Land_OfficeChair_01_F",[0,0,0]];
private _pcKey=createSimpleObject["Land_PCSet_01_keyboard_F",[0,0,0]];
private _pcMouse=createSimpleObject["Land_PCSet_01_mouse_F",[0,0,0]];
private _pcPad=createSimpleObject["Land_PCSet_01_mousepad_F",[0,0,0]];
private _pcScreen1=createSimpleObject["Land_PCSet_01_screen_F",[0,0,0]];
private _pcScreen2=createSimpleObject["Land_PCSet_01_screen_F",[0,0,0]];
private _plant=createSimpleObject["Land_FlowerPot_01_Flower_F",[0,0,0]];
private _rack1=createSimpleObject["Land_OfficeCabinet_01_F",[0,0,0]];
private _rack2=createSimpleObject["Land_OfficeCabinet_01_F",[0,0,0]];
private _stool=createSimpleObject["Land_Bench_F",[0,0,0]];

<<<<<<< HEAD
_desk0 attachTo[_h,[9.6,-1.4,1.32]];_desk0 setDir 180;
_desk3 attachTo[_h,[9.6,-1.4,.75]];_desk3 setDir 180;
_desk1 attachTo[_h,[10.91,-1.4,1.32]];_desk1 setDir 180;
_cashier attachTo[_h,[10.91,-1.34,.717]];
_pcChair1 attachTo[_h,[10.215,-.2,1.57]];_pcChair1 setDir(random 90)+270;
_pcScreen1 attachTo[_h,[9.95,-1.5,1.975]];_pcScreen1 setDir 200;
_pcKey attachTo[_h,[10.2,-1.2,1.725]];_pcKey setDir 170;
_pcMouse attachTo[_h,[9.8,-1.18,1.75]];_pcMouse setDir 210;
_pcPad attachTo[_h,[9.8,-1.21,1.724]];_pcPad setDir 90;
_desk4 attachTo[_h,[10.91,-1.4,.75]];_desk4 setDir 180;
_desk2 attachTo[_h,[12.23,-1.4,1.32]];_desk2 setDir 180;
_desk5 attachTo[_h,[12.23,-1.4,.75]];_desk5 setDir 180;
_desk6 attachTo[_h,[9.285,-0.41,1.32]];_desk6 setDir 270;
_stool attachTo[_h,[12.55,-5,1.13]];
_plant attachTo[_h,[3.5,0.3,1.7]];_plant setDir 80;
_desk7 attachTo[_h,[10.5,-1.5,13]];_desk7 setDir 180;
_rack1 attachTo[_h,[8.9,-.08,13.38]];
_rack2 attachTo[_h,[9.699,-.08,13.38]];
_pcChair2 attachTo[_h,[10.5,-.8,13.27]];
_pcScreen2 attachTo[_h,[10.5,-1.5,13.66]];_pcScreen2 setDir 180;
_desk8 attachTo[_h,[9,1,1.31]];
_papers attachTo[_h,[8.8,1.15,1.8]];_papers setDir 90;
_paper attachTo[_h,[9.15,1.25,1.73]];_paper setDir 85;
_cup attachTo[_h,[9,1.3,1.78]];_cup setDir 85;
_chair1 attachTo[_h,[9,1.5,1.31]];
_bucket attachTo[_h,[10.06,1.2,1.06]];
_desk9 attachTo[_h,[12.45,7.1,1.31]];_desk9 setDir 270;
_chair2 attachTo[_h,[11.8,7.2,1.4]];_chair2 setDir(random 30)+270;

if(PF_Optimize)then{
sleep .2;
{_x hideObjectGlobal true}forEach attachedObjects _H;};
=======
_desk0 attachTo[_house,[9.6,-1.4,1.32]];_desk0 setDir 180;
_desk3 attachTo[_house,[9.6,-1.4,.75]];_desk3 setDir 180;
_desk1 attachTo[_house,[10.91,-1.4,1.32]];_desk1 setDir 180;
_cashier attachTo[_house,[10.91,-1.34,.717]];
_pcChair1 attachTo[_house,[10.215,-.2,1.57]];_pcChair1 setDir(random 90)+270;
_pcScreen1 attachTo[_house,[9.95,-1.5,1.975]];_pcScreen1 setDir 200;
_pcKey attachTo[_house,[10.2,-1.2,1.725]];_pcKey setDir 170;
_pcMouse attachTo[_house,[9.8,-1.18,1.75]];_pcMouse setDir 210;
_pcPad attachTo[_house,[9.8,-1.21,1.724]];_pcPad setDir 90;
_desk4 attachTo[_house,[10.91,-1.4,.75]];_desk4 setDir 180;
_desk2 attachTo[_house,[12.23,-1.4,1.32]];_desk2 setDir 180;
_desk5 attachTo[_house,[12.23,-1.4,.75]];_desk5 setDir 180;
_desk6 attachTo[_house,[9.285,-0.41,1.32]];_desk6 setDir 270;
_stool attachTo[_house,[12.55,-5,1.13]];
_plant attachTo[_house,[3.5,0.3,1.7]];_plant setDir 80;
_desk7 attachTo[_house,[10.5,-1.5,13]];_desk7 setDir 180;
_rack1 attachTo[_house,[8.9,-.08,13.38]];
_rack2 attachTo[_house,[9.699,-.08,13.38]];
_pcChair2 attachTo[_house,[10.5,-.8,13.27]];
_pcScreen2 attachTo[_house,[10.5,-1.5,13.66]];_pcScreen2 setDir 180;
_desk8 attachTo[_house,[9,1,1.31]];
_papers attachTo[_house,[8.8,1.15,1.8]];_papers setDir 90;
_paper attachTo[_house,[9.15,1.25,1.73]];_paper setDir 85;
_cup attachTo[_house,[9,1.3,1.78]];_cup setDir 85;
_chair1 attachTo[_house,[9,1.5,1.31]];
_bucket attachTo[_house,[10.06,1.2,1.06]];
_desk9 attachTo[_house,[12.45,7.1,1.31]];_desk9 setDir 270;
_chair2 attachTo[_house,[11.8,7.2,1.4]];_chair2 setDir(random 30)+270;

sleep 1;

_house enableSimulationGlobal false;
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
