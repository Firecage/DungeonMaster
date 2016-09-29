var
	hasrare = 0
	restartpressed=0
proc/resetstockpile()
	usr.gold =0//raw ore start
	usr.silver=0
	usr.iron=0
	usr.coal=0
	usr.sand=0
	usr.stone=0 //END
	usr.addy=0

	usr.udiamond=0
	usr.uemerald=0
	usr.uruby=0

	usr.cdiamond=0
	usr.cemerald=0
	usr.cruby=0
	usr.fdiamond=0
	usr.femerald=0
	usr.fruby=0

	usr.seed=0
	usr.log=0
	usr.bone=0

	usr.umeat=0 //raw food start
	usr.ufish=0
	usr.grape=0 //END
	usr.fungus=0
	usr.tomatoe=0
	usr.rgold=0 //refined ingots start
	usr.rsilver=0
	usr.gulver=0
	usr.riron=0
	usr.rcoal=0
	usr.glass=0
	usr.raddy=0 //END

	usr.cmeat=0
	usr.cfish=0
/*proc/randomare()
	if("SandKing" && "Illithid" in usr.Rares)
		switch(alert("You have multiple rares, which would you like to be?","Rare Selection","Illthid","SandKing"))
			if("Illthid")
				usr.spawnIllithid()
				restartpressed=0
				return
			if("SandKing")
				usr.spawnSandKing()
				restartpressed=0
				return
		return*/


proc/LocateValidLocation(X=220,XX=999,Y=210,YY=800,Z=1,ZZ=Z)
	var/TRIES=0
	START
	TRIES+=1
	var/turf/T = locate(rand(X,XX),rand(Y,YY),rand(Z,ZZ))
	if(T)
		if(TRIES<50)
			if(T.z != 2)
				for(var/atom/TT in range(1,T))
					if(TT.density)
						goto START
			for(var/mob/Monsters/M in view(15,T))
				if(M.HumanParts)
					goto START
		for(var/turf/TT in range(1,T))
			if(TT.density||TT.opacity)
				TT.icon_state = "CaveFloor"
				TT.CanDigAt = 0
				TT.opacity = 0
				TT.density = 0
				TT.name = "cavefloor"
				TT.icon = 'Cave.dmi'
				TT.Sky = 1
				TT.Content3 = "CanClimb"
				TT.OIcon = "CaveFloor"
	return(T)
proc/Restart()
	if(restartpressed==0)
		restartpressed=1
		if(usr.hasunits == 0)
			winshow(src,"RaceSelection",1)
		else
			switch(alert("You already have units would you like to remove them?","You sure?","Yes","No"))
				if("Yes")
					src << "<BIG><b><font color=gold>You may now select a new race from the menu."
					for(var/mob/Monsters/M in usr.UnitList)
						del M
						usr.hasunits = 0
					resetstockpile()
					usr.hasunits = 0
					usr.CoolDown("[GenderToLeader(usr.Gender)]",0)
					winshow(src,"RaceSelection",1)
				if("No")
					src << "<BIG><b><font color=gold>You must restart to select a new race."
					restartpressed=0
//proc/Restart()
	//Restartm()
mob/verb/Restart()
	if(restartpressed==0)
		restartpressed=1
		if(usr.hasunits == 0)
			winshow(src,"RaceSelection",1)
		else
			switch(alert("You already have units would you like to remove them?","You sure?","Yes","No"))
				if("Yes")
					src << "<BIG><b><font color=gold>You may now select a new race from the menu."
					for(var/mob/Monsters/M in UnitList)
						del M
						hasunits = 0
					resetstockpile()
					hasunits = 0
					usr.CoolDown("[GenderToLeader(Gender)]",0)
					winshow(src,"RaceSelection",1)
				if("No")
					src << "<BIG><b><font color=gold>You must restart to select a new race."
					restartpressed=0

