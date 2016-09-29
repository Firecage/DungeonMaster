obj/WorkShops/Carpentry
	icon_state = "Carpentry"
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
					DestroyCarpentryStation()
			if (Result == "Craft")
				var/list/menu2 = new()
				menu2 += "Weapons"
				menu2 += "Armor"
				menu2 += "Misc"
				menu2 += "Cancel"
				var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
				if(Result2 == "Weapons")
					var/list/weapon = new()
					weapon += "Necromancer's Staff"
					weapon += "Staff"
					weapon += "Wooden Spear"
					if(M.Race == "Elf")
						weapon += "Wooden Pickaxe"
						weapon += "Wooden Sword"
						weapon += "Wooden Mace"
						weapon += "Wooden Elf Spear"
						weapon += "Wooden Axe"
						//weapon += "Wooden Bow"
						//weapon += "Wooden Arrows"
						//weapon += "Wooden Elf Bow"
					weapon += "Cancel"
					var/Rweapon = input("What Action Will You Choose?", "Choose", null) in weapon
					if(Rweapon == "Wooden Pickaxe")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Picks/WoodenPickAxe/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,1,3)
					if (Rweapon == "Wooden Sword")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Swords/WoodenSword/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,1,3)
					if (Rweapon == "Wooden Spear")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Spears/WoodenSpear/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,1,3)
					if (Rweapon == "Wooden Mace")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Maces/WoodenMace/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,1,3)
					if (Rweapon == "Wooden Axe")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Axes/WoodenAxe/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,1,3)
					if (Rweapon == "Wooden Elf Spear")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Spears/ElfSpear/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,1,3)
					if (Rweapon == "Staff")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Maces/Staff/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,1,3)
					if (Rweapon == "Necromancer's Staff")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Maces/NecroStaff/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,1,3)
					if (Rweapon != "Cancel")
						..()
				if (Result2 == "Armor")
					var/list/armor = new()
					if(M.Race == "Elf")
						armor += "Full Wooden Armor"
						armor += "Wooden Helmet"
						armor += "Wooden Chestplate"
						armor += "Wooden LeftArm"
						armor += "Wooden RightArm"
						armor += "Wooden Leggings"
					if(M.Race != "Kobold")
						armor += "WoodenBuckler"
					if(M.Race == "Lizardman")
						armor += "Lizardman Shield"
					armor += "Cancel"
					var/Rarmor = input("What Action Will You Choose?", "Choose", null) in armor
					if(Rarmor == "Full Wooden Armor")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Chestplate/WoodenChestplate/LA = new
							craft(LA,M.WoodCraftingSkill,usr.log,5,3)
							var/obj/Items/Equipment/Armour/Leggings/WoodenLeggings/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,5,3)
							var/obj/Items/Equipment/Armour/Helmet/WoodenHelmet/LC = new
							craft(LC,M.WoodCraftingSkill,usr.log,5,3)
							var/obj/Items/Equipment/Armour/RightArm/WoodenRightGauntlet/LD = new
							craft(LD,M.WoodCraftingSkill,usr.log,5,3)
							var/obj/Items/Equipment/Armour/LeftArm/WoodenLeftGauntlet/LE = new
							craft(LE,M.WoodCraftingSkill,usr.log,5,3)
							var/obj/Items/Equipment/Armour/Shield/WoodenBuckler/LF = new
							craft(LF,M.WoodCraftingSkill,usr.log,5,3)
					if (Rarmor == "WoodenBuckler")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Shield/WoodenBuckler/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,5,3)
					if (Rarmor == "Wooden Chestplate")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Chestplate/WoodenChestplate/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,5,3)
					if (Rarmor == "Wooden RightArm")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/RightArm/WoodenRightGauntlet/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,5,3)
					if (Rarmor == "Wooden LeftArm")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/LeftArm/WoodenLeftGauntlet/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,5,3)
					if (Rarmor == "Wooden Leggings")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Leggings/WoodenLeggings/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,5,3)
					if (Rarmor == "Wooden Helmet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Helmet/WoodenHelmet/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,5,3)
					if (Rarmor == "Lizardman Shield")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Shield/LizardShield/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,5,3)
					if (Rarmor != "Cancel")
						..()


				if (Result2 == "Misc")
					var/list/misc = new()
					misc += "Wooden Spike"
					misc += "Wooden Cage"
					misc += "Wooden Door"
					misc += "Wooden Fence"
					misc += "Wooden Chair"
					misc += "Wooden Bucket"
					if(M.Race != "Lizardman")
						misc += "Wooden Spade"
					if(M.Race == "Svartalfar" || M.Intelligence >= 10)
						misc += "Paper"
					misc += "Wooden Wagon"
					misc += "Wooden Sign"
					misc += "Wooden Chest"
					misc += "Wooden Table"
					misc += "Wooden Training Post"
					if(M.Race != "Goblin")
						if(M.Race != "Kobold")
							if(M.Race != "Vampire")
								if(M.Race != "Lizardman")
									misc += "Wooden Bed"
					misc += "Cancel"
					var/Rmisc = input("What Action Will You Choose?", "Choose", null) in misc
					if (Rmisc == "Wooden Spike")
						if(M in range(1,src))
							var/obj/Items/Traps/Spikes/WoodenSpike/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,1,3)
					if (Rmisc == "Paper")
						if(M in range(1,src))
							for(var/obj/Items/woods/wood/S in M)
								for(var/obj/Items/Shafts/WoodenBucket/S2 in M)
									if(S2.HasWater == "Water")
										var/success
										success = prob(M.WoodCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											del(S)
											break
											M.WoodCraftingSkill += 0.5
											return
										var/obj/Items/Shafts/MagicScroll/LB = new

										M.WoodCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										S2.HasWater = null
										return
							usr << "You need one piece of wood and one wooden bucket full of water to make this."
					if (Rmisc == "Wooden Chair")
						if(M in range(1,src))
							var/obj/Items/Furniture/Chairs/WoodenChair/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Bucket")
						if(M in range(1,src))
							var/obj/Items/Shafts/WoodenBucket/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Spade")
						if(M in range(1,src))
							var/obj/Items/Shafts/WoodenSpade/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Table")
						if(M in range(1,src))
							var/obj/Items/Furniture/Tables/Table/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Training Post")
						if(M in range(1,src))
							var/obj/Items/Furniture/Posts/WoodTrainingPost/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Chest")
						if(M in range(1,src))
							var/mob/Monsters/Chests/WoodenChest/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Sign")
						if(M in range(1,src))
							var/obj/Items/Shafts/Sign/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Wagon")
						if(M in range(1,src))
							var/mob/Monsters/Chests/Wagon/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Cage")
						if(M in range(1,src))
							var/obj/Items/Traps/Cages/WoodenCage/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Door")
						if(M in range(1,src))
							var/obj/Items/Furniture/Doors/WoodenDoor/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Fence")
						if(M in range(1,src))
							var/obj/Items/Furniture/Fences/WoodenFence/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc == "Wooden Bed")
						if(M in range(1,src))
							var/obj/Items/Furniture/Beds/WoodenBed/LB = new
							craft(LB,M.WoodCraftingSkill,usr.log,7,3)
					if (Rmisc != "Cancel")
						..()
				if (Result2 != "Cancel")
					..()
