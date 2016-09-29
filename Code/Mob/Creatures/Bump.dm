mob/var/saveddestination
mob/Monsters/Bump(atom/m)
	var/mob/M = src.Owner
	if(m!=destination)
		for(var/atom/DESTINATION in range(0,m))
			if(DESTINATION==destination)
				if(DESTINATION.density)
					return(Bump(DESTINATION))
	if(src.Flying)
		if(m.density)
			if(m.icon_state == "Lava")
				src.loc = m
			if(m.CaveWater)
				src.loc = m
			if(m.icon == 'Swamp.dmi')
				src.loc = m
			if(m.icon_state == "water")
				src.loc = m
	if(m==src.destination && m.density && density && m.Owner!=Owner)
		if(m.TP)
			if(src.saveddestination != null)
				saveddestination=src.destination
			else
				saveddestination=null
			if(ismob(Owner)) if(!Owner:client) destination = null
			flick('TrainingFlick.dmi',m)
			GainEXP(m.Content3)
			Hunger -= 0.2
			DamageType(0.5)
			return
		if(m.Tree == 1)
			if(src.saveddestination != null)
				saveddestination=src.destination
			else
				saveddestination=null
			src.Chop_Tree(m)
			return
		if(!isturf(m))
			Combats(m)
			return
		if(!src.Flying)
			if(m.icon_state == "Lava")
				if(m.density)
					if(src.IsWood && src.Race != "Gargoyle")
						src.Owner << "[src] is Burning To Death!"
						src.Fire()
					if(src.Race == "Gargoyle")
						flick("Dig",m)
						var/find
						find = prob(src.FishingSkill/10)
						if(find == 1)
							var/obj/Items/ores/stone/B = new
							B.loc = src.loc
							if(src.FishingSkill < 120) src.FishingSkill += 0.3
							return
			if(m.CaveWater)
				if(src.saveddestination != null)
					saveddestination=src.destination
				else
					saveddestination=null
				flick("Dig",m)
				var/find
				find = prob(src.FishingSkill/10)
				if(find == 1)
					M.ufish+=1
					M.bone+=1
					if(src.FishingSkill < 120) src.FishingSkill += 0.3
					return
					//var/mob/Body/B = new
					//B.loc = src.loc
					//B.icon = 'cave.dmi'
					//B.icon_state = "CaveFish"
					//B.Race = "Fish"
					//B.name = "CaveFish"
					//B.FishDecay()
					//B.Race = "Fish"
					//B.weight = 5
					//if(src.FishingSkill < 120) src.FishingSkill += 0.3
					//return
			if(m.icon == 'Swamp.dmi')
				if(src.saveddestination != null)
					saveddestination=src.destination
				else
					saveddestination=null
				flick("Dig",m)
				var/find
				find = prob(src.FishingSkill/10)
				if(find == 1)
					var/TFish = prob(50)
					if(TFish == 1)
						M.ufish+=1
						M.bone+=1
						if(src.FishingSkill < 120) src.FishingSkill += 0.3
						return
						//var/mob/Body/B = new
						//B.loc = src.loc
						//B.icon = 'cave.dmi'
						//B.icon_state = "TFish"
						//B.name = "TropicalFish"
						//B.FishDecay()
						//B.Race = "Fish"
						//B.weight = 5
						//if(src.FishingSkill < 120) src.FishingSkill += 0.3
						//return
					if(TFish == 0)
						M.ufish+=1
						M.bone+=1
						if(src.FishingSkill < 120) src.FishingSkill += 0.3
						return
						//var/mob/Body/B = new
						//B.loc = src.loc
						//B.icon = 'cave.dmi'
						//B.icon_state = "BlowFish"
						//B.name = "BlowFish"
						//B.FishDecay()
						//B.Race = "Fish"
						//B.weight = 5
						//if(src.FishingSkill < 120) src.FishingSkill += 0.3
						//return
			if(m.icon_state == "water")
				if(src.saveddestination != null)
					saveddestination=src.destination
				else
					saveddestination=null
				flick("Dig",m)
				var/find
				find = prob(src.FishingSkill/10)
				src.WaterPoints += 0.25
				if(find == 1)
					M.ufish+=1
					M.bone+=1
					if(src.FishingSkill < 120) src.FishingSkill += 0.3
					return
					//var/mob/Body/B = new
					//B.loc = src.loc
					//B.icon = 'cave.dmi'
					//B.icon_state = "Fish"
					//B.name = "Fish"
					//B.FishDecay()
					//B.Race = "Fish"
					//B.weight = 5
					//if(src.FishingSkill < 120) src.FishingSkill += 0.3
					//return

		if(m.CanDigAt == 1)
			if(src.UsesPicks == 0 || HoldingWeapon == "Pickaxe" || src.VampPick == 1 || src.Werepowers == 1)
				if(src.saveddestination != null)
					saveddestination=src.destination
				else
					saveddestination=null
				src.GainEXP(0.4)
			//	m.overlays += 'dig.dmi'
				m.HP -= src.MineingSkill / 4
				src.MineingSkill += 0.1
				if(m.icon_state == "Elf Wall")
					if(src.Race != "Elf")
						var/Harm = prob(2)
						if(HoldingWeapon != "Pickaxe") Harm = prob(6)
						if(Harm == 1)
							src.BloodContent -= rand(15,25)
							src.BloodLoss()
							src.RightArmHP -= 15
							src.LeftArmHP -= 15
				//flick("Dig",m)
				if(m.HP <= 0)
					for(var/obj/ArrowSlit/K in m)
						m.overlays -= K
						m.opacity = 1
						del K
					for(var/obj/Tapestry/K in m)
						m.overlays -= K
						del K
					for(var/obj/DigAt/DD in view(1,src))
						if(DD.Owner == src)
							if(DD == src.DigTarget)
								src.DigTarget = null
								del(DD)
					var/CI
					CI = prob(1)
					if(src.Race == "Spider" || src.Race == "Dwarf" || src.Race == "Kobold")
						CI = 0
					if(CI == 1)
						view() << "Cave In!"
						for(var/turf/grounds/cellarfloor/CF in view(3,src))
							if(CF.density == 0)
								CF.T = prob(50)
							for(var/obj/Items/Furniture/Pillars/P in range(4,CF))
								if(CF.T == 1)
									CF.T = 0
							if(CF.T == 1)
								CF.opacity = 1
								CF.density = 1
								CF.CanDigAt = 1
								CF.icon_state = "CaveWall"
								CF.HP = 200
								CF.T = 0
								CF.Cant = 1
								CF.text = "<font color=#999966>#"
								CF.Detailed = 0
						for(var/turf/grounds/cavefloor/CF in view(3,src))
							if(CF.density == 0)
								CF.T = prob(50)
							for(var/obj/Items/Furniture/Pillars/P in range(4,CF))
								if(CF.T == 1)
									CF.T = 0
							if(CF.T == 1)
								CF.opacity = 1
								CF.density = 1
								CF.CanDigAt = 1
								CF.icon_state = "CaveWall"
								CF.HP = 200
								CF.T = 0
								CF.Detailed = 0
								CF.text = "<font color=#999966>#"
								if(CF.z == 1)
									var/obj/Support/Q = new
									Q.loc = locate(CF.x,CF.y,3)
									for(var/turf/T in view(0,Q))
										if(T.Supported == 1)
											T.Supported = 0
											T.icon_state = "DFloor"
											T.name = "Floor"
											//T.overlays -= 'dig.dmi'
											T.density = 0
											T.Detailed = 0
											if(T.Content3 == "Peak")
												T.icon = 'Cave.dmi'
												T.icon_state = "Peak"
												T.name = "MountainPeak"
												m.text = "<font color=#999966>×"
											if(T.Content == "Sky")
												T.icon = 'Cave.dmi'
												T.icon_state = "Sky"
												T.name = "Sky"
												T.text = "<font color=#33FFFF>×"
									del(Q)
					randomore(m)
					m.opacity = 0
					m.density = 0
					m.CanDigAt = 0
					m.Detailed = 0
					m.icon = 'cave.dmi'
					m.icon_state = m.OIcon
					m.text = "<font color=#999966>×"
					m.IsWood = 0
					if(m.Content3 == "Peak")
						m.icon_state = "Peak"
					if(m.Content == "Sky")
						m.icon_state = "Sky"
					if(m.z == 1)
						var/obj/Support/Q = new
						Q.loc = locate(m.x,m.y,3)
						for(var/turf/T in view(0,Q))
							if(T.Supported == 1)
								T.Supported = 0
								T.opacity = 0
								T.density = 0
								T.CanDigAt = 0
								T.Detailed = 0
								if(T.Content3 == "Peak")
									T.icon_state = "Peak"
									m.text = "<font color=#999966>×"
								if(T.Content == "Sky")
									T.icon_state = "Sky"
									m.text = "<font color=#33FFFF>×"
						del(Q)
				return
		return
	if(m)
		if(m.Owner == src.Owner && src.destination == m.loc) return
		//else
			//if(m == src.destination)
				//src.destination=saveddestination
				//return


		//else step_rand(src)
mob/Monsters/proc/Chop_Tree(obj/Tree/T)
	for(var/mob/M in world)
		var/o = src.Owner
		if(M == o)
			if(src.UsesPicks == 0 || src.HoldingWeapon == "Axe" || src.Race == "Goblin" || src.Werepowers == 1 || src.VampPick == 1)
				T.HP -= src.WoodCuttingSkill / 4
				src.GainEXP(0.4)
				src.WoodCuttingSkill += 0.15
				if(T.HP <= 0)
					for(var/obj/DigAt/DD in view(0,T))
						if(DD.Owner == src)
							if(DD == src.DigTarget)
								src.DigTarget = null
								del(DD)
					var/seeds = rand(1,2)
					if(M.seed >=250)
						M.seed = 250
						usr << "Your seed stockpile is full."
					else
						M.seed += seeds
					var/logs = 3
					if(src.Race == "Lizardman" || src.Race == "Human" || src.Race == "Elf")
						logs = 4
					if(M.log >=250)
						M.log = 250
						M << "Your wood stockpile is full."
					else
						M.log += logs
					del T
				return