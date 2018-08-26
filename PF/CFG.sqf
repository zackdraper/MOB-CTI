<<<<<<< HEAD
//PHRONK'S FURNITURE SCRIPT	v0.6


PF_BlacklistMkr=["BLUmkr","BL_Mkr0"];	//List of markers to prevent furniture spawning in them

//List of location names to prevent furniture triggers being created in them
PF_BlacklistLoc=[
//ALTIS
	"airbase","Gravia","military","power plant","Terminal",
//MALDEN
	"Airport","military base","Radio Station","harbor","Les Sables",
//STRATIS
	"airfield","Girna Bay","military range","Stratis Air Base",
//TANOA
	"Blue Pearl industrial port","Comms Bravo"];

PF_BlacklistObj=[];									//List of building classnames to avoid spawning furniture in

PF_Dbug=FALSE;										//TRUE enables debug mode, FALSE disables it

PF_Chance=75;										//% Chance for furniture to spawn per house

PF_Optimize=TRUE;								//TRUE enables hiding all furniture until player is within 150m, FALSE disables it
//DON'T EDIT BELOW
publicVariable"PF_Optimize";
=======
/*	PHRONK'S FURNITURE SCRIPT	v0.4
	By Phronk

	TODO:	1. Up to 5 layouts for each individual building
			2. Create layouts for CUP / Tanoa structures
			3. Create layouts for industrial/military structures
			4. Lock doors at night

			SHOP TEMPLATES:
				1. Hardware store
				2. Grocery store
				3. Statue / sculpture store (pottery too)
				4. Car dealership
				5. Bank
				6. Real-estate
				7. Military recruitment office
				8. Bar
				9. Pressure washer stall
				10. Stall selling gas (barrels / canisters)
*/
PF_Blacklist=[];			//List of markers to prevent furniture spawning in them

PF_Dbug=False;											//TRUE enables debug mode, FALSE disables it

PF_Chance=50;											//% Chance for furniture to spawn in house
>>>>>>> 07f0a89e0c6448f803f3e8d796a0852406ba09ff
