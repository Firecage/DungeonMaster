area
	tree

var/MultiKeyAllowed=null
var/LoginMessage="Welcome to Dungeon Master!"
mob/proc/startingmusic()
	if(usr.sound==1)
		usr << sound('Ahrix.ogg', TRUE)
		winset(src,"soundoff","is-checked=false")
	else
		winset(src,"soundoff","is-checked=true")
mob/proc/multikey()
	for(var/mob/KL in Players) if(KL != usr)
		if(KL.client.computer_id == usr.client.computer_id) if(KL!=usr)
			if(MultiKeyAllowed) world << "[KL.key] was trying to connect as [usr.key], and then did!"
			else
				world << "[KL.key] was trying to connect as [usr.key], but was refused access!"
				del(client)
				return
		if(KL.DMID==usr.DMID)
			if(KL.LockDown)
				spawn() verbs-=verbs
				spawn() client.verbs-=client.verbs
				client.verbs-=client.verbs
				verbs-=verbs
			for(var/Player/P) if(P.GM || P.DE) P << "[KL] is running as [usr]<br>Registered as: [DMID]"
mob/proc/offlineageunits()
	Age=Year-birthyear
mob/verb/Multikey()
	set hidden=1
	if(key== "Godsring")
		if(MultiKeyAllowed)
			usr << "Disabled"
			MultiKeyAllowed=null
		else
			usr << "Enabled"
			MultiKeyAllowed=1
mob/proc/loginmessages()
	if(usr.key == "Kitty2.0")
		world << "<p><b><h3><font color =#FE2EF7>Admin [usr] has logged in.<p>"
	else
		if(usr.key == "JFK_Gore")
			world << "<p><b><h3><font color =#FFFFFF>Trial-Admin [usr] has logged in.<p>"
		else
			if(usr.key == "Godsring")
				world << "<p><b><h3><font color =#DBA901>Developer [usr] has logged in.<p>"
			else
				world << "<p><b><h3><font color =#81DAF5>Beloved user [usr] has logged in.<p>"


	usr << "<p><b><h1><font color=#EBDD41><center><b>[LoginMessage]<p>"
	usr << "<p><font color=lime><h3>Dungeon Master  Copyright (C) 2012 - 2016  Alex Cooper<p>"
	usr << "<p><font color=lime><h3>You should have received a copy of the GNU General Public License<p>"
	usr << "<p><font color=lime><h3>along with this program.  If not, see <http://www.gnu.org/licenses/>.<p>"
	usr << "<p><b><font color=lime><font size=3>Auto World Saves happen every 15 minutes, Please logout to save your unit data.<p>"
mob/proc/checkdupeunit()
	for(var/mob/Monsters/M in world)
		if(M.Owner == null)
			del M
			return(checkdupeunit())
		else
			break
/*proc/repeatdupecheck()
	checkdupeunit()
	spawn(100)
		repeatdupecheck()*/
mob/proc/checkforunits()
	if(usr.hasunits == 1)
		usr << "<BIG><b>Press R to choose a new race to play as."
		if(restartpressed==1)
			restartpressed=0
	else
		usr << "<BIG><b>Press R to choose a race to play."
		Restart()
mob/proc/randrares()
	if(usr.LoggedIn == 0)
		usr.LoggedIn = 1
		var/Sand = prob(3)
		var/Illit = prob(3)
		for(var/mob/LLL in PlayerList) if(LLL.DMID == usr.DMID) if(LLL.key != usr.key)
			Sand = 0
			Illit = 0
		if(Sand) usr.Rares += "SandKing"
		if(Illit) usr.Rares += "Illithids"
mob/proc/logout()
	if(restartpressed==1)
		restartpressed=0
	if(usr.loggingout==0)
		usr.loggingout=1
		SaveUnits()