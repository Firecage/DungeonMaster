obj/WorkShops/Kitchen
	icon_state = "Kitchen"

	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Race == "Spider")
				return
			if(M.Wagon == 1)
				return
			var/list/menu = new()
			menu += "Cook"
			//menu += "Tear all Meat from Corpses"
			//menu += "Make Cheese"
			menu += "Destroy"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result == "Cancel") return
			if(M in range(1,src))
				if (Result == "Destroy")
					if(M in range(1,src))
						DestroyKit()
				if(Result == "Tear all Meat from Corpses") for(var/mob/Body/m in M) M.TearMeat(m)
				/*if(Result == "Make Cheese")
					for(var/obj/Items/Shafts/WoodenBucket/B in M)
						if(B in M)
							if(M in range(1,src))
								if(B.HasWater == "Milk")
									var/obj/Items/Food/Cheese/CB = new
									CB.loc = M.loc
									M.CookingSkill+=2
									CB.name = "[B.Content3] Cheese"
									B.HasWater = null
									B.Content3 = 0*/

				if(Result == "Cook")
					if(usr.umeat>=1)
						usr.cmeat+=usr.umeat
						usr.umeat=0
					if(usr.ufish>=1)
						usr.cfish+=usr.ufish
						usr.ufish=0
					/*for(var/obj/Items/Food/Meat/B in M) if(B.icon_state == "RawMeat")
						if(!prob(M.CookingSkill*4))
							usr<< "failed!"
							M.weight -= B.weight
							del(B)
							M.CookingSkill+=2
							break
							return
						else
							B.name = "Cooked [B.name]"
							B.icon_state="CookedMeat"
							M.CookingSkill+=1*/