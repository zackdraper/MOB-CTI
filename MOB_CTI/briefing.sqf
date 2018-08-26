/*

	briefing.sqf

	Give help text for the player
	
*/
//////////////////////////////////////////////////////////////////////////////


_index = player createDiarySubject ["kb","Key Bindings"];

_kb = "<br/>"+
"*********************************************<br/>"+
"Key Bindings:<br/>"+
"*********************************************<br/>"+
"<br/>"+
"Ctrl + R:                  Magazine Repack<br/>"+
"<br/>"+
"Shift + V:                 Running Jump<br/>"+
"<br/>"+
"End:                       Earplugs<br/>"+
"<br/>"+
"Ctrl + /:                  View Distance Settings<br/>"+
"<br/>"+
"";


player createDiaryRecord ["kb", ["Key Bindings", _kb]];

_index = player createDiarySubject ["econ","Economy"];

_str1 = "<br/>"+
"*********************************************<br/>"+
"Occupation:<br/>"+
"*********************************************<br/>"+
"Funds scales with the number of towns under your sides control"+
"<br/>"+
"<br/>"+
"Ammo scales with the number of towns under your sides control"+
"<br/>"+
"<br/>"+
"Max Fuel scales with the number of towns under your sides control"+
"<br/>"+
"";

_str2 = "<br/>"+
"*********************************************<br/>"+
"External Ammo + Occupation:<br/>"+
"*********************************************<br/>"+
"Funds scales with the number of towns under your sides control"+
"<br/>"+
"<br/>"+
"Ammo will require building a ammo depot for a supply copper to fly supplies in to your base.  If the chopper is lost, enroute to the base, the ammo will be lost."+
"<br/>"+
"<br/>"+
"Max Fuel scales with number of towns under your sides control"+
"<br/>"+
"<br/>"+
"";

_str3 = "<br/>"+
"*********************************************<br/>"+
"Limited:<br/>"+
"*********************************************<br/>"+
"Funds, Ammo, and Fuel Max will be set at thier initial values and never go up"+
"<br/>"+
"";

_str4 = "<br/>"+
"*********************************************<br/>"+
"Unlimited:<br/>"+
"*********************************************<br/>"+
"Funds, Ammo, and Fuel max will be infinte."+
"<br/>"+
"";

player createDiaryRecord ["econ", ["Occupation", _str1]];
player createDiaryRecord ["econ", ["External Ammo + Occupation", _str2]];
player createDiaryRecord ["econ", ["Limited", _str3]];
player createDiaryRecord ["econ", ["Unlimited", _str4]];

player createDiarySubject ["Scripts","Scripts"];
player createDiaryRecord ["Scripts",["R3F Logistics", "You can load objects into vehicles using the R3F logistics Framework"]];

if(true)exitwith{};