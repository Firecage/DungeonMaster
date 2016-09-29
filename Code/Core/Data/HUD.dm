obj/Hud/Left
	icon = 'HUD.dmi'
	icon_state = "Left"
	layer = 10
	name = ""
obj/Hud/Right
	icon = 'HUD.dmi'
	icon_state = "Right"
	layer = 10
	name = ""
obj/Hud/Top
	icon = 'HUD.dmi'
	icon_state = "Top"
	layer = 10
	name = ""
obj/Hud/Top2
	icon = 'HUD.dmi'
	icon_state = "Top2"
	layer = 12
	name = ""
obj/Hud/Day
	icon = 'HUD.dmi'
	icon_state = "Moon"
	layer = 11
	name = ""
obj/Hud/Bottom
	icon = 'HUD.dmi'
	icon_state = "Bottom"
	layer = 10
	name = ""
obj/Hud/BottomLeft
	icon = 'HUD.dmi'
	icon_state = "BottomRight"
	layer = 10
	name = ""
obj/Hud/TopLeft
	icon = 'HUD.dmi'
	icon_state = "TopLeft"
	layer = 10
	name = ""
obj/Hud/TopRight
	icon = 'HUD.dmi'
	icon_state = "TopRight"
	layer = 10
	name = ""

obj/Hud/BottomRight
	icon = 'HUD.dmi'
	icon_state = "BottomLeft"
	layer = 10
	name = ""
obj/Hud/Warp
	icon = 'HUD.dmi'
	icon_state = "Warp"
	layer = 11
	name = "Warp to a set of X,Y,Z cords. Hot Key - (G)"
	Click() usr.GotoCoords()
obj/Hud/Interact
	icon = 'HUD.dmi'
	icon_state = "Interact"
	layer = 11
	name = "Interact with an object or mob near by.Hot Key - (i)"
	Click() usr.Interact()
obj/Hud/Build
	icon = 'HUD.dmi'
	icon_state = "Build"
	layer = 11
	name = "Displays the build menu.Hot Key - (B)"
	Click() usr.Test()
obj/Hud/Area
	icon = 'HUD.dmi'
	icon_state = "Area"
	layer = 11
	name = "Selects all of your units in the area.Hot Key - (A)"
	Click() usr.All()

obj/Hud/Pointer
	icon = 'HUD.dmi'
	icon_state = "Pointer"
	layer = 11
	name = "Toggle the use of an icon for your view centre. Hot Key - (None)"
	Click()
		if(usr.icon == 'Player.dmi') usr.icon = null
		else usr.icon = 'Player.dmi'

obj/Hud/All
	icon = 'HUD.dmi'
	icon_state = "All"
	layer = 11
	name = "Selects all your units in the world. Hot Key - (E)"
	Click() usr.Every()

obj/Hud/DigOnUnit
	icon = 'HUD.dmi'
	icon_state = "DigOnUnit"
	layer = 11
	name = "Turns autodig on/off on selected units. Hot Key - (none)"
	Click()
		for(var/mob/Monsters/c in usr.Selected)
			if(c.Dig == 0)
				c.Dig = 1
				c.Dig()
				usr << "[c]'s Auto Dig is On!"
			else if(c.Dig == 1)
				c.Dig = 0
				c.destination = null
				c.DigTarget = null
				usr << "[c]'s Auto Dig is off!"
				for(var/obj/DigAt/DD in world)
					if(DD.Owner == c)
						del(DD)
obj/Hud/EquipArmor
	icon = 'HUD.dmi'
	icon_state = "ArmorE"
	layer = 11
	name = "Equips all armor in your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Equipment/E in c) c.EquipItem(E)
obj/Hud/RemoveArmor
	icon = 'HUD.dmi'
	icon_state = "ArmorUnE"
	layer = 11
	name = "Unequips all armor in your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Equipment/E in c) c.UnEquipItem(E)
obj/Hud/ZDown
	icon = 'HUD.dmi'
	icon_state = "ZDown"
	text = "<font color=cyan>v"
	layer = 10
	name = "Moves Camera 1 Z Level Down. Hot Key - (none)"
	Click() switch(usr.z)
		if(1) usr.z=2
		if(2) usr.z=4
		if(3) usr.z=1
