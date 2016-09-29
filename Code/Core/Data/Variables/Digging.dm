/mob
	var/autodigging = 0
	var/adding = 1

/mob/proc/GetADiggers()
	var/digcount = 0
	for(var/mob/M in usr.Selected)
		if(M.Dig)
			digcount++
	return digcount

/mob/verb/digadd()
	set name = ".digsub"
	if(usr.Function == "RemoveAutodig")
		adding = 1
		for(var/obj/Hud/DigAdd/O in usr.client.screen)
			O.icon_state = "adda"
		for(var/obj/Hud/DigSub/O in usr.client.screen)
			O.icon_state = "subi"
		usr << "You are now adding autodig!"
		usr.Function = "PlaceAutodig"

/mob/verb/digsub()
	set name = ".digsub"
	if(usr.Function == "PlaceAutodig")
		adding = 0
		for(var/obj/Hud/DigAdd/O in usr.client.screen)
			O.icon_state = "addi"
		for(var/obj/Hud/DigSub/O in usr.client.screen)
			O.icon_state = "suba"
		usr << "You are now removing autodig!"
		usr.Function = "RemoveAutodig"

/mob/verb/enddig()
	set name = ".enddig"
	if(autodigging)
		autodigging = 0
		adding = 1
		for(var/obj/Hud/DigAdd/O in usr.client.screen)
			O.icon_state = "addi"
		for(var/obj/Hud/DigSub/O in usr.client.screen)
			O.icon_state = "subi"
		usr << "You have stopped using the autodigging selection feature!"

/mob/verb/switchdig()
	set name = "Use Autodigging"
	if(usr.Function == "PlaceAutodig" || usr.Function == "RemoveAutodig")
		autodigging = 0
		adding = 1
		for(var/obj/Hud/DigAdd/O in usr.client.screen)
			O.icon_state = "addi"
		for(var/obj/Hud/DigSub/O in usr.client.screen)
			O.icon_state = "subi"
		usr << "You have stopped using the autodigging selection feature!"
		usr.Function = null
	else
		autodigging = 1
		for(var/obj/Hud/DigAdd/O in usr.client.screen)
			O.icon_state = "adda"
		for(var/obj/Hud/DigSub/O in usr.client.screen)
			O.icon_state = "subi"
		usr << "You are now using the autodigging selection feature!"
		usr.Function = "PlaceAutodig"

/mob/verb/switchadd()
	set name = "Toggle Autodigging add/sub"
	if(autodigging)
		if(usr.Function == "PlaceAutodig")
			adding = 0
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "addi"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "suba"
			usr << "You are now removing autodig!"
			usr.Function = "RemoveAutodig"
		else if(usr.Function == "RemoveAutodig")
			adding = 1
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "adda"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "subi"
			usr << "You are now adding autodig!"
			usr.Function = "PlaceAutodig"

/mob/proc/Dig()
	if(Dig)
		if(src.Sleeping == 0)
			for(var/obj/DigAt/D in oview(src))
				if(D.Owner == src)
					if(src.DigTarget == D)
						for(var/turf/T in view(0,D))
							src.destination = T
							for(var/obj/Tree/t in view(0,D))
								src.destination = t
					if(src.DigTarget == null)
						src.DigTarget = D
	else
		return
	spawn(1)
		Dig()