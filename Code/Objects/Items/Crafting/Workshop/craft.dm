obj/proc/craft(obj/Items/LB,craftingSkill,material,var/s,var/d)
	for(var/mob/Monsters/M in usr.Selected)
		load("config/config.txt",type = "multiplier")
		var/mob/m
		m=M.Owner
		var/success
		success = prob(craftingSkill*10)
		if(success == 0)
			usr<< "failed!"
			break
			return
		else
			if(material>=1)
				//success(M.BoneCraftingSkill,material)
				Quality(LB,craftingSkill)
				LB.loc = M.loc
				switch(s)
					if(1)
						LB.BoneWeaponCraft()
						var/T = input("What will you name [LB]?")as null|text
						if(T)
							LB.name = T
					if(2)
						LB.MetalWeaponCraft()
						var/T = input("What will you name [LB]?")as null|text
						if(T)
							LB.name = T
					if(3)
						LB.AdamantiumWeaponCraft()
						var/T = input("What will you name [LB]?")as null|text
						if(T)
							LB.name = T
					if(4)
						LB.MetalArmourCraft()
						var/T = input("What will you name [LB]?")as null|text
						if(T)
							LB.name = T
					if(5)
						LB.BoneArmourCraft()
						var/T = input("What will you name [LB]?")as null|text
						if(T)
							LB.name = T
					if(6)
						LB.AdamantiumArmourCraft()
						var/T = input("What will you name your armor?")as null|text
						if(T)
							LB.name = T
					if(7)
						LB.FurnitureCraft()
					if(8)
						LB.DoorCraft()
					if(9)
						LB.TrainCraft()
				switch(d)
					if(1)
						usr.bone-=1
						M.BoneCraftingSkill += 0.25
						if(usr.bone<1)
							usr.bone=0
					if(2)
						usr.shell-=1
						M.BoneCraftingSkill += 0.25
						if(usr.shell<1)
							usr.shell=0
					if(3)
						usr.log-=1
						M.WoodCraftingSkill += 0.25
						if(usr.log<1)
							usr.log=0
					if(4)
						usr.riron-=1
						M.MetalCraftingSkill += 0.25
						if(usr.riron<1)
							usr.riron=0
					if(5)
						usr.rsilver-=1
						M.MetalCraftingSkill += 0.25
						if(usr.rsilver<1)
							usr.rsilver=0
					if(6)
						usr.rgold-=1
						M.MetalCraftingSkill += 0.25
						if(usr.rgold<1)
							usr.rgold=0
					if(7)
						usr.raddy-=1
						M.MetalCraftingSkill += 0.25
						if(usr.raddy<1)
							usr.raddy=0
					if(8)
						usr.stone-=1
						M.StoneCraftingSkill += 0.25
						if(usr.stone<1)
							usr.stone=0
					if(9)
						usr.udiamond-=1
						M.JewlCraftingSkill += 0.25
					if(10)
						usr.uemerald-=1
						M.JewlCraftingSkill += 0.25
					if(11)
						usr.uruby-=1
						M.JewlCraftingSkill += 0.25
					if(12)
						usr.gulver-=1
						M.Machinery += 4
				break
				return
			else
				usr << "You need at least one of the material."
				break
				return