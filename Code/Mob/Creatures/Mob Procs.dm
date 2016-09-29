mob/proc/randomore(var/mob/m)
	var/E
	var/D
	var/EM
	var/R
	var/S
	var/AD
	var/G
	//var/GU
	var/Wood
	var/Bone
	var/SIL
	var/BUG2
	var/BUG
	var/BUG3
	var/CAP
	var/mob/M = src.Owner
	if(m.IsWall == 0)
		E = prob(35)
		D = prob(1.5)
		EM = prob(0.75)
		SIL = prob(5)
		BUG2 = prob(2)
		R = prob(0.75)
		S = prob(70)
		G = prob(5)
	//	GU = prob(35)
		BUG3 = prob(2)
		BUG = prob(2)
		CAP = prob(3)
	if(m.IsWall == 1)
		if(m.icon_state == "WoodWall" || m.icon_state == "TribalWall" || m.icon_state == "Elf Wall")
			Wood = prob(65)
		if(m.icon_state == "StoneWall" || m.icon_state == "DetailedWall" || m.icon_state == "GoblinWall" || m.icon_state == "StoneWall2" || m.icon_state == "SandWall" || m.icon_state == "IllithidWall")
			S = prob(65)
		if(m.icon_state == "BoneWall")
			Bone = prob(65)
	m.IsWall = 0
	if(BUG2 == 1)
		var/mob/Monsters/Critters/DeathBeatle/DB = new
		DB.loc = src.loc
		return
	if(src.Race == "Dwarf")
		AD = prob(1)
		if(src.z == 4)
			AD = prob(2)
	if(m.icon_state == "AdaSpire")
		AD = prob(70)
	if(BUG3 == 1)
		var/mob/Monsters/Critters/Mole/Mole = new
		Mole.loc = src.loc
	if(src.Race == "Goblin" && src.Level >= 20)
		EM = prob(1.25)
		R = prob(1.25)
		D = prob(2)
	if(CAP == 1)
		var/mob/Monsters/Critters/TowerCap/SS = new
		SS.loc = src.loc
	if(SIL == 1)
		if(M.silver >=250)
			M.silver = 250
		else
			M.silver +=1
	if(Wood == 1)
		if(M.log >=250)
			M.log = 250
		else
			M.log +=1
	if(Bone == 1)
		var/obj/Items/Bones/Bones/SS = new
		SS.loc = src.loc
		if(M.bone >=250)
			M.bone = 250
		else
			M.bone +=1
	if(BUG == 1)
		var/mob/Monsters/Critters/CaveSpider/CS = new
		CS.loc = src.loc
	if(G == 1)
		if(M.gold >=250)
			M.gold = 250
		else
			M.gold +=1
	if(E == 1)
		if(M.iron >=250)
			M.iron = 250
		else
			M.iron +=1
	if(AD == 1)
		if(M.addy >=250)
			M.addy = 250
		else
			M.addy +=1
	if(S == 1)
		if(M.stone >=250)
			M.stone = 250
		else
			M.stone +=1
	if(D == 1)
		M.udiamond+=1
	if(EM == 1)
		M.uemerald+=1
	if(R == 1)
		M.uruby+=1
client/proc/randomoredrill(var/mob/m)
	var/E
	var/D
	var/EM
	var/R
	var/S
	var/AD
	var/G
	//var/GU
	var/SIL
	var/mob/M = usr
	E = prob(35)
	D = prob(1.5)
	EM = prob(0.75)
	SIL = prob(5)
	R = prob(0.75)
	S = prob(70)
	G = prob(5)
	//	GU = prob(35)
	if(m.Race == "Dwarf")
		AD = prob(1)
		if(m.z == 4)
			AD = prob(2)
	if(m.Race == "Goblin" && m.Level >= 20)
		EM = prob(1.25)
		R = prob(1.25)
		D = prob(2)
	if(SIL == 1)
		if(M.silver >=250)
			M.silver = 250
		else
			M.silver +=1
			usr << "You drilled one silver ore and now have [M.silver] silver ore."
	if(G == 1)
		if(M.gold >=250)
			M.gold = 250
		else
			M.gold +=1
			usr << "You drilled one gold ore and now have [M.gold] gold ore."
	if(E == 1)
		if(M.iron >=250)
			M.iron = 250
		else
			M.iron +=1
			usr << "You drilled one iron ore and now have [M.iron] iron ore."
	if(AD == 1)
		if(M.addy >=250)
			M.addy = 250
		else
			M.addy +=1
			usr << "You drilled one addy ore and now have [M.addy] addy ore."
	if(S == 1)
		if(M.stone >=250)
			M.stone = 250
		else
			M.stone +=1
			usr << "You drilled one stone and now have [M.stone] stone."
	if(D == 1)
		M.udiamond+=1
	if(EM == 1)
		M.uemerald+=1
	if(R == 1)
		M.uruby+=1
