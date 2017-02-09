state("Shock2")
{
	string255 Level : 0x46AFA8;
}

startup
{
	settings.Add("level1", true, "MedSci");
	settings.Add("level2", true, "Engineering");
	settings.Add("level3", true, "Hydroponics");
	settings.Add("level4", true, "Recreation");
	settings.Add("level5", true, "Command");
	settings.Add("level6", true, "Rickenbacker");
	settings.Add("level7", true, "Body of The Many");
//	settings.Add("level8", true, "SHODAN"); Still need to figure out how to automatically split at the end
}

start 
{	
	return (current.Level == "earth.mis");
}

reset
{
	return (current.Level == "earth.mis" && old.Level != "earth.mis");
}

split
{
	return (
		(settings["level1"] && current.Level == "eng1.mis" && old.Level == "MedSci1.mis") 					||
		(settings["level2"] && current.Level == "Hydro2.mis" && old.Level == "MedSci1.mis") 					||
		(settings["level3"] && current.Level == "Rec1.mis" && (old.Level == "Hydro2.mis" || old.Level == "hydro2.mis")) 	||
		(settings["level4"] && current.Level == "command1.mis" && old.Level == "Rec1.mis") 					||
		(settings["level5"] && current.Level == "rick1.mis" && old.Level == "command1.mis") 					||
		(settings["level6"] && current.Level == "Many.mis" && old.Level == "Rick3.mis") 					||
		(settings["level7"] && current.Level == "shodan.mis" && old.Level == "Many.mis")
	);
}

isLoading
{
}
