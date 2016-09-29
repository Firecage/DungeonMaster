obj/WorkShops/Smelters
	icon_state = "Smelter"
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Race == "Spider")
				return
			if(M.Wagon == 1)
				return
			var/list/menu = new()
			menu += "Smelt Ores and Sand"
			menu += "Alloy Gold and Silver"
			menu += "Destroy"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Destroy")
				if(M in range(1,src))
					DestroySmelterStation()
			if (Result == "Smelt Ores and Sand")
				if(usr.iron>=1)
					usr.riron+=usr.iron
					usr << "[M] just made [usr.iron] iron bars and now has [usr.riron] iron bars."
					usr.iron=0
				if(usr.silver>=1)
					usr.rsilver+=usr.silver
					usr << "[M] just made [usr.silver] silver bars and now has [usr.rsilver] silver bars."
					usr.silver=0
				if(usr.gold>=1)
					usr.rgold+=usr.gold
					usr << "[M] just made [usr.gold] gold bars and now has [usr.rgold] gold bars."
					usr.gold=0
				if(usr.addy>=1)
					usr.raddy+=usr.addy
					usr << "[M] just made [usr.addy] adamantium bars and now has [usr.raddy] adamantium bars."
					usr.addy=0
				if(usr.sand>=1)
					var/obj/Items/Potions/EmptyBottle/LB = new
					LB.loc = M.loc
					usr.sand-=1
					return(DblClick())
			if (Result == "Alloy Gold and Silver")
				if(M in range(1,src))
					if(usr.rsilver>=1)
						if(usr.rgold>=1)
							var/T = input("How much gulver do you want to make?")as null|num
							if(usr.rgold == usr.rsilver)
								if(usr.rgold&&usr.rsilver>T)
									usr.rgold-=T
									usr.rsilver-=T
									usr.gulver+=T
									usr << "[M] just made [T] gulver bars and now has [usr.gulver] bars."
								else
									usr << "You dont have enough resources to make [T] gulver bars."
							else
								if(usr.rgold>usr.rsilver)
									if(usr.rgold&&usr.rsilver>T)
										usr.gulver+=T
										usr << "[M] just made [T] gulver bars and now has [usr.gulver] bars."
										usr.rgold-=T
										usr.rsilver-=T
										//usr.rgold-=usr.rsilver
										//usr.rsilver-=usr.rsilver
									else
										usr << "You dont have enough resources to make [T] gulver bars."
								if(usr.rsilver>usr.rgold)
									if(usr.rgold&&usr.rsilver>T)
										usr.gulver+=T
										usr << "[M] just made [T] gulver bars and now has [usr.gulver] bars."
										usr.rgold-=T
										usr.rsilver-=T
									else
										usr << "You dont have enough resources to make [T] gulver bars."
										//usr.rsilver-=usr.rgold
										//usr.rgold-=usr.rgold
