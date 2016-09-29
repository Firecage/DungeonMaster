/*obj/proc/CacoonTrap()
	var/OGB = 0
	for(var/mob/Monsters/X in range(4,src))
		if(X.Owner != src.Owner)
			if(!X.Critter)
				for(var/mob/KLL in Players2)
					if(KLL == src.Owner)
						for(var/mob/MK in Players2)
							if(X.Owner == MK)
								if(MK.name in KLL.AllyList || MK.Faction == KLL.Faction)
									OGB = 1
		if(OGB == 0 && X.Owner != src.Owner)
			var/mob/Monsters/Devourer/FleshCrawler/F1 = new(loc)
			var/mob/Monsters/Devourer/FleshCrawler/F2 = new(loc)
			F1.Owner = src.Owner
			F2.Owner = src.Owner
			F1.destination = X
			F2.destination = X
			F1.name = "{[F1.Owner]} Flesh Crawler"
			F2.name = "{[F2.Owner]} Flesh Crawler"
			view(src) << "[src] explodes open in a shower of gore releasing two small monstrosities!"
			src.Owner << "<b><font color=red><font size=3>[src] has detected an intruder at [src.x],[src.y],[src.z]!"
			del src
	spawn(5) src.CacoonTrap()*/
obj/proc/BSTTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(KLK == src.Owner)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner)
					..()
				else
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							if(M.density == 1)
								var/avoid = prob(M.SneakingSkill)
								if(avoid == 0)
									M.LeftLegHP -= 10
									M.RightLegHP -= 10
									M.BloodContent -= 15
									M.BloodLoss()
									M.SneakingSkill += 0.1
									var/Break = prob(3)
									if(Break == 1)
										del(src)
										return
									var/Stun = prob(10)
									if(Stun == 1)
										if(M.Race != "Gargoyle")
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
									else
										M.SneakingSkill += 0.1
	spawn(5)
		BSTTrap()
		return
obj/proc/RibTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(KLK == src.Owner)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner)
					..()
				else
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							if(M.density == 1)
								var/avoid = prob(M.SneakingSkill)
								if(avoid == 0)
									src.Hole = 0
									src.IsSpiked = 0
									view() << "<b><font color=red>[M] walks over a trap and their legs are crushed!"
									M.LeftLegHP -= 60
									M.RightLegHP -= 60
									M.BloodContent -= 50
									M.BloodLoss()
									M.SneakingSkill += 1.5
									var/Stun = prob(10)
									if(Stun == 1)
										if(M.Race != "Gargoyle")
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
									del(src)
								else
									M.SneakingSkill += 0.1
	spawn(5)
		RibTrap()
		return
obj/proc/StoneTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			for(var/mob/KLK in world)
				if(src.Owner == KLK)
					for(var/mob/MK in world)
						if(M.Owner == MK)
							if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
								OGB = 1
			if(M.Owner == src.Owner)
				..()
			else
				if(M.Wagon == 0)
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							var/avoid = prob(M.SneakingSkill)
							if(avoid == 0)
								if(!M.WearingHelmet)
									if(M.Race != "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head"
										M.HeadHP -= 80
										M.BloodContent -= 65
										M.BloodLoss()
										M.SneakingSkill += 1
										var/Stun = prob(70)
										if(Stun == 1)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
										del(src)
									if(M.Race == "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head and bounces off harmlessly, leaving a small scratch."
										M.HeadHP -= 10
										del(src)
								else
									if(M.Race != "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head, but some of the force is deflected by their helmet."
										M.HeadHP -= 50
										M.BloodContent -= 40
										M.BloodLoss()
										M.SneakingSkill += 1
										var/Stun = prob(50)
										if(Stun == 1)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
										del(src)
									if(M.Race == "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head and bounces off harmlessly, leaving a small scratch."
										M.HeadHP -= 10
										del(src)
							else
								M.SneakingSkill += 0.1
	spawn(5)
		StoneTrap()
		return
/obj/proc/PitTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(src.Owner == KLK)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner) ..()
				else
					if(M.Wagon == 0)
						if(src.HasPersonIn == 0)
							if(OGB == 0)
								if(M.density == 1)
									var/avoid = prob(M.SneakingSkill+40)
									if(src.IsSpiked == 0)
										if(avoid == 0)
											M.destination = null
											for(var/mob/A in world) if(A == M.Owner) M.Deselect()
											src.HasPersonIn = 1
											M.InHole = 1
											src.Hole = 0
											src.icon = 'Cave.dmi'
											src.icon_state = "Hole"
											view(src) << "<b><font color=red>[M] falls into a pit"
											src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
											M.Struggle()

									if(src.Poisoned == 1)
										if(avoid == 0)
											if(src.IsSpiked == 1)
												M.HP  -= src.PoisonContent
												M.LeftLegHP -= 80
												M.RightLegHP -= 80
												M.BloodContent -= 60
												M.BloodLoss()
												src.Hole = 0
												src.icon = 'Cave.dmi'
												src.icon_state = "Hole"
												src.IsSpiked = 0
												src.Poisoned = 0
												src.PoisonContent = 0
												view(src) << "<b><font color=red>[M] falls into a posionious spiked trap"
												src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
												var/Stun = prob(50)
												if(Stun == 1)
													if(M.Race != "Gargoyle")
														M.Stunned = 1
														view(src) << "<b><font color=red>[M] is stunned!<br>"
												else
													M.SneakingSkill += 0.1
											if(src.IsSpiked == 1)
												if(avoid == 0)
													M.LeftLegHP -= 70
													M.RightLegHP -= 70
													M.BloodContent -= 50
													M.BloodLoss()
													src.Hole = 0
													src.icon = 'Cave.dmi'
													src.icon_state = "Hole"
													src.IsSpiked = 0
													view(src) << "<b><font color=red>[M] falls into a spiked trap"
													src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
													if(prob(50))
														M.Stunned = 1
														view(src) << "<b><font color=red>[M] is stunned!<br>"
													else
														M.SneakingSkill += 0.1
	spawn(5)
		PitTrap()
		return