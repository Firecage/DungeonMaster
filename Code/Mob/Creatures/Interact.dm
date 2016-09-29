mob/proc/hideinteract()
	spawn(1)
		winshow(src,"InteractChoices",0)
	spawn(1)
		winshow(src,"givecreature",0)
	spawn(1)
		winshow(src,"thiscreature",0)
	spawn(1)
		winshow(src,"closestcreature",0)
	spawn(1)
		winshow(src,"MagicalInteractChoices",0)
var/minteractopen = 0
var/interactopen = 0
mob/verb/Interact() for(var/mob/Monsters/M in usr.Selected)
	if(M.MagicalAptitude)
		if(minteractopen == 0)
			winshow(src,"MagicalInteractChoices",1)
			minteractopen = 1
		else
			winshow(src,"MagicalInteractChoices",0)
			minteractopen = 0
			return


	else
		if(interactopen == 0)
			winshow(src,"InteractChoices",1)
			interactopen = 1
		else
			winshow(src,"InteractChoices",0)
			interactopen = 0
			return



Player/Login()
	..()
	InitInteractButtons()




mob/proc/InitInteractButtons()
	/*
	Alright, this is how it's done:
	*/




mob/verb/givecreatureto() for(var/mob/Monsters/M in usr.Selected)
	set hidden = 1
	winshow(src,"InteractChoices",0)
	winshow(src,"MagicalInteractChoices",0)
	winshow(src,"givecreature",1)





mob/verb/thiscreature() for(var/mob/Monsters/M in usr.Selected)
	set hidden = 1
	//winshow(src,"InteractChoices",0)
	//winshow(src,"MagicalInteractChoices",0)
	//winshow(src,"thiscreature",1)
	var/list/menu = new()
	menu += "Run"
	menu += "Dig On/Off"
	menu += "Give Creature To"
	menu += "Suicide"
	if(M.Race == "Gargoyle" || M.Race == "Dragon" || M.SubRace == "Illithid" || M.Undead) menu += "Rest"
	if(M.Race == "Orc")
		if(M.Level >= 40)
			menu += "Berserk"
			menu += "Defensive Fighting"
	if(M.GargRuby >= 15) menu += "Firebolt"
	if(M.GargRuby >= 30)
		menu -= "Firebolt"
		menu += "Fireball"
	if(M.GargRuby >= 100)
		menu -= "Fireball"
		menu += "Fiery Death"
	if(M.GargEmerald >= 15)
		menu += "Poison Bolt"
	if(M.GargEmerald >= 30)
		menu += "Create Tree"
	if(M.GargEmerald >= 100)
		menu += "Grant Life"
	for(var/obj/Items/Arrows/A in M) if(A.suffix == "(Stuck In)") menu += "Pull Out Arrow"
	if(M.density)
		if(M.Race == "Vampire") menu += "Rest"
		if(M.Race == "Svartalfar") menu += "Rest"
	if(M.Race == "Vampire")
		if(M.Level >= 10)
			menu += "Morph"
			if(M.Level >= 15)
				menu += "Turn Into Mist"
				if(!M.DayWalker) if(M.Level >= 40) menu += "Become Daywalker"
	if(M.HasWings)
		if(M.Race == "Angel of Death" || M.Race == "Demon" || M.Race == "Gargoyle" || M.Race == "Vampire") menu += "Retract Wings"
		menu += "Fly"
	menu += "Cancel"
	var/Result = input("Do What?", "Choose", null) in menu
	switch(Result)
		if("Cancel") return
		//if("Create Mobile Caccoon")
			//if(M.Level>=100)
				//var/obj/Items/Shafts/MobileSandKing/Sand = new
				//Sand.loc = M.loc
				//view() << "[M] begins to spin a tight, hard caccoon around itself as it expels a quantity of undigested food from its gullet, it eventually finishes and is completely encased in a seemingly unbreakable caccoon."
				//del M
		if("Create Creature")
			if(M.Hunger >= 75)
				var/list/menus = new()
				menus += "Goblin"
				menus += "Kobold"
				menus += "Dwarf"
				menus += "Wolf"
				menus += "Lizardman"
				menus += "Orc"
				menus += "Cancel"
				var/Results = input("Do What?", "Choose", null) in menus
				if (Results != "Cancel")
					..()
				if (Results == "Goblin")
					var/mob/Monsters/Goblin/S = new
					S.loc = M.loc
					S.Owner = M.Owner
					S.GiveBirth()
					M.Hunger -= 75
					var/mob/m = M.Owner
					m.UnitList += S
					return
				if (Results == "Kobold")
					var/mob/Monsters/Kobold/S = new
					S.loc = M.loc
					S.Owner = M.Owner
					S.GiveBirth()
					M.Hunger -= 75
					var/mob/m = M.Owner
					m.UnitList += S
					return
				if (Results == "Dwarf")
					var/mob/Monsters/Dwarf/S = new
					S.loc = M.loc
					S.Owner = M.Owner
					S.GiveBirth()
					M.Hunger -= 75
					var/mob/m = M.Owner
					m.UnitList += S
					return
				if (Results == "Wolf")
					var/mob/Monsters/Wolf/S = new
					S.loc = M.loc
					S.Owner = M.Owner
					S.CanBeSlaved = 0
					M.Hunger -= 50
					var/mob/m = M.Owner
					m.UnitList += S
					return
				if (Results == "Lizardman")
					var/mob/Monsters/Lizardman/S = new
					S.loc = M.loc
					S.Owner = M.Owner
					S.GiveBirth()
					M.Hunger -= 75
					var/mob/m = M.Owner
					m.UnitList += S
					return
				if (Results == "Orc")
					var/mob/Monsters/Orc/S = new
					S.loc = M.loc
					S.Owner = M.Owner
					S.GiveBirth()
					M.Hunger -= 75
					var/mob/m = M.Owner
					m.UnitList += S
					return
