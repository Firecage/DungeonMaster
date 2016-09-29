obj/WorkShops/Forge
	icon_state = "Forge"
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Race == "Spider")
				return
			if(M.Wagon == 1)
				return
			if(M.Infects == 1)
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
					DestroyForge()
			if (Result == "Craft")
				var/list/menu2 = new()
				menu2 += "Weapons"
				menu2 += "Armor"
				menu2 += "Misc"
				menu2 += "Cancel"
				var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
				if (Result2 == "Weapons")
					var/list/weapon = new()
					weapon+= "Encrusted Weapons"
					if(M.Race == "Orc")
						weapon += "Metal OrcAxe"
						weapon += "Metal OrcSword"
					weapon += "Metal Spear"
					weapon += "Metal Axe"
					weapon += "Metal Dagger"
					if(M.Race != "Kobold")
						weapon += "Metal Mace"
					if(M.Race == "Goblin")
						weapon += "Goblin Sword"
					weapon += "Metal Bow"
					weapon += "Metal Arrows"
					if(M.MetalCraftingSkill >= 100) weapon += "Soul Blade"
					if(M.Race != "Orc")
						weapon += "MetalStraightSword"
						weapon += "MetalGladius"
					if(M.Race == "Dwarf")
						weapon += "Adamantium Sword"
						weapon += "Adamantium Axe"
						weapon += "Adamantium Mace"
						weapon += "Adamantium Spear"
						weapon += "Adamantium Helmet"
					if(M.Race != "Goblin")
						if(M.Race != "Kobold")
							weapon += "Gold Spear"
							weapon += "Gold Axe"
							weapon += "Gold Dagger"
							weapon += "Gold Mace"
							weapon += "GoldStraightSword"
							weapon += "GoldGladius"
							weapon += "Silver Spear"
							weapon += "Silver Axe"
							weapon += "Silver Mace"
							weapon += "Silver Dagger"
							weapon += "Silver Sword"
					weapon += "Cancel"
					var/Rweapon = input("What Action Will You Choose?", "Choose", null) in weapon
					if(Rweapon == "Soul Blade")
						if(M in range(1,src))
							for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Sword/S1 in M)
								if(S1.suffix == "(Carrying)")
									for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Mace/S2 in M)
										if(S2.suffix == "(Carrying)")
											for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Dagger/S3 in M)
												if(S3.suffix == "(Carrying)")
													for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Spear/S4 in M)
														if(S4.suffix == "(Carrying)")
															for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Axe/S5 in M)
																if(S5.suffix == "(Carrying)")
																	var/obj/Items/Equipment/Weapon/DemonicWeapons/SoulBlade/S6 = new
																	S6.loc = M.loc
																	for(var/turf/L in range(1,src))
																		if(L.icon_state == "Lava")
																			S6.WeaponDamageMin += 10
																			S6.WeaponDamageMax += 10
																			break
																	for(var/obj/Items/Equipment/E in list(S1,S2,S3,S4,S5)) if(M.DropItem(E)) del(E)
																	return
					if(Rweapon == "Gold Mace")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Maces/GoldMace/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,1,6)
					if (Rweapon == "Gold Axe")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Axes/GoldAxe/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,1,6)
					if (Rweapon == "Gold Dagger")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Daggers/GoldDagger/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,1,6)
					if(Rweapon == "Silver Spear")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Spears/SilverSpear/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,1,5)
					if(Rweapon == "Silver Dagger")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Daggers/SilverDagger/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,1,5)
					if(Rweapon == "Silver Sword")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Swords/SilverSword/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,1,5)
					if(Rweapon == "Silver Mace")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Maces/SilverMace/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,1,5)
					if(Rweapon == "Silver Axe")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Axes/SilverAxe/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,1,5)
					if (Rweapon == "Gold Spear")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Spears/GoldSpear/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,1,6)
					if (Rweapon == "Metal Bow")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Bows/MetalBow/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)
					if (Rweapon == "Metal Arrows")
						if(M in range(1,src))
							var/XK = 0
							var/T = input("Amount?")as null|num
							if(!T)
								return
							else
								if(usr.riron <= T)
									M.CraftCount = usr.riron
								else
									M.CraftCount = T
								if(M.CraftCount >= 1)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										//M.weight -= S.weight
										M.MetalCraftingSkill += 1
										T -= 1
										usr.riron -= 1
										//del(S)
									else if(M.WearingBack)
										for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
											if(L.suffix == "(Equipped)")
												if(L.Content <= 250)
													var/obj/Items/Arrows/MetalArrow/LB = new
													LB.loc = L
													var/obj/Items/Arrows/MetalArrow/LB2 = new
													LB2.loc = L
													var/obj/Items/Arrows/MetalArrow/LB3 = new
													LB3.loc = L
													var/obj/Items/Arrows/MetalArrow/LB4 = new
													LB4.loc = L
													var/obj/Items/Arrows/MetalArrow/LB5 = new
													LB5.loc = L
													var/obj/Items/Arrows/MetalArrow/LB6 = new
													LB6.loc = L
													var/obj/Items/Arrows/MetalArrow/LB7 = new
													LB7.loc = L
													var/obj/Items/Arrows/MetalArrow/LB8 = new
													LB8.loc = L
													var/obj/Items/Arrows/MetalArrow/LB9 = new
													LB9.loc = L
													var/obj/Items/Arrows/MetalArrow/LB10 = new
													LB10.loc = L
													//M.MetalCraftingSkill += 1.5
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
													usr.riron -= 1
													//del(S)
												else
													M.Owner << "The quiver has too many arrows in it."
													return

									else
										M.Owner << "[M] - I've got no quiver to put arrows in!"
										return
								else
									M.CraftCount = 0
									return
					if (Rweapon == "Metal Spear")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Spears/MetalSpear/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)
					if (Rweapon == "Metal Mace")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Maces/MetalMace/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)
					if (Rweapon == "GoldGladius")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Swords/GoldGladius/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,1,5)
					if (Rweapon == "MetalGladius")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Swords/Gladius/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)
					if (Rweapon == "GoldStraightSword")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Swords/GoldStraightSword/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,1,5)
					if (Rweapon == "MetalStraightSword")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Swords/StraightSword/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)
					if(Rweapon == "Adamantium Sword")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Swords/AdamantiumSword/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,3,7)
					if(Rweapon == "Adamantium Dagger")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Daggers/AdamantiumDagger/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,3,7)
					if(Rweapon == "Adamantium Axe")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Axes/AdamantiumAxe/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,3,7)
					if(Rweapon == "Adamantium Mace")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Maces/AdamantiumMace/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,3,7)
					if(Rweapon == "Adamantium Spear")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Spears/AdamantiumSpear/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,3,7)
					if (Rweapon == "Metal OrcSword")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Swords/GoblinSword/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)
					if (Rweapon == "Goblin Sword")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Swords/GoblinSword/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)
					if (Rweapon == "Metal Dagger")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Daggers/MetalDagger/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)
					if (Rweapon == "Metal OrcAxe")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)
					if (Rweapon == "Metal Axe")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Axes/MetalAxe/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)
					if(Rweapon == "Encrusted Weapons")
						var/list/Encweapon = new()
				if(Result2 == "Armor")
					var/list/armor = new()
					armor += "Encrusted Armor"
					armor += "Full Metal Armor"
					armor += "Metal ChestPlate"
					armor += "Metal Leggings"
					armor += "Metal Left Gauntlet"
					armor += "Metal Right Gauntlet"
					armor += "MetalNeckGuard"
					armor += "Metal Helmet"
					armor += "Metal Buckler"
					if(M.Race == "Dwarf")
						armor += "Full Adamantium Armor"
						armor += "Adamantium Helmet"
						armor += "Adamantium ChestPlate"
						armor += "Adamantium Leggings"
						armor += "Adamantium Left Gauntlet"
						armor += "Adamantium Right Gauntlet"
						armor += "Adamantium Buckler"
					if(M.Race != "Goblin")
						if(M.Race != "Kobold")
							armor += "Gold ChestPlate"
							armor += "Gold Leggings"
							armor += "Gold Helmet"
							armor += "Gold Buckler"
							armor += "GoldLeftGauntlet"
							armor += "GoldRightGauntlet"
							armor += "GoldNeckGuard"
							armor += "Silver ChestPlate"
							armor += "Silver Leggings"
							armor += "Silver Helmet"
							armor += "Silver Buckler"
							armor += "Silver Left Gauntlet"
							armor += "Silver Right Gauntlet"
							armor += "SilverNeckGuard"
					armor += "Cancel"
					var/Rarmor = input("What Action Will You Choose?", "Choose", null) in armor
					if (Rarmor == "Full Metal Armor")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate/LA = new
							craft(LA,M.MetalCraftingSkill,usr.riron,4,4)
							var/obj/Items/Equipment/Armour/Leggings/MetalLeggings/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,4,4)
							var/obj/Items/Equipment/Armour/Helmet/MetalHelmet/LC = new
							craft(LC,M.MetalCraftingSkill,usr.riron,4,4)
							var/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet/LD = new
							craft(LD,M.MetalCraftingSkill,usr.riron,4,4)
							var/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet/LE = new
							craft(LE,M.MetalCraftingSkill,usr.riron,4,4)
							var/obj/Items/Equipment/Armour/Shield/MetalBuckler/LF = new
							craft(LF,M.MetalCraftingSkill,usr.riron,4,4)
					if (Rarmor == "Metal ChestPlate")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,4,4)
					if (Rarmor == "Metal Leggings")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Leggings/MetalLeggings/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,4,4)
					if (Rarmor == "Metal Left Gauntlet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,4,4)
					if (Rarmor == "Metal Right Gauntlet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,4,4)
					if (Rarmor == "MetalNeckGuard")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/NeckGuards/MetalNeckGuard/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,4,4)
					if (Rarmor == "Metal Helmet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Helmet/MetalHelmet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,4,4)
					if (Rarmor == "Metal Buckler")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Shield/MetalBuckler/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,4,4)
					if(Rarmor == "Full Adamantium Armor")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Chestplate/AdamantiumChestPlate/LA = new
							craft(LA,M.MetalCraftingSkill,usr.raddy,6,7)
							var/obj/Items/Equipment/Armour/Leggings/AdamantiumLeggings/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,6,7)
							var/obj/Items/Equipment/Armour/Helmet/AdamantiumHelmet/LC = new
							craft(LC,M.MetalCraftingSkill,usr.raddy,6,7)
							var/obj/Items/Equipment/Armour/Shield/AdamantiumBuckler/LD = new
							craft(LD,M.MetalCraftingSkill,usr.raddy,6,7)
							var/obj/Items/Equipment/Armour/LeftArm/AdamantiumLeftGauntlet/LE = new
							craft(LE,M.MetalCraftingSkill,usr.raddy,6,7)
							var/obj/Items/Equipment/Armour/RightArm/AdamantiumRightGauntlet/LF = new
							craft(LF,M.MetalCraftingSkill,usr.raddy,6,7)
					if (Rarmor == "SilverNeckGuard")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/NeckGuards/SilverNeckGuard/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,4,5)
					if (Rarmor == "GoldNeckGuard")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/NeckGuards/GoldNeckGuard/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,4,6)
					if (Rarmor == "Silver ChestPlate")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Chestplate/SilverChestPlate/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,4,5)
					if (Rarmor == "Adamantium ChestPlate")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Chestplate/AdamantiumChestPlate/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,6,7)
					if (Rarmor == "GoldRightGauntlet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/RightArm/GoldRightGauntlet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,4,6)
					if (Rarmor == "GoldLeftGauntlet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/LeftArm/GoldLeftGauntlet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,4,6)
					if (Rarmor == "Gold ChestPlate")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Chestplate/GoldChestPlate/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,4,6)
					if (Rarmor == "Silver Leggings")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Leggings/SilverLeggings/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,4,5)
					if (Rarmor == "Adamantium Leggings")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Leggings/AdamantiumLeggings/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,6,7)
					if (Rarmor == "Gold Leggings")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Leggings/GoldLeggings/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,4,6)
					if (Rarmor == "Silver Helmet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Helmet/SilverHelmet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,4,5)
					if (Rarmor == "Adamantium Helmet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Helmet/AdamantiumHelmet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,6,7)
					if (Rarmor == "Gold Helmet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Helmet/GoldHelmet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,4,6)
					if (Rarmor == "Silver Right Gauntlet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/RightArm/SilverRightGauntlet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,4,5)
					if (Rarmor == "Silver Left Gauntlet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/LeftArm/SilverLeftGauntlet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,4,5)
					if (Rarmor == "Silver Buckler")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Shield/SilverBuckler/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,4,5)
					if (Rarmor == "Gold Buckler")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Shield/GoldBuckler/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,4,6)
					if (Rarmor == "Adamantium Buckler")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Shield/AdamantiumBuckler/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,6,7)
					if (Rarmor == "Adamantium Right Gauntlet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/RightArm/AdamantiumRightGauntlet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,6,7)
					if(Rarmor == "Adamantium Left Gauntlet")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/LeftArm/AdamantiumLeftGauntlet/LB = new
							craft(LB,M.MetalCraftingSkill,usr.raddy,6,7)
					if(Rarmor == "Encrusted Armor")
						var/list/encarmor = new()
						for(var/obj/Items/gems/Diamond/R in M)
							if(M.Race != "Kobold")
								encarmor += "Diamond Encrusted Metal ChestPlate"
								encarmor += "Diamond Encrusted Silver ChestPlate"
								encarmor += "Diamond Encrusted Metal Leggings"
								encarmor += "Diamond Encrusted Silver Leggings"
								encarmor += "Diamond Encrusted Metal Helmet"
								encarmor += "Diamond Encrusted Silver Helmet"
							if(M.Race == "Dwarf")
								encarmor += "Diamond Encrusted Gold ChestPlate"
								encarmor += "Diamond Encrusted Gold Leggings"
								encarmor += "Diamond Encrusted Gold Helmet"
						for(var/obj/Items/gems/Emerald/R in M)
							if(M.Race != "Kobold")
								encarmor += "Emerald Encrusted Metal ChestPlate"
								encarmor += "Emerald Encrusted Silver ChestPlate"
								encarmor += "Emerald Encrusted Metal Leggings"
								encarmor += "Emerald Encrusted Silver Leggings"
								encarmor += "Emerald Encrusted Metal Helmet"
								encarmor += "Emerald Encrusted Silver Helmet"
							if(M.Race == "Dwarf")
								encarmor += "Emerald Encrusted Gold ChestPlate"
								encarmor += "Emerald Encrusted Gold Leggings"
								encarmor += "Emerald Encrusted Gold Helmet"
						for(var/obj/Items/gems/Ruby/R in M)
							if(M.Race != "Kobold")
								encarmor += "Ruby Encrusted Metal ChestPlate"
								encarmor += "Ruby Encrusted Silver ChestPlate"
								encarmor += "Ruby Encrusted Metal Leggings"
								encarmor += "Ruby Encrusted Silver Leggings"
								encarmor += "Ruby Encrusted Metal Helmet"
								encarmor += "Ruby Encrusted Silver Helmet"
							if(M.Race == "Dwarf")
								encarmor += "Ruby Encrusted Gold ChestPlate"
								encarmor += "Ruby Encrusted Gold Leggings"
								encarmor += "Ruby Encrusted Gold Helmet"
						encarmor += "Cancel"
						var/Rencarmor = input("What Action Will You Choose?", "Choose", null) in encarmor
						if(Result2 == "Diamond Encrusted Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/DiamondMetalHelmet/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 25

										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Diamond Encrusted Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/DiamondSilverHelmet/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 25
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/EmeraldMetalHelmet/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Emerald Encrusted Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/EmeraldSilverHelmet/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Ruby Encrusted Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/RubyMetalHelmet/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Ruby Encrusted Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/RubySilverHelmet/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/RubyGoldChestPlate/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10

										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/DiamondGoldChestPlate/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 25
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/DiamondSilverChestPlate/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 25
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/DiamondMetalChestPlate/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 25
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/RubyMetalChestPlate/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/EmeraldMetalChestPlate/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Equipment/Armour/Helmet/DiamondGoldHelmet/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 15
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/RubyGoldHelmet/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/EmeraldGoldHelmet/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/EmeraldGoldChestPlate/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/EmeraldSilverChestPlate/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/RubySilverChestPlate/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										break
										return
						if (Result2 == "Diamond Encrusted Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Equipment/Armour/Leggings/DiamondGoldLeggings/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 25
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/DiamondSilverLeggings/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 25
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/DiamondMetalLeggings/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 25
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/RubyMetalLeggings/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/RubyGoldLeggings/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/EmeraldMetalLeggings/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/EmeraldGoldLeggings/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Equipment/Armour/Leggings/EmeraldSilverLeggings/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/success
										success = prob(M.MetalCraftingSkill*4)
										if(success == 0)
											usr<< "failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/RubySilverLeggings/LB = new
										Quality(LB,M.MetalCraftingSkill)
										LB.Defence += 10
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return

					if (Rarmor == "Cancel")
						..()
				if(Result2 == "Misc")
					var/list/misc = new()
					misc += "Metal PickAxe"
					misc += "Metal Fence"
					misc += "Metal Cage"
					misc += "Metal Training Post"
					misc += "Metal Chest"
					misc += "MetalSpade"
					misc += "Metal Flask"
					misc += "Metal Bed"
					misc += "Metal Door"
					if(M.Race != "Orc")
						misc += "Gold Crown"
					if(M.Race == "Human" || M.Race == "Dwarf") misc += "Metal Drill"
					if(M.Race != "Goblin")
						misc += "Gold PickAxe"
					if(M.Race != "Orc")
						misc += "Gold Cage"
						misc += "Golden Throne"
						misc += "Silver Training Post"
						//menu2 += "Silver Arrows"
					if(M.Race != "Goblin")
						if(M.Race != "Kobold")
							misc += "Gold Door"
							misc += "Gold Bed"
							misc += "Gold Training Post"
							misc += "Gold Chest"
							misc += "Silver Chest"
							misc += "Golden Pillar"
					var/Rmisc = input("What Action Will You Choose?", "Choose", null) in misc
					if (Rmisc == "Golden Pillar")
						if(M in range(1,src))
							var/obj/Items/Furniture/Pillars/GoldPillar/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,7,6)
					if (Rmisc == "Metal Flask")
						if(M in range(1,src))
							var/obj/Items/Shafts/MetalFlask/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,7,4)
					if (Rmisc == "Metal Drill")
						if(M in range(1,src))
							var/mob/Monsters/Chests/Drill/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,7,6)
					if (Rmisc == "Gold Chest")
						if(M in range(1,src))
							var/mob/Monsters/Chests/GoldChest/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,7,6)
					if (Rmisc == "Silver Chest")
						if(M in range(1,src))
							var/mob/Monsters/Chests/SilverChest/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,7,5)
					if (Rmisc == "Metal Chest")
						if(M in range(1,src))
							var/mob/Monsters/Chests/MetalChest/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,7,4)
					if (Rmisc == "MetalSpade")
						if(M in range(1,src))
							var/obj/Items/Shafts/Spade/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,7,4)
					if (Rmisc == "Gold Door")
						if(M in range(1,src))
							var/obj/Items/Furniture/Doors/GoldDoor/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,7,6)
					if (Rmisc == "Gold Training Post")
						if(M in range(1,src))
							var/obj/Items/Furniture/Posts/GoldTrainingPost/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,9,6)
					if (Rmisc == "Metal Training Post")
						if(M in range(1,src))
							var/obj/Items/Furniture/Posts/MetalTrainingPost/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,9,4)
					if (Rmisc == "Silver Training Post")
						if(M in range(1,src))
							var/obj/Items/Furniture/Posts/SilverTrainingPost/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rsilver,9,5)
					if (Rmisc == "Metal Door")
						if(M in range(1,src))
							var/obj/Items/Furniture/Doors/MetalDoor/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,7,4)
					if (Rmisc == "Metal Fence")
						if(M in range(1,src))
							var/obj/Items/Furniture/Fences/MetalFence/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,7,4)
					if (Rmisc == "Golden Throne")
						if(M in range(1,src))
							var/obj/Items/Furniture/Chairs/GoldenThrone/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,7,6)
					if (Rmisc == "Gold Bed")
						if(M in range(1,src))
							var/obj/Items/Furniture/Beds/GoldBed/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,7,6)
					if (Rmisc == "Metal Bed")
						if(M in range(1,src))
							var/obj/Items/Furniture/Beds/MetalBed/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,7,4)
					if (Rmisc == "Metal Cage")
						if(M in range(1,src))
							var/obj/Items/Traps/Cages/MetalCage/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,7,4)
					if (Rmisc == "Gold Cage")
						if(M in range(1,src))
							var/obj/Items/Traps/Cages/GoldCage/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,7,6)
					if (Rmisc == "Gold Crown")
						if(M in range(1,src))
							var/obj/Items/Equipment/Armour/Crown/Gold/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,4,6)
					if (Rmisc == "Gold PickAxe")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Picks/GoldPickAxe/LB = new
							craft(LB,M.MetalCraftingSkill,usr.rgold,2,6)
					if (Rmisc == "Metal PickAxe")
						if(M in range(1,src))
							var/obj/Items/Equipment/Weapon/Picks/PickAxe/LB = new
							craft(LB,M.MetalCraftingSkill,usr.riron,2,4)

				if(Result2 != "Cancel")
					..()
