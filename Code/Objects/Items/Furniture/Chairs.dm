/obj/Items/Furniture/Chairs

/obj/Items/Furniture/Chairs/BoneThrone
	icon = 'BoneItems.dmi'
	icon_state = "Throne"
	weight = 50
	suffix = null

/obj/Items/Furniture/Chairs/BoneThrone/DblClick()

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

/obj/Items/Furniture/Chairs/WoodenChair
	icon = 'Cave.dmi'
	icon_state = "Chair"
	weight = 15
	suffix = null

/obj/Items/Furniture/Chairs/WoodenChair/DblClick()

	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight+src.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return

	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)

			if(M.Wagon == 0)


				var/obj/A14 = src
				A14.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Face North"
				menu += "Face East"
				menu += "Face West"
				menu += "Face South"
				menu += "Inspect"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return
				if (Result == "Face North")
					if(src.suffix == "(Carrying)")
						src.dir = 3
						src.layer = 5
				if (Result == "Face South")
					if(src.suffix == "(Carrying)")
						src.dir = 2
						src.layer = 4
				if (Result == "Face East")
					if(src.suffix == "(Carrying)")
						src.dir = 4
						src.layer = 4
				if (Result == "Face West")
					if(src.suffix == "(Carrying)")
						src.dir = 8
						src.layer = 4

/obj/Items/Furniture/Chairs/GoldenThrone
	icon = 'RoyalItems.dmi'
	icon_state = "Throne"
	weight = 50
	suffix = null

/obj/Items/Furniture/Chairs/GoldenThrone/DblClick()

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
