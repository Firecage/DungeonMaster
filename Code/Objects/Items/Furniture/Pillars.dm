/obj/Items/Furniture/Pillars

/obj/Items/Furniture/Pillars/PortalStone
	icon = 'Book.dmi'
	icon_state = "PortalStone"
	name = "Anti-Astral Stone"
	weight = 50
	suffix = null
	density = 1

/obj/Items/Furniture/Pillars/PortalStone/DblClick()
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
				menu += "Destroy"
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
				if (Result == "Destroy")
					if(src.suffix == "(Carrying)")
						M.weight -= src.weight
						del src
						return

/obj/Items/Furniture/Pillars/GoblinPillar
	icon = 'StoneItems.dmi'
	icon_state = "Pillar"
	weight = 50
	suffix = null
	density = 0
	name = "Pillar"

/obj/Items/Furniture/Pillars/GoblinPillar/DblClick()
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
		for(src in M)
			if(src.loc == M)
				if(src.suffix == "(Carrying)")
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					return

/obj/Items/Furniture/Pillars/GoldPillar
	icon = 'GoldItems.dmi'
	icon_state = "Pillar"
	name = "Golden Pillar"
	weight = 50
	suffix = null
	density = 1

/obj/Items/Furniture/Pillars/GoldPillar/DblClick()
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
		for(src in M)
			if(src.loc == M)
				if(src.suffix == "(Carrying)")
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					return

/obj/Items/Furniture/Pillars/Statue
	icon = 'Statue.dmi'
	weight = 50
	suffix = null
	density = 1

/obj/Items/Furniture/Pillars/Statue/DblClick()
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
		for(src in M)
			if(src.loc == M)
				if(src.suffix == "(Carrying)")
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					return

/obj/Items/Furniture/Pillars/DwarfPillar
	icon = 'StoneItems.dmi'
	icon_state = "Pillar"
	name = "Pillar"
	weight = 50
	suffix = null
	density = 1

/obj/Items/Furniture/Pillars/DwarfPillar/DblClick()
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