obj/Hud/ZUp
	icon = 'HUD.dmi'
	icon_state = "ZUp"
	text = "<font color=cyan>^"
	layer = 11
	name = "Moves Camera 1 Z Level Up. Hot Key - (none)"
	Click() switch(usr.z)
		if(4) usr.z=2
		if(1) usr.z=3
		if(2) usr.z=1
obj/Hud/DropGems
	icon = 'HUD.dmi'
	icon_state = "DropGems"
	layer = 11
	name = "Drops all gems in your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/gems/A in c) c.DropItem(A)
/*obj/Hud/DropBones
	icon = 'HUD.dmi'
	icon_state = "DropBones"
	layer = 10
	name = "Drops all bones in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,9"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Bones/A in c) c.DropItem(A)

obj/Hud/DropWood
	icon = 'HUD.dmi'
	icon_state = "DropWood"
	layer = 10
	name = "Drops all wood in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,8"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/woods/wood/A in c) c.DropItem(A)*/
obj/Hud/DropEdibles
	icon = 'HUD.dmi'
	icon_state = "DropEdibles"
	text = "<font color=red>%"
	layer = 11
	name = "Drops all edibles in your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/c in usr.Selected)
		for(var/obj/Items/Food/B in c) c.DropItem(B)
		for(var/mob/Body/B in c) c.DropItem(B)
/*obj/Hud/DropOres
	icon = 'HUD.dmi'
	icon_state = "DropOres"
	text = "<font color=yellow>*"
	layer = 10
	name = "Drops all ores in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,6"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/ores/A in c) if(A.icon_state!="Stone") c.DropItem(A)
obj/Hud/DropStone
	icon = 'HUD.dmi'
	icon_state = "Stone"
	text = "#"
	layer = 10
	name = "Drops all stones in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,5"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/ores/stone/A in c) c.DropItem(A)
obj/Hud/DropIngots
	icon = 'HUD.dmi'
	icon_state = "DropIngots"
	text = "="
	layer = 10
	name = "Drops all ingots in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,4"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Ingots/A in c) c.DropItem(A)*/
obj/Hud/DropArmor
	icon = 'HUD.dmi'
	icon_state = "DropArmor"
	text = "<b>æ"
	layer = 11
	name = "Drops up all armor in your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Equipment/A in c) c.DropItem(A,0)
obj/Hud/Armor
	icon = 'HUD.dmi'
	icon_state = "Armor"
	layer = 11
	name = "Picks up all armor near your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/c in usr.Selected)
		for(var/obj/Items/Equipment/Armour/Chestplate/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Armour/Leggings/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Armour/LeftArm/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Armour/RightArm/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Armour/Helmet/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Armour/Shield/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Weapon/A in oview(1,c)) if(c.PickUpItem(A)) break
obj/Hud/Skin
	icon = 'HUD.dmi'
	icon_state = "Skin"
	layer = 11
	text = "<font color=red><b>@"
	name = "Picks up all skin near your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Skin/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Seeds
	icon = 'HUD.dmi'
	icon_state = "Seeds"
	layer = 11
	name = "Picks up all seeds near your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Seeds/A in oview(1,c)) c.PickUpItem(A)
/*obj/Hud/Ores
	icon = 'HUD.dmi'
	icon_state = "Ores"
	text = "<font color=yellow>*"
	layer = 10
	name = "Picks up all ores near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "12,1"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/ores/A in oview(1,c)) if(A.icon_state!="Stone") if(A.icon_state!="Silver"||c.Race!="Vampire"&&c.SubRace!="Werewolf") c.PickUpItem(A)*/
