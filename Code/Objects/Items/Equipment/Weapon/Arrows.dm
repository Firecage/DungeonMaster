/obj/Items/Arrows/WoodenArrow
	//sticks in or caught in mid air
	icon = 'WoodItems.dmi'
	icon_state = "Arrow"
	weight = 3
	suffix = null
	desc = "This is a wooden arrow, its very sharp"

/obj/Items/Arrows/WoodenArrow/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.WearingBack == 1)
					for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
						if(L.suffix == "(Equipped)")
							if(L.Content <= 250)
								src.loc = L
								L.Content += 1
								return
				else
					usr << "[M] : I have no quiver to put arrows in<br>"
					return


/obj/Items/Arrows/MetalArrow
	//sticks in or caught in mid air
	icon = 'MetalObjects.dmi'
	icon_state = "Arrow"
	weight = 3
	suffix = null
	desc = "This is a metal arrow, its very sharp"

/obj/Items/Arrows/MetalArrow/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.WearingBack == 1)
					for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
						if(L.suffix == "(Equipped)")
							if(L.Content <= 250)
								src.loc = L
								L.Content += 1
								return
				else
					usr << "[M] : I have no quiver to put arrows in<br>"
					return

/obj/Items/Arrows/SilverArrow
	//sticks in or caught in mid air
	icon = 'SilverItems.dmi'
	icon_state = "Arrow"
	weight = 3
	suffix = null
	desc = "This is a silver arrow, its very sharp"

/obj/Items/Arrows/SilverArrow/DblClick()

	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.WearingBack == 1)
					for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
						if(L.suffix == "(Equipped)")
							if(L.Content <= 250)
								src.loc = L
								L.Content += 1
								return
				else
					usr << "[M] : I have no quiver to put arrows in<br>"
					return


/obj/Items/Arrows/BoneArrow
	//sticks in or caught in mid air
	icon = 'BoneItems.dmi'
	icon_state = "Arrow"
	weight = 3
	suffix = null
	desc = "This is a bone arrow, its very sharp"

/obj/Items/Arrows/BoneArrow/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.WearingBack == 1)
					for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
						if(L.suffix == "(Equipped)")
							if(L.Content <= 250)
								src.loc = L
								L.Content += 1
								return
				else
					usr << "[M] : I have no quiver to put arrows in<br>"
					return
