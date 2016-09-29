/obj/Items/Potions

/obj/Items/Potions/EmptyBottle
	IsEmpty = 1
	icon = 'Farm Items.dmi'
	icon_state = "Empty"
	name = "Empty Bottle"
	weight = 10
	suffix = null
	desc = "This is an empty bottle, it can be used for potion creation."

/obj/Items/Potions/EmptyBottle/DblClick()
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

/obj/Items/Potions/LifePotion
	IsPotion = 1
	IsEmpty = 0
	icon = 'Farm Items.dmi'
	icon_state = "RedPotion"
	name = "Potion of LongLife"
	weight = 10
	suffix = null
	desc = "This is a potion of long life, it will extend a units life time."

/obj/Items/Potions/LifePotion/DblClick()
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

/obj/Items/Potions/EternalLifePotion
	IsPotion = 1
	IsEmpty = 0
	icon = 'Farm Items.dmi'
	icon_state = "SparklePotion"
	name = "Potion of Eternal Life"
	weight = 10
	suffix = null
	desc = "This is a potion of Eternal life, it will extend a units life time infinitely."

/obj/Items/Potions/EternalLifePotion/DblClick()
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

/obj/Items/Potions/VampirismCure
	IsPotion = 1
	IsEmpty = 0
	icon = 'Farm Items.dmi'
	icon_state = "BluePotion"
	name = "Vampirism Cure"
	weight = 10
	suffix = null
	desc = "This is a potion of Cure, it will prevent a newly bitten victim form turning into a vampire."

/obj/Items/Potions/VampirismCure/DblClick()
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

/obj/Items/Potions/HealPotion
	IsPotion = 1
	IsEmpty = 0
	icon = 'Farm Items.dmi'
	icon_state = "BluePotion"
	name = "Potion of Restoration"
	weight = 10
	suffix = null
	desc = "This is a potion of limb restoration, it will heal any lost limbs."

/obj/Items/Potions/HealPotion/DblClick()
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

/obj/Items/Potions/DevourerPotion
	IsPotion = 1
	IsEmpty = 0
	icon = 'Farm Items.dmi'
	icon_state = "PurplePotion"
	name = "Immunity To Devourer Potion"
	weight = 10
	suffix = null
	desc = "This is a potion of immunity, it will make you immune to the dread Devourer disease"

/obj/Items/Potions/DevourerPotion/DblClick()
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
