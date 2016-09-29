
var/mobtype = null
mob/verb/spawn_Goblin()
	set hidden = 1
	mobtype = "Goblin"
	var/type = text2path("/mob/Monsters/[mobtype]")
	var/location
	var/amount = 3

	location=LocateValidLocation(X=240,XX=850,Y=210,YY=800)

	if(location)
		for(var/i = 0, i < amount, i++)
			new type(location)