/*			if (Result2 == "Create Rare Creature")
				if (M.SandKing == 1)
					if(M.Hunger >= 75)
						var/list/menus = new()
						menus += "Vampire"
						menus += "Spider Queen"
						menus += "Svartalfar"
						menus += "Skeleton"
						menus += "Naga"
						menus += "Cancel"
						var/Results = input("Do What?", "Choose", null) in menus
						if (Results != "Cancel")
							..()
						if (Results == "Vampire")
							if (M.Hunger >= 90)
								var/mob/Monsters/Vampire/S = new
								S.loc = M.loc
								S.Owner = M.Owner
								S.Birth()
								S.name = "{[usr.key]} Vampire"
								S.PillarPowerup()
								M.Hunger -= 90
								var/mob/m = M.Owner
								m.UnitList += S
								return
						if (Results == "Naga")
							if (M.Hunger >= 90)
								var/mob/Monsters/Naga/S = new
								S.loc = M.loc
								S.Owner = M.Owner
								S.Birth()
								S.name = "{[usr.key]} Naga"
								S.PillarPowerup()
								M.Hunger -= 90
								var/mob/m = M.Owner
								m.UnitList += S
								return
						if (Results == "Spider Queen")
							if (M.Hunger >= 75)
								var/mob/Monsters/SpiderQueen/S = new
								S.loc = M.loc
								S.Owner = M.Owner
								S.CanBeSlaved = 0
								S.Birth()
								S.name = "{[usr.key]} Spider Queen"
								S.PillarPowerup()
								M.Hunger -= 75
								var/mob/m = M.Owner
								m.UnitList += S
								return
						if (Results == "Svartalfar")
							if (M.Hunger >= 50)
								var/mob/Monsters/Svartalfar/S = new
								S.loc = M.loc
								S.Owner = M.Owner
								S.CanBeSlaved = 0
								S.Birth()
								S.name = "{[usr.key]} Svartalfar"
								S.PillarPowerup()
								M.Hunger -= 50
								var/mob/m = M.Owner
								m.UnitList += S
								return
						if (Results == "Skeleton")
							if (M.Hunger >= 25)
								var/mob/Monsters/Skeleton/S = new
								S.loc = M.loc
								S.Owner = M.Owner
								S.CanBeSlaved = 0
								S.Birth()
								S.name = "{[usr.key]} Skeleton"
								S.PillarPowerup()
								M.Hunger -= 25
								var/mob/m = M.Owner
								m.UnitList += S
								return*/