obj/Hud/Edibles
	icon = 'HUD.dmi'
	icon_state = "Edibles"
	text = "<font color=red>%"
	layer = 11
	name = "Picks up all edibles near your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/c in usr.Selected)
		for(var/obj/Items/Plants/GrapeVine/G in view(1,c))
			if(G.Content >= 2)
				G.Content -= 1
				new/obj/Items/Food/Grape(c.loc)
			if(G.Content >= 1) G.icon_state = "PPlant5"
			if(G.Content >= 2) G.icon_state = "PPlant4"
			if(G.Content >= 3) G.icon_state = "PPlant3"
			if(G.Content >= 4) G.icon_state = "PPlant2"
			if(G.Content <= 0)
				for(var/turf/e in view(0,G)) e.HasPlantIn = 0
				del(G)
		for(var/obj/Items/Plants/TomatoPlant/F in view(1,c))
			if(F.Content >= 2)
				F.Content -= 1
				new/obj/Items/Food/Tomato(c.loc)
			if(F.Content >= 1) F.icon_state = "Plant5"
			if(F.Content >= 2) F.icon_state = "Plant4"
			if(F.Content >= 3) F.icon_state = "Plant3"
			if(F.Content >= 4) F.icon_state = "Plant2"
			if(F.Content <= 0)
				for(var/turf/e in view(0,F)) e.HasPlantIn = 0
				del(F)
		for(var/obj/Items/Food/A in oview(1,c)) c.PickUpItem(A)
		for(var/mob/Body/B in oview(1,c)) c.PickUpItem(B)

obj/Hud/TearMeat
	icon = 'HUD.dmi'
	icon_state = "TearMeat"
	layer = 11
	name = "Tears all meat from corpses inside your selected units. Devourers will devour all bodies instead of tearing the meat. Hot Key - (none)"
	Click() for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Devourer") for(var/mob/Body/B in M) if(B.icon != 'Cave.dmi' && B.Race != "FleshCrawler") if(!B.Critter)
			M.weight -= B.weight
			M.EggContent += 1
			del B
		if(M.Race == "Devourer" || M.Race == "Spider" || M.Race == "Dragon" || M.SandWorker == 1 || M.Werepowers == 1 || M.Race == "Vampire") for(var/mob/Body/m in M) M.TearMeat(m)
		if(M.Carn || M.HoldingWeapon == "Butcher Knife" || M.HoldingWeapon == "Dagger") for(var/mob/Body/m in M) M.TearMeat(m)

obj/Hud/TearSkin
	icon = 'HUD.dmi'
	icon_state = "TearSkin"
	layer = 11
	name = "Tears all skin from corpses inside your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Spider" || M.Race == "Dragon" || M.SandWorker || M.Werepowers || M.Race == "Vampire") for(var/mob/Body/m in M) M.TearSkin(m)
		if(M.Carn || M.HoldingWeapon == "Butcher Knife" || M.HoldingWeapon == "Dagger") for(var/mob/Body/m in M) M.TearSkin(m)

/*obj/Hud/Bones
	icon = 'HUD.dmi'
	icon_state = "Bones"
	layer = 10
	text = "<b>&"
	name = "Picks up all bones near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "10,1"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Bones/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Wood
	icon = 'HUD.dmi'
	icon_state = "Wood"
	layer = 10
	name = "Picks up all wood near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "9,1"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/woods/wood/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Stone
	icon = 'HUD.dmi'
	icon_state = "Stone"
	layer = 10
	name = "Picks up all Stone near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "8,1"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/ores/stone/A in oview(1,c)) c.PickUpItem(A)*/
obj/Hud/Gem
	icon = 'HUD.dmi'
	icon_state = "Gems"
	layer = 11
	name = "Picks up all gems near your selected units. Hot Key - (none)"
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/gems/A in oview(1,c)) c.PickUpItem(A)
/*obj/Hud/Ingots
	icon = 'HUD.dmi'
	icon_state = "Ingots"
	layer = 10
	text = "="
	name = "Picks up all ingots near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "6,1"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Ingots/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Arrows
	icon = 'HUD.dmi'
	icon_state = "Arrows"
	layer = 10
	name = "Picks up all arrows near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "5,1"
		c.screen += src
	Click() for(var/mob/Monsters/c in usr.Selected) if(c.WearingBack) for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in c) if(L.suffix == "(Equipped)") if(L.Content<=250) for(var/obj/Items/Arrows/A in view(1,c))
		if(L.Content <= 249)
			A.loc = L
			A.Owner = c.Owner
			L.Content += 1
		else
			if(L.Content >=250)
				usr << "Quiver is full."*/
obj/Hud/Cords
	icon = 'HUD.dmi'
	icon_state = "Cords"
	layer = 11
	name = "Displays your current X,Y,Z cords.Hot Key - (C)"
	Click() usr.GetCoords()
