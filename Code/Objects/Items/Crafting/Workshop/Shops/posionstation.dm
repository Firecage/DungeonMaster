obj/WorkShops/PoisonStation
	name = "PoisonStation"
	icon_state = "Poison"
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Race == "Spider")
				return
			if(M.Wagon == 1)
				return
			if(M.UsesPoison)
				var/list/menu = new()
				menu += "Craft"
				menu += "Destroy"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Destroy")
					if(M in range(1,src))
						DestroyPoison()
				if (Result == "Craft")
					var/list/menu2 = new()
					menu2 += "Extract Poison"
					menu2 += "Extract Toxic"
					if(M.Race == "Orc")
						menu2 += "Extract Strong Poison"
					menu2 += "Cancel"
					var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
					if (Result2 != "Cancel")
						..()
					if (Result2 == "Extract Toxic")
						if(M in range(1,src))
							for(var/obj/Items/Glands/ToxicGland/S in M)
								var/success
								success = prob(M.PoisonSkill*4)
								if(success == 0)
									usr<< "failed!"
									M.weight -= S.weight
									del(S)
									M.PoisonSkill += 1
									break
									return
								var/obj/Items/Poisons/StrongPoison/LB = new
								LB.loc = M.loc
								LB.PoisonContent = M.PoisonSkill *2
								M.PoisonSkill += 1
								M.weight -= S.weight
								del(S)
								break
								return
					if (Result2 == "Extract Strong Poison")
						if(M in range(1,src))
							for(var/obj/Items/Glands/PoisonRoots/S in M)
								var/success
								success = prob(M.PoisonSkill*4)
								if(success == 0)
									usr<< "failed!"
									M.weight -= S.weight
									M.PoisonSkill += 1
									del(S)
									break
									return
								var/obj/Items/Poisons/Poison/LB = new
								LB.loc = M.loc
								LB.PoisonContent = M.PoisonSkill*3
								M.PoisonSkill += 1
								M.weight -= S.weight
								del(S)
								break
								return
							M.Owner << "You need poison spore plant roots to make this."
					if (Result2 == "Extract Poison")
						if(M in range(1,src))
							for(var/obj/Items/Glands/PoisonRoots/S in M)
								var/success
								success = prob(M.PoisonSkill*4)
								if(success == 0)
									usr<< "failed!"
									M.weight -= S.weight
									M.PoisonSkill += 1
									del(S)
									break
									return
								var/obj/Items/Poisons/Poison/LB = new
								LB.loc = M.loc
								LB.PoisonContent = M.PoisonSkill
								M.PoisonSkill += 1
								M.weight -= S.weight
								del(S)
								break
								return
							for(var/obj/Items/Glands/PoisonGland/S in M)
								var/success
								success = prob(M.PoisonSkill*4)
								if(success == 0)
									usr<< "failed!"
									M.weight -= S.weight
									M.PoisonSkill += 1
									del(S)
									break
									return
								var/obj/Items/Poisons/Poison/LB = new
								LB.loc = M.loc
								LB.PoisonContent = M.PoisonSkill
								M.PoisonSkill += 1
								M.weight -= S.weight
								del(S)
								break
								return