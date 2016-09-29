/obj/Items/Furniture/Tables

/obj/Items/Furniture/Tables/Table
	icon = 'Cave.dmi'
	icon_state = "Table"
	weight = 30
	suffix = null

/obj/Items/Furniture/Tables/Table/DblClick()

	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight+src.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					src.layer = M.layer
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return

	for(var/mob/Monsters/M in usr.Selected)
		for(src in M)
			if(src.loc == M)
				if(src.suffix == "(Carrying)")
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					if(M.dir == NORTH)
						src.dir = NORTH
						src.layer = 5
					else
						src.dir = M.dir
					return