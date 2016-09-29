/obj/Items/Furniture/Beds
	CR = 40

/obj/Items/Furniture/Beds/GoldBed
	icon = 'GoldItems.dmi'
	icon_state = "Bed"
	weight = 50
	suffix = null

/obj/Items/Furniture/Beds/GoldBed/DblClick()
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


				var/obj/A10 = src
				A10.loc = M
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

/obj/Items/Furniture/Beds/MetalBed
	icon = 'MetalObjects.dmi'
	icon_state = "Bed"
	weight = 50
	suffix = null

/obj/Items/Furniture/Beds/MetalBed/DblClick()
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


				var/obj/A10 = src
				A10.loc = M
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

/obj/Items/Furniture/Beds/WoodenBed
	icon = 'Cave.dmi'
	icon_state = "Bed"
	weight = 50
	suffix = null

/obj/Items/Furniture/Beds/WoodenBed/DblClick()
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


				var/obj/A10 = src
				A10.loc = M
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

/obj/Items/Furniture/Beds/SleepingBag
	icon = 'Cave.dmi'
	icon_state = "SleepingBag"
	weight = 5
	suffix = null

/obj/Items/Furniture/Beds/New()

/obj/Items/Furniture/Beds/DblClick()
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

/obj/Items/Furniture/Beds/LeatherBed
	icon = 'Cave.dmi'
	icon_state = "LeatherBed"
	weight = 25
	suffix = null

/obj/Items/Furniture/Beds/LeatherBed/DblClick()
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