obj/Hud/MSG
	icon = 'HUD.dmi'
	icon_state = "MSG"
	layer = 11
	name = "Send a msg to a single player.Hot Key - (W)"
	Click() usr.SendMSGL()
obj/Hud/Say
	icon = 'HUD.dmi'
	icon_state = "Say"
	layer = 11
	name = "Send a msg to the world.Hot Key - (S)"
	Click() usr.WorldSay2()
obj/Hud/Way
	icon = 'HUD.dmi'
	icon_state = "Way"
	layer = 101
	name = "Create or goto waypoint. Hot Key - (Q)"
	Click() usr.WayPoint()
obj/Hud/Who
	icon = 'HUD.dmi'
	icon_state = "Who"
	layer = 11
	name = "Displays who is currently online. Hot Key - (H)"
	Click() usr.Who2()
obj/Hud/Restart
	icon = 'HUD.dmi'
	icon_state = "Restart"
	layer = 11
	name = "Restart and begin again somewhere else.Hot Key - (R)"
	LeftClick()
		usr.Restart()
	RightClick()
		usr.Restart()
obj/Hud/Updates
	icon = 'HUD.dmi'
	icon_state = "Updates"
	layer = 10
	name = "Shows current updates.Hot Key - (T)"
	Click() usr.Updates()
obj/Hud/Find
	icon = 'HUD.dmi'
	icon_state = "Find"
	layer = 11
	name = "Warp to a selected unit.Hot Key - (Z)"
	Click() usr.Goto()
obj/Hud/Stop
	icon = 'HUD.dmi'
	icon_state = "Stop"
	layer = 11
	name = "Stops all your units and removes all targets.Hot Key - (P)"
	Click() usr.StopAll()
//client
	//buildhud()
client/proc/buildhud()
	var/obj/Hud/Left/h1 = new()
	var/obj/Hud/Right/h2 = new()
	var/obj/Hud/Top/h3 = new()
	var/obj/Hud/Top2/h4 = new()
	var/obj/Hud/Bottom/h5 = new()
	var/obj/Hud/BottomLeft/h6 = new()
	var/obj/Hud/TopLeft/h7 = new()
	var/obj/Hud/TopRight/h8 = new()
	var/obj/Hud/BottomRight/h9 = new()
	var/obj/Hud/Interact/h10 = new()
	var/obj/Hud/Warp/h11 = new()
	var/obj/Hud/Cords/h12 = new()
	var/obj/Hud/Who/h13 = new()
	var/obj/Hud/Build/h14 = new()
	var/obj/Hud/Area/h15 = new()
	var/obj/Hud/All/h16 = new()
	var/obj/Hud/Way/h17 = new()
	var/obj/Hud/Day/h18 = new()
	var/obj/Hud/Say/h19 = new()
	var/obj/Hud/Stop/h20 = new()
	var/obj/Hud/MSG/h21 = new()
	var/obj/Hud/Restart/h22 = new()
	var/obj/Hud/Updates/h23 = new()
	var/obj/Hud/Find/h24 = new()
	var/obj/Hud/Pointer/h25 = new()
	var/obj/Hud/EquipArmor/h26 = new()
	var/obj/Hud/RemoveArmor/h27 = new()
	var/obj/Hud/Armor/h28 = new()
	var/obj/Hud/Gem/h29 = new()
	var/obj/Hud/Edibles/h30 = new()
	var/obj/Hud/DropEdibles/h31 = new()
	var/obj/Hud/DropArmor/h32 = new()
	var/obj/Hud/DropGems/h33 = new()
	var/obj/Hud/TearSkin/h34 = new()
	var/obj/Hud/TearMeat/h35 = new()
	var/obj/Hud/Skin/h36 = new()
	var/obj/Hud/Seeds/h37 = new()
	var/obj/Hud/ZUp/h38 = new()
	var/obj/Hud/ZDown/h39 = new()
	var/obj/Hud/DigOnUnit/h40 = new()
	h1.screen_loc = "1,2 to 1,18"
	h2.screen_loc = "19,2 to 19,18"
	h3.screen_loc = "2,19 to 18,19"
	h4.screen_loc = "10,19"
	h5.screen_loc = "2,1 to 18,1"
	h6.screen_loc = "1,1"
	h7.screen_loc = "1,19"
	h8.screen_loc = "19,19"
	h9.screen_loc = "19,1"
	h10.screen_loc = "1,2"
	h11.screen_loc = "1,3"
	h12.screen_loc = "1,4"
	h13.screen_loc = "1,5"
	h14.screen_loc = "1,6"
	h15.screen_loc = "1,7"
	h16.screen_loc = "1,8"
	h17.screen_loc = "1,9"
	h18.screen_loc = "10,19"
	h19.screen_loc = "1,10"
	h20.screen_loc = "1,13"
	h21.screen_loc = "1,11"
	h22.screen_loc = "1,12"
	h23.screen_loc = "1,14"
	h24.screen_loc = "1,15"
	h25.screen_loc = "1,16"
	h26.screen_loc = "19,19"
	h27.screen_loc = "19,18"
	h28.screen_loc = "13,1"
	h29.screen_loc = "7,1"
	h30.screen_loc = "11,1"
	h31.screen_loc = "19,7"
	h32.screen_loc = "19,11"
	h33.screen_loc = "19,10"
	h34.screen_loc = "19,2"
	h35.screen_loc = "19,1"
	h36.screen_loc = "14,1"
	h37.screen_loc = "4,1"
	h38.screen_loc = "19,13"
	h39.screen_loc = "19,12"
	h40.screen_loc = "18,19"
