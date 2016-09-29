obj
	proc
		Quality(obj/Items/LB,craftingSkill)
			for(var/mob/Monsters/M in usr.Selected)
				if(craftingSkill >= 299)
					LB.CraftRank = "Supernatural Quality"
					M.Owner << "<br><B><li><h3><font color=green>[M] just made a [LB] [LB.CraftRank]<br>"
				else
					if(craftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
						M.Owner << "<br><B><li><h3><font color=green>[M] just made a [LB] [LB.CraftRank]<br>"
					else
						if(craftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
							M.Owner << "<br><B><li><h3><font color=green>[M] just made a [LB] [LB.CraftRank]<br>"
						else
							if(craftingSkill >= 61)
								LB.CraftRank = "Masterful Quality"
								M.Owner << "<br><B><li><h3><font color=green>[M] just made a [LB] [LB.CraftRank]<br>"
							else
								if(craftingSkill >= 51)
									LB.CraftRank = "Grand Quality"
									M.Owner << "<br><B><li><h3><font color=green>[M] just made a [LB] [LB.CraftRank]<br>"
								else
									if(craftingSkill >= 41)
										LB.CraftRank = "Impressive Quality"
										M.Owner << "<br><B><li><h3><font color=green>[M] just made a [LB] [LB.CraftRank]<br>"
									else
										if(craftingSkill >= 31)
											LB.CraftRank = "Quality"
											M.Owner << "<br><B><li><h3><font color=green>[M] just made a [LB] [LB.CraftRank]<br>"
										else
											if(craftingSkill >= 21)
												LB.CraftRank = "Average Quality"
												M.Owner << "<br><B><li><h3><font color=green>[M] just made a [LB] [LB.CraftRank]<br>"
											else
												if(craftingSkill >= 1)
													LB.CraftRank = "Poor Quality"
													M.Owner << "<br><B><li><h3><font color=green>[M] just made a [LB] [LB.CraftRank]<br>"
												else
													usr << "This is a bug you shouldn't have zero of any skill, Please report it to an admin."
													LB.CraftRank = "Report to Admin"
													M.Owner << "<br><B><li><h3><font color=green>[M] just made a [LB] [LB.CraftRank]<br>"


obj/proc/DoorCraft()
	switch(CraftRank)
		if("Poor Quality") HP = rand(400,500)
		if("Average Quality") HP = rand(600,650)
		if("Quality") HP = rand(700,750)
		if("Impressive Quality") HP = rand(800,950)
		if("Grand Quality") HP = rand(1000,1050)
		if("Masterful Quality") HP = rand(1100,1150)
		if("Epic Quality") HP = rand(1200,1250)
		if("Legendary Quality") HP = rand(1300,1350)
		if("Supernatural Quality") HP = rand(1500,1700)
	name = "[src] - [src.CraftRank]"
	desc = "this is a [src] it looks like it could take [src.HP] Damage."
obj/proc/FurnitureCraft()
	switch(CraftRank)
		if("Poor Quality") CR = rand(1,5)
		if("Average Quality") CR = rand(5,10)
		if("Quality") CR = rand(20,30)
		if("Impressive Quality") CR = rand(30,40)
		if("Grand Quality") CR = rand(40,50)
		if("Masterful Quality") CR = rand(50,60)
		if("Epic Quality") CR = rand(70,80)
		if("Legendary Quality") CR = rand(127,138)
		if("Supernatural Quality") CR = rand(190,250)
	name = "[src] - [CraftRank]"
	desc = "this is [src] it has a impressiveness rating of [src.CR]."
obj/proc/TrainCraft()
	switch(CraftRank)
		if("Poor Quality") Content3 = 1.5
		if("Average Quality") Content3 = 1.6
		if("Quality") Content3 = 1.7
		if("Impressive Quality") Content3 = 1.8
		if("Grand Quality") Content3 = 1.85
		if("Masterful Quality") Content3 = 1.9
		if("Epic Quality") Content3 = 1.95
		if("Legendary Quality") Content3 = 2
		if("Supernatural Quality") Content3 = 2
	name = "[src] - [CraftRank]"
	desc = "this is a [src] it grants [Content3] experience per hit."
obj/proc/MetalWeaponCraft()
	switch(CraftRank)
		if("Poor Quality")
			WeaponDamageMin = 15
			WeaponDamageMax = 20
		if("Average Quality")
			WeaponDamageMin = 18
			WeaponDamageMax = 22
		if("Quality")
			WeaponDamageMin = 20
			WeaponDamageMax = 24
		if("Impressive Quality")
			WeaponDamageMin = 21
			WeaponDamageMax = 25
		if("Grand Quality")
			WeaponDamageMin = 22
			WeaponDamageMax = 25
		if("Masterful Quality")
			WeaponDamageMin = 22
			WeaponDamageMax = 26
		if("Epic Quality")
			WeaponDamageMin = 22
			WeaponDamageMax = 28
		if("Legendary Quality")
			WeaponDamageMin = 25
			WeaponDamageMax = 30
		if("Supernatural Quality")
			WeaponDamageMin = 50
			WeaponDamageMax = 60
		if("Holy Quality")
			WeaponDamageMin = 26
			WeaponDamageMax = 32
		if("Unholy Quality")
			WeaponDamageMin = 20
			WeaponDamageMax = 40
	name = "[name] - [CraftRank]"
	if(Silver)
		WeaponDamageMin-=5
		WeaponDamageMax-=5
obj/proc/BoneWeaponCraft()
	MetalWeaponCraft()
	WeaponDamageMin-=5
	WeaponDamageMax+=5
obj/proc/AdamantiumWeaponCraft()
	CraftRank="Legendary Quality"
	WeaponDamageMin = 30
	WeaponDamageMax = 40
	name = "[name] - [src.CraftRank]"
obj/proc/Machinery()
	name = "[src] - [CraftRank]"
obj/proc/AdamantiumArmourCraft()
	CraftRank="Legendary Quality"
	Defence = 18.5
	name = "[src] - [CraftRank]"

//Base defence of 20, plus 10 for holy shield, then rare cape + 5 copies of armor.
//Thus, 40-ish base defence, aiming for 50 room from 250
obj/proc/MetalArmourCraft()
	switch(CraftRank)
		if("Poor Quality") Defence = 10
		if("Average Quality") Defence = 11
		if("Quality") Defence = 12
		if("Impressive Quality") Defence = 13
		if("Grand Quality") Defence = 14
		if("Masterful Quality") Defence = 15
		if("Epic Quality") Defence = 16
		if("Legendary Quality") Defence = 17
		if("Supernatural Quality") Defence = 18
		if("Holy Quality") Defence = 17
		if("Unholy Quality") Defence = 18
	name = "[src] - [CraftRank]"
obj/proc/BoneArmourCraft()
	switch(CraftRank)
		if("Poor Quality") Defence = 5
		if("Average Quality") Defence = 6
		if("Quality") Defence = 7
		if("Impressive Quality") Defence = 8
		if("Grand Quality") Defence = 9
		if("Masterful Quality") Defence = 10
		if("Epic Quality") Defence = 11
		if("Legendary Quality") Defence = 12
		if("Supernatural Quality") Defence = 15
		if("Holy Quality") Defence = 13
		if("Unholy Quality") Defence = 14
	name = "[src] - [CraftRank]"