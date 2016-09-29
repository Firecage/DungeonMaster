mob/proc/lizardmandata(var/mob/M)
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
mob/proc/lizardmanCHILDdata(var/mob/CHILD,var/mob/FATHER,var/mob/MOTHER)
	var/GENDER
	//CHILD.MagicalAptitude=prob(7)
	GENDER=prob(50)
	if(GENDER)
		CHILD.Gender = "Male"
	else
		CHILD.Gender = "Female"
	if(CHILD.Gender=="Female")
		CHILD.overlays+=icon('Female.dmi',"Unders")
mob/proc/lizardmanNPCdata()
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
mob/verb/spawnLizardman()
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
				spawnLizardman()
				//winshow(src,"RaceSelection",1)
			if("No")
				src << "<BIG><b><font color=gold>You must restart to select a new race."
	else
		restartpressed=0
		mobtype = "Lizardman"
		var/TYPE = text2path("/mob/Monsters/[mobtype]")
		var/LOC
		var/NUMBER = 3
		src.hasunits+=1
		LOC=LocateValidLocation(X=175,XX=365,Y=675,YY=785)
		var/CURNUM=0
		if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
			CURNUM+=1
			if(NUMBER>1)
				switch(CURNUM)
					if(1)
						M.x-=1
						lizardmandata(M)
					if(2)
						loc = M.loc
						lizardmandata(M)
					if(3)
						M.x += 1
						lizardmandata(M)
					if(4)
						M.y += 1
						lizardmandata(M)
					if(5)
						M.y -= 1
						lizardmandata(M)
					else
						loc = M.loc
			M.ForcePickUpItem(new/obj/Items/Furniture/Beds/SleepingBag)
			M.ForcePickUpItem(new/obj/Items/Food/Meat(loc))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Picks/PickAxe,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Spears/Spear,"Quality"))
			for(var/obj/Items/Equipment/E in M)
				M.EquipItem(E)
			if(M.weight>M.weightmax)
				M.weightmax=M.weight+30
			winshow(src,"RaceSelection",0)
			M.ChangeOwnership(src)
			M.name="{[name]} [M.name]"
			M.CantBeGiven=1
			M.PillarPowerup()
			lizardmanstartalert()