//________________________________________________________________________
	screen += h1
	screen += h2
	screen += h3
	screen += h4
	screen += h5
	screen += h6
	screen += h7
	screen += h8
	screen += h9
	screen += h10
	screen += h11
	screen += h12
	screen += h13
	screen += h14
	screen += h15
	screen += h16
	screen += h17
	screen += h18
	screen += h19
	screen += h20
	screen += h21
	screen += h22
	screen += h23
	screen += h24
	screen += h25
	screen += h26
	screen += h27
	screen += h28
	screen += h29
	screen += h30
	screen += h31
	screen += h32
	screen += h33
	screen += h34
	screen += h35
	screen += h36
	screen += h37
	screen += h38
	screen += h39
	screen += h40
client
	macro_mode=1
	Southeast() ..()
	Southwest() ..()
	Northeast() ..()
	Northwest() ..()
	North() ..()
	South() ..()
	East() ..()
	West() ..()
	New()
		buildhud()
		..()
		/*new/obj/Hud/Left(src)
		new/obj/Hud/Right(src)
		new/obj/Hud/Top(src)
		new/obj/Hud/Top2(src)
		new/obj/Hud/Bottom(src)
		new/obj/Hud/BottomLeft(src)
		new/obj/Hud/TopLeft(src)
		new/obj/Hud/TopRight(src)
		new/obj/Hud/BottomRight(src)
		new/obj/Hud/Interact(src)
		new/obj/Hud/Warp(src)
		new/obj/Hud/Cords(src)
		new/obj/Hud/Who(src)
		new/obj/Hud/Build(src)
		new/obj/Hud/Area(src)
		new/obj/Hud/All(src)
		new/obj/Hud/Way(src)
		new/obj/Hud/Day(src)
		new/obj/Hud/Say(src)
		new/obj/Hud/Stop(src)
		new/obj/Hud/MSG(src)
		new/obj/Hud/Restart(src)
		new/obj/Hud/Updates(src)
		new/obj/Hud/Find(src)
		new/obj/Hud/Pointer(src)
		new/obj/Hud/EquipArmor(src)
		new/obj/Hud/RemoveArmor(src)
		new/obj/Hud/Armor(src)
		new/obj/Hud/Gem(src)
		new/obj/Hud/Edibles(src)
		new/obj/Hud/DropEdibles(src)
		new/obj/Hud/DropArmor(src)
		new/obj/Hud/DropGems(src)
		new/obj/Hud/TearSkin(src)
		new/obj/Hud/TearMeat(src)
		new/obj/Hud/Skin(src)
		new/obj/Hud/Seeds(src)
		new/obj/Hud/ZUp(src)
		new/obj/Hud/ZDown(src)
		new/obj/Hud/DigOnUnit(src)*/