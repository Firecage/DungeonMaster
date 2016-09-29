mob/proc/textlist(var/textlist)
	writing=list();
	for(var/t=1,t<=length(textlist),t++)
		writing+=copytext(textlist,t,t+1)

mob/proc/Text(mob/m,var/x,var/y,var/offx,var/offy,var/t)
	if(m.key!=null)
		textlist(t)
		for(var/w in writing)
			var/obj/HUD2/Text/s=new(m.client)
			s.screen_loc="[x]:[offx],[y]:[offy]"
			s.icon_state=w
			s.name="\proper[w]"
			offx+=8
			if(offx >= 32) {/*sleep(0.1);*/offx-=32 ; x++}

var/writing
mob/proc/PillarPowerup() if(ismob(Owner))
	var/mob/M = Owner
	for(var/obj/PowerupPillar/P in world) if(M.Faction == P.Content2)
		Strength += P.Strength
		GainEXP(P.Content3)
		Agility += P.Agility
		Defence += P.Defence
		Intelligence += P.Intelligence
		weightmax += P.weightmax

mob/proc/Meditation() spawn()
	if(Meditating)
		Meditating = 0
		Owner << "[src] prepares to stop meditating."
	else
		Meditating = 1
		view(src) << "[src] starts to meditate. They will slowly gain magical skills over time."
		if(StopDouble("Meditation"))
			while(Meditating)
				if(ismob(Owner)) if(!Owner:client) break
				Target = null
				BowOn = 0
				CanWalk = 0
				destination = null
				sleep(100)
				if(MagicalWill < 50) if(prob(35))
					MagicalWill += 0.5
					if(Race == "Svartalfar") MagicalWill += 0.5
				if(MagicalAnger < 50) if(prob(35))
					MagicalAnger += 0.5
					if(Race == "Svartalfar") MagicalAnger += 0.5
				if(MagicalMind < 50) if(prob(30))
					MagicalMind += 0.5
					if(Race == "Svartalfar") MagicalMind += 0.5
				if(MagicalConcentration < 50) if(prob(30))
					MagicalConcentration += 0.5
					if(Race == "Svartalfar") MagicalConcentration += 0.5
				if(MaxMana < 250) if(prob(40))
					MaxMana += 1.25
					if(Race == "Svartalfar") MaxMana += 1.25
				if(Mana<MaxMana) Mana+=0.5
				GainEXP(25)
			Meditating=0
			view(src) << "[src] finishes meditating and stands up."
			RunningProcs-="Meditation"
			CanWalk = 1

/*mob/proc/CacoonTrap()
	for(var/mob/Monsters/X in range(4,src))
		var/OGB = 0
		if(X.Owner != src.Owner)
			if(!X.Critter)
				for(var/mob/KLL in Players2)
					if(KLL == src.Owner)
						for(var/mob/MK in Players2)
							if(X.Owner == MK)
								if(MK.name in KLL.AllyList || MK.Faction == KLL.Faction)
									OGB = 1
		if(OGB == 0)
			var/mob/Monsters/Devourer/FleshCrawler/F1 = new(loc)
			var/mob/Monsters/Devourer/FleshCrawler/F2 = new(loc)
			F1.Owner = src.Owner
			F2.Owner = src.Owner
			F1.destination = X
			F2.destination = X
			F1.name = "{[F1.Owner]} Flesh Crawler"
			F2.name = "{[F2.Owner]} Flesh Crawler"
			view(src) << "[src] explodes open in a shower of gore and releases two small monstrosities!"
			src.Owner << "<b><font color=red><font size=3>[src] has detected an intruder at [src.x],[src.y],[src.z]!"
			del src
	spawn(5)
		src.CacoonTrap()*/

mob/proc/SolarPowered()
	if(night == 0)
		src.Hunger += 1
		if(src.Hunger >= 100)
			src.Hunger = 100
		src.Mana += 1
		if(src.Mana >= src.MaxMana)
			src.Mana = src.MaxMana
		src.Tiredness += 0.5
		if(src.Tiredness >= 100)
			src.Tiredness = 100
	spawn(100)
		src.SolarPowered()

