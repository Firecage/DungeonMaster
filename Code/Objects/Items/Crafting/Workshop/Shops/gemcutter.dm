obj/WorkShops/GemCutter
	icon_state = "Gemcutting"
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
					DestroyGem()
			if (Result == "Craft")
				var/list/menu2 = new()
				menu2 += "CutEmerald"
				menu2 += "CutRuby"
				menu2 += "CutDiamond"
				menu2 += "FlawlessCutEmerald"
				menu2 += "FlawlessCutRuby"
				menu2 += "FlawlessCutDiamond"
				menu2 += "Silver Ruby Ring"
				menu2 += "Silver Diamond Ring"
				menu2 += "Silver Emerald Ring"
				menu2 += "Gold Ruby Ring"
				menu2 += "Gold Diamond Ring"
				menu2 += "Gold Emerald Ring"
				menu2 += "Plant Fibre Ring"
				menu2 += "Cancel"
				var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
				if (Result2 != "Cancel")
					..()
				if (Result2 == "CutEmerald")
					if(M in range(1,src))
						var/obj/Items/gems/Emerald/LB = new
						craft(LB,M.JewlCraftingSkill,usr.uemerald,7,10)
						break
						return
				if (Result2 == "FlawlessCutEmerald")
					if(M in range(1,src))
						var/obj/Items/gems/Emerald/LB = new
						craft(LB,M.JewlCraftingSkill,usr.uemerald,7,10)
						LB.Content = "Flawless"
						LB.name = "Flawless Emerald"
						break
						return
				if (Result2 == "CutRuby")
					if(M in range(1,src))
						var/obj/Items/gems/Ruby/LB = new
						craft(LB,M.JewlCraftingSkill,usr.uruby,7,11)
						break
						return
				if (Result2 == "FlawlessCutRuby")
					if(M in range(1,src))
						var/obj/Items/gems/Ruby/LB = new
						craft(LB,M.JewlCraftingSkill,usr.uruby,7,11)
						LB.Content = "Flawless"
						LB.name = "Flawless Ruby"
						break
						return
				if (Result2 == "FlawlessCutDiamond")
					if(M in range(1,src))
						var/obj/Items/gems/Diamond/LB = new
						craft(LB,M.JewlCraftingSkill,usr.udiamond,7,9)
						LB.Content = "Flawless"
						LB.name = "Flawless Diamond"
						break
						return
				if (Result2 == "CutDiamond")
					if(M in range(1,src))
						var/obj/Items/gems/Diamond/LB = new
						craft(LB,M.JewlCraftingSkill,usr.udiamond,7,9)
						break
						return
				if (Result2 == "Silver Ruby Ring")
					if(M in range(1,src))
						for(var/obj/Items/gems/Ruby/S in M)
							if(usr.rsilver>=1)
								var/success
								success = prob(M.JewlCraftingSkill*4)
								if(success == 0)
									usr<< "failed!"
									M.weight -= S.weight
									usr.rsilver-=1
									del(S)
									break
									M.JewlCraftingSkill+=2
									return
								var/obj/Items/gems/RubyRing/LB = new
								LB.loc = M.loc
								LB.icon_state = "Silver Ruby Ring"
								M.JewlCraftingSkill += 1
								M.weight -= S.weight
								usr.rsilver-=1
								del(S)
								break
								return
				if (Result2 == "Silver Diamond Ring")
					if(M in range(1,src))
						for(var/obj/Items/gems/Diamond/S in M)
							if(usr.rsilver>=1)
								var/success
								success = prob(M.JewlCraftingSkill*4)
								if(success == 0)
									usr<< "failed!"
									M.weight -= S.weight
									usr.rsilver-=1
									del(S)
									break
									M.JewlCraftingSkill+=2
									return
								var/obj/Items/gems/DiamondRing/LB = new
								LB.loc = M.loc
								LB.icon_state = "Silver Diamond Ring"
								M.JewlCraftingSkill += 1
								M.weight -= S.weight
								usr.rsilver-=1
								del(S)
								break
								return
				if (Result2 == "Silver Emerald Ring")
					if(M in range(1,src))
						for(var/obj/Items/gems/Emerald/S in M)
							if(usr.rsilver>=1)
								var/success
								success = prob(M.JewlCraftingSkill*4)
								if(success == 0)
									usr<< "failed!"
									M.weight -= S.weight
									usr.rsilver-=1
									del(S)
									break
									M.JewlCraftingSkill+=2
									return
								var/obj/Items/gems/EmeraldRing/LB = new
								LB.loc = M.loc
								LB.icon_state = "Silver Emerald Ring"
								M.JewlCraftingSkill += 1
								M.weight -= S.weight
								usr.rsilver-=1
								del(S)
								break
								return
				if (Result2 == "Gold Ruby Ring")
					if(M in range(1,src))
						for(var/obj/Items/gems/Ruby/S in M)
							if(S.Content == "Flawless")
								if(usr.rgold>=1)
									var/success
									success = prob(M.JewlCraftingSkill)
									if(success == 0)
										usr<< "failed!"
										M.weight -= S.weight
										usr.rgold-=1
										del(S)
										break
										M.JewlCraftingSkill+=2
										return
									var/obj/Items/gems/RubyRing/LB = new
									LB.loc = M.loc
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									usr.rgold-=1
									del(S)
									break
									return
				if (Result2 == "Gold Diamond Ring")
					if(M in range(1,src))
						for(var/obj/Items/gems/Diamond/S in M)
							if(S.Content == "Flawless")
								if(usr.rgold>=1)
									var/success
									success = prob(M.JewlCraftingSkill)
									if(success == 0)
										usr<< "failed!"
										M.weight -= S.weight
										usr.rgold-=1
										del(S)
										break
										M.JewlCraftingSkill+=2
										return
									var/obj/Items/gems/DiamondRing/LB = new
									LB.loc = M.loc
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									usr.rgold-=1
									del(S)
									break
									return
				if (Result2 == "Gold Emerald Ring")
					if(M in range(1,src))
						for(var/obj/Items/gems/Emerald/S in M)
							if(S.Content == "Flawless")
								if(usr.rgold>=1)
									var/success
									success = prob(M.JewlCraftingSkill)
									if(success == 0)
										usr<< "failed!"
										M.weight -= S.weight
										usr.rgold-=1
										del(S)
										break
										M.JewlCraftingSkill+=2
										return
									var/obj/Items/gems/EmeraldRing/LB = new
									LB.loc = M.loc
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									usr.rgold-=1
									del(S)
									break
									return
				if (Result2 == "Plant Fibre Ring")
					if(M in range(1,src))
						for(var/obj/Items/Glands/PoisonRoots/S in M)
							if(usr.rgold>=1)
								var/success
								success = prob(M.JewlCraftingSkill*4)
								if(success == 0)
									usr<< "failed!"
									M.weight -= S.weight
									usr.rgold-=1
									del(S)
									break
									M.JewlCraftingSkill+=2
									return
								var/obj/Items/gems/PlantFibreRing/LB = new
								LB.loc = M.loc
								M.JewlCraftingSkill += 1
								M.weight -= S.weight
								usr.rgold-=1
								del(S)
								break
							return