mob/proc/InitSpawnButtons()
	/*
	Alright, this is how it's done:
	*/
	var/obj/HUD/Restart/Human/Human = new()
	Human.screen_loc = "HumanSelect:0:2,0:6"
	usr.client.screen += Human
	var/obj/HUD/Restart/Dwarf/Dwarf = new()
	Dwarf.screen_loc = "DwarfSelect:0:2,0:6"
	usr.client.screen += Dwarf
	var/obj/HUD/Restart/Goblin/Goblin = new()
	Goblin.screen_loc = "GoblinSelect:0:2,0:6"
	usr.client.screen += Goblin
	var/obj/HUD/Restart/Kobold/Kobold = new()
	Kobold.screen_loc = "KoboldSelect:0:2,0:6"
	usr.client.screen += Kobold
	var/obj/HUD/Restart/Ratman/Ratman = new()
	Ratman.screen_loc = "RatmanSelect:0:2,0:6"
	usr.client.screen += Ratman
	/*var/obj/HUD/Restart/Svart/Svart = new()
	Svart.screen_loc = "SvartSelect:0:2,0:6"
	usr.client.screen += Svart*/
	var/obj/HUD/Restart/Frogman/Frogman = new()
	Frogman.screen_loc = "FrogmanSelect:0:2,0:6"
	usr.client.screen += Frogman
	var/obj/HUD/Restart/Lizardman/Lizardman = new()
	Lizardman.screen_loc = "LizardmanSelect:0:2,0:6"
	usr.client.screen += Lizardman
	var/obj/HUD/Restart/Elf/Elf = new()
	Elf.screen_loc = "ElfSelect:0:2,0:6"
	usr.client.screen += Elf
	var/obj/HUD/Restart/Orc/Orc = new()
	Orc.screen_loc = "OrcSelect:0:2,0:6"
	usr.client.screen += Orc
	/*var/obj/HUD/Restart/Dev/Dev = new()
	Dev.screen_loc = "DevSelect:0:2,0:6"
	usr.client.screen += Dev
	var/obj/HUD/Restart/Dragon/Dragon = new()
	Dragon.screen_loc = "DragonSelect:0:2,0:6"
	usr.client.screen += Dragon
	var/obj/HUD/Restart/Spider/Spider = new()
	Spider.screen_loc = "SpiderSelect:0:2,0:6"
	usr.client.screen += Spider*/



Player/Login()
	..()
	InitSpawnButtons()

obj
	HUD
		Restart
			Human
				icon = 'Human.jpg'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnHuman()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						/*usr << output(\
							{"
							<script type="text/javascript">
							function replace(v) {
    							document.getElementById('foo').innerHTML = v;
							}
							</script>
							<div id="foo">This text can change.</div>
							<p>And this can't.</p>
							"},
    						"browser1");

						#define LP(str) list2params(list(str))
						mob/verb/say(T as text)
						usr << output(LP(T),"browser1:replace")*/

						usr << output("HP:200<p>Weight:110", "racedescription")
			Dwarf
				icon = 'Dwarf.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnDwarf()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Dwarf", "racedescription")
			Goblin
				icon = 'Goblin.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnGoblin()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Goblin", "racedescription")
			Kobold
				icon = 'Kobold.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnKobold()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Kobold", "racedescription")
			Ratman
				icon = 'Ratman.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnRatman()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Ratman", "racedescription")
			/*Svart
				icon = 'Svart.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnSvart()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Svart", "racedescription")*/
			Frogman
				icon = 'Frogman.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnFrogman()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Frogman", "racedescription")
			Lizardman
				icon = 'Lizardman.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnLizardman()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Lizardman", "racedescription")
			Elf
				icon = 'Elf.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnElf()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Elf", "racedescription")
			Orc
				icon = 'Orc.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnOrc()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Orc", "racedescription")
			/*Dev
				icon = 'Devour.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnDev()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Devour", "racedescription")
			Dragon
				icon = 'Dragon.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnDragon()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Dragon", "racedescription")
			Spider
				icon = 'Spider.png'
				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						usr.spawnSpider()
						restartpressed=0
						for(var/mob/Monsters/M in usr.UnitList)
							M.StartBuild()
					if(P["right"])
						usr << output("This is a Queen Spider", "racedescription")*/




						//output the description in any way you want