mob/proc/Running() if(!Running && Delay > 1)
	view(src) << "[src] starts to run!"
	Running = 1
	Delay -= 1
	Tiredness -= 25
	spawn(300)
		Delay += 1
		view(src) << "[src] stops running!"
		spawn(100)
		Running = 0

obj/proc/Portal()
	for(var/mob/M in view(0,src))
		if(M.loc != locate(M.x,M.y,4))
			M.loc = locate(M.x,M.y-1,4)
			M.destination = null
			var/C = prob(15)
			var/P = prob(25)
			if(M.client == null) if(!M.SubRace)
				if(C) if(M.CanSee)
					if(M.Wagon == 0 && M.Race != "Demon" && M.Race != "Gargoyle" && M.Race != "Demon" && M.Race != "Dragon" && M.Unholy == 0)
						M.Owner << "[M] goes insane from the horror and tears their own eyes out!"
						M.HasLeftEye = 0
						M.HasRightEye = 0
						M.CanSee = 0
						M.RightEyeHP = 0
						M.LeftEyeHP = 0
						M.LeftEye = "Destroyed"
						M.RightEye = "Destroyed"
				if(C == 0)
					if(P)
						if(ismob(M.Owner))
							if(M.Wagon == 0)
								if(M.Race != "Demon" && M.Race != "Gargoyle" && M.Race != "Demon" && M.Race != "Dragon")
									M.Owner << "[M] is possessed by the demonic forces surrounding the portal!"
									M.RaceChange(SUBRACE="HalfDemon")
		else
			M.loc = locate(M.x,M.y-1,src.Content)
			M.destination = null
	spawn(10)
		Portal()
		return

obj/proc/PlantRegen()
	if(src.Content <= 4)
		src.Content += 1
		if(src.Content >= 1)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant5"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant5"
		if(src.Content >= 2)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant4"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant4"
		if(src.Content >= 3)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant3"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant3"
		if(src.Content >= 4)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant2"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant2"
		if(src.Content >= 5)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant1"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant1"
	spawn(1200)
		src.PlantRegen()
		return

obj/proc/AstralPortal()
	for(var/mob/M in view(0,src))
		var/obj/AstralPortal/A
		M.loc = A.GoesTo

mob/proc/FindItems()
	for(var/obj/Items/I in view(6,src))
		if(I.suffix == null)
			if(I.Door == 0)
				if(I.IsTrap == 0)
					if(I.Content3 != "Cage")
						if(src.Target == null)
							src.Target = I
	for(var/obj/Items/I in view(0,src))
		if(src.Target == I)
			del(I)
	if(src.Target)
		var/obj/A = src.Target
		if(A.suffix == null)
			step_towards(src,src.Target)
		else
			src.Target = null
	else
		step_rand(src)
	spawn(10) FindItems()

mob/proc/TurnOffAttack()
	src.destination = null
	spawn(500) TurnOffAttack()

mob/proc/PetFollow()
	if(destination) step_towards(src,src.destination)
	else return
	spawn(5) PetFollow()


mob/proc/Ready()
	src.Owner << "<b><font color=purple>[src]'s egg sack begins to swell she may now create a lair!"
	src.icon = 'SpiderQueenMature.dmi'
	src.icon_state = "Normal"
	src.MaxWebContent += 100
	src.WebContent = src.MaxWebContent
	src.CanBreed = 1