/*			if (Result2 == "Generate Warrior")
				if(M.Hunger >= 50)
					var/mob/Monsters/SandWarrior/S = new
					S.loc = M.loc
					S.SandWorker = 1
					S.Owner = M.Owner
					S.name = "{[usr]} Sand Soldier"
					S.Birth()
					S.PillarPowerup()
					M.Hunger -= 25
					var/mob/m = M.Owner
					m.UnitList += S
					view() << "[M] spews out a Sand Soldier and becomes hungrier!"
					return
			if (Result2 == "Spawn Mind Worm")
				for(var/mob/Monsters/K in usr.UnitList)
					if(K.Race == "Mind Worm")
						usr << "You can only have one mind worm at a time."
						return
				var/mob/Monsters/MindWorm/S = new
				S.loc = M.loc
				S.Owner = M.Owner
				S.name = "{[usr]} Mind Worm"
				S.Birth()
				var/mob/m = M.Owner
				m.UnitList += S
				view(M) << "A mind worm slowly crawls out of the pool of cerebral fluid bubbling inside of [M]"
				return*/
	/*	if("Generate Humanoid")
			if(M.Hunger >= 50)
				var/mob/Monsters/SandKing/Sand_Humanoid/S = new
				S.loc = M.loc
				S.Owner = M.Owner
				S.name = "{[usr]} Sand Humanoid"
				S.GiveBirth()
				S.PillarPowerup()
				M.Hunger -= 50
				var/mob/m = M.Owner
				m.UnitList += S
				view() << "[M] spews out a Sand Humanoid and becomes hungrier!"
				return
		if("Generate Human")
			if(M.Hunger >= 75)
				var/mob/Monsters/Human/S = new
				S.loc = M.loc
				S.Owner = M.Owner
				S.name = "{[usr]} Human"
				S.GiveBirth()
				S.PillarPowerup()
				M.Hunger -= 75
				var/mob/m = M.Owner
				m.UnitList += S
				view() << "[M] spews out a Human and becomes hungrier!"
				return*/
		if("Give Creature To")
			var/CAN=1
			switch(M.Race) if("Spider","Svartalfar","SandKing","Devourer","Dragon","Illithid") CAN=0
			if(M.Wagon || M.Infects || M.IsRoyal || M.CantBeGiven) CAN=0
			if(!CAN) usr<<"This unit cannot be given away."
			if(CAN)
				var/T = input("Set Who as Owner?")as null|text
				if(T) for(var/Player/S in world) if(S.client) if(T == S.name)
					if(usr.ckey in S.IgnoreList)
						usr << "[S] is ignoring you."
						return
					else
						var/choice = alert(S, "[M.Owner] is asking to give [M] to you", "Choose", "Yes", "No", null)
						if(choice == "Yes")
							if(M in usr.UnitList)
								M.ChangeOwnership(S)
								S << "[usr] makes [S] the owner of [M]"
								if(S != usr) usr << "[usr] makes [S] the owner of [M]"
								M.name = "{[M.Owner]} [M.Race]"
							else
								usr << "You don't own this unit!"
						else
							usr << "[S] has refused."
		if("Pull Out Arrow")
			for(var/obj/Items/Arrows/A in M)
				if(A.suffix == "(Stuck In)")
					A.loc = M.loc
					M.weight -= A.weight
					A.suffix = null
					M.Owner << "[M] pulls out [A]"
					M.BloodContent -= rand(5,15)
					M.BloodLoss()
					break
					return
		if("Suicide")
			switch(alert("Kill: [M]","Suicide this Unit?","Yes","No"))
				if("Yes") if(!M.PreviousOwner)
					M.GoingToDie = 1
					M.DeathType = "Suicide"
					M.Killer = M
					M.Death()
					M.Owner << "[M] has commited SUICIDE!"
		if("Firebolt") if(!M.Flying)
			for(var/mob/Monsters/X in oview(5,M))
				if(M.MagicTarget == X)
					if(M.PracticeSkill == 0)
						var/fireprob = prob(M.GargRuby / 15)
						view() << "[M] tosses a firebolt at [X]!!"
						X.BloodContent -= 15
						X.BloodLoss()
						if(fireprob)
							X.Fire()
						M.PracticeSkill = 1
						spawn(100)
						M.PracticeSkill = 0
						return
					else
						view() << "[M] attempts to toss some sort of flaming projectile but is unable to as they have just recently tossed something else."
						return
		if("Fireball") if(!M.Flying)
			for(var/mob/Monsters/X in oview(5,M))
				if(M.MagicTarget == X)
					if(M.PracticeSkill == 0)
						var/fireprob = prob(M.GargRuby / 15)
						view() << "[M] throws a fireball at [X]!!"
						X.BloodContent -= 35
						X.BloodLoss()
						if(fireprob)
							X.Fire()
						M.PracticeSkill = 1
						spawn(100)
						M.PracticeSkill = 0
						return
					else
						view() << "[M] attempts to toss some sort of flaming projectile but is unable to as they have just recently tossed something else."
						return
		if("Fiery Death") if(!M.Flying)
			for(var/mob/Monsters/X in oview(5,M))
				if(M.MagicTarget == X)
					if(M.PracticeSkill == 0)
						view(M) << "[M] sends forth the flames of hell to strike [X]!!"
						if(X.Race!="Demon"&&X.SubRace!="HalfDemon")
							X.BloodContent -= 100
							X.BloodLoss()
							X.Fire()
						M.PracticeSkill = 1
						spawn(100) M.PracticeSkill = 0
					else
						view() << "[M] attempts to throw some sort of flaming projectile but is unable to as they have just recently tossed something else."
						return
		if("Poison Bolt") if(!M.Flying)
			for(var/mob/Monsters/X in oview(5,M))
				if(M.MagicTarget == X)
					if(M.PracticeSkill == 0)
						view() << "[M] tosses a green, glowing ball of poison at [X]!!"
						X.BloodContent -= 25
						X.BloodLoss()
						M.PracticeSkill = 1
						spawn(100)
						M.PracticeSkill = 0
						return
					else
						view() << "[M] attempts to toss some sort of green projectile but is unable to as they have just recently tossed something else."
						return
		if("Create Tree") if(!M.Flying)
			view() << "[M] begins to glow green and uses the powers of nature to promote the growth of forest!!"
			new/turf/grounds/Trees/Tree1(M.loc)
		if("Grant Life") if(!M.Flying)
			for(var/mob/Monsters/X in oview(5,M))
				if(M.MagicTarget == X)
					if(M.PracticeSkill == 0)
						view() << "[M] makes a deep rumbling sound and waves its arms, glowing bright green with the powers of nature, and then points at [X] as a green light flies from their outstreched finger... [X] begins to look younger...."
						if(X.Age >= 10)
							X.Age -= 10
						else
							X.Age = 1
						M.PracticeSkill = 1
						spawn(2000)
						M.PracticeSkill = 0
					else
						view() << "[M] attempts to toss some sort of green projectile but is unable to as they have just recently tossed something else."
		//if("Lay Eggs") M.DragonLayEgg()
		//if("Dragon Breath") M.DragonBreath(M.MagicTarget)
		if("Fly Up")
			view(M) << "[M] flies up into the sky!"
			M.loc = locate(M.x,M.y,3)
		if("Fly Down")
			view(M) << "[M] flies down to the ground!"
			M.loc = locate(M.x,M.y,1)
		if("Run") M.Running()
		//if("Lay Egg") M.SpiderChooseEgg()
		if("Dig On/Off")
			if(!M.Dig)
				M.Dig = 1
				M.Dig()
				usr << "[M]'s Auto Dig is On!"
				return
			else
				M.Dig = 0
				M.destination = null
				M.DigTarget = null
				usr << "[M]'s Auto Dig is off!"
				for(var/obj/DigAt/DD in world) if(DD.Owner == M) del(DD)
		if("Morph") M.VampireMorph()
		if("Turn Into Mist") M.VampireMistForm()
		if("Become Daywalker")
			M.DayWalker = 1
			view(M) << "[M] harnesses their power and transforms into a creature out of nightmares, a creature not bound to the darkness!"
		if("Fly") M.Fly()
		if("Retract Wings") if(!M.Flying) if(M.Race == "Demon" || M.Race == "Gargoyle" || M.Race == "Vampire" || M.Race == "Angel of Death")
			if(M.WingsOut) M.WingsOut = 0
			else M.WingsOut = 1
			M.RebuildOverlays()
			return
		if("Rest")
			if(!M.IsMist)
				if(!M.Flying) M.Sleep(300-Level)
				else M.Owner << "[M] can't sleep while flying"
			else M.Owner<<"[M] cannot rest while in the form of mist!"
