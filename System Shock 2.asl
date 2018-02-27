state("SS2")
{
	string255 Level : 0x46D068;
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
		(current.Level == "eng1.mis" && old.Level == "MedSci1.mis") 					||
		(current.Level == "Hydro2.mis" && old.Level == "MedSci1.mis") 					||
		(current.Level == "Rec1.mis" && (old.Level == "Hydro2.mis" || old.Level == "hydro2.mis")) 	||
		(current.Level == "command1.mis" && old.Level == "Rec1.mis") 					||
		(current.Level == "rick1.mis" && old.Level == "command1.mis") 					||
		(current.Level == "Many.mis" && old.Level == "Rick3.mis") 					||
		(current.Level == "shodan.mis" && old.Level == "Many.mis")
	);
}

isLoading
{
}
