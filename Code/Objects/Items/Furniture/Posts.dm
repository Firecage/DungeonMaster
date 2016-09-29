/obj/Items/Furniture/Posts

/obj/Items/Furniture/Posts/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight+src.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					M.Target = null
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
/obj/Items/Furniture/Posts/BoneTrainingPost
	icon = 'Cave.dmi'
	icon_state = "BonePost"
	weight = 50
	suffix = null
	Content3 = 1
	HP = 100
	TP = 1
	density = 1

/obj/Items/Furniture/Posts/SilkTrainingPost
	icon = 'Cave.dmi'
	icon_state = "SilkPost"
	weight = 50
	suffix = null
	Content3 = 1
	HP = 100
	TP = 1
	density = 1

/obj/Items/Furniture/Posts/WoodTrainingPost
	icon = 'Cave.dmi'
	icon_state = "Wood Post"
	weight = 50
	Content3 = 1
	suffix = null
	HP = 100
	TP = 1
	density = 1

/obj/Items/Furniture/Posts/GoldTrainingPost
	icon = 'GoldItems.dmi'
	icon_state = "Gold Training Post"
	weight = 50
	suffix = null
	Content3 = 1
	HP = 100
	TP = 1
	density = 1

/obj/Items/Furniture/Posts/SilverTrainingPost
	icon = 'SilverItems.dmi'
	icon_state = "Silver Training Post"
	weight = 50
	Silver = 1
	Content3 = 1
	HP = 100
	TP = 1
	density = 1

/obj/Items/Furniture/Posts/MetalTrainingPost
	icon = 'MetalObjects.dmi'
	icon_state = "Metal Training Post"
	weight = 50
	HP = 100
	Content3 = 1
	TP = 1
	density = 1
