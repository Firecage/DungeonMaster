mob/var
	savedx = 0
	savedy = 0
	savedz = 0
	wasroyal = 0
	savedowner = null
	loggingout=0
	loggedout
	cageoldowner
	savedloc
	oldkey =  null
Admin/verb/SaveUnitsInWorld()
	set category="Admin"
	SaveUnits()
	SaveWinfo()
	world << "[usr] has saved units."

/proc/CallSave()
	spawn(9500)
		world << "<font size=4>Units Saving & World Information"
		CallSave()
		sleep(5)
		//SaveUnits()
		SaveWinfo()
/proc/SaveWinfo()
	var/sav = "Worldinfo/winfo.sav"
	var/savefile/S = new(sav)
	S["Day"] << Day
	S["Month"] << Month
	S["Year"] << Year
	S["Season"] << Season
	S["night"] << night
/proc/LoadWinfo()
	if(fexists("Worldinfo/winfo.sav"))
		var/sav = "Worldinfo/winfo.sav"
		var/savefile/S = new(sav)
		S["Day"] >> Day
		S["Month"] >> Month
		S["Year"] >> Year
		S["Season"] >> Season
		S["night"] << night
/proc/SaveUnits()
	for(var/mob/M in world)
		if(M.key)
			if(M.key == usr.key)
				if(usr.key == null)
					return
				if(usr.loggingout == 1) //Makes sure the user its saving is logging out
					usr.Save()
					var/sav = "units/[M.ckey]_save.sav"
					var/savefile/S = new(sav)
					M.savedx = M.x
					M.savedy = M.y
					M.savedz = M.z
					if(M.IsRoyal == 1)
						M.IsRoyal=0
						M.wasroyal = 1
					for(var/mob/X in M.UnitList)
						X.savedx = X.x
						X.savedy = X.y
						X.savedz = X.z
					for(var/mob/Monsters/m in usr.UnitList)
						if(m.IsRoyal == 1)
							m.IsRoyal=0
							m.wasroyal = 1
					M.Write(S)
					for(var/mob/Monsters/k in world)
						if(usr == k.Owner)
							del k
					//for(var/mob/Monsters/K in usr.UnitList)
						//del K

mob/proc/LoadUnits()
	/*if(usr.Loaded==1)
		world << "Already loaded"
		return*/
	if(usr.ckey==null)
		return
	if(!usr.key)
		return
	if(fexists("units/[usr.ckey]_save.sav"))
		var/sav = "units/[usr.ckey]_save.sav"
		var/savefile/S = new(sav)
		Read(S)
		if(usr.loggingout == 1) //Makes sure its loading someone is loggedout var needs to reflect that was well and should be nammed Loggedout or Logging in.
			usr.Load() //Loads the Player Save refer to mob/proc/Load()
			if(!isobj(loc))
				x = savedx
				y = savedy
				z = savedz
			//Loaded = 1
			density = 0
			Selected = list()
			client.images = null
			if(IsClanLeader == 1)
				verbs+=typesof(/Clan/verb)
			var/In = 0
			if(usr in PlayerList)
				In = 1
			if(In == 0)
				PlayerList += usr
			for(var/mob/Monsters/K in UnitList)
				//for(var/mob/CK in K)
					//if(CK.savedowner == usr.key)                 All to the left is no longer needed due to the way the save system works now.
						//CK.Owner = CK.savedowner
						//CK.ChangeOwnership(usr.key)
				//K.loc = K.savedloc   //This would be better but causes crashing for some reason will fix as some point..
				K.x = K.savedx
				K.y = K.savedy
				K.z = K.savedz
				if(K.wasroyal==1)
					K.IsRoyal=1
					K.wasroyal=0
				if(K.Meditating)
					K.Meditating = 0
					K.CanWalk = 1
				K.offlineageunits()
				K.CoolDown = 0
				K.Sleeping = 0
				K.Stunned = 0
				K.Fainted = 0
				K.Blueprints = new
				K.HomeLoc = null
				K.Target = null
				K.Owner = usr
				if(K.HasRightLeg == 1 && K.HasLeftLeg == 1)
					K.CanWalk = 1
				if(K.Race=="Devourer")
					K.CanWalk = 1
				K.RebuildOverlays()
				if(K.Race == "Vampire")
					if(K.y == 1 || K.y == 3)
						K.y = 2
				var/image/I = new('mob.dmi',K)
				if(K.UsesEquipment)
					I.icon_state = "hum"
					I.pixel_y = -5
				I.layer = MOB_LAYER - 1
				K.Star = I
				K.LimbLoss()
			usr.loggingout = 0
		return(1)



