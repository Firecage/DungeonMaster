mob/proc/humandata(var/mob/M)
	var/GENDER
	if(M.Age <= 0)
		M.Age = rand(20,30)
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
		M.Hair="Human[pick("Black","Brown")]"
		M.overlays+=icon('Female.dmi',"Unders")
	else
		M.Hair=0
	if(prob(50))
		M.Black=1
		M.icon = 'HumanBlack.dmi'
mob/proc/humanCHILDdata(var/mob/CHILD,var/mob/FATHER,var/mob/MOTHER)
	var/GENDER
	//CHILD.birthday = Day
	//CHILD.birthmonth = Month
	//CHILD.birthyear = Year
	CHILD.MagicalAptitude=prob(9)
	GENDER=prob(50)
	if(GENDER)
		CHILD.Gender = "Male"
	else
		CHILD.Gender = "Female"
	if(CHILD.Gender=="Female")
		CHILD.Hair="Human[pick("Black","Brown")]"
		CHILD.overlays+=icon('Hair.dmi',"[Hair]")
		CHILD.overlays+=icon('Female.dmi',"Unders")
	else
		CHILD.Hair=0
	if(FATHER.Black==1 && MOTHER.Black==1)
		CHILD.Black=1
		CHILD.icon = 'HumanBlack.dmi'
	else
		if(FATHER.Black==0 && MOTHER.Black==0)
			CHILD.Black=0
		else
			if(FATHER.Black==0 && MOTHER.Black==1)
				if(prob(50))
					CHILD.Black=1
					CHILD.icon = 'HumanBlack.dmi'
			else
				if(FATHER.Black==1 && MOTHER.Black==0)
					if(prob(50))
						CHILD.Black=1
						CHILD.icon = 'HumanBlack.dmi'

	CHILD.MagicalAptitude=prob(10)
	crossbreed(CHILD,FATHER,MOTHER)
mob/proc/humanNPCdata()
	var/GENDER
	Age = rand(20,30)
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
	if(Gender=="Female")
		Hair="Human[pick("Black","Brown")]"
	else
		Hair=0
	if(prob(50))
		Black=1
		icon = 'HumanBlack.dmi'
mob/verb/spawnHuman()
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
				//winshow(src,"RaceSelection",1)
				spawnHuman()
			if("No")
				src << "<BIG><b><font color=gold>You must restart to select a new race."
	else
		restartpressed=0
		mobtype = "Human"
		var/TYPE = text2path("/mob/Monsters/[mobtype]")
		var/LOC
		var/NUMBER = 3
		src.hasunits=1
		LOC=LocateValidLocation(X=240,XX=850,Y=210,YY=800)
		var/CURNUM=0
		if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
			CURNUM+=1
			if(NUMBER>1)
				switch(CURNUM)
					if(1)
						M.x-=1
						humandata(M)
					if(2)
						loc = M.loc
						humandata(M)
					if(3)
						M.x += 1
						humandata(M)
					if(4)
						M.y += 1
						humandata(M)
					if(5)
						M.y -= 1
						humandata(M)
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
			humanstartalert()