mob/verb/spawnDev()
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
				spawnDev()
			if("No")
				src << "<BIG><b><font color=gold>You must restart to select a new race."
	else
		mobtype = "Devourer"
		var/TYPE = text2path("/mob/Monsters/[mobtype]")
		var/LOC
		var/NUMBER = 1
		src.hasunits+=1
		LOC=LocateValidLocation(X=240,XX=850,Y=210,YY=800)
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
			M.ForcePickUpItem(new/obj/Items/Food/Meat/Cooked_Meat)
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings,"Quality"))
			M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Daggers/MetalDagger,"Quality"))
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
			alert(src,"Awoken after Two Thousand years in slumber, you have finally recovered and regenerated your body from wounds created all those years ago by the Gods that imprisoned you. Strong once more, you are now ready to bring about a second coming of the dreaded Plague of Black Blight!","Devourer")
			src<<"The Tear All Meat button on the HUD can be used to quickly incorperate dead bodies into your body total."
			src<<"Also of note, when creating zombie organs you can place up to 5 of the same organ into a zombie before adding further ones becomes useless."