mob/proc/Detail()
	for(var/mob/Monsters/M in usr.Selected)
		var/mob/Test/left = new
		left.loc = locate(M.x-1,M.y,M.z)
		for(var/turf/TUR in view(0,left))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTH
				src.destination = null
			if(TUR.dir == SOUTHWEST)
				TUR.dir = NORTH
			if(TUR.dir == NORTHWEST)
				TUR.dir = NORTH
			if(TUR.dir == WEST)
				TUR.dir = SOUTHWEST
			if(TUR.dir == EAST)
				TUR.dir = NORTHEAST
		var/mob/Test/right = new
		right.loc = locate(M.x+1,M.y,M.z)
		for(var/turf/TUR in view(0,right))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTH
				src.destination = null
			if(TUR.dir == SOUTHEAST)
				TUR.dir = SOUTH
			if(TUR.dir == NORTHEAST)
				TUR.dir = SOUTH
			if(TUR.dir == WEST)
				TUR.dir = SOUTHWEST
			if(TUR.dir == EAST)
				TUR.dir = NORTHWEST
		var/mob/Test/top = new
		top.loc = locate(M.x,M.y+1,M.z)
		for(var/turf/TUR in view(0,top))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = WEST
				src.destination = null
			if(TUR.dir == NORTHEAST)
				TUR.dir = WEST
			if(TUR.dir == NORTHWEST)
				TUR.dir = WEST
			if(TUR.dir == NORTH)
				TUR.dir = SOUTHEAST
			if(TUR.dir == SOUTH)
				TUR.dir = SOUTHWEST
		var/mob/Test/bot = new
		bot.loc = locate(M.x,M.y-1,M.z)
		for(var/turf/TUR in view(0,bot))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = EAST
				src.destination = null
			if(TUR.dir == SOUTHEAST)
				TUR.dir = EAST
			if(TUR.dir == SOUTHWEST)
				TUR.dir = EAST
			if(TUR.dir == NORTH)
				TUR.dir = NORTHEAST
			if(TUR.dir == SOUTH)
				TUR.dir = NORTHWEST
		var/mob/Test/botleft = new
		botleft.loc = locate(M.x-1,M.y-1,M.z)
		for(var/turf/TUR in view(0,botleft))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTHWEST
				src.destination = null
		var/mob/Test/botright = new
		botright.loc = locate(M.x+1,M.y-1,M.z)
		for(var/turf/TUR in view(0,botright))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTHEAST
				src.destination = null
		var/mob/Test/topright = new
		topright.loc = locate(M.x+1,M.y+1,M.z)
		for(var/turf/TUR in view(0,topright))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTHEAST
				src.destination = null
		var/mob/Test/topleft = new
		topleft.loc = locate(M.x-1,M.y+1,M.z)
		for(var/turf/TUR in view(0,topleft))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTHWEST
				src.destination = null
		del(topleft)
		del(topright)
		del(botright)
		del(botleft)
		del(bot)
		del(top)
		del(left)
		del(right)
/*mob/proc/Dig()
	if(Dig)
		if(src.Sleeping == 0)
			for(var/obj/DigAt/D in oview(src))
				if(null)
					return
				else
					if(D.Owner == src)
						if(src.DigTarget == D)
							for(var/obj/Tree/T in view(0,D))
								if(T)
									src.destination = T
									return
							for(var/turf/T in view(0,D))
								src.destination = T
						if(src.DigTarget == null)
							src.DigTarget = D
						if(null)
							return
	else
		return
	spawn(1) Dig()*/
mob/proc/Heat()
	for(var/mob/Monsters/M in view(4,src)) if(M.Coldness >= 0) M.Coldness = 0
	for(var/turf/grounds/KKG in view(1,src))
		if(KKG.OnFire == 0)
			if(KKG.IsWood == 1)
				var/CatchChance = prob(10)
				if(CatchChance)
					if(KKG.icon_state == "WoodWall")
						KKG.Fire()
					if(KKG.icon_state == "TribalWall")
						KKG.Fire()
					if(KKG in view(0,src))
						if(KKG.icon_state == "WoodFloor")
							KKG.Fire()
						if(KKG.icon_state == "Tribal")
							KKG.Fire()
	spawn(75) Heat()
proc/Heat()
	for(var/mob/Monsters/M in view(4,src)) if(M.Coldness >= 0) M.Coldness = 0
	for(var/turf/grounds/KKG in view(1,src))
		if(KKG.OnFire == 0)
			if(KKG.IsWood == 1)
				var/CatchChance = prob(10)
				if(CatchChance)
					if(KKG.icon_state == "WoodWall")
						KKG.Fire()
					if(KKG.icon_state == "TribalWall")
						KKG.Fire()
					if(KKG in view(0,src))
						if(KKG.icon_state == "WoodFloor")
							KKG.Fire()
						if(KKG.icon_state == "Tribal")
							KKG.Fire()
	spawn(75) Heat()

