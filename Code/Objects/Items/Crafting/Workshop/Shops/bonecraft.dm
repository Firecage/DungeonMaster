obj/WorkShops/BoneCraft
	icon_state = "Bonecraft"
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
					DestroyBone()
			if (Result == "Craft")
				var/list/menu2 = new()
				menu2 += "Weapons"
				menu2 += "Armor"
				menu2 += "Misc"
				menu2 += "Cancel"
				var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
				if(M.UsesPoison)
					/*Begin Bone Weapons*/
					if (Result2 == "Weapons")
						var/list/weapon = new()
						weapon += "BoneSpear"
						weapon += "BoneAxe"
						weapon += "BoneDagger"
						weapon += "Bone Sword"
						weapon += "Skull Mace"
						weapon += "Bone Bow"
						weapon += "Bone Arrows"
						weapon += "Cancel"
						if(Race != "Orc")
							weapon += "ChitinSpear"
							weapon += "ChitinSword"
							weapon += "ChitinAxe"
							weapon += "ChitinDagger"
							weapon += "ChitinMace"
						var/Rweapon = input("What Action Will You Choose?", "Choose", null) in weapon
						if (Rweapon == "BoneSpear")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Spears/BoneSpear/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,1,1)
						if (Rweapon == "BoneAxe")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Axes/BoneAxe/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,1,1)
						if (Rweapon == "BoneDagger")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Daggers/BoneDagger/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,1,1)
								LB.WeaponDamageMin = LB.WeaponDamageMin/2
								LB.WeaponDamageMax = LB.WeaponDamageMax/2
						if (Rweapon == "Bone Sword")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Swords/BoneSword/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,1,1)
						if (Rweapon == "Bone Bow")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Bows/BoneBow/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,1,1)
						if (Rweapon == "Bone Arrows")
							if(M in range(1,src))
								var/XK = 0
								var/T = input("Amount?")as null|num
								if(!T)
									return
								else
									if(usr.bone <= T)
										M.CraftCount = usr.bone
									else
										M.CraftCount = T
									if(M.CraftCount >= 1)
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											usr.bone -= 1
											//M.weight -= S.weight
											//del(S)
											break
											//M.BoneCraftingSkill += 0.25
											return
										if(M.WearingBack)
											for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
												if(L.suffix == "(Equipped)")
													if(L.Content <= 250)
														var/obj/Items/Arrows/BoneArrow/LB = new
														LB.loc = L
														var/obj/Items/Arrows/BoneArrow/LB2 = new
														LB2.loc = L
														var/obj/Items/Arrows/BoneArrow/LB3 = new
														LB3.loc = L
														var/obj/Items/Arrows/BoneArrow/LB4 = new
														LB4.loc = L
														var/obj/Items/Arrows/BoneArrow/LB5 = new
														LB5.loc = L
														var/obj/Items/Arrows/BoneArrow/LB6 = new
														LB6.loc = L
														var/obj/Items/Arrows/BoneArrow/LB7 = new
														LB7.loc = L
														var/obj/Items/Arrows/BoneArrow/LB8 = new
														LB8.loc = L
														var/obj/Items/Arrows/BoneArrow/LB9 = new
														LB9.loc = L
														var/obj/Items/Arrows/BoneArrow/LB10 = new
														LB10.loc = L
														M.BoneCraftingSkill += 1.5
														//M.weight -= S.weight
														LB.Owner = M.Owner
														LB2.Owner = M.Owner
														LB3.Owner = M.Owner
														LB4.Owner = M.Owner
														LB5.Owner = M.Owner
														LB6.Owner = M.Owner
														LB7.Owner = M.Owner
														LB8.Owner = M.Owner
														LB9.Owner = M.Owner
														LB10.Owner = M.Owner
														L.Content += 10
														M.Owner << "Arrows placed in quiver!"
														M.CraftCount -= 1
														usr.bone -= 1
														//del(S)
													else
														M.Owner << "This quiver has too many arrows in it!"
														return
										else
											M.Owner << "[M] - I,ve got no quiver to put arrows in!"
											return
									else
										M.CraftCount = 0
										return
						if (Rweapon == "Skull Mace")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Maces/SkullMace/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,1,1)
						if (Rweapon == "ChitinSpear")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Spears/ChitinSpear/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,1,2)
						if (Rweapon == "ChitinSword")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Swords/ChitinSword/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,1,2)
						if (Rweapon == "ChitinAxe")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Axes/ChitinAxe/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,1,2)
						if (Rweapon == "ChitinDagger")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Daggers/ChitinDagger/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,1,2)
						if (Rweapon == "ChitinMace")
							if(M in range(1,src))
								var/obj/Items/Equipment/Weapon/Maces/ChitinMace/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,1,2)
						if (Rweapon != "Cancel")
							..()
					/*Begin Bone Armor*/
					if (Result2 == "Armor")
						var/list/armor = new()
						armor += "Full Bone Armor"
						armor += "BoneHelmet"
						armor += "BoneChestPlate"
						armor += "BoneLeggings"
						armor += "BoneLeftGauntlet"
						armor += "BoneRightGauntlet"
						armor += "BoneBuckler"
						armor += "Cancel"
						if(Race != "Orc")
							armor += "Full Chitin Armor"
							armor += "ChitinHelmet"
							armor += "ChitinChestPlate"
							armor += "ChitinLeggings"
							armor += "ChitinBuckler"
							armor += "ChitinLeftGauntlet"
							armor += "ChitinRightGauntlet"
						var/Rarmor = input("What Action Will You Choose?", "Choose", null) in armor
						if (Rarmor == "Full Bone Armor")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate/LA = new
								craft(LA,M.BoneCraftingSkill,usr.bone,5,1)
								var/obj/Items/Equipment/Armour/Leggings/BoneLeggings/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,5,1)
								var/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet/LC = new
								craft(LC,M.BoneCraftingSkill,usr.bone,5,1)
								var/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet/LD = new
								craft(LD,M.BoneCraftingSkill,usr.bone,5,1)
								var/obj/Items/Equipment/Armour/Shield/BoneBuckler/LE = new
								craft(LE,M.BoneCraftingSkill,usr.bone,5,1)
								var/obj/Items/Equipment/Armour/Helmet/BoneHelmet/LF = new
								craft(LF,M.BoneCraftingSkill,usr.bone,5,1)
						if (Rarmor == "BoneHelmet")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Helmet/BoneHelmet/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,5,1)
						if (Rarmor == "BoneChestPlate")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,5,1)
						if (Rarmor == "BoneLeggings")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Leggings/BoneLeggings/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,5,1)
						if (Rarmor == "BoneLeftGauntlet")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,5,1)
						if (Rarmor == "BoneRightGauntlet")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,5,1)
						if (Rarmor == "BoneBuckler")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Shield/BoneBuckler/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,5,1)
						if (Rarmor == "Full Chitin Armor")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Chestplate/ChitinChestPlate/LA = new
								craft(LA,M.BoneCraftingSkill,usr.shell,5,2)
								var/obj/Items/Equipment/Armour/Leggings/ChitinLeggings/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,5,2)
								var/obj/Items/Equipment/Armour/LeftArm/ChitinLeftGauntlet/LC = new
								craft(LC,M.BoneCraftingSkill,usr.shell,5,2)
								var/obj/Items/Equipment/Armour/RightArm/ChitinRightGauntlet/LD = new
								craft(LD,M.BoneCraftingSkill,usr.shell,5,2)
								var/obj/Items/Equipment/Armour/Helmet/ChitinHelmet/LE = new
								craft(LE,M.BoneCraftingSkill,usr.shell,5,2)
								var/obj/Items/Equipment/Armour/Shield/ChitinBuckler/LF = new
								craft(LF,M.BoneCraftingSkill,usr.shell,5,2)
						if (Rarmor == "ChitinHelmet")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Helmet/ChitinHelmet/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,5,2)
						if (Rarmor == "ChitinChestPlate")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Chestplate/ChitinChestPlate/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,5,2)
						if (Rarmor == "ChitinLeggings")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Leggings/ChitinLeggings/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,5,2)
						if (Rarmor == "ChitinLeftGauntlet")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/LeftArm/ChitinLeftGauntlet/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,5,2)
						if (Rarmor == "ChitinRightGauntlet")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/RightArm/ChitinRightGauntlet/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,5,2)
						if (Rarmor == "ChitinBuckler")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Shield/ChitinBuckler/LB = new
								craft(LB,M.BoneCraftingSkill,usr.shell,5,2)
						if (Rarmor != "Cancel")
							..()
					/*Begin Bone Misc*/
					if (Result2 == "Misc")
						var/list/misc = new()
						misc += "BoneCage"
						misc += "Bone Door"
						misc += "Bone Training Post"
						misc += "BoneCrown"
						misc += "Bone Throne"
						misc += "Cancel"
						if(Race != "Orc")
							misc += "LockPick"
						var/Rmisc = input("What Action Will You Choose?", "Choose", null) in misc
						if (Rmisc == "BoneCage")
							if(M in range(1,src))
								var/obj/Items/Traps/Cages/BoneCage/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,7,1)
								LB.desc = "This is a bone cage, it can be used to capture creatures in"
						if (Rmisc == "Bone Door")
							if(M in range(1,src))
								var/obj/Items/Furniture/Doors/BoneDoor/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,8,1)
						if (Rmisc == "Bone Training Post")
							if(M in range(1,src))
								var/obj/Items/Furniture/Posts/BoneTrainingPost/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,9,1)
						if (Rmisc == "BoneCrown")
							if(M in range(1,src))
								var/obj/Items/Equipment/Armour/Crown/Bone/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,5,1)
						if (Rmisc == "Bone Throne")
							if(M in range(1,src))
								var/obj/Items/Furniture/Chairs/BoneThrone/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,7,1)
						if (Rmisc == "LockPick")
							if(M in range(1,src))
								var/obj/Items/Shafts/LockPick/LB = new
								craft(LB,M.BoneCraftingSkill,usr.bone,7,1)
						if (Rmisc != "Cancel")
							..()
				if (Result2 != "Cancel")
					..()

