proc/weatherwinter()
	for(var/turf/grounds/grass/g in world)
		if(g.icon_state=="Grass")
			g.icon_state="Snow"
			g.name="Snow"
			g.text = "<font color=#F8F8F8>×"
	for(var/obj/Tree/T in world)
		T.icon_state = "Winter"
	for(var/turf/grounds/waters/water/g in world)
		if(!g.isbridge)
			if(g.icon_state=="water")
				g.icon_state="frozenwater"
				g.name="ice"
				g.CanFish=0
				g.density=0
				g.text = "<font color=#F8F8F8>×"

proc/weatherspring()
	for(var/turf/grounds/grass/g in world)
		if(g.icon_state=="Snow")
			g.icon_state="Grass"
			g.name="Grass"
			g.text = "<font color=#33CC33>×"
	for(var/obj/Tree/T in world)
		T.icon_state = ""
	for(var/turf/grounds/waters/water/g in world)
		if(!g.isbridge)
			if(g.icon_state=="frozenwater")
				g.icon_state="water"
				g.name="water"
				g.CanFish=1
				g.density=1
				g.text = "<font color=#F8F8F8>×"
proc/weathersummer()
	for(var/turf/grounds/grass/g in world)
		if(g.icon_state=="Snow")
			g.icon_state="Grass"
			g.name="Grass"
			g.text = "<font color=#33CC33>×"
	for(var/obj/Tree/T in world)
		T.icon_state = ""
	for(var/turf/grounds/waters/water/g in world)
		if(!g.isbridge)
			if(g.icon_state=="water")
			else
				if(g.icon_state=="frozenwater")
					g.icon_state="water"
					g.name="water"
					g.CanFish=1
					g.density=1
					g.text = "<font color=#F8F8F8>×"
proc/weatherfall()
	for(var/turf/grounds/grass/g in world)
		if(g.icon_state=="Snow")
			g.icon_state="Grass"
			g.name="Grass"
			g.text = "<font color=#33CC33>×"
	for(var/turf/grounds/waters/water/g in world)
		if(!g.isbridge)
			if(g.icon_state=="water")
			else
				if(g.icon_state=="frozenwater")
					g.icon_state="water"
					g.name="water"
					g.CanFish=1
					g.density=1
					g.text = "<font color=#F8F8F8>×"
	for(var/obj/Tree/T in world)
		var/I = rand(1,10)
		switch(I)
			if(1 to 6) T.icon_state = "Fall 1"
			if(7 to 9) T.icon_state = "Fall 3"
			else T.icon_state = "Fall 2"