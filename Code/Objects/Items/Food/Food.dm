/obj/Items/Food/DblClick()
	if(ismob(loc))
		var/mob/M=loc
		if(M.Owner!=usr)
			return
		var/list/menu=new()
		if(M.Race != "Vampire" && M.Race != "Gargoyle")
			menu+="Eat"
		menu+="Inspect"
		menu+="Drop"
		menu+="Cancel"
		var/Result=input("What would you like to do with the [src]?","Choose",null)in menu
		switch(Result)
			if("Eat")
				M.EatItem(src)
			if("Inspect")
				usr<<"\icon[src] <b>[name]</b>"
				if(FoodPower)
					usr<<"Satisfies [FoodPower] points of hunger when eaten."
				if(weight)
					usr<<"Weighs [weight] units."
				if(desc)
					usr<<desc
				usr<<"" //just the same as including a "<br>" at the end, stops people from getting as confused when looking at lots of items.
			if("Drop")
				M.DropItem(src)
	else if(!suffix)
		for(var/mob/Monsters/M in usr.Selected)
			if(M.PickUpItem(src,1))
				return(1)

/mob/proc/EatItem(var/ITEM)
	var/mob/M = Owner
	switch(ITEM)
		if("cmeat")
			Hunger+=150
			M.cmeat-=1
			//Tiredness-=75
		if("cfish")
			Hunger+=125
			M.cfish-=1
			//Tiredness-=50
		if("grape")
			MakeMany(/obj/Items/Seeds/GrapeSeed,2,loc)
			Hunger+=30
			M.grape-=1
		if("ufish")
			if(!Carn)
				Hunger+=75
				Tiredness-=75
				M.ufish-=1
			else
				Hunger+=125
				M.ufish-=1
		if("tomatoe")
			MakeMany(/obj/Items/Seeds/TomatoSeed,2,loc)
			Hunger+=50
			M.tomatoe-=1
		if("fungus")
			if(!Carn&&Race!="Dwarf")
				Hunger+=75
				Tiredness-=75
				M.fungus-=1
			else
				Hunger+=100
				M.fungus-=1
		if("umeat")
			if(!Carn)
				Hunger+=75
				Tiredness-=75
				M.umeat-=1
			else
				Hunger+=150
				M.umeat-=1
	if(Hunger>MaxHunger)
		Hunger=MaxHunger
	if(Tiredness<=0)
		Tiredness=0
	return(1)
	/*if(ITEM.loc==src)
		if(ITEM.suffix=="(Carrying)")
			var/Healthy=1
			switch(ITEM.icon_state)
				if("RawMeat")
					if(!Carn)
						Healthy=0
				if("Fungus")
					if(!Carn&&Race!="Dwarf")
						Healthy=0
				if("Adamantium")
					Hunger+=100
					MaxHunger+=100
			view(src) << "[src] eats the [ITEM]."
			if(!Healthy)
				Hunger+=ITEM.FoodPower/2
				Tiredness-=ITEM.FoodPower
			else
				Hunger+=ITEM.FoodPower
			if(Hunger>MaxHunger)
				Hunger=MaxHunger
			switch(Race)
				if("Spider")
					WebContent += ITEM.FoodPower
					if(WebContent > MaxWebContent)
						WebContent=MaxWebContent
				if("Dragon") switch(ITEM.Race)
					if("Demon")
						MagmaPoints += 100
					if("Dragon")
						ZombiePoints += 250
					if("Gremlin")
						SandPoints += 50
					if("Lizardman")
						PoisonPoints += 50
					if("Orc")
						IcePoints += 50
			switch(ITEM.icon_state)
				if("Grape")
					MakeMany(/obj/Items/Seeds/GrapeSeed,2,loc)
				if("Tomato")
					MakeMany(/obj/Items/Seeds/TomatoSeed,2,loc)
			if(DropItem(ITEM))
				del(ITEM)
			return(1)*/