mob/Monsters/proc/StartAllProcs()
	..()
	FullHeal() //Before ANY other procs in case it could mean death.
	RebuildOverlays()
	if(Race!="Gargoyle" && Race!="Skeleton" && Race!="Machine")
		spawn() Bleeding()
		spawn() Heal()
	spawn() Hunger()
	spawn() Tiredness()
	spawn() WalkTo()
	spawn() switch(Race)
		if("Zombie","Skeleton","Devourer")
		else Bed()
	spawn() LevelUp()
	spawn()	Build_From_Blueprint()
	spawn(5) //Time to allow saves to be loaded and everything.
		spawn()
			switch(Race)
				if("Lizardman","Vampire") Regen()
				if("Demon") FlameAttack()
			switch(SubRace)
				if("Werewolf")
					Regen()
					WerewolfTransformation()
mob/Monsters/proc/StartBuild()
	spawn()	Build_From_Blueprint()
//atom/var/tmp/destination
mob/var/tmp/destination
mob/Monsters/proc/WalkTo(LINKED=1) if(StopDouble("WalkTo") || LINKED) spawn()
//	sleep(Delay+CanBeSlaved*2)
	while(!CanBeSlaved)
		sleep(Delay)
		if(Delay < 1) src.Delay = 1
		if(destination) if(!Fainted&&!Stunned&&!Sleeping&&CanWalk)
			if(CliffClimber||Flying) if(z==1||z==3) if(istype(destination,/atom/))
				var/atom/F = destination
				if(F.z != z) switch(F.z)
					if(3) for(var/turf/W in range(1,src)) if(W.density || Flying) if(W.opacity || Flying)
						var/turf/W2 = locate(x,y,3)
						if(W2) if(W2.icon_state == "Sky")
							z = 3
							break
					if(1) if(Flying) for(var/turf/W in range(0,src)) if(W.icon_state == "Sky")
						z=1
						break
			if(destination == loc) destination=null
			if(destination == src) destination=null
			if(src.destination != src || src.destination != src.loc)
				if(src.InHole==0)
					if(src.HoldingWeapon == "Bow")
						walk_towards(src,destination,4)
					else
						//if(destination in range(1,src))
						if(get_dist(src,destination) <= 1)
							walk_towards(src,destination,4)
						else
							if(get_dist(src,destination) > 30)
								walk_towards(src,destination,4)
							else
								walk_to(src,destination,0,4)
						if(loc == destination) destination = null
				else
					destination = null
	RandomWalk(1)
/*/mob/Monsters/proc/WalkTo(LINKED=1)
//	sleep(Delay+CanBeSlaved*2)
	if(StopDouble("WalkTo") || LINKED)
		spawn()
			while(!CanBeSlaved)
				sleep(Delay)
				if(Delay < 1)
					src.Delay = 1
				if(destination)
					if(!Fainted&&!Stunned&&!Sleeping&&CanWalk)
						if(CliffClimber||Flying)
							if(z==1||z==3)
								if(istype(destination,/atom/))
									var/atom/F = destination
									if(F.z != z)
										switch(F.z)
											if(3)
												for(var/turf/W in range(1,src))
													if(W.density || Flying)
														if(W.opacity || Flying)
															var/turf/W2 = locate(x,y,3)
															if(W2)
																if(W2.icon_state == "Sky")
																	z = 3
																	break
											if(1)
												if(Flying)
													for(var/turf/W in range(0,src))
														if(W.icon_state == "Sky")
															z=1
															break
						step_towards(src,destination)
						if(loc == destination)
							destination = null
			RandomWalk(1)*/


mob/Monsters/proc/Hunger() if(StopDouble("Hunger")) spawn() while(1)
	sleep(400)
	if(MagicalAptitude)
		if(Mana < MaxMana)
			Mana += MagicalConcentration / 2
			for(var/obj/Items/Equipment/Armour/Chestplate/ChaosRobe/C in src) if(C.suffix == "(Equipped)") Mana += 5
			for(var/obj/Items/Equipment/Armour/Helmet/ChaosHood/C in src) if(C.suffix == "(Equipped)") Mana += 5
			for(var/obj/Items/Equipment/Armour/Capes/ChaosCape/C in src) if(C.suffix == "(Equipped)") Mana += 5
		if(Mana > MaxMana) Mana = MaxMana
	if(HP<MAXHP)
		HP += 10
		if(HP>MAXHP)HP=MAXHP
	if(ismob(Owner))
		if(!InHole&&Owner:client)
			switch(Race)
				if("Zombie","Devourer")
					if(Hunger<100)
						Hunger+=0.5
				else
					if(!InHole&&Race != "Gargoyle")
						if(Race=="Lizardman") Hunger -= 0.5
						else Hunger-=1
					if(Hunger<=20)
						EatSomething()
						if(Hunger<=10)
							switch(Race)
								if("Machine")
									if(HP <= 0)
										GoingToDie = 1
										Killer = "Lack Of Energy"
										DeathType = "Power Core Degredation"
										Death()
								else
									HP+=Hunger //You're thinking "PLUS?!" but infact, the value is always below zero in this situation, so it's lowering your HP.
								//	if(HP<=0) Death("has died of starvation!")
									if(HP <= 0)
										GoingToDie = 1
										Killer = "Lack Of Food"
										DeathType = "Starvation"
										Death()
