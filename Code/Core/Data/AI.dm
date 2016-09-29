var/text= null
var/said= 0
proc/ai(text)
	if(findtext(text,"Hi"))
		if(said==0)
			world << "<p><font color=#c61aff><strong>F.R.E.Y.A</strong>:<font color=#ff66ff> Hello [usr]!<br>"
			said=1
			spawn(50)
				said=0
		else
			return
	if(findtext(text,"/",1,1))
		if(findtext(text,"boss"))
			if(findtext(text,"coord"))
				world << "<p><font color=#c61aff><strong>F.R.E.Y.A</strong>:<font color=#ff66ff> Hello [usr] if you would like to know the boss coordinates please type /c boss.<br>"
		if(findtext(text,"c boss"))
			SayBossCoords()
		if(findtext(text,"help"))
			usr << "<p><font color=#c61aff><strong>F.R.E.Y.A</strong>:<font color=#ff66ff> Hello [usr], You can type /commands for a list of commands or /? <command> for information about a particular command.<br>"
		if(findtext(text,"commands"))
			usr << "<p><font color=#c61aff><strong>F.R.E.Y.A</strong>:<font color=#ff66ff> [usr] the commands are as follows... <br> /loc <br> /help <br> /c boss <br> /? <br>"
		if(findtext(text,"? commands"))
			usr << "<p><font color=#c61aff><strong>F.R.E.Y.A</strong>:<font color=#ff66ff> [usr] you may do /commands to see a list of commands or /? <command> for information about a specific command.<br>"
		for(var/mob/M in Players2)
			for(var/mob/m in Players2)
				if(M.name in usr.AllyList)
					if(usr.name in m.AllyList)
						if(findtext(text,"/loc [m.name]"))
							var/T = "/c [m.x],[m.y],[m.z]" as null|text
							T=TextFilter(T)
							usr << "<p><font color=#c61aff><strong>F.R.E.Y.A</strong>:<font color=#ff66ff> [usr] your friend [m.name] is located at [T]<br>"
