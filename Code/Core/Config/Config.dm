mob/proc/loadadmins()
	var/text = file2text("config/admins.txt")
	if (!text)
	else
		var/list/lines = dd_text2list(text, "\n")
		for(var/line in lines)
			if (!line)
				continue
			if (copytext(line, 1, 2) == ";")
				continue
			var/dkey = copytext(line, 1, length(line)+1)
			if(usr.ckey == dkey)
				adminlist += usr.client.address
				usr.GM = 1
				usr.verbs+=typesof(/Admin/verb/)
				usr.verbs+=typesof(/TurfCreate/verb)
				usr.verbs+=typesof(/mob/Spawn/verb)
				usr.verbs+=typesof(/MiscCreate/verb)
				usr.verbs+=typesof(/mob/Developer/verb)
				usr.GM = 1
				usr.DE = 1
				usr.sight = 30
				usr.Rares += "SandKing"
				usr.Rares += "Illithids"
proc/loadskillmulti()
	var/text = file2text("config/skillmulti.txt")
	if (!text)
	else
		var/list/lines = dd_text2list(text, "\n")
		for(var/line in lines)
			if (!line)
				continue
			if (copytext(line, 1, 2) == ";")
				continue
			var/multi = copytext(line, 1, length(line)+1)
			multi = text2num(multi)
			multis = multi
var/multis
proc/load(filename, type = "config") //the type switch below will allow you more customization
	var/list/Lines = dd_file2list(filename)

	for(var/t in Lines)
		if(!t)	continue

		t = trim(t)
		if(length(t) == 0)
			continue
		else if(copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/name = null
		var/value = null

		if(pos)
			name = lowertext(copytext(t, 1, pos))
			value = copytext(t, pos + 1)
		else
			name = lowertext(t)

		if(!name)
			continue
		switch(type)
			if("config")
				switch(name)
					if("fps =")
						world.fps = text2num(value)



