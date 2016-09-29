/obj/Items/Furniture/Fences

/obj/Items/Furniture/Fences/WoodenFence
	icon = 'Fences.dmi'
	icon_state = "Wooden Fence"
	weight = 25
	desc = "This is a fence."
	suffix = null
	HumanParts = 0
	HP = 10

/obj/Items/Furniture/Fences/WoodenFence/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 1)
			var/list/menu = new()
			menu += "Attack"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result == "Cancel")
				return
			if (Result == "Attack")
				M.destination = src
				return
		if(src in view(1,M))
			M.destination = null
			if(src.Placed == 0)
				if(src.suffix == null)
					if(M.weight+src.weight <= M.weightmax)
						src.loc = M
						src.suffix = "(Carrying)"
						M.weight += src.weight
						src.Owner = M.Owner
						return
					else
						usr << "[M] : I Cant Carry Too Much!"
						return
	for(var/mob/Monsters/M in usr.Selected)
		for(src in M)
			if(src.loc == M)
				if(src.suffix == "(Carrying)")
					var/list/menu = new()
					menu += "Drop"
					menu += "Inspect"
					menu += "Place"
					menu += "Destroy"
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
						if(src in M)
							M.weight -= src.weight
						del(src)
						return
					if (Result == "Place")
						if(src.Placed == 0)
							src.loc = M.loc
							src.dir = M.dir
							src.density = 1
							M.weight -= src.weight
							src.Placed = 1
							src.opacity = 0
							src.Door = 1
							src.Locked = 0
							src.Death()
							return

/obj/Items/Furniture/Fences/StoneFence
	icon = 'Fences.dmi'
	icon_state = "Stone Fence"
	weight = 25
	desc = "This is a fence."
	suffix = null
	HumanParts = 0
	HP = 10

/obj/Items/Furniture/Fences/StoneFence/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 1)
			var/list/menu = new()
			menu += "Attack"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result == "Cancel")
				return
			if (Result == "Attack")
				M.destination = src
				return
		if(src in view(1,M))
			M.destination = null
			if(src.Placed == 0)
				if(src.suffix == null)
					if(M.weight+src.weight <= M.weightmax)
						src.loc = M
						src.suffix = "(Carrying)"
						M.weight += src.weight
						src.Owner = M.Owner
						return
					else
						usr << "[M] : I Cant Carry Too Much!"
						return
	for(var/mob/Monsters/M in usr.Selected)
		for(src in M)
			if(src.loc == M)
				if(src.suffix == "(Carrying)")
					var/list/menu = new()
					menu += "Drop"
					menu += "Inspect"
					menu += "Place"
					menu += "Destroy"
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
						if(src in M)
							M.weight -= src.weight
						del(src)
						return
					if (Result == "Place")
						if(src.Placed == 0)
							src.loc = M.loc
							src.dir = M.dir
							src.density = 1
							M.weight -= src.weight
							src.Placed = 1
							src.opacity = 0
							src.Door = 1
							src.Locked = 0
							src.Death()
							return

/obj/Items/Furniture/Fences/MetalFence
	icon = 'Fences.dmi'
	icon_state = "Metal Fence"
	weight = 25
	desc = "This is a fence."
	suffix = null
	HumanParts = 0
	HP = 10

/obj/Items/Furniture/Fences/MetalFence/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 1)
			var/list/menu = new()
			menu += "Attack"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result == "Cancel")
				return
			if (Result == "Attack")
				M.destination = src
				return
		if(src in view(1,M))
			M.destination = null
			if(src.Placed == 0)
				if(src.suffix == null)
					if(M.weight+src.weight <= M.weightmax)
						src.loc = M
						src.suffix = "(Carrying)"
						M.weight += src.weight
						src.Owner = M.Owner
						return
					else
						usr << "[M] : I Cant Carry Too Much!"
						return

	for(var/mob/Monsters/M in usr.Selected)
		for(src in M)
			if(src.loc == M)
				if(src.suffix == "(Carrying)")
					var/list/menu = new()
					menu += "Drop"
					menu += "Inspect"
					menu += "Place"
					menu += "Destroy"
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
						if(src in M)
							M.weight -= src.weight
						del(src)
						return
					if (Result == "Place")
						if(src.Placed == 0)
							src.loc = M.loc
							src.dir = M.dir
							src.density = 1
							M.weight -= src.weight
							src.Placed = 1
							src.opacity = 0
							src.Door = 1
							src.Locked = 0
							src.Death()
							return
