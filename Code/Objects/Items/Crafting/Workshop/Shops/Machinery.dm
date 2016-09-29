/*This is where I will begin design the new skill of machinary for humans*/
obj
	WorkShops
		Tinkertable
			density = 1
			layer = 4
			icon_state = "Machinery"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Race == "Human")
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
							if(M.Race == "Human")
								menu2 += "General Parts"
								menu2 += "Automaton Parts"
								menu2 += "Weapons"
								menu2 += "Clockwork Pets"
							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
			//Begin General Parts Section
							if(Result2 == "General Parts")
								var/list/menu3 = new()
								if(M.Race == "Human")
									menu3 += "Gear"
									menu3 += "Clockwork"
									menu3 += "Metal Hands"
									menu3 += "Bell"
									menu3 += "Whistle"
									menu3 += "Simple Pully"
									menu3 += "Power Core"
								menu3 += "Cancel"
								var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
								if (Result3 != "Cancel")
									..()
								if(Result3 == "Gear")
									if(M in range(1,src))
										var/obj/Items/Machinery/Parts/Gear/LB = new
										craft(LB,M.Machinery,usr.gulver,7,12)
										break
										return

								if(Result3 == "Clockwork")
									if(M in range(1,src))
										var/obj/Items/Machinery/Parts/Clockwork/LB = new
										craft(LB,M.Machinery,usr.gulver,7,12)
										break
										return
								if(Result3 == "Whistle")
									if(M in range(1,src))
										var/obj/Items/Machinery/Parts/Whistle/LB = new
										craft(LB,M.Machinery,usr.gulver,7,12)
										break
										return

								if(Result3 == "Power Core")
									if(M in range(1,src))
										for(var/obj/Comet/S in M)
											if(prob(M.Machinery*3))
												var/obj/Items/Machinery/Parts/PowerCore/LB = new
												LB.loc = M.loc
												if(M.Machinery >= 299)
													LB.CraftRank = "Supernatural Quality"
												if(M.Machinery >= 90)
													LB.CraftRank = "Epic Quality"
												if(M.Machinery >= 100)
													LB.CraftRank = "Legendary Quality"
												if(M.Machinery <= 90)
													LB.CraftRank = "Epic Quality"
												if(M.Machinery <= 75)
													LB.CraftRank = "Masterful Quality"
												if(M.Machinery <= 60)
													LB.CraftRank = "Grand Quality"
												if(M.Machinery <= 50)
													LB.CraftRank = "Impressive Quality"
												if(M.Machinery <= 40)
													LB.CraftRank = "Quality"
												if(M.Machinery <= 30)
													LB.CraftRank = "Average Quality"
												if(M.Machinery <= 20)
													LB.CraftRank = "Poor Quality"
												LB.Machinery()
												M.Machinery += 4
												M.weight -= S.weight
												del(S)
												break
												return
											else
												usr<< "failed!"
												M.weight -= S.weight
												M.Machinery += 4
												del(S)
												break
												return


			//Begin Automatom Parts Section
							if(Result2 == "Automaton Parts")
								var/list/menu3 = new()
								if(M.Race == "Human")
									menu3 += "Automaton Vessal"
									menu3 += "Automaton Shielding"
									menu3 += "Automaton Complete"
								menu3 += "Cancel"
								var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
								if (Result3 != "Cancel")
									..()
								if(Result3 == "Automaton Vessal")
									if(M in range(1,src))
										if(M.Machinery >= 50)
											var/obj/Items/Machinery/Parts/AutomatonVessal/LB = new
											craft(LB,M.Machinery,usr.gulver,7,12)
											break
											return
										else
											M.Owner << "You need a Machinery skill of at least 50."
											return
								if(Result3 == "Automaton Shielding")
									if(M in range(1,src))
										if(M.Machinery >= 50)
											var/obj/Items/Machinery/Parts/AutomatonShielding/LB = new
											craft(LB,M.Machinery,usr.gulver,7,12)
											break
											return
										else
											M.Owner << "You need a Machinery skill of at least 50."
											return
								if(Result3 == "Automaton Complete")
									if(M in range(1,src))
										if(M.Machinery >= 50)
											var/obj/Items/Machinery/Parts/AutomatonVessal/S
											var/obj/Items/Machinery/Parts/AutomatonShielding/C
											var/obj/Items/Machinery/Parts/PowerCore/D
											var/obj/Items/Machinery/Parts/Whistle/DD
											var/obj/Items/Machinery/Parts/Clockwork/MS
											for(S in M) break
											for(D in M) break
											for(DD in M) break
											for(C in M) break
											for(MS in M) break
											if(S&&D&&DD&&C&&MS)
												M.Machinery+=100
												var/mob/Monsters/Automaton/G=new(M.loc)
												G.ChangeOwnership(M.Owner)
												G.PillarPowerup()
												G.name="{[usr]} Automaton"
												G.Strength+=MS.Strength/12
												G.Agility+=MS.Agility/12
												G.weightmax+=MS.weightmax
												G.Defence+=MS.Strength/12+Agility/12
												view(M) << "<b><font color=red>[G.name] blinks to life before [M]'s eyes."
												M.weight -= S.weight + D.weight + DD.weight + MS.weight + C.weight
												del(S)
												del(D)
												del(DD)
												del(C)
												del(MS)
												return
											else
												M.Owner << "You need 1 automaton vessal 1 automaton shielding 1 powercore 1 whistle 1 clockwork."

										else
											M.Owner << "You need a Machinery skill of at least 50."
											return
							if(Result2 == "Weapons")
							if(Result2 == "Clockwork Pets")
								var/list/menu3 = new()
								if(M.Race == "Human")
									menu3 += "Cat"
								menu3 += "Cancel"
								var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
								if (Result3 != "Cancel")
									..()
								if(Result3 == "Cat")
									if(M in range(1,src))
										if(M.Machinery >= 10)
											var/obj/Items/Machinery/Parts/PowerCore/D
											var/obj/Items/Machinery/Parts/Whistle/DD
											var/obj/Items/Machinery/Parts/Clockwork/MS
											for(D in M) break
											for(DD in M) break
											for(MS in M) break
											if(D&&DD&&MS)
												M.Machinery+=0.9
												del(D)
												del(DD)
												del(MS)
												return
											else
												M.Owner << "A mechanical cat requires at least a powercore,whistle and a clockwork..."
												return

										else
											M.Owner << "You need a Machinery skill of at least 10."
											return



					else
						if(clickcooldown==0)
							usr << "[src] is human technology,[M] is not sure what to do with this."
							clickcooldown()

var
	clickcooldown=0

proc/clickcooldown()
	clickcooldown=1
	spawn(100)
		clickcooldown=0