atom
	var
		tmp
			Target
			Owner
			Star
			Restart = 0
			CoolDown = 0
			M //Only used for saves (Not used at all?
		NoDropOnDeath = 0
		Intelligence = 0
		//IsBread = 0
		//IsCake = 0
		ArmourSkill = 0
		LockVar = 0
		Cant = 0
		Poisoned = 0
		CraftRank = null
		HumanParts = 0

		BelongsToHumans = 0
		BelongsToDwarf = 0
		BelongsToGoblin = 0
		BelongsToSkorn = 0

		CanFish = 0
		Undead = 0
		Up = 0
		CantKill = 0
		Tame = 0
		Cactus = 0
		Tree = 0
		Bamboo = 0
		Coldness = 0
		HasHeadOn = 0
		Sky = 0
		GoingToDie = 0
		BloodAcidity = 0


		IsPotion = 0


		WS = 0

		IsEmpty = 0

		HasWater = null
		SwordSkill = 0
		ClawSkill = 0
		Dig = 0

		Drill = 0
		IsWall = 0
		BowSkill = 0
		CaveWater = 0
		T = 0

		PoisonDMG = 0
		PoisonContent = 0

		Old

		GoesTo = null
		isbridge = 0

		Content = 0
		Content2 = 0
		Content3 = 0

		GM = 0
		WC = 0
		DE = 0

		OnFire = 0
		Fuel = 75
		OIcon = "Grass"
		IsWood = 0
		CanBeSlaved = 0
		Door = 0

		CanDigAt = 0
		html
		Placed = 0
		Locked = 0
		Supported = 0

		Detailed = 0
		IsTrap = 0

		Hole = 0
		InHole = 0
		IsSpiked = 0
		HasPersonIn = 0

		Enchanted = 0

		Wagon = 0
		Body = 0

		Silver = 0
		Skinned = 0
		TP = 0
		Carn = 0
		Pale = 0
		PoisonSkill = 0

		CR = 0

		Black = 0
		HasPlantIn = 0

		Evolved

		IsMist = 0

		TS = 0
		HP
		MAXHP
		weight = 0
		weightmax = 0

obj/proc/AcidSpray()
	if(src.BloodAcidity >= 1)
		for(var/mob/Monsters/M in range(0,src))
			if(M.BloodAcidity == 0)
				view(M) << "[M] steps into a pool of acidic blood!"
				M.BloodContent -= 10
				M.BloodLoss()
		for(var/turf/grounds/Y in view(1,src))
			var/AcidMelt = prob(src.BloodAcidity)
			if(AcidMelt == 1)
				Y.name = "acid ground"
				Y.icon = 'Cave.dmi'
				Y.icon_state = "Acidground"
				Y.Sky = 1
				Y.Content3 = "CanClimb"
				Y.OIcon = "Acidground"
				Y.density = 0
				Y.CanDigAt = 0
				Y.opacity = 0
		for(var/obj/Items/I in view(0,src))
			var/Melt = prob(src.BloodAcidity)
			if(Melt == 1)
				var/obj/Bloods/AcidGoo/A = new(I.loc)
				A.name = I.name
				del I
		if(src.Undead == 0)
			src.icon += rgb(-50,150,0)
			src.Undead = 1
	spawn(20)
		src.AcidSpray()

obj/proc/Seek()
	if(src.Target)
		walk_towards(src,src.Target,2)
	else
		src.BowSkill = 0
		return
	spawn(0.1) Seek()

/mob/proc/Struggle()
	if(src)
		for(var/obj/Items/Traps/PitTrap/P in view(0,src))
			if(src.InHole == 1)
				var/E
				E = prob(src.SneakingSkill/2)
				if(E == 1)
					view()<< "<b><font color=red>[src] has escaped from a pit trap!"
					src.Owner << "<b><font color=red>[src] has escaped from a pit trap!"
					src.InHole = 0
					src.SneakingSkill += 0.5
					del(P)

			else
				return
	spawn(100)
		Struggle()

