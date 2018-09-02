#include "Styles.hpp"

class RscTitles {

	class blank {
		name = "blank";
		duration = 999999;
		idd = 5555;
		movingEnable = true;
		onLoad = "";
		controls[]={};
	};

	class statusoverlay {

		name = "statusoverlay";
      		duration = 999999;
     		idd = 6667;
     		movingEnable = false;
		onLoad = "uiNamespace setvariable ['GUI_OVERLAY',(_this select 0)];";
      	  	controls[]= { BGPicture,LabelManpower,LabelAmmo,LabelFuel,LabelCap,PictureManpowerShadow,PictureAmmoShadow, 
			PictureFuelShadow,PictureCapShadow,PictureManpower,PictureAmmo,PictureFuel,PictureCap, PictureIntelShadow, 
			PictureIntel, CentralShadow, CentralLabel, CaptureFrame_OPFOR, CaptureFrame_BLUFOR, CaptureFrame, LabelPoint};
	  	class BGPicture {
			idc = -1;
			style = ST_PICTURE;
			type = CT_STATIC;
			colorText[] = {0.8,0.8,0.8,0.9};
			colorBackground[] = COLOR_NOALPHA;
			font = "PuristaMedium";
			sizeEx = 0.5;
			x = 0.95 * safezoneW + safezoneX;
			w = 0.075 * safezoneW;
			y = 0.395 * safezoneH + safezoneY;
			h = 0.153 * safezoneH;
			text = "MOB_CTI\resources\Pictures\gradient.paa";
	  	};
	  	class GenericLabel69 {
			idc = -1;
			type =  CT_STATIC;
			style = ST_RIGHT;
			colorBackground[] = COLOR_NOALPHA;
			font = "PuristaMedium";
			sizeEx = 0.022 * safezoneH;
			x = 0.905 * safezoneW + safezoneX;
			w = 0.08 * safezoneW;
			y = 0.5225 * safezoneH + safezoneY;
			h = 0.04 * safezoneH;
			text = "";
			shadow = 2;
	  	};
	  	class CentralLabel : GenericLabel69 {
			idc = 266;
			type = CT_STATIC;
			style = ST_CENTER;
			colorText[] = {1,1,0,1};
			sizeEx = 0.03 * safezoneH;
			x = 0 * safezoneW + safezoneX;
			w = 1 * safezoneW;
			y = 0.2 * safezoneH + safezoneY;
			h = 0.05 * safezoneH;
			text = "";
	  	};
	  	class CentralShadow : CentralLabel {
			idc = 267;
			shadow = 1;
	  	};
	  	class GenericPicture69 {
	  		idc = -1;
			type =  CT_STATIC;
			style = ST_PICTURE;
			colorText[] = {0.9,0.9,0.9,1};
			colorBackground[] = COLOR_NOALPHA;
			font = "PuristaMedium";
			sizeEx = 0.5;
			x = 0.985 * safezoneW + safezoneX;
			w = 0.012 * safezoneW;
			h = 0.0213333333 * safezoneH;
	  	};
	  	class PictureManpower : GenericPicture69 {
			y = (0.4 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
			text = "MOB_CTI\resources\Pictures\ui_manpo.paa";
	  	};
	  	class PictureAmmo : GenericPicture69 {
			y = (0.4 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
			text = "MOB_CTI\resources\Pictures\ui_ammo.paa";
	  	};
	  	class PictureFuel : GenericPicture69 {
			y = (0.4 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
			text = "MOB_CTI\resources\Pictures\ui_fuel.paa";
	  	};
	  	class PictureCap : GenericPicture69 {
			y = (0.4 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
			text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
	  	};
	  	class PictureCombatReadiness : GenericPicture69 {
			idc = 135;
			y = (0.4 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
			text = "\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa";
	  	};
	  	class PictureIntel : GenericPicture69 {
	  		colorText[] = {0,0.45,0.95,1};
			y = (0.4 + ( ICONE_SPACY * 5 ) - 0.0025) * safezoneH + safezoneY;
			text = "\A3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa";
	  	};
	  	class PictureManpowerShadow : PictureManpower {
			y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
			x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
			colorText[] = {0,0,0,0.7};
	  	};
	  	class PictureAmmoShadow : PictureAmmo {
			y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
			x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
			colorText[] = {0,0,0,0.7};
	  	};
	  	class PictureFuelShadow : PictureFuel {
			y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
			x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
			colorText[] = {0,0,0,0.7};
	  	};
	  	class PictureCapShadow : PictureCap {
			y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
			x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
			colorText[] = {0,0,0,0.7};
	  	};
	  	class PictureCombatReadinessShadow : PictureCombatReadiness {
	  		idc = -1;
			y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
			x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
			colorText[] = {0,0,0,0.7};
	  	};
	  	class PictureIntelShadow : PictureIntel {
			y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 5 ) - 0.0025 ) * safezoneH + safezoneY;
			x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
			colorText[] = {0,0,0,0.7};
	  	};
	  	class LabelManpower : GenericLabel69 {
	  		idc = 101;
			text = "";
			y = (0.39 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
			colorText[] = {0, 0.75, 0, 1};
	 	};
	 	class LabelAmmo : GenericLabel69 {
	  		idc = 102;
			text = "";
			y = (0.39 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
			colorText[] = {0.75, 0, 0, 1};
	  	};
	  	class LabelFuel : GenericLabel69 {
	  		idc = 103;
			text = "";
			y = (0.39 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
			colorText[] = {0.75, 0.75, 0, 1};
	  	};
	  	class LabelCap : GenericLabel69 {
	  		idc = 104;
			text = "";
			y = (0.39 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
			colorText[] = {0.8, 0.8, 0.8, 1};
	  	};

	 	class CaptureFrameStandard {
			type =  CT_STATIC;
			font = FontM;
			sizeEx = 0.023;
			text = "";
		};
	  	class CaptureFrame : CaptureFrameStandard {
			idc = 202;
			style = ST_FRAME;
			colorText[] = COLOR_BLACK;
			colorBackground[] = COLOR_OPFOR_NOALPHA;
			x = 0.9125 * safezoneW + safezoneX;
			w = 0.085 * safezoneW;
			y = 0.358 * safezoneH + safezoneY;
			h = 0.012 * safezoneH;
		};
		class CaptureFrame_OPFOR : CaptureFrameStandard{
			idc = 203;
			style = ST_STATIC;
			colorText[] = {0.6, 0, 0, 1};
			colorBackground[] = {0.6, 0, 0, 1};
			x = 0.9125 * safezoneW + safezoneX;
			w = 0.084 * safezoneW;
			y = 0.358 * safezoneH + safezoneY;
			h = 0.011 * safezoneH;

		};
		class CaptureFrame_BLUFOR : CaptureFrameStandard{
			idc = 244;
			style = ST_STATIC;
			colorText[] = {0, 0.2, 0.6, 1};
			colorBackground[] = {0, 0.2, 0.6, 1};
			x = 0.9125 * safezoneW + safezoneX;
			w = 0.084 * safezoneW;
			y = 0.358 * safezoneH + safezoneY;
			h = 0.011 * safezoneH;
		};

	  	class LabelPoint : GenericLabel69 {
	  		idc = 205;
			text = "";
			style = ST_RIGHT;
			sizeEx = 0.024 * safezoneH;
			x = 0.8 * safezoneW + safezoneX;
			w = 0.2 * safezoneW;
			y = 0.33 * safezoneH + safezoneY;
			h = 0.03 * safezoneH;
			colorText[] = {0.7, 0, 0, 1};
	  	};
	};

};
