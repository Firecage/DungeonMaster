obj
	Tree
		icon = 'Tree.dmi'
		pixel_x = -32
		Tree = 1
		HP = 250
		IsWood = 1
		density = 1
		opacity = 1
		layer = 5

obj/proc/TowerCapGrow()
	sleep(1000)
	var/mob/Monsters/Critters/TowerCap/C = new
	C.loc = src.loc
	del(src)
	return

obj/proc/GrapeGrow()
	sleep(1000)
	if(Season != "Winter")
		var/obj/Items/Plants/GrapeVine/T = new
		T.loc = src.loc
		T.name = "Grape Vine Plant"
		del(src)
	else del(src)

obj/proc/TomatoGrow()
	sleep(1000)
	if(Season != "Winter")
		var/obj/Items/Plants/TomatoPlant/T = new
		T.loc = src.loc
		T.name = "Tomato Plant"
		del(src)
	else
		for(var/turf/T in view(0,src))
			T.HasPlantIn = 0
			del(src)
	return

obj/proc/GarlicGrow()
	sleep(1000)
	if(Season != "Winter")
		var/obj/Items/Plants/GarlicPlant/T = new
		T.loc = src.loc
		T.name = "Garlic Plant"
		del(src)
	else
		for(var/turf/T in view(0,src))
			T.HasPlantIn = 0
			del(src)
	return
obj/proc/PoisonSporeGrow()
	sleep(750)
	if(src)
		for(var/turf/T in view(0,src))
			if(T.Detailed == 0)
				if(T.Content == "Marsh")
					var/mob/Monsters/Critters/PoisonSporePlant/P = new
					P.loc = src.loc
	del(src)
	return
obj/proc/CarnGrow()
	sleep(750)
	if(src)
		for(var/turf/T in view(0,src))
			if(T.Detailed == 0)
				if(T.Content == "Marsh")
					var/mob/Monsters/Critters/CarnivorousPlant/P = new
					P.loc = src.loc
	del(src)
	return

obj/Grower/Tree/proc/TreeGrow()
	sleep(1000)//1000
	var/obj/Tree/T = new(src.loc)
	var/turf/Turf = src.loc
	if(Turf.icon_state == "Desert")//Fix this later
		T.icon = 'cactus.dmi'
		T.icon_state = "Cactus"
		T.pixel_x = 0
		T.name = "Cactus"
		T.Cactus = 1
		layer = 3
	else if(T.name == "Bamboo")
		T.icon = 'bamboo.dmi'
		T.icon_state = "Bamboo"
		T.pixel_x = 0
		T.name = "Bamboo"
		T.Bamboo = 1
		layer = 3
		if(Season == "Winter")
			T.icon_state = "Winter"
			if(Turf.icon_state == "Desert")//Fix this later
				T.icon = 'cactus.dmi'
				T.icon_state = "Cactus"
				T.pixel_x = 0
				T.name = "Cactus"
				T.Cactus = 1
				layer = 3
		if(Season == "Spring" || Season == "Summer")
			T.icon_state = ""
			if(Turf.icon_state == "Desert")//Fix this later
				T.icon = 'cactus.dmi'
				T.icon_state = "Cactus"
				T.pixel_x = 0
				T.name = "Cactus"
				T.Cactus = 1
				layer = 3
		if(Season == "Fall")
			var/I = rand(1,10)
			switch(I)
				if(1 to 6) T.icon_state = "Fall 1"
				if(7 to 9) T.icon_state = "Fall 3"
				else T.icon_state = "Fall 2"
			if(Turf.icon_state == "Desert")//Fix this later
				T.icon = 'cactus.dmi'
				T.icon_state = "Cactus"
				T.pixel_x = 0
				T.name = "Cactus"
				T.Cactus = 1
				layer = 3
	/*
	if(Season == "Winter")//do trees only grow in winter?
		for(var/turf/T in view(0,src))
			if(T.icon_state == "Grass")
				T.icon = 'plants.dmi'
				T.icon_state = "tree 2x1"
				T.overlays += /obj/Trees/tree2x2
				T.overlays += /obj/Trees/tree1x2
				T.overlays += /obj/Trees/tree3x2
				T.overlays += /obj/Trees/leaves3x2
				T.overlays += /obj/Trees/leaves2x2
				T.overlays += /obj/Trees/leaves1x2
				T.overlays += /obj/Trees/leaves1x1
				T.overlays += /obj/Trees/leaves2x1
				T.overlays += /obj/Trees/leaves3x1
				T.Tree = 1
				T.IsWood = 1
				T.density = 1
				T.opacity = 1
				T.HP = 250
				T.name = "Tree"
			if(T.icon_state == "Snow")
				T.icon = 'plants.dmi'
				T.icon_state = "SnowTree"
				T.overlays += /obj/Trees/tree2x2
				T.overlays += /obj/Trees/tree1x2
				T.overlays += /obj/Trees/tree3x2
				T.Tree = 1
				T.IsWood = 1
				T.density = 1
				T.opacity = 1
				T.HP = 250
				T.name = "Tree"
			if(T.icon_state == "Desert")
				T.icon_state = "Cactus"
				T.Tree = 1
				T.density = 1
				T.HP = 250
				T.opacity = 1
				T.IsWood = 1
				T.name = "Cactus"
				T.Cactus = 1
			if(T.Content == "Marsh")
				T.icon_state = "Bamboo"
				T.Tree = 1
				T.density = 1
				T.HP = 250
				T.IsWood = 1
				T.opacity = 1
				T.name = "Bamboo"
				T.Bamboo = 1
				*/
	del(src)
	return

obj/Grower
	name = ""
	Tree
	//	icon = 'Tree.dmi'
		pixel_x = -32
		New(loc, mob/M)
			var/turf/T = loc
			var/image/I
			if(T.icon_state == "Desert")
				I = image('cactus.dmi', src, "Cactus",2)
				pixel_x = 0

			else if(T.Content == "Marsh")
				I = image('bamboo.dmi', src, "Bamboo",2)
				pixel_x = 0
			else
				I = image('Tree.dmi', src, "", 2)
		//	var/image/I = image(icon, src,icon_state)
			I.alpha = 128
			M << I

