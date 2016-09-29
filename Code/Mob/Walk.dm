/*mob/Monsters/proc/RandomWalk(LINKED=0) if(StopDouble("WalkTo") || LINKED)
	if("Guard" in RunningProcs)
		GuardWalk(1)
		return
	spawn() while(CanBeSlaved)
		sleep(300)
		src.destination = null
		src.BowOn = 0
	while(CanBeSlaved)
		sleep(Delay+1)
		FindGear()
		if(!InHole && CanWalk)
			if(destination)
				if(ismob(destination) || destination == HomeLoc)
					if(destination in range(6,src)) step_towards(src,destination)
					else
						if(destination==HomeLoc) step_towards(src,destination)
						else destination = null
				if(destination == loc) destination=null
			if(!destination)
				if(HomeLoc&&ReturningHome==2)
					step_towards(src,HomeLoc)
					ReturningHome=0
				else
					step_rand(src)
					destination = LocateTarget()
	WalkTo(1)

mob/Monsters/proc/GuardWalk(LINKED=0) if(StopDouble("WalkTo") || LINKED) spawn()
	spawn() while(CanBeSlaved)
		FindGear()
		sleep(200)
	while(CanBeSlaved)
		sleep(Delay+1)
		if(!InHole && CanWalk)
			if(destination==HomeLoc) if(loc==HomeLoc) destination=null
			if(destination) step_towards(src,destination)
	WalkTo(1)

mob/Monsters/proc/WalkTo(LINKED=1)
	if(StopDouble("WalkTo") || LINKED) spawn()
	while(!CanBeSlaved)
		sleep(Delay)
		if(Delay < 1) src.Delay = 1
		if(destination) if(!Fainted&&!Stunned&&!Sleeping&&CanWalk)
			if(CliffClimber||Flying) if(z==1||z==3) if(istype(destination,/atom/))
				var/atom/F = destination
				if(F.z != z)
					switch(F.z)
						if(3)
							for(var/turf/W in range(1,src)) if(W.density || Flying) if(W.opacity || Flying)
								var/turf/W2 = locate(x,y,3)
								if(W2) if(W2.icon_state == "Sky")
									z = 3
									break
						if(1) if(Flying) for(var/turf/W in range(0,src)) if(W.icon_state == "Sky")
							z=1
							break
			step_towards(src,destination)
			if(loc == destination) destination = null
	RandomWalk(1)*/

BaseCamp/GameController/cycle_delay = 2
mob
	base_event_cycle = 0

	proc/WalkTo(D)
		src.destination = D
		GameController.AddEventCycleReceiver(src)


	base_EventCycle()
		base_StepTowards(src.destination, pathSizeLimit = 50)
		if(src.Dig) Dig()
	//	world<<"[destination:x] [destination:y]"
		if((src.loc == src.destination) && (Dig == 0))
			src.End_Destination()
			return
		if(src.loc == src.destination)
			src.destination = null
		return

	proc/End_Destination()
		src.destination = null
		GameController.RemoveEventCycleReceiver(src)

	proc/Dig()
		if(!src.destination)
			for(var/obj/DigAt/D in oview(15,src))
				if(D.Owner == src)
					if(locate(/obj/Tree/) in D.loc)
						src.WalkTo(locate(/obj/Tree/) in D.loc)
						return
					else if(isturf(D.loc))
						src.WalkTo(D.loc)

/*mob/proc/Dig()
	if(Dig)
		if(src.Sleeping == 0)
			for(var/obj/DigAt/D in oview(src))
				if(D.Owner == src)
					if(src.DigTarget == D)
						for(var/obj/Tree/T in view(7,D))
							if(T)
								//src.destination = T
								src.WalkTo(T)
								return
						for(var/turf/T in view(7,D))
							//src.destination = T
							src.WalkTo(T)
					if(src.DigTarget == null)
						src.DigTarget = D
	else
		return
	spawn(1) Dig()*/

/*var/WalkManager/WalkManager

WalkManager
	var
		Loop
		list
			Receivers
	proc
		AddReceiver(atom/movable/M)
			if(!(M in Receivers))
				Receivers += M
				if(!Loop)
					InitLoop()

		RemReceiver(atom/movable/M)
			Receivers -= M

		InitLoop()
			Loop = 1
			ParseWalk()

		ParseWalk()
			while(Receivers.len > 0)
				sleep(3)
				..()
			Loop = 0

proc/MakePath(atom/S, atom/D)



Path/var/list/Steps = list()*/