obj
	var                   //These vars define the terms so they
		mapsaved_x           //are recognized.
		mapsaved_y
		mapsaved_z
turf
	var
		mapsaved_x
		mapsaved_y
		mapsaved_z
proc
	SaveObjects()                            //This is the Save proc.
		var/savefile/F = new ("objects.sav") //creates the save file
		var/list/L = new
		for(var/obj/O in world)
			O.mapsaved_x = O.x //these tell the game to save the objects
			O.mapsaved_y = O.y //location.
			O.mapsaved_z = O.z
			L += O
		F[""] << L
	SaveTurfs()
		var/savefile/F = new ("turfs.sav") //creates the save file
		var/list/turf/L = new
		for(var/turf/T in world)
			//O.mapsaved_x = O.x //these tell the game to save the objects
			//O.mapsaved_y = O.y //location.
			//O.mapsaved_z = O.z
			//L += O
			L+=T
		F[""] << L

//var/map_storage/map_save/map_save = new("FoomerMaps","CutiePie",list(/mob))

proc
	LoadObjects()                         //Its time to load the objs!
		var/savefile/F = new ("objects.sav")
		var/list/L = new
		F[""] >> L
		if(!L) return
		for(var/obj/O in world) if(O.loc) del(O)
		for(var/obj/O in L)
			O.loc = locate(O.mapsaved_x,O.mapsaved_y,O.mapsaved_z) //loads the obj

	/*LoadTurfs()                         //Its time to load the objs!
		var/savefile/F = new ("turfs.sav")
		var/list/turf/L = new
		F[""] >> L
		if(!L) return
		//for(var/turf/T in world) if(O.loc) del(O)
		for(var/turf/T in L)
			T.x = locate(T.x,T.y,T.z)//loads the obj
			T.y = locate(T.x,T.y,T.z)
			T.z = locate(T.x,T.y,T.z)*/
                                                      //location                                                   //location
mob/proc/Save()
	var/sav = "players/[src.ckey]_save.sav"
	var/savefile/S = new(sav)
	S["Kills"] << src.Kills
	S["Faction"] << src.Faction
	S["IsClanLeader"] << src.IsClanLeader
mob/proc/Load()
	var/sav = "players/[src.ckey]_save.sav"
	if(length(file(sav)))
		var/savefile/S = new(sav)
		S["Kills"] >> src.Kills
		S["Faction"] >> src.Faction
		S["IsClanLeader"] >> src.IsClanLeader

/*
proc
	SaveTurf()                            //This is the Save proc.
		var/savefile/F = new ("turfs.sav") //creates the save file
		var/list/L = new
		for(var/turf/grounds/cavefloor/T in world)
			T.mapsaved_x = T.x //these tell the game to save the objects
			T.mapsaved_y = T.y //location.
			T.mapsaved_z = T.z
			L += T
		F[""] << L

proc
	LoadTurf()                         //Its time to load the objs!
		var/savefile/F = new ("turfs.sav")
		var/list/L = new
		F[""] >> L
		if(!L) return
		for(var/turf/grounds/T in world) if(T.loc) del(T)
		for(var/turf/grounds/T in L)
			//T.loc = locate(T.mapsaved_x,T.mapsaved_y,T.mapsaved_z) //loads the obj
			T.x = T.mapsaved_x
			T.y = T.mapsaved_y
			T.z = T.mapsaved_z*/