/*mob/proc/restart_now()
	if(Up)
		Close()
		Up = 0
	if(Restart)
		return
	Restart = 1
	var/ASK
	for(var/mob/Monsters/M in UnitList)
		ASK=1
		break
	if(ASK)
		if(alert(usr, "Are you sure you want to restart?", "Choose", "No", "Yes", null)=="Yes") ASK=null
	if(!ASK)
		Function = null
		if(client)
			for(var/mob/Monsters/M in Selected)
				M.Deselect(src)
			for(var/mob/Monsters/M in world)
				if(!M.Wagon)
					if(M.Owner == usr)
						for(var/obj/DigAt/DD in world)
							if(DD.Owner == M.Owner)
								for(var/turf/T in DD.loc)
									if(T.density)
										if(!T.IsWall)
											T.icon_state = "CaveWall"
							del(DD)
						for(var/obj/Items/I in M)
							if(I.Content3 == "Cage")
								M.ForceDropItem(I)
						if(M.Race != "Devouerer" && M.Race != "Illithid" && M.Caged && M.Race != "SandKing" && M.SubRace != "Werewolf" && M.Race != "Svartalfar" && !M.Infects && M.SubRace != "Queen" && !M.IsRoyal)
							M.CanBeSlaved = 1
							M.ChangeOwnership(FORCE=1)
						else
							del(M)
			UnitList = list()
			CoolDowns= list()
			Restart = 1
			loc = locate(rand(350,700),rand(400,750),1)
			density = 0
			var/list/menu = new()
			if(key == "Godsring" || key == "Virgili555")
				verbs+=typesof(/Admin/verb/)
//			if("SandKing" in Rares) menu += "Sand King - Rare"
			if("Illithids" in Rares)
				menu += "Illithid - Rare"
			menu += "Human"
			menu += "Dwarf"
			menu += "Elf"
			menu += "Orc"
			menu += "Goblin"
			menu += "Lizardman"
			menu += "Frogman"
			menu += "Kobold"
			menu += "Ratman"
			menu += "Svartalfar"
			menu += "Spider"
			menu += "Dragon"
			menu += "Devourer"
			menu += "Cancel"
			Race=input("Which Race Would You Like To Play?", "Choose", null) in menu
			if(Race=="Cancel")
				Restart=0
				return
			var/TYPE = text2path("/mob/Monsters/[Race]")
			var/LOC
			var/NUMBER = 3
			switch(Race)
				if("Spider")
					TYPE=/mob/Monsters/Spider/Queen
					NUMBER=1
					LOC=LocateValidLocation(X=240,XX=850,Y=210,YY=800)
				if("Sand King - Rare")
					TYPE=/mob/Monsters/SandKing
					NUMBER=1
					LOC=LocateValidLocation(Z=2)
				if("Illithid - Rare")
					TYPE=/mob/Monsters/Illithid
					NUMBER=1
				if("Dragon","Devourer")
					NUMBER=1
					LOC=LocateValidLocation(X=240,XX=850,Y=210,YY=800)
				if("Svartalfar")
					NUMBER=1
					LOC=LocateValidLocation(Z=2)
				if("Ratman","Kobold")
					NUMBER=5
					LOC=LocateValidLocation(X=289,XX=851,Y=211,YY=360)
				if("Dwarf")
					LOC=LocateValidLocation(X=240,XX=350,Y=263,YY=666)
				if("Goblin","Human")
					LOC=LocateValidLocation(X=240,XX=850,Y=210,YY=800)
				if("Elf")
					LOC=LocateValidLocation(X=600,XX=850,Y=200,YY=800)
				if("Lizardman","Frogman") LOC=LocateValidLocation(X=175,XX=365,Y=675,YY=785)
			if(!LOC) LOC = LocateValidLocation()
			var/CURNUM=0
			if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
				CURNUM+=1
				if(NUMBER>1)
					switch(CURNUM)
						if(1)
							M.x-=1
							switch(M.Race)
								if("Frogman","Lizardman")
									M.ForcePickUpItem(new/obj/Items/woods/wood(loc))
								else
									M.ForcePickUpItem(new/obj/Items/ores/stone(loc))
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
				switch(M.Race)
					if("Human","Dwarf","Goblin","Orc","Lizardman","Frogman","Kobold","Ratman")
						M.ForcePickUpItem(new/obj/Items/Furniture/Beds/SleepingBag)
				if(M.Carn)
					M.ForcePickUpItem(new/obj/Items/Food/Meat(loc))
				else
					M.ForcePickUpItem(new/obj/Items/Food/Meat/Cooked_Meat)
					M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate,"Quality"))
					M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings,"Quality"))
					M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Daggers/MetalDagger,"Quality"))
				if(M.UsesPicks)
					M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Picks/PickAxe,"Quality"))
				switch(M.Race)
					if("Dragon")
						M.Age=50
						M.EggContent=0.9
						M.Gender="Female"
					if("Human","Dwarf")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Axes/MetalAxe,"Quality"))
					if("Elf")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Axes/WoodenAxe,"Quality"))
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/WoodenChestplate,"Quality"))
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Leggings/WoodenLeggings,"Quality"))
					if("Orc")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe,"Quality"))
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Shield/WoodenBuckler,"Quality"))
					if("Goblin")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Swords/GoblinSword,"Quality"))
					if("Lizardman","Frogman","Kobold","Ratman")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Spears/Spear,"Quality"))
					if("Svartalfar")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Helmet/RedHat,"Quality"))
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/RedRobe,"Quality"))
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Maces/NecroStaff,"Quality"))
				for(var/obj/Items/Equipment/E in M)
					M.EquipItem(E)
				if(M.weight>M.weightmax)
					M.weightmax=M.weight+30
				M.ChangeOwnership(src)
				M.name="{[name]} [M.name]"
				M.CantBeGiven=1
				M.PillarPowerup()
			switch(Race)
				if("Sand King - Rare")
					alert(src,"You hatch in an odd place, completely unaware of your surroundings at first, you begin to realize you are one of the Sand Kings, in larva form, You must create tool bodies for yourself and become mature if you wish to survive... You seem to realize you will need a Castle to protect your fragile form.")
				if("Illithid - Rare")
					src << "<font color=red>Illithid guide - F6 to use mind powers, if you do not have an F6 key type MindFlayer into the command bar or make a macro. To use mind control make sure you right click your target to set them as your magic target before using the option in the powers menu. Keep in mind it will only ever work against creatures under level 10, and may take multiple attempts if used against player-owned units."
					alert(src,"You are an illithid. An ancient creature of great power. You have come to this land to dominate the minds of its inhabitants and amass an army to destroy any and all who challange your awesome power.")
				if("Dragon")
					alert(src,"A legendary dragon. That's you. Soon however you will be more than that, you'll be a mother. Before that time comes you'll need to find a suitable location to make your home.")
				if("Human")
					alert(src,"As part of the Human empire you were ordered to scout out new lands suitable for settlements, it now looks although your search has come to an end! it might be best if you set up camp for the winter ahead.")
				if("Dwarf")
					alert(src,"You and your companions have arived at the new un-explored lands, here many adventures and dangers await you. You should think about creating a secure place to live deep in the mountains, so that you may start to create a vast dwarven city.")
				if("Elf")
					alert(src,"As an Elf of the woods, it is your ancient duty to protect the forests from the fools who would desecrate them. You found yourselves called here by the forests themselves. Now you must preform your duty.")
				if("Orc")
					alert(src,"Forever have the orcs roamed the lands of this world in nomadic tribes, searching for the perfect place to settle down. Upon reaching [WorldName] the orcs decided they liked it and soon discovered others did also, as the leader of your orc tribe you must decide which races, if any, are worthy of staying in your land and who should be removed, for if you are to create the perfect tribe there can be no room for weakness!")
				if("Goblin")
					alert(src,"Lured to this land in the hopes of starting a dark dungeon you and your companions finally arive, it might be best to create a basic cave to get started with.")
				if("Lizardman")
					alert(src,"Native to this land the lizardmen live a harsh life in a horrific enviroment, disturbed by the other races your lizardmen decide to hunt down and kill the inruders so that this land may be yours once more.")
				if("Frogman")
					alert(src,"Since anyone can remember the frogmen and the lizardmen have been at war for control of the swamps. Every day there is mass bloodshed. It's up to you if you wish to partake in this, or simply flee the land and find somewhere a bit more safe to live. Whatever your choice, watch out for swamp dragons.")
				if("Kobold")
					alert(src,"Tempted by the un-found treasures of this new land you finally arive, it might be best to create a secure cave so that you may one day make a vast Kobold army to raid this land with.")
				if("Ratman")
					alert(src,"Driven from your home by hordes of dangerous predators, you have arrived in this new land to propagate your kind... and eat cheese.")
				if("Svartalfar")
					alert(src,"A Dark God of another land has destroyed your family, and cursed you with longevity and power, only to warp your appearance and seperate you from the rest of mankind.")
				if("Spider")
					alert(src,"After many weeks of travel from your old nests you arive at new lands, ready to create a new swarm, you begin to locate a suitable area for your hatchlings.")
				if("Dragon")
					alert(src,"Travelling far from your hatching ground you have arrived in this new land to make your home.")
				if("Devourer")
					alert(src,"Awoken after Two Thousand years in slumber, you have finally recovered and regenerated your body from wounds created all those years ago by the Gods that imprisoned you. Strong once more, you are now ready to bring about a second coming of the dreaded Plague of Black Blight!")
					src<<"The Tear All Meat button on the HUD can be used to quickly incorperate dead bodies into your body total."
					src<<"Also of note, when creating zombie organs you can place up to 5 of the same organ into a zombie before adding further ones becomes useless."
	Restart = 0

mob/verb/Restart()
	if(Up)
		Close()
		Up = 0
	if(Restart)
		return
	Restart = 1
	var/ASK
	for(var/mob/Monsters/M in UnitList)
		ASK=1
		break
	if(ASK)
		if(alert(usr, "Are you sure you want to restart?", "Choose", "No", "Yes", null)=="Yes") ASK=null
	if(!ASK)
		Function = null
		if(client)
			for(var/mob/Monsters/M in Selected)
				M.Deselect(src)
			for(var/mob/Monsters/M in world)
				if(!M.Wagon)
					if(M.Owner == usr)
						for(var/obj/DigAt/DD in world)
							if(DD.Owner == M.Owner)
								for(var/turf/T in DD.loc)
									if(T.density)
										if(!T.IsWall)
											T.icon_state = "CaveWall"
							del(DD)
						for(var/obj/Items/I in M)
							if(I.Content3 == "Cage")
								M.ForceDropItem(I)
						if(M.Race != "Devouerer" && M.Race != "Illithid" && M.Caged && M.Race != "SandKing" && M.SubRace != "Werewolf" && M.Race != "Svartalfar" && !M.Infects && M.SubRace != "Queen" && !M.IsRoyal)
							M.CanBeSlaved = 1
							M.ChangeOwnership(FORCE=1)
						else
							del(M)
			UnitList = list()
			CoolDowns= list()
			Restart = 1
			loc = locate(rand(350,700),rand(400,750),1)
			density = 0
			var/list/menu = new()
			if(key == "Godsring" || key == "Virgili555")
				verbs+=typesof(/Admin/verb/)
//			if("SandKing" in Rares) menu += "Sand King - Rare"
			if("Illithids" in Rares)
				menu += "Illithid - Rare"
			menu += "Human"
			menu += "Dwarf"
			menu += "Elf"
			menu += "Orc"
			menu += "Goblin"
			menu += "Lizardman"
			menu += "Frogman"
			menu += "Kobold"
			menu += "Ratman"
			menu += "Svartalfar"
			menu += "Spider"
			menu += "Dragon"
			menu += "Devourer"
			menu += "Cancel"
			Race=input("Which Race Would You Like To Play?", "Choose", null) in menu
			if(Race=="Cancel")
				Restart=0
				return
			var/TYPE = text2path("/mob/Monsters/[Race]")
			var/LOC
			var/NUMBER = 3
			switch(Race)
				if("Spider")
					TYPE=/mob/Monsters/Spider/Queen
					NUMBER=1
					LOC=LocateValidLocation(X=240,XX=850,Y=210,YY=800)
				if("Sand King - Rare")
					TYPE=/mob/Monsters/SandKing
					NUMBER=1
					LOC=LocateValidLocation(Z=2)
				if("Illithid - Rare")
					TYPE=/mob/Monsters/Illithid
					NUMBER=1
				if("Dragon","Devourer")
					NUMBER=1
					LOC=LocateValidLocation(X=240,XX=850,Y=210,YY=800)
				if("Svartalfar")
					NUMBER=1
					LOC=LocateValidLocation(Z=2)
				if("Ratman","Kobold")
					NUMBER=5
					LOC=LocateValidLocation(X=289,XX=851,Y=211,YY=360)
				if("Dwarf")
					LOC=LocateValidLocation(X=240,XX=350,Y=263,YY=666)
				if("Goblin","Human")
					LOC=LocateValidLocation(X=240,XX=850,Y=210,YY=800)
				if("Elf")
					LOC=LocateValidLocation(X=600,XX=850,Y=200,YY=800)
				if("Lizardman","Frogman") LOC=LocateValidLocation(X=175,XX=365,Y=675,YY=785)
			if(!LOC) LOC = LocateValidLocation()
			var/CURNUM=0
			if(TYPE) for(var/mob/Monsters/M in MakeMany(TYPE,NUMBER,LOC,1))
				CURNUM+=1
				if(NUMBER>1)
					switch(CURNUM)
						if(1)
							M.x-=1
							switch(M.Race)
								if("Frogman","Lizardman")
									M.ForcePickUpItem(new/obj/Items/woods/wood(loc))
								else
									M.ForcePickUpItem(new/obj/Items/ores/stone(loc))
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
				switch(M.Race)
					if("Human","Dwarf","Goblin","Orc","Lizardman","Frogman","Kobold","Ratman")
						M.ForcePickUpItem(new/obj/Items/Furniture/Beds/SleepingBag)
				if(M.Carn)
					M.ForcePickUpItem(new/obj/Items/Food/Meat(loc))
				else
					M.ForcePickUpItem(new/obj/Items/Food/Meat/Cooked_Meat)
					M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate,"Quality"))
					M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings,"Quality"))
					M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Daggers/MetalDagger,"Quality"))
				if(M.UsesPicks)
					M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Picks/PickAxe,"Quality"))
				switch(M.Race)
					if("Dragon")
						M.Age=50
						M.EggContent=0.9
						M.Gender="Female"
					if("Human","Dwarf")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Axes/MetalAxe,"Quality"))
					if("Elf")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Axes/WoodenAxe,"Quality"))
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/WoodenChestplate,"Quality"))
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Leggings/WoodenLeggings,"Quality"))
					if("Orc")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe,"Quality"))
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Shield/WoodenBuckler,"Quality"))
					if("Goblin")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Swords/GoblinSword,"Quality"))
					if("Lizardman","Frogman","Kobold","Ratman")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Spears/Spear,"Quality"))
					if("Svartalfar")
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Helmet/RedHat,"Quality"))
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Armour/Chestplate/RedRobe,"Quality"))
						M.ForcePickUpItem(CraftItem(new/obj/Items/Equipment/Weapon/Maces/NecroStaff,"Quality"))
				for(var/obj/Items/Equipment/E in M)
					M.EquipItem(E)
				if(M.weight>M.weightmax)
					M.weightmax=M.weight+30
				M.ChangeOwnership(src)
				M.name="{[name]} [M.name]"
				M.CantBeGiven=1
				M.PillarPowerup()
			switch(Race)
				if("Sand King - Rare")
					alert(src,"You hatch in an odd place, completely unaware of your surroundings at first, you begin to realize you are one of the Sand Kings, in larva form, You must create tool bodies for yourself and become mature if you wish to survive... You seem to realize you will need a Castle to protect your fragile form.")
				if("Illithid - Rare")
					src << "<font color=red>Illithid guide - F6 to use mind powers, if you do not have an F6 key type MindFlayer into the command bar or make a macro. To use mind control make sure you right click your target to set them as your magic target before using the option in the powers menu. Keep in mind it will only ever work against creatures under level 10, and may take multiple attempts if used against player-owned units."
					alert(src,"You are an illithid. An ancient creature of great power. You have come to this land to dominate the minds of its inhabitants and amass an army to destroy any and all who challange your awesome power.")
				if("Dragon")
					alert(src,"A legendary dragon. That's you. Soon however you will be more than that, you'll be a mother. Before that time comes you'll need to find a suitable location to make your home.")
				if("Human")
					alert(src,"As part of the Human empire you were ordered to scout out new lands suitable for settlements, it now looks although your search has come to an end! it might be best if you set up camp for the winter ahead.")
				if("Dwarf")
					alert(src,"You and your companions have arived at the new un-explored lands, here many adventures and dangers await you. You should think about creating a secure place to live deep in the mountains, so that you may start to create a vast dwarven city.")
				if("Elf")
					alert(src,"As an Elf of the woods, it is your ancient duty to protect the forests from the fools who would desecrate them. You found yourselves called here by the forests themselves. Now you must preform your duty.")
				if("Orc")
					alert(src,"Forever have the orcs roamed the lands of this world in nomadic tribes, searching for the perfect place to settle down. Upon reaching [WorldName] the orcs decided they liked it and soon discovered others did also, as the leader of your orc tribe you must decide which races, if any, are worthy of staying in your land and who should be removed, for if you are to create the perfect tribe there can be no room for weakness!")
				if("Goblin")
					alert(src,"Lured to this land in the hopes of starting a dark dungeon you and your companions finally arive, it might be best to create a basic cave to get started with.")
				if("Lizardman")
					alert(src,"Native to this land the lizardmen live a harsh life in a horrific enviroment, disturbed by the other races your lizardmen decide to hunt down and kill the inruders so that this land may be yours once more.")
				if("Frogman")
					alert(src,"Since anyone can remember the frogmen and the lizardmen have been at war for control of the swamps. Every day there is mass bloodshed. It's up to you if you wish to partake in this, or simply flee the land and find somewhere a bit more safe to live. Whatever your choice, watch out for swamp dragons.")
				if("Kobold")
					alert(src,"Tempted by the un-found treasures of this new land you finally arive, it might be best to create a secure cave so that you may one day make a vast Kobold army to raid this land with.")
				if("Ratman")
					alert(src,"Driven from your home by hordes of dangerous predators, you have arrived in this new land to propagate your kind... and eat cheese.")
				if("Svartalfar")
					alert(src,"A Dark God of another land has destroyed your family, and cursed you with longevity and power, only to warp your appearance and seperate you from the rest of mankind.")
				if("Spider")
					alert(src,"After many weeks of travel from your old nests you arive at new lands, ready to create a new swarm, you begin to locate a suitable area for your hatchlings.")
				if("Dragon")
					alert(src,"Travelling far from your hatching ground you have arrived in this new land to make your home.")
				if("Devourer")
					alert(src,"Awoken after Two Thousand years in slumber, you have finally recovered and regenerated your body from wounds created all those years ago by the Gods that imprisoned you. Strong once more, you are now ready to bring about a second coming of the dreaded Plague of Black Blight!")
					src<<"The Tear All Meat button on the HUD can be used to quickly incorperate dead bodies into your body total."
					src<<"Also of note, when creating zombie organs you can place up to 5 of the same organ into a zombie before adding further ones becomes useless."
	Restart = 0
	*/