mob/Monsters/proc/EatSomething()
	var/mob/M = Owner
	switch(Race)
	//if("Gargoyle") for(var/obj/Items/ores/ITEM in src) if(ITEM.icon_state!="Sand") if(EatItem(ITEM)) return(1)
		if("Vampire")
			for(var/mob/Monsters/C in view(1,src))
				if(VampireBite(C,100,1))
					return(1)
		if("Machine")
			if(usr.raddy>=1)
				usr.raddy-=1
				Hunger=100
				return(1)
	if(M.cmeat>=1)
		EatItem("cmeat")
		usr << "Eating meat"
	else
		if(M.cfish>=1)
			EatItem("cfish")
		else
			if(M.grape>=1)
				EatItem("grape")
			else
				if(M.ufish>=1)
					EatItem("ufish")
				else
					if(M.tomatoe>=1)
						EatItem("tomatoe")
					else
						if(M.fungus>=1)
							EatItem("fungus")
						else
							if(M.umeat>=1)
								EatItem("umeat")
							else
								Owner << "<b><font color=red>[src] : I'm Hungry!" //Now it only pops up if you don't have food.

		//for(var/obj/Items/Food/ITEM in src) switch(ITEM.icon_state) if("CookedMeat","Grape","Tomato") if(EatItem(ITEM)) return(1)
		//for(var/obj/Items/Food/ITEM in src) if(EatItem(ITEM)) return(1)

		//for(var/obj/Items/Food/ITEM in range(5,src)) if(ITEM.ItemType=="Food") if(ForcePickUpItem(ITEM)) if(EatItem(ITEM)) return(1)
		//for(var/mob/Monsters/M in range(5,src)) for(var/obj/Items/Food/ITEM in M) if(ITEM.ItemType=="Food") if(M.DropItem(ITEM)) if(ForcePickUpItem(ITEM)) if(EatItem(ITEM)) return(1)
mob/Monsters/proc/Tiredness() if(StopDouble("Tiredness")) spawn() while(1)
	sleep(400)
	if(ismob(Owner)) if(!InHole&&Owner:client) switch(Race)
		if("Gargoyle","Elf","Zombie","Svartalfar","Devourer","Machine") if(Tiredness < 100) Tiredness +=0.5
		else
			if(src.Tiredness <= 20)
				src.Owner << "<b><font color=red>[src] : I'm Tired!"
				if(!IsMist&&!Flying) switch(Race)
					if("Spider","Dragon") Sleep(300-Level)
					else for(var/obj/Items/Furniture/Beds/B in view(20,src))
						if(!Sleeping)
							if(destination) src.SavedDest = src.destination
							else src.SavedDest = src.loc
							if(B.loc!=src&&B.loc!=loc) destination = B.loc
						break
			if(src.Tiredness <= -10)
				src.HP -= 10
				if(src.HP <= 0)
					src.GoingToDie = 1
					src.Killer = "Lack Of Sleep"
					src.DeathType = "Tiredness"
				src.Death()
			else src.Tiredness -= 1
mob/proc/Bed() if(StopDouble("Bed")) spawn() while(1)
	if(CanBeSlaved) sleep(1000)
	else sleep(5)
	if(Tiredness <= 20) for(var/obj/Items/Furniture/Beds/B in view(0,src))
		var/CanSleep = 1
		for(var/mob/Monsters/J in oview(5,src)) if(J.destination == src) CanSleep = 0
		if(CanSleep && src.Sleeping == 0) Sleep(300-B.CR)
mob/proc/Sleep(TIME=300) if(!Sleeping)
	if(TIME<=40) TIME=40
	spawn(TIME)
		Tiredness = 100
		Sleeping = 0
		destination = SavedDest
		SavedDest = null
		RebuildOverlays()
	Tiredness = 100
	Sleeping = 1
	if(!SavedDest) SavedDest = destination
	destination = null
	dir=SOUTH
	RebuildOverlays()
	Deselect()