mob/verb/closestcreature()	for(var/mob/Monsters/M in usr.Selected)
	set hidden = 1
	for(var/mob/Monsters/C in oview(1,M))
		if(M)
			var/list/menu = new()
			if(M.Race == "Vampire")
				if(M.density)
					menu += "Feed From [C]"
			menu += "Rescue [C]"
			if(M.Race != "Vampire")
				menu += "Breed With [C]"
			if(M.Werepowers == 1)
				menu += "Bite [C]"
			menu += "Cancel"
			var/Result = input("Interact With What Object", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Feed From [C]")
				M.VampireBite(C)
			if (Result == "Bite [C]")
				var/Bite = null
				var/CheckStr = M.Strength - C.Strength
				Bite = prob(CheckStr)
				if(Bite == null)
					Bite = 0
				if(M in view(1,C))
					if(Bite)
						if(M.density == 1)
							if(M.CoolDown == 0)
								if(M.HasTeeth == 1)
									if(C.Race != "Vampire" && C.SubRace != "Werewolf" && C.Race != "Gargoyle" && C.Race != "Svartalfar" && C.Race != "Demon" && C.Race != "Skeleton" && C.Race != "Dragon")
										if(C.Wagon == 0)
											if(C.Race != "TowerCap")
												if(M.IsMist == 0)
													var/WereInfect = prob(50)
													if(C.SubRace)
														WereInfect = 0
													if(WereInfect && C.isturning == 0)
														var/WerewolfYes = prob(65)
														view() << "<b><font color=red>[C] is infected by a werewolf!"
														view() << "<b><font color=red>[M] slashes at [C] and sinks its teeth into them!"
														C.BloodContent -= 15
														C.BloodLoss()
														M.GainEXP(25)
														M.CoolDown = 1
														spawn(500)
														if(WerewolfYes)
															switch(C.Race)
																if("Human","Dwarf","Lizardman","Goblin","Orc","Kobold")
																	C.SubRace = "Werewolf"
																	C.WerewolfTransformation()
																	C.Carn = 1
																	C.Delay -= 1
																	C.Regen()
																	view() << "[C] has succumbed to the terrible lycanthropy and falls under the control of [M]"
																	var/Resist = prob(90)
																	if(Resist&&!C.IsRoyal)
																		C.Deselect()
																		C.ChangeOwnership(usr)
																		view(C) << "[C] is completely dominated by the lycanthropy and becomes a slave to [M]."
																	else
																		view(C) << "[C] resists the controlling impulse of the disease and remains in control of their body and mind!"
																	M.CoolDown = 0
																else
																	view() << "[C] has succumbed to the terrible lycanthropy, but it is not compatible with their body, they begin to waste away as blood pours from their eyes and body."
																	C.BloodContent -= 250
																	C.BloodLoss()
																	M.CoolDown = 0
														else
															view() << "[C] has recovered from the vile infection passed to it by the werewolf"
															M.CoolDown = 0
														return
													else
														view() << "<b><font color=red>[M] slashes at [C] and sinks its teeth into them!"
														C.BloodContent -= 15
														C.BloodLoss()
														M.GainEXP(25)
														C.Death()
														M.CoolDown = 1
														spawn(300)
															if(M)
																M.CoolDown = 0
														return
									else
										M.Owner << "You can't bite one of those creatures!"
					else
						view() << "<b><font color=red> [M] tries to grab hold of [C] and bite them, but [C] escapes!"
						M.CoolDown = 1
						spawn(300)
						M.CoolDown = 0
						return

			if(Result == "Breed With [C]")
				M.BreedWith(C)
			if (Result == "Rescue [C]")
				if(C.InHole == 1)
					if(M in view(1,C))
						view() << "<b><font color=red>[M] Rescues [C] from a trap"
						C.InHole = 0
						C.SneakingSkill +=1
						C.HasPersonIn = 0
						for(var/obj/Items/Traps/PitTrap/P in view(0,C))
							del(P)

mob/verb/magicalskills() for(var/mob/Monsters/M in usr.Selected)
	set hidden = 1
	if(M.MagicalAptitude)
		var/list/menu = new()
		if(M.MagicalAptitude == 1 && usr.DieAge >= usr.Age)
			if(M.Meditating == 0) menu += "Meditate"
			if(M.Meditating == 1) menu += "Stop Meditating"
		if(M.MagicalConcentration >= 20 && usr.DieAge >= usr.Age)
			menu += "Nether Travel"
			menu += "Nether Return"
		if(M.MagicalWill >= 20 && usr.DieAge >= usr.Age)
			menu += "Willful Alteration"
		if(M.MagicalAnger >= 20 && usr.DieAge >= usr.Age)
			if(M.MagicalWill >= 25) menu += "Destructive Alteration"
		if(M.MagicalMind >= 20 && usr.DieAge >= usr.Age)
			menu += "Insanity"
			if(M.MagicalAnger >= 20)
				menu += "Damage Mind"
				if(M.MagicalConcentration >= 25)
					menu += "Steal Thoughts"
			if(M.MagicalWill >= 25)
				menu += "Teleportation"
		menu += "Cancel"
		var/Result = input("Do What?", "Choose", null) in menu
		if (Result != "Cancel")
			..()
		if (Result == "Nether Travel")
			if(M.Mana >= 10 - M.MagicalConcentration / 10)
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M], you cannot nether return!"
					return
				view(M) << "[M] twists in and out of view and turns into some kind of dark shadowy substance before dissappearing."
				M.loc = locate(M.x,M.y,4)
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M]'s destination, you cannot nether travel!"
					M.loc = locate(M.x,M.y,1)
					return
				M.Mana -= 10 - M.MagicalConcentration / 10
			else
				M.Owner << "You need [10 - M.Mana] more mana."
		if (Result == "Teleportation")
			M.Owner << "Teleportation is disabled untill further notice."
			/*if(M.Mana >= 80 - M.MagicalWill / 10)
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,usr))
					usr << "There is a magic blocking portal stone near your destination, you cannot teleport!"
					return
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M], you cannot teleport!"
					return
				var/X = M.icon
				M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
				M.icon = 'Blood.dmi'
				flick("AstralBurst",M)
				view(M) << "A glowing blue portal snaps into existance and [M] steps through it!"
				M.Mana -= 80 - M.MagicalWill / 10
				for(var/turf/T in view(0,M))
					if(T.density == 1 && T.icon_state != "water" && T.icon_state != "Lava")
						M.icon = 'Blood.dmi'
						flick("AstralBurst",M)
						view(M) << "....and is torn to pieces by the dense object they stepped into!"
						spawn(10)
							M.icon = 'Blood.dmi'
							flick("HolyBurst",M)
						spawn(20)
							del(M)
				spawn(10)
					M.icon = X
			else
				M.Owner << "You need [80 - M.Mana] more mana."*/
		if (Result == "Nether Return")
			if(M.Mana >= 10 - M.MagicalConcentration / 10)
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M], you cannot nether return!"
					return
				M.loc = locate(M.x,M.y,1)
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M]'s destination, you cannot nether return!"
					M.loc = locate(M.x,M.y,4)
					return
				M.Mana -= 10 - M.MagicalConcentration / 10
				view(M) << "A dark shadow begins to creep forth from the earth and forms into the shape of [M]"
			else
				M.Owner << "You need [10 - M.Mana] more mana."
		if (Result == "Damage Mind")
			for(var/mob/Monsters/MM in oview(5,M))
				if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM)
					if(M.Mana >= M.MagicalMind / 2)
						view(M) << "[M] uses their force of *Thought* to re-write the mind of [MM], causing them to lose some of the knowledge they once possessed."
						MM.EXP = 0
						MM.SwordSkill -= M.MagicalMind / 15
						MM.AxeSkill -= M.MagicalMind / 15
						MM.MaceSkill -= M.MagicalMind / 15
						MM.MetalCraftingSkill -= M.MagicalMind / 15
						MM.LeatherCraftingSkill -= M.MagicalMind / 15
						MM.MagicalConcentration -= M.MagicalMind / 15
						MM.MagicalAnger -= M.MagicalMind / 15
						MM.MagicalWill -= M.MagicalMind / 15
						MM.UnArmedSkill -= M.MagicalMind / 15
						M.Mana -= M.MagicalMind / 2
					else
						M.Owner << "You need [M.MagicalMind / 2 - M.Mana] more mana."
		if (Result == "Steal Thoughts")
			for(var/mob/Monsters/MM in oview(5,M))
				if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM)
					if(M.Mana >= M.MagicalMind * 2)
						view(M) << "[M] uses their force of *Mind* to absorb some of the knowledge [MM] once held, making it their own...."
						M.GainEXP(MM.EXP)
						MM.EXP = 0
						MM.SwordSkill -= M.MagicalMind / 15
						MM.AxeSkill -= M.MagicalMind / 15
						MM.MaceSkill -= M.MagicalMind / 15
						MM.MetalCraftingSkill -= M.MagicalMind / 15
						MM.LeatherCraftingSkill -= M.MagicalMind / 15
						MM.MagicalConcentration -= M.MagicalMind / 15
						MM.MagicalAnger -= M.MagicalMind / 15
						MM.MagicalWill -= M.MagicalMind / 15
						MM.UnArmedSkill -= M.MagicalMind / 15
						M.SwordSkill += M.MagicalMind / 15
						M.AxeSkill += M.MagicalMind / 15
						M.MaceSkill += M.MagicalMind / 15
						M.MetalCraftingSkill += M.MagicalMind / 15
						M.LeatherCraftingSkill += M.MagicalMind / 15
						M.UnArmedSkill += M.MagicalMind / 15
						M.Mana -= M.MagicalMind * 2
					else
						M.Owner << "You need [M.MagicalMind * 2 - M.Mana] more mana."
		if (Result == "Insanity")
			for(var/mob/Monsters/MM in oview(5,M))
				if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM)
					if(M.Mana >= 25)
						view(M) << "[M] uses their force of *Thought* to scramble the mind of [MM] causing them to go in to temporary insanity."
						for(var/mob/Monsters/GGL in oview(6,MM))
							if(GGL != M)
								view(MM) << "[MM] starts chasing after random creatures!!!"
								MM.destination = GGL
								spawn(25)
									MM.destination = GGL
								spawn(50)
									MM.destination = GGL
								spawn(75)
									MM.destination = GGL
								break
						spawn(100)
						for(var/obj/Items/LLK in oview(6,MM))
							view(MM) << "[MM] starts chasing after random objects!!!"
							MM.destination = LLK
							spawn(200)
								MM.destination = LLK
							break
						spawn(300)
							view(MM) << "[MM]'s temporary insanity seems to have worn off."
							M.Mana -= 25
							return
					else
						M.Owner << "You need [25 - M.Mana] more mana."
		if (Result == "Nether Alteration")
			if(M.Mana >= 30)
				var/list/menu3 = new()
				menu += "Grass"
				menu += "Snow"
				menu += "Desert"
				menu += "Hell"
				menu += "Mountains"
				menu += "Nether"
				menu += "Cancel"
				var/Result2 = input("Do What?", "Choose", null) in menu3
				if (Result2 == "Cancel") return
				if(M in range(10,usr))
					if(Result2 == "Grass")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(2,usr))
								if(Y.icon == 'Stairs.dmi')
									usr << "Move away from the stairs."
									return
								else
									Y.name = "grass"
									Y.icon = 'Cave.dmi'
									Y.icon_state = "Grass"
									Y.Sky = 1
									Y.Content3 = "CanClimb"
									Y.OIcon = "Grass"
									Y.density = 0
									Y.CanDigAt = 0
									Y.opacity = 0
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result2 == "Nether")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(2,usr))
								if(Y.icon == 'Stairs.dmi')
									usr << "Move away from the stairs."
									return
								else
									Y.name = "nether"
									Y.icon = 'Cave.dmi'
									Y.icon_state = "NetherFloor"
									Y.Sky = 1
									Y.Content3 = "CanClimb"
									Y.OIcon = "NetherFloor"
									Y.density = 0
									Y.CanDigAt = 0
									Y.opacity = 0
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result2 == "Snow")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(2,usr))
								if(Y.icon == 'Stairs.dmi')
									usr << "Move away from the stairs."
									return
								else
									Y.name = "snow"
									Y.icon = 'Cave.dmi'
									Y.icon_state = "Snow"
									Y.Sky = 1
									Y.Content3 = "CanClimb"
									Y.OIcon = "Snow"
									Y.density = 0
									Y.CanDigAt = 0
									Y.opacity = 0
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result2 == "Desert")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(2,usr))
								if(Y.icon == 'Stairs.dmi')
									usr << "Move away from the stairs."
									return
								else
									Y.name = "sand"
									Y.icon = 'Cave.dmi'
									Y.icon_state = "Desert"
									Y.Sky = 1
									Y.Content3 = "CanClimb"
									Y.OIcon = "Desert"
									Y.density = 0
									Y.CanDigAt = 0
									Y.opacity = 0
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result2 == "Hell")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(2,usr))
								if(Y.icon == 'Stairs.dmi')
									usr << "Move away from the stairs."
									return
								else
									Y.name = "hellfloor"
									Y.icon = 'Cave.dmi'
									Y.icon_state = "HellFloor"
									Y.Sky = 1
									Y.Cant = 1
									Y.Content3 = "CanClimb"
									Y.OIcon = "HellFloor"
									Y.density = 0
									Y.CanDigAt = 0
									Y.opacity = 0
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result2 == "Mountains")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(2,usr))
								if(Y.icon == 'Stairs.dmi')
									usr << "Move away from the stairs."
									return
								else
									Y.name = "Mountain"
									Y.icon = 'Cave.dmi'
									Y.icon_state = "CaveWall"
									Y.Sky = 1
									Y.Content3 = "CanClimb"
									Y.OIcon = "CaveFloor"
									Y.density = 1
									Y.CanDigAt = 1
									Y.opacity = 1
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
				else usr<<"You can only cast this spell within 10 tiles of your unit."
			else
				M.Owner << "You need [30 - M.Mana] more mana."
		if (Result == "Willful Alteration")
			if(M.Mana >= 50)
				var/list/menu2 = new()
				menu2 += "Grass"
				menu2 += "Snow"
				menu2 += "Desert"
				menu2 += "Hell"
				menu2 += "Mountains"
				menu2 += "Cancel"
				var/Result2 = input("Do What?", "Choose", null) in menu2
				if (Result2 != "Cancel")
					..()
				if(Result2 == "Grass")
					view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
					for(var/turf/grounds/Y in view(4,M))
						if(Y.icon == 'Stairs.dmi')
							usr << "Move away from the stairs."
							return
						else
							Y.name = "grass"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "Grass"
							Y.Sky = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "Grass"
							Y.density = 0
							Y.CanDigAt = 0
							Y.opacity = 0
					M.DieAge -= 0.25
				if(Result2 == "Snow")
					view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
					for(var/turf/grounds/Y in view(4,M))
						if(Y.icon == 'Stairs.dmi')
							usr << "Move away from the stairs."
							return
						else
							Y.name = "snow"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "Snow"
							Y.Sky = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "Snow"
							Y.density = 0
							Y.CanDigAt = 0
							Y.opacity = 0
					M.DieAge -= 0.25
				if(Result2 == "Desert")
					view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
					for(var/turf/grounds/Y in view(4,M))
						if(Y.icon == 'Stairs.dmi')
							usr << "Move away from the stairs."
							return
						else
							Y.name = "sand"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "Desert"
							Y.Sky = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "Desert"
							Y.density = 0
							Y.CanDigAt = 0
							Y.opacity = 0
					M.DieAge -= 0.25
				if(Result2 == "Hell")
					view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
					for(var/turf/grounds/Y in view(4,M))
						if(Y.icon == 'Stairs.dmi')
							usr << "Move away from the stairs."
							return
						else
							Y.name = "hellfloor"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "HellFloor"
							Y.Sky = 1
							Y.Cant = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "HellFloor"
							Y.density = 0
							Y.CanDigAt = 0
							Y.opacity = 0
				if(Result2 == "Mountains")
					view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
					for(var/turf/grounds/Y in view(4,M))
						if(Y.icon == 'Stairs.dmi')
							usr << "Move away from the stairs."
							return
						else
							Y.name = "Mountain"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "CaveWall"
							Y.Sky = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "CaveFloor"
							Y.density = 1
							Y.CanDigAt = 1
							Y.opacity = 1
				M.Mana -= 50
			else
				M.Owner << "You need [50 - M.Mana] more mana."
		if (Result == "Destructive Alteration")
			for(var/mob/Monsters/MK in range(2,usr))
				if(MK.Owner != usr)
					usr << "You can't cast this directly on a unit."
					return
			if(M.Mana >= 100)
				var/list/menu2 = new()
				menu2 += "Lava"
				menu2 += "Water"
				menu2 += "Cancel"
				var/Result2 = input("Do What?", "Choose", null) in menu2
				if(Result2 == "Cancel") return
				if(M in range(usr,10))
					if(Result2 == "Lava")
						for(var/mob/Monsters/MK in range(2,usr))
							if(MK.Owner != usr)
								usr << "You can't cast this directly on a unit."
								return
						view() << "[M] uses their furious force of will to alter the terrain in a very dangerous manner..."
						for(var/turf/grounds/Y in view(2,usr))
							if(Y.icon == 'Stairs.dmi')
								usr << "Move away from the stairs."
								return
							else
								Y.name = "Lava"
								Y.icon = 'Lava.dmi'
								Y.icon_state = "Lava"
								Y.Sky = 1
								Y.Content3 = "Lava"
								Y.OIcon = "Lava"
								Y.density = 1
								Y.CanDigAt = 0
								Y.opacity = 0
					if(Result2 == "Water")
						for(var/mob/Monsters/MK in range(2,usr))
							if(MK.Owner != usr)
								usr << "You can't cast this directly on a unit."
								return
						view() << "[M] uses their furious force of will to alter the terrain in a very dangerous manner..."
						for(var/turf/grounds/Y in view(2,usr))
							if(Y.icon == 'Stairs.dmi')
								usr << "Move away from the stairs."
								return
							else
								Y.name = "Water"
								Y.icon = 'water.dmi'
								Y.icon_state = "water"
								Y.Sky = 1
								Y.Content3 = "Liquid"
								Y.OIcon = "water"
								Y.density = 1
								Y.CanDigAt = 0
								Y.opacity = 0
					if(Result2 != "Cancel") M.Mana -= 100
				else usr<<"You can only cast this spell within 10 tiles of your unit."
			else
				M.Owner << "You need [100 - M.Mana] more mana."
		if(Result == "Meditate" || Result == "Stop Meditating") M.Meditation()
