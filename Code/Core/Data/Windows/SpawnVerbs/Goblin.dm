mob/proc/goblindata(var/mob/M)
	var/GENDER
	if(M.Age <= 0)
		M.Age = rand(20,60)
	M.birthday = Day
	M.birthmonth = Month
	if(M.birthyear <= 0 || M.birthyear == null)
		M.birthyear = Year - M.Age
	GENDER=prob(50)
	if(GENDER)
		M.Gender = "Male"
	else
		M.Gender = "Female"
	if(M.Gender=="Female")
		M.overlays+=icon('Female.dmi',"Unders")
mob/proc/goblinCHILDdata(var/mob/CHILD,var/mob/FATHER,var/mob/MOTHER)
	var/GENDER
	CHILD.MagicalAptitude=prob(7)
	GENDER=prob(50)
	if(GENDER)
		CHILD.Gender = "Male"
	else
		CHILD.Gender = "Female"
	if(CHILD.Gender=="Female")
		CHILD.overlays+=icon('Female.dmi',"Unders")
mob/proc/goblinNPCdata()
	var/GENDER
	Age = rand(20,60)
	birthday = Day
	birthmonth = Month
	if(birthyear <= 0 || birthyear == null)
		birthyear = Year - Age
	GENDER=prob(50)
	if(GENDER)
		Gender = "Male"
	else
		Gender = "Female"
		overlays+=icon('Female.dmi',"Unders")
mob/verb/spawnGoblin()
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
				spawnGoblin()
				//winshow(src,"RaceSelection",1)
			if("No")
				src << "<BIG><b><font color=gold>You must restart to select a new race."
	else
		mobtype = "Goblin"
		var/TYPE = text2path("/mob/Monsters/[mobtype]")
		var/LOC
		var/NUMBER = 3
		src.hasunits+=1
		LOC=LocateValidLocation(X=240,XX=850,Y=210,YY=800)
		var/CURNUM=0
		if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
			CURNUM+=1
			if(NUMBER>1)
				switch(CURNUM)
					if(1)
						M.x-=1
						goblindata(M)
					if(2)
						loc = M.loc
						goblindata(M)
					if(3)
						M.x += 1
						goblindata(M)
					if(4)
						M.y += 1
						goblindata(M)
					if(5)
						M.y -= 1
						goblindata(M)
					else
						loc = M.loc
			M.ForcePickUpItem(new/obj/Items/Furniture/Beds/SleepingBag)
			M.ForcePickUpItem(new/obj/Items/Food/Meat(loc))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Picks/PickAxe,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Swords/GoblinSword,"Quality"))
			for(var/obj/Items/Equipment/E in M)
				M.EquipItem(E)
			if(M.weight>M.weightmax)
				M.weightmax=M.weight+30
			winshow(src,"RaceSelection",0)
			M.ChangeOwnership(src)
			M.name="{[name]} [M.name]"
			M.CantBeGiven=1
			M.PillarPowerup()
			goblintartalert()

