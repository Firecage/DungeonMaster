mob/proc/dwarfdata(var/mob/M)
	var/GENDER
	GENDER=prob(50)
	M.Age = rand(20,30)
	if(GENDER)
		M.Gender = "Male"
		M.Beard = pick("Grey","Brown","Black")
		M.Hair = 0
	else
		M.Gender = "Female"
		M.Beard = 0
		M.Hair = "HumanBrown"
	M.birthday = Day
	M.birthmonth = Month
	M.birthyear = Year - M.Age
mob/proc/dwarfNPCdata()
	var/GENDER
	GENDER=prob(50)
	Age = rand(20,30)
	if(GENDER)
		Gender = "Male"
		Beard = pick("Grey","Brown","Black")
		Hair = 0
	else
		Gender = "Female"
		Beard = 0
		Hair = "HumanBrown"
	birthday = Day
	birthmonth = Month
	birthyear = Year - Age
mob/proc/dwarfCHILDdata(var/mob/CHILD,var/mob/FATHER,var/mob/MOTHER)
	var/GENDER
	GENDER=prob(50)
	CHILD.Age = rand(20,30)
	if(GENDER)
		CHILD.Gender = "Male"
		CHILD.Beard = pick("Grey","Brown","Black")
		CHILD.Hair = 0
	else
		CHILD.Gender = "Female"
		CHILD.Beard = 0
		CHILD.Hair = "HumanBrown"
	CHILD.birthday = Day
	CHILD.birthmonth = Month
	CHILD.birthyear = Year
	crossbreed(CHILD,FATHER,MOTHER)
mob/verb/spawnDwarf()
	set hidden = 1
	if(usr.hasunits == 1)
		switch(alert("You already have units would you like to remove them?","You sure?","Yes","No"))
			if("Yes")
				//src << "<BIG><b><font color=gold>You may now select a new race from the menu."
				for(var/mob/Monsters/M in UnitList)
					del M
					hasunits = 0
				hasunits = 0
				usr.CoolDown("[GenderToLeader(Gender)]",0)
				spawnDwarf()
			if("No")
				src << "<BIG><b><font color=gold>You must restart to select a new race."
	else
		restartpressed=0
		mobtype = "Dwarf"
		var/TYPE = text2path("/mob/Monsters/[mobtype]")
		var/LOC
		var/NUMBER = 3
		src.hasunits+=1
		LOC=LocateValidLocation(X=240,XX=350,Y=263,YY=666)
		var/CURNUM=0
		if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
			CURNUM+=1
			if(NUMBER>1)
				switch(CURNUM)
					if(1)
						M.x-=1
						M.ForcePickUpItem(new/obj/Items/ores/stone(loc))
						dwarfdata(M)
					if(2)
						loc = M.loc
						dwarfdata(M)
						RebuildOverlays()
					if(3)
						M.x += 1
						dwarfdata(M)
					if(4)
						M.y += 1
						dwarfdata(M)
					if(5)
						M.y -= 1
						dwarfdata(M)
					else
						loc = M.loc
			M.ForcePickUpItem(new/obj/Items/Furniture/Beds/SleepingBag)
			M.ForcePickUpItem(new/obj/Items/Food/Meat/Cooked_Meat)
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Daggers/MetalDagger,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Picks/PickAxe,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Axes/MetalAxe,"Quality"))
			for(var/obj/Items/Equipment/E in M)
				M.EquipItem(E)
			if(M.weight>M.weightmax)
				M.weightmax=M.weight+30
			winshow(src,"RaceSelection",0)
			M.ChangeOwnership(src)
			M.name="{[name]} [M.name]"
			M.CantBeGiven=1
			M.PillarPowerup()
			dwarfstartalert()

