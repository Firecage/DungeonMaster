obj/WorkShops/CampFires
	GoodAltar
		icon = 'Cave.dmi'
		icon_state = "GoodAltar"
		weight = 100
		suffix = null
		HP = 200
		DblClick() for(var/mob/Monsters/M in usr.Selected) if(M in view(1,src))
			var/list/menu = new()
			menu += "Pray"
			if(src.Content2 >= 150)
				menu += "Holy Shield"
			for(var/obj/Items/Shafts/MetalFlask/F in M)
				if(F.HasWater == "Water")
					menu += "Bless Flask of Water"
			for(var/obj/Items/Shafts/LeatherFlask/F in M)
				if(F.HasWater == "Water")
					menu += "Bless Flask of Water"
			menu += "Destroy"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if(Result == "Cancel")
				return
			if(Result == "Holy Shield")
				if(src.Content2 >= 150 && M.Shielded == 0 && M.Undead == 0 && M.Infects == 0 && M.Unholy == 0)
					src.Content2 -= 150
					M.Defence += 10
					M.Shielded = 1
					M.ImmuneToMagic = 1
					M.RebuildOverlays()
					view(usr) << "[src] covers [M] in a holy shield of light!"
					return
				else
					usr << "[src] either doesn't have 150 prayer points OR you are trying to cast on an unholy/shielded creature."
					return
			if(Result == "Bless Flask of Water")
				for(var/obj/Items/Shafts/LeatherFlask/F in M)
					if(F.HasWater == "Water")
						view(M) << "[M] blesses the flask of water with the power of the lords of light!"
						F.HasWater = "Holy"
						return
				for(var/obj/Items/Shafts/MetalFlask/F in M)
					if(F.HasWater == "Water")
						view(M) << "[M] blesses the flask of water with the power of the lords of light!"
						F.HasWater = "Holy"
						return
			if(Result == "Destroy")
				del(src)
				return
			if(Result == "Pray")
				if(M.Undead == 0 && M.Infects == 0 && M.Hunger >= 70)
					view(M) << "[M] prays to the [src]"
					src.Content2 += 15
					M.Hunger -= 70
					M.Tiredness -= 70
				else
					usr << "Undead CANNOT pray to a good god!! Or you are too hungry."
				return
	EvilAltar
		icon = 'Cave.dmi'
		icon_state = "EvilAltar"
		weight = 100
		HP = 200
		DblClick() for(var/mob/Monsters/M in usr.Selected) if(M in view(1,src))
			var/list/menu = new()
			menu += "Sacrifice"
			if(src.Content2 >= 150)
				menu += "Unholy Vigor"
			for(var/obj/Items/Shafts/MetalFlask/F in M)
				if(F.HasWater == "Blood")
					menu += "Bless Flask of Blood"
			for(var/obj/Items/Shafts/LeatherFlask/F in M)
				if(F.HasWater == "Blood")
					menu += "Bless Flask of Blood"
			menu += "Destroy"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if(Result == "Cancel")
				return
			if(Result == "Destroy")
				del(src)
				return
			if(Result == "Bless Flask of Blood")
				for(var/obj/Items/Shafts/LeatherFlask/F in M)
					if(F.HasWater == "Blood")
						view(M) << "[M] blesses the flask of blood with the power of the unholy gods!"
						F.HasWater = "Unholy"
						return
				for(var/obj/Items/Shafts/MetalFlask/F in M)
					if(F.HasWater == "Blood")
						view(M) << "[M] blesses the flask of blood with the power of the unholy gods!"
						F.HasWater = "Unholy"
						return
			if(Result == "Unholy Vigor")
				if(src.Content2 >= 150 && M.Shielded == 0 && M.Unholy == 0)
					view(usr) << "[usr] fills [M] with unholy strength making their attacks much more damaging!"
					M.WeaponDamageMin += 5
					M.WeaponDamageMax += 5
					M.Unholy = 1
					M.ImmuneToTemperature = 1
					src.Content2 -= 150
				else
					usr << "[src] either doesn't have 150 worship points or that creature has been blessed by a good god, or you have already given it unholy vigor."
			if(Result == "Sacrifice")
				if(M in view(2,src))
					usr << "[M] leaps into the flames of the dispicable altar and allows the dark tendrils to consume it."
					src.Content2 += M.Level*2
					src.Content2 += M.Strength + M.Agility / 2
					M.DeathType = "Sacrificed To Death"
					M.GoingToDie = 1
					M.Death()
					return
	Fire
		density = 1
		luminosity = 6
		layer = 4
		icon = 'Cave.dmi'
		icon_state = "Fire"
		New() Heat()
	DblClick() for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Spider")
			return
		if(M.Wagon == 1)
			return
		var/list/menu = new()
		menu += "Cook"
		menu += "Tear all Meat from Corpses"
		menu += "Destroy"
		menu += "Cancel"
		var/Result = input("What Action Will You Choose?", "Choose", null) in menu
		if (Result != "Cancel")
			..()
		if (Result == "Destroy")
			if(M in range(1,src))
				del(src)
		if(Result == "Tear all Meat from Corpses") for(var/mob/Body/m in M) M.TearMeat(m)
		if (Result == "Cook")
			if(usr.umeat>=1)
				usr.cmeat+=usr.umeat
				usr.umeat=0
			if(usr.ufish>=1)
				usr.cfish+=usr.ufish
				usr.ufish=0
			//for(var/obj/Items/Food/Meat/B in M) if(B.icon_state=="RawMeat")
				//if(!prob(M.CookingSkill*4))
					//usr<< "failed!"
					//M.weight -= B.weight
					//del(B)
					//M.CookingSkill+=2
					//break
					//return
				//else
					//B.name = "Cooked [B.name]"
					//B.icon_state="CookedMeat"
					//M.CookingSkill+=1