/*
	if (Result == "This Creature")

	if (Result == "Closest Creature")
		for(var/mob/Monsters/C in oview(1,M))
			if(M)
				var/list/menu2 = new()
				if(M.Race == "Vampire")
					if(M.density)
						menu2 += "Feed From [C]"
				menu2 += "Rescue [C]"
				if(M.Race != "Vampire") menu2 += "Breed With [C]"
				if(M.Werepowers == 1)
					menu2 += "Bite [C]"
				menu2 += "Cancel"
				var/Result2 = input("Interact With What Object", "Choose", null) in menu2
				if (Result2 != "Cancel")
					..()
				if (Result2 == "Feed From [C]") M.VampireBite(C)
				if (Result2 == "Bite [C]")
					var/Bite = null
					var/CheckStr = M.Strength - C.Strength
					Bite = prob(CheckStr)
					if(Bite == null) Bite = 0
					if(M in view(1,C))
						if(Bite)
							if(M.density == 1)
								if(M.CoolDown == 0)
									if(M.HasTeeth == 1)
										if(C.Race != "Vampire" && C.SubRace != "Werewolf" && C.Race != "Gargoyle" && C.Race != "Svartalfar" && C.Race != "Demon" && C.Race != "Skeleton" && C.Race != "Dragon")
											if(C.Wagon == 0)
												if(C.Race != "TowerCap")
													if(M.IsMist == 0)
														var/WereInfect = prob(50)
														if(C.SubRace) WereInfect = 0
														if(WereInfect && C.isturning == 0)
															var/WerewolfYes = prob(65)
															view() << "<b><font color=red>[C] is infected by a werewolf!"
															view() << "<b><font color=red>[M] slashes at [C] and sinks its teeth into them!"
															C.BloodContent -= 15
															C.BloodLoss()
															M.GainEXP(25)
															M.CoolDown = 1
															spawn(500)
															if(WerewolfYes) switch(C.Race)
																if("Human","Dwarf","Lizardman","Goblin","Orc","Kobold")
																	C.SubRace = "Werewolf"
																	C.WerewolfTransformation()
																	C.Carn = 1
																	C.Delay -= 1
																	C.Regen()
																	view() << "[C] has succumbed to the terrible lycanthropy and falls under the control of [M]"
																	var/Resist = prob(90)
																	if(Resist&&!C.IsRoyal)
																		C.Deselect()
																		C.ChangeOwnership(usr)
																		view(C) << "[C] is completely dominated by the lycanthropy and becomes a slave to [M]."
																	else
																		view(C) << "[C] resists the controlling impulse of the disease and remains in control of their body and mind!"
																	M.CoolDown = 0
																else
																	view() << "[C] has succumbed to the terrible lycanthropy, but it is not compatible with their body, they begin to waste away as blood pours from their eyes and body."
																	C.BloodContent -= 250
																	C.BloodLoss()
																	M.CoolDown = 0
															else
																view() << "[C] has recovered from the vile infection passed to it by the werewolf"
																M.CoolDown = 0
															return
														else
															view() << "<b><font color=red>[M] slashes at [C] and sinks its teeth into them!"
															C.BloodContent -= 15
															C.BloodLoss()
															M.GainEXP(25)
															C.Death()
															M.CoolDown = 1
															spawn(300)
																if(M)
																	M.CoolDown = 0
															return
										else
											M.Owner << "You can't bite one of those creatures!"
						else
							view() << "<b><font color=red> [M] tries to grab hold of [C] and bite them, but [C] escapes!"
							M.CoolDown = 1
							spawn(300)
							M.CoolDown = 0
							return

				if(Result2 == "Breed With [C]") M.BreedWith(C)
				if (Result2 == "Rescue [C]")
					if(C.InHole == 1)
						if(M in view(1,C))
							view() << "<b><font color=red>[M] Rescues [C] from a trap"
							C.InHole = 0
							C.SneakingSkill +=1
							C.HasPersonIn = 0
							for(var/obj/Items/Traps/PitTrap/P in view(0,C))
								del(P)*/