mob/proc/CreateZombie()
	spawn(500)
		if(src)
			src.icon = turn(src.icon,270)
			var/mob/Monsters/Zombie/Z = new
			Z.icon = src.icon
			Z.icon_state = src.icon_state
			for(var/mob/O in world)
				if(O.ckey == src.Owner)
					Z.Owner = O
					Z.name = "([O]) Zombie"
					O.UnitList += Z
			Z.Zombie()
			Z.LimbLoss()

			Z.overlays += /obj/Bloods/Zombie/
			Z.loc = src.loc
			range(8,src) << "<font color = teal>[src] begins to twitch, after a moment, they rise up from the dead and begin to walk!<br>"
			Z.Owner << "<font color = teal>A Zombie has risen at [Z.x],[Z.y],[Z.z]<br>"
			del (src)
obj/proc/TomatoDecay()
	spawn(19000)
	if(src.suffix == null)
		for(var/turf/t in view(0,src))
			if(t.icon_state == "FarmLand")
				if(t.HasPlantIn == 1)
					t.HasPlantIn = 0
		del(src)
	else
		src.TomatoDecay()
obj/proc/ItemDecay()
	spawn(19000)
	if(src.suffix == null)
		del(src)
	else
		src.ItemDecay()
mob/proc/Infection(var/mob/InfectorOwner)
	if(src.Race != "Gargoyle")
		if(src.ImmuneToDevourer == 0)
			src.Infects = 1
			spawn(500)
				if(src)
					src.Owner << "<font color = teal>[src] begins to look pale.<br>"
					spawn(1000)
						if(src)
							if(prob(25 + src.Level) && src.ImmuneToDevourer == 0)
								src.Owner << "<font color = teal>[src] seems to have recovered from whatever horrid plague had stricken them.<br>"
								src.Infects = 0
								return
							if(src.ImmuneToDevourer == 1)
								src.Owner << "<font color = teal>[src] seems to have recovered from whatever horrid plague had stricken them due tot heir newfound immunity.<br>"
								src.Infects = 0
								return
							else
								src.Owner << "<font color = teal>[src] begins to gurgle and splutter blood everywhere, they become a Zombie!<br>"
								var/mob/Monsters/Zombie/Z = new
								Z.icon = src.icon
								Z.icon_state = src.icon_state
								Z.Zombie()
								if(src.loc != locate(0,0,0))
									Z.loc = src.loc
								else
									Z.loc = InfectorOwner.loc
								Z.Owner = InfectorOwner
								Z.Undead = 1
								Z.name = "([Z.Owner]) Zombie"
								InfectorOwner.UnitList += Z
								Z.LimbLoss()
								var/obj/Bloods/Zombie/O = new
								Z.overlays += O
								Z.Owner << "<font color = teal>A new infection was created at [src.x],[src.y],[src.z]<br>"
								for(var/obj/Items/I in src)
									I.loc = src.loc
									I.suffix = null
								del(src)
								return
mob/proc/Zombie()
	if(src)
		if(src.Owner)
			if(src.icon_state == "NoLeftArm")
				src.HasLeftArm = 0
			if(src.icon_state == "NoRightArm")
				src.HasRightArm = 0
			if(src.icon_state == "NoLeftLeg")
				src.HasLeftLeg = 0
			if(src.icon_state == "NoRightLeg")
				src.HasRightLeg = 0
			if(src.icon_state == "NoLegs")
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArms")
				src.HasRightArm = 0
				src.HasLeftArm = 0
			if(src.icon_state == "NoRightLegNoLeftArm")
				src.HasRightLeg = 0
				src.HasLeftArm = 0
			if(src.icon_state == "NoLeftLegNoRightArm")
				src.HasLeftLeg = 0
				src.HasRightArm = 0
			if(src.icon_state == "NoRightArmNoRightLeg")
				src.HasRightArm = 0
				src.HasRightLeg = 0
			if(src.icon_state == "NoLeftArmNoLeftLeg")
				src.HasLeftArm = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoLegsNoRightArm")
				src.HasRightArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoLegsNoLeftArm")
				src.HasLeftArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArmsNoLeftLeg")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArmsNoRightLeg")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasRightLeg = 0
			if(src.icon_state == "None")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
mob/proc/BodyDecay()
	spawn(4000)
	if(src.suffix == null)
		del(src)
	else
		src.BodyDecay()
mob/proc/FishDecay()
	spawn(500)
		if(src.suffix == null)
			del(src)