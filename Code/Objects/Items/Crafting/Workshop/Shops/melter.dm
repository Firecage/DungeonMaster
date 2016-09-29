obj/WorkShops/Melter
	icon_state = "Smelter"
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Race == "Spider")
				return
			if(M.Wagon == 1)
				return
			var/list/menu = new()
			menu += "Craft"
			menu += "Destroy"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Destroy")
				if(M in range(1,src))
					DestroyMelter()
			if (Result == "Craft")
				var/list/menu2 = new()
				menu2 += "Melt All Weapons On Unit"
				menu2 += "Melt All Armours On Unit"
				menu2 += "Melt All Items Near By"
				menu2 += "Cancel"
				var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
				if (Result2 != "Cancel")
					..()
				if (Result2 == "Melt All Weapons On Unit")
					var/choice = alert(usr, "This will destroy all NON-EQUIPED weapons on your unit, continue?", "Choose", "No", "Yes", null)
					if (choice == "No")
						return
					if (choice == "Yes")
						var/EX = 0
						for(var/obj/Items/Equipment/Weapon/W in M)
							if(W.suffix == "(Carrying)")
								M.weight -= W.weight
								EX+=0.5
								del(W)
						usr << "Done, [M] gains [EX] exp!"
						M.GainEXP(EX)
				if (Result2 == "Melt All Armours On Unit")
					var/choice = alert(usr, "This will destroy all NON-EQUIPED armours on your unit, continue?", "Choose", "No", "Yes", null)
					if (choice == "No")
						return
					if (choice == "Yes")
						var/EX = 0
						for(var/obj/Items/Equipment/Armour/W in M)
							if(W.suffix == "(Carrying)")
								M.weight -= W.weight
								EX+=0.5
								del(W)
						usr << "Done, [M] gains [EX] exp!"
						M.GainEXP(EX)
				if (Result2 == "Melt All Items Near By")
					var/choice = alert(usr, "This will destroy all near by items on the ground, continue?", "Choose", "No", "Yes", null)
					if (choice == "No")
						return
					if (choice == "Yes")
						var/EX = 0
						for(var/obj/Items/W in view(1,src))
							if(W.suffix == null)
								if(W.Content3 == "Cage") continue
								if(W.Body == 0)
									del(W)
									EX += 0.5
						usr << "Done, [M] gains [EX] exp!"
						M.GainEXP(EX)