/*proc/spawnSandKing()
	set hidden = 1
	if(usr.hasunits == 1)
		switch(alert("You already have units would you like to remove them?","You sure?","Yes","No"))
			if("Yes")
				src << "<BIG><b><font color=gold>You may now select a new race from the menu."
				for(var/mob/Monsters/M in UnitList)
					del M
					usr.hasunits = 0
			if("No")
				src << "<BIG><b><font color=gold>You must restart to select a new race."
	else
		mobtype = "SandKing"
		var/TYPE = text2path("/mob/Monsters/[mobtype]")
		var/LOC
		var/NUMBER = 1
		src.hasunits+=1
		LOC=LocateValidLocation(Z=2)
		var/CURNUM=0
		if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
			CURNUM+=1
			if(NUMBER>1)
				switch(CURNUM)
					if(1)
						M.x-=1
						M.ForcePickUpItem(new/obj/Items/ores/stone(loc))
						loc = M.loc
					if(2)
						loc = M.loc
					if(3)
						M.x += 1
					if(4)
						M.y += 1
					if(5)
						M.y -= 1
					else
						loc = M.loc
			M.ForcePickUpItem(new/obj/Items/Food/Meat(loc))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Helmet/RedHat,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/RedRobe,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Maces/NecroStaff,"Quality"))
			for(var/obj/Items/Equipment/E in M)
				M.EquipItem(E)
			if(M.weight>M.weightmax)
				M.weightmax=M.weight+30
			winshow(src,"RaceSelection",0)
			loc = M.loc
			M.ChangeOwnership(src)
			M.name="{[name]} [M.name]"
			M.CantBeGiven=1
			M.PillarPowerup()
			alert(src,"A Dark God of another land has destroyed your family, and cursed you with longevity and power, only to warp your appearance and seperate you from the rest of mankind.","Svartalfar")
*/
mob/verb/spawnSandKing()
	set hidden = 1
	if(usr.hasunits == 1)
		switch(alert("You already have units would you like to remove them?","You sure?","Yes","No"))
			if("Yes")
				src << "<BIG><b><font color=gold>You may now select a new race from the menu."
				for(var/mob/Monsters/M in UnitList)
					del M
					usr.hasunits = 0
			if("No")
				src << "<BIG><b><font color=gold>You must restart to select a new race."
	else
		mobtype = "SandKing"
		var/TYPE = text2path("/mob/Monsters/[mobtype]")
		var/LOC
		var/NUMBER = 1
		src.hasunits+=1
		LOC=LocateValidLocation(Z=2)
		var/CURNUM=0
		if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
			CURNUM+=1
			if(NUMBER>1)
				switch(CURNUM)
					if(1)
						M.x-=1
						M.ForcePickUpItem(new/obj/Items/ores/stone(loc))
						loc = M.loc
					if(2)
						loc = M.loc
					if(3)
						M.x += 1
					if(4)
						M.y += 1
					if(5)
						M.y -= 1
					else
						loc = M.loc
			M.ForcePickUpItem(new/obj/Items/Food/Meat(loc))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Helmet/RedHat,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/RedRobe,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Maces/NecroStaff,"Quality"))
			for(var/obj/Items/Equipment/E in M)
				M.EquipItem(E)
			if(M.weight>M.weightmax)
				M.weightmax=M.weight+30
			winshow(src,"RaceSelection",0)
			loc = M.loc
			M.ChangeOwnership(src)
			M.name="{[name]} [M.name]"
			M.CantBeGiven=1
			M.PillarPowerup()
			alert(src,"A minor diety of sorts said to have been born from the sands of time its self you set out upon the world shaping it to your will.","SandKing")
/*proc/spawnIllithid
	set hidden = 1
	if(usr.hasunits == 1)
		switch(alert("You already have units would you like to remove them?","You sure?","Yes","No"))
			if("Yes")
				src << "<BIG><b><font color=gold>You may now select a new race from the menu."
				for(var/mob/Monsters/M in UnitList)
					del M
					usr.hasunits = 0
			if("No")
				src << "<BIG><b><font color=gold>You must restart to select a new race."
	else
		mobtype = "Illithid"
		var/TYPE = text2path("/mob/Monsters/[mobtype]")
		var/LOC
		var/NUMBER = 1
		src.hasunits+=1
		LOC=LocateValidLocation(Z=2)
		var/CURNUM=0
		if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
			CURNUM+=1
			if(NUMBER>1)
				switch(CURNUM)
					if(1)
						M.x-=1
						M.ForcePickUpItem(new/obj/Items/ores/stone(loc))
						loc = M.loc
					if(2)
						loc = M.loc
					if(3)
						M.x += 1
					if(4)
						M.y += 1
					if(5)
						M.y -= 1
					else
						loc = M.loc
			M.ForcePickUpItem(new/obj/Items/Food/Meat(loc))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Helmet/RedHat,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/RedRobe,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Maces/NecroStaff,"Quality"))
			for(var/obj/Items/Equipment/E in M)
				M.EquipItem(E)
			if(M.weight>M.weightmax)
				M.weightmax=M.weight+30
			winshow(src,"RaceSelection",0)
			loc = M.loc
			M.ChangeOwnership(src)
			M.name="{[name]} [M.name]"
			M.CantBeGiven=1
			M.PillarPowerup()
			alert(src,"A Dark God of another land has destroyed your family, and cursed you with longevity and power, only to warp your appearance and seperate you from the rest of mankind.","Svartalfar")

*/
mob/verb/spawnIllithid()
	set hidden = 1
	if(usr.hasunits == 1)
		switch(alert("You already have units would you like to remove them?","You sure?","Yes","No"))
			if("Yes")
				src << "<BIG><b><font color=gold>You may now select a new race from the menu."
				for(var/mob/Monsters/M in UnitList)
					del M
					usr.hasunits = 0
			if("No")
				src << "<BIG><b><font color=gold>You must restart to select a new race."
	else
		mobtype = "Illithid"
		var/TYPE = text2path("/mob/Monsters/[mobtype]")
		var/LOC
		var/NUMBER = 1
		src.hasunits+=1
		LOC=LocateValidLocation(Z=1)
		var/CURNUM=0
		if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
			CURNUM+=1
			if(NUMBER>1)
				switch(CURNUM)
					if(1)
						M.x-=1
						M.ForcePickUpItem(new/obj/Items/ores/stone(loc))
						loc = M.loc
					if(2)
						loc = M.loc
					if(3)
						M.x += 1
					if(4)
						M.y += 1
					if(5)
						M.y -= 1
					else
						loc = M.loc
			M.ForcePickUpItem(new/obj/Items/Food/Meat(loc))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Helmet/RedHat,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/RedRobe,"Quality"))
			for(var/obj/Items/Equipment/E in M)
				M.EquipItem(E)
			if(M.weight>M.weightmax)
				M.weightmax=M.weight+30
			winshow(src,"RaceSelection",0)
			loc = M.loc
			M.ChangeOwnership(src)
			M.name="{[name]} [M.name]"
			M.CantBeGiven=1
			M.PillarPowerup()
			alert(src,"The once and great and powerful Illithid race struck down by the gods out of fear of there power the few that remain such as yourself are scattered throughout the land.","Illithid")

