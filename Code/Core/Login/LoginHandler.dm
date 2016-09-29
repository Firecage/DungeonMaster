#define DEBUG
mob/Logout()
	usr.logout()
	Players -= usr
	usr.Loaded=0
	usr.Up = 0
	world << "<b><p><font color=purple>[usr] has logged out.<p>"
	usr.Restart = 0
	for(var/obj/DigAt/D in world) if(D.Owner == usr) del(D)
	/*for(var/mob/Monsters/M in usr.UnitList)
		for(var/obj/Items/Traps/Cages/F in M)
			for(var/mob/T in F)
				del T								Was used for debug perpouses when making the new save system.
				M.DigTarget = null
				M.destination = null
				M.Guarding(AUTO=1)
		del M*/
	for(var/mob/Monsters/M in usr.Selected)
		usr.Selected.Remove(M)
		M.destination = null
mob/Login()
	winset(src,"macro.A","command=Mute")
	usr.LoadUnits()
	usr.loggingout=0
	usr.IsWood = 0
	usr.Loaded=1
	usr.Up = 0
	usr.loadadmins()
	load("config/config.txt")
	//loadnames()
	//load("config/name_gen/firstname.txt")
	usr.startingmusic()
	usr.DMID = usr.client.address
	usr.verbs+=typesof(/Targeting/verb/)
	usr.Content = "CantBeCaged"
	AllPlayers+=usr.client.address
	OnlinePlayers+=usr.client.address
	usr.multikey()
	//if(!usr in ClientList)
	//ClientList+=usr.client.address
	if(usr in Players2) ..()
	else Players2 += usr
	Players += usr
	if(usr.IsClanLeader)
		usr.verbs+=typesof(/Clan/verb)
	usr.loginmessages()
	usr.Intro()
	usr.Loaded=1
	usr.Owner = usr.key
	usr.loc = locate(rand(350,700),rand(400,750),1)
	for(var/mob/Monsters/M in usr.UnitList)
		if(M.Owner == usr)
			usr.loc = M.loc
			M.Blueprints = new()
	/*var/var/obj/HUD/Building_Interface/Open/O = new()
	O.screen_loc = "12:25,1:31"
	src.client.screen += O*/
	//src.Building_Interface += O
	usr.density = 0
	usr.randrares()
	var/In = 0
	if(In == 0) PlayerList += usr
	if(usr in PlayerList) In = 1
	usr.Restart = 0
	usr.checkforunits()
	usr.checkdupeunit()