var/map_storage/map_save/map_save = new()
map_storage/map_save
	game_id = "FoomerMaps"

	backdoor_password = "CutiePie"

	ignore_types = list(/mob)

	// This overrides the map_storage library's Output functions so that
	// we can add our own progress meters. Since the library will call
	// these functions every 1% of progress, we're using the probabilty
	// calls to reduce the frequency of the visible updates, since each
	// of these must be followed by a delay in order to display.
	SaveOutput(percent)
		if(prob(10) || percent == 100)
			winset(usr, "status", "text=\"Saving [percent]% done.\"")
			sleep(1)
		return

	LoadOutput(percent)
		if(prob(10) || percent == 100)
			winset(usr, "status", "text=\"Loading [percent]% done\"")
			sleep(1)
		return

	// If you want, you can also override how the library clears the
	// map, just in case you want to include things such as moving players
	// to a save place off the map, or maybe you just don't want anything
	// to be removed when you load a map. What you see here is the default
	// behavior for the ClearMap function.
	ClearMap()
		for(var/turf/T in world)
			for(var/atom/movable/A in T)
				if(ismob(A))
					var/mob/M = A
					if(M.client)
						M.loc = null
						continue
				del(A)
			del(T)
		return
/*************************************************************************
MAP SAVING AND LOADING FUNCTIONS AS USED IN A GAME
**************************************************************************/

// Save the map file.
mob/verb/MapSave()
	if(usr.GM == 1)
		// Request a name for this map. If it doesn't have a name cancel this, and if it doesn't
		// have an game_id, then add the .map game_id.
		var/mapname = input(usr, "What do you want to name your map?", "Map Name", "My Map") as null|text
		if(!mapname)
			return
		if(copytext(mapname, length(mapname)-3, 0) != ".map")
			mapname += ".map"

		// Ask if the user wants to password-lock the map.
		var/password = input(usr, "Save with a password?", "Password", null) as null|text

		// Remove any old files by that name and replace them with the new file.
		fdel(mapname)
		var/savefile/map = new(mapname)

		// Time before we started saving, so we know how long it took.
		var/startsave = world.timeofday

		map_save.Save(map, password)

		world.log << "Map saved as [mapname]! (Time: [(world.timeofday - startsave) / 10] second\s)"
		return
/*mob/verb/MapSave()
	var/savefile/map = new("map.sav")
	map_save.Save(map, password)
	world.log << "Map saved"
	world << "Map saved"
	return*/
// Load the saved map file.
mob/verb/MapLoad()
	if(usr.GM == 1)
		// Find all the map files in the directory, and if there are none, abort.
		var/list/maps = list()
		for(var/file in flist(""))
			if(copytext(file, length(file)-3, 0) == ".map")
				maps += file
		if(!maps.len)
			world.log << "No maps found."
			return

		// Ask the user which map file to load.
		var/mapname = input(src, "Select a map to load.", "Load Map", maps[1]) as null|anything in maps
		if(!mapname)
			return

		if(!fexists(mapname))
			world.log << "No map file."
			return

		var/savefile/map = new(mapname)

		// Make sure that the selected file is a valid map file.
		if(!map_save.IsValid(map))
			world.log << "Invalid map format."
			return

		if(!map_save.Verify(map))
			world.log << "[map] has been tampered with."
			return

		// If the map is password-locked, ask for the password.
		var/password
		if(map_save.PasswordLocked(map))
			password = input(src, "This file requires a password", "Password", null) as null|text
			if(!password)
				return

		// Make sure to move players off the map.
		src.loc = null

		world.log << "Loading map..."
		sleep(1)

		// Time before it started loading, so we know how long it took.
		var/start_time = world.timeofday

		if(map_save.Load(map, password))
			world.log << "Map loaded!"
		else
			world.log << "Map failed to load..."

		// Now we can put players back on the map.
		src.loc = locate(1,1,1)

		world.log << "Loading time: [(world.timeofday - start_time) / 10] second\s"

		return
turf
	map_storage_saved_vars = "density;opacity;tag"
obj
	map_storage_saved_vars = "density;opacity;tag"



