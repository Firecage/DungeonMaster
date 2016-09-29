client/preload_rsc = 1
world
	name = "Dungeon Master"
	view = 9
	//hub = "Ginseng.DungeonMaster"
	hub = "Godsring.DungeonMaster"
	version = 1.102
	loop_checks  = 0
	fps=30
	map_format = TOPDOWN_MAP
	status = "Dungeon Master:Official Server RP/PVP"
	New()
		..()
		log = file("world.log")
		NightChange()
		Repop()
		BirthChanges()
		CallSave()
		LoadWinfo()
		//spawn(30)
			//SeasonsCneck()
		//spawn(20)
			//Seasons()

var/Season = "Winter"
var/WorldName
var/Date
var/History
var/Legends
var/Ages
var/night = 1
var/PlayerList = list()
/proc/LoadWorld()
	spawn(10)
		LoadWinfo()
		return
var/client/mouse_pointer_icon(cursor.dmi)