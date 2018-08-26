class CfgNotifications
{

	class Default
	{
		title = "%1"; // Tile displayed as text on black background. Filled by arguments.
		description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};

	class Arsenal_SaveLoadout
	{
		title = "Loadout Saved";
		iconPicture = "\A3\Ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa";
		iconText = ""; 
		description = "Loadout has been saved for respawn."; 
		color[] = {1,1,1,1}; 
		duration = 5; 
		priority = 0; 
		difficulty[] = {}; 
	};

	class TownCapture
	{
		title = "Town Captured";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
		iconText = "";
		description = "%1 has been captured.";
		color[] = {1,1,1,1}; 
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};

	class UnitCreated
	{
		title = "Unit Created";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		iconText = "";
		description = "%1 was created";
		color[] = {1,1,1,1}; 
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};

	class BuildingConstructed
	{
		title = "Building Constructed";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		iconText = "";
		description = "%1 has been constructed";
		color[] = {1,1,1,1}; 
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};
};