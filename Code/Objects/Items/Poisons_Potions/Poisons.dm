/obj/Items/Poisons

/obj/Items/Poisons/DblClick()
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

/obj/Items/Poisons/Toxic
	icon = 'Cave.dmi'
	icon_state = "Toxic"
	weight = 10
	suffix = null
	desc = "This is toxic, it can be used to add poison to weapons, traps and food, it can be used to even poison units in their sleep. It is more deadly than normal posion."

/obj/Items/Poisons/Poison
	icon = 'Cave.dmi'
	icon_state = "Poison"
	weight = 10
	suffix = null
	desc = "This is posion, it can be used to add poison to weapons, traps and food, it can be used to even poison units in their sleep."

/obj/Items/Poisons/StrongPoison
	icon = 'Cave.dmi'
	icon_state = "StrongPoison"
	weight = 10
	suffix = null
	desc = "This is strong posion, it can be used to add poison to weapons, traps and food, it can be used to even poison units in their sleep. It is more deadly than normal poison and toxic"