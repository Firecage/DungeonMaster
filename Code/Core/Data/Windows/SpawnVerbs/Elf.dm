mob/proc/elfdata(var/mob/M)
	var/GENDER
	GENDER=prob(50)
	M.Age = rand(20,30)
	if(GENDER)
		M.Gender = "Male"
	else
		M.Gender = "Female"
	M.Hair="Elf[M.Gender]"
	M.birthday = Day
	M.birthmonth = Month
	M.birthyear = Year - M.Age
mob/proc/elfNPCdata()
	var/GENDER
	GENDER=prob(50)
	Age = rand(20,30)
	if(GENDER)
		Gender = "Male"
	else
		Gender = "Female"
	Hair="Elf[Gender]"
	birthday = Day
	birthmonth = Month
	birthyear = Year - Age
mob/proc/elfCHILDdata(var/mob/CHILD,var/mob/FATHER,var/mob/MOTHER)
	var/GENDER
	CHILD.birthday = Day
	CHILD.birthmonth = Month
	CHILD.birthyear = Year
	GENDER=prob(50)
	if(GENDER)
		CHILD.Gender = "Male"
	else
		CHILD.Gender = "Female"
	CHILD.Hair="Elf[CHILD.Gender]"
	crossbreed(CHILD,FATHER,MOTHER)
	CHILD.MagicalAptitude=prob(12)
mob/verb/spawnElf()
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
				spawnElf()
				//winshow(src,"RaceSelection",1)
			if("No")
				src << "<BIG><b><font color=gold>You must restart to select a new race."
	else
		restartpressed=0
		mobtype = "Elf"
		var/TYPE = text2path("/mob/Monsters/[mobtype]")
		var/LOC
		var/NUMBER = 3
		src.hasunits+=1
		LOC=LocateValidLocation(X=600,XX=850,Y=200,YY=800)
		var/CURNUM=0
		if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
			CURNUM+=1
			if(NUMBER>1)
				switch(CURNUM)
					if(1)
						M.x-=1
						M.ForcePickUpItem(new/obj/Items/woods/wood(loc))
						elfdata(M)
					if(2)
						loc = M.loc
						elfdata(M)
					if(3)
						M.x += 1
						elfdata(M)
					if(4)
						M.y += 1
						elfdata(M)
					if(5)
						M.y -= 1
						elfdata(M)
					else
						loc = M.loc
			M.ForcePickUpItem(new/obj/Items/Furniture/Beds/SleepingBag)
			M.ForcePickUpItem(new/obj/Items/Food/Meat(loc))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Picks/PickAxe,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Axes/WoodenAxe,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/WoodenChestplate,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Leggings/WoodenLeggings,"Quality"))
			for(var/obj/Items/Equipment/E in M)
				M.EquipItem(E)
			if(M.weight>M.weightmax)
				M.weightmax=M.weight+30
			winshow(src,"RaceSelection",0)
			M.ChangeOwnership(src)
			M.name="{[name]} [M.name]"
			M.CantBeGiven=1
			M.PillarPowerup()
			elfstartalert()

