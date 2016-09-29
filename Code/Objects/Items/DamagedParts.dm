
obj
	Comet
		New()
			ItemDecay()
		icon = 'Cave.dmi'
		icon_state = "Comet"
		density = 0
		opacity = 1
		weight = 30
		suffix = null
		desc = "A large boulder fallen from the sky!"
		DblClick()
			for(var/mob/Monsters/M in usr.Selected)
				if(src in view(1,M))
					M.destination = null
					if(src.suffix == null)
						if(M.weight+src.weight<=M.weightmax)
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
					var/list/menu = new()
					menu += "Drop"
					menu += "Inspect"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Inspect")
						if(M.Race == "Human")
							usr << "According to your races historical texts this appears to be a boulder fallen from the realm of gods which emits a powerful magical aura.*I wonder what i might make with this*"
						else
							usr << src.desc
					if (Result == "Drop")
						if(src.suffix == "(Carrying)")
							var/obj/A1 = src
							A1.loc = M.loc
							A1.suffix = null
							M.weight -= A1.weight
							return
	Smoke
		icon = 'Cave.dmi'
		icon_state = "Smoke"
		density = 0
		IsMist = 1
		IsWood = 0
		opacity = 1
		New()
			SmokeMove()
			DeleteSmoke()
	Fire
		icon = 'Cave.dmi'
		icon_state = "Flame"
		density = 0
		IsMist = 1
		IsWood = 0
		layer = 50
		New()
			SmokeMove()
			DeleteSmoke()
			Flame()
			pixel_x = rand(-12,12)
			pixel_y = rand(-12,12)
	Trees
		layer = 5
		fleaves1x2
			icon = 'plants.dmi'
			icon_state = "fleaves 1x2"
			pixel_y = 32
			pixel_x = -32
		fleaves2x2
			icon = 'plants.dmi'
			icon_state = "fleaves 2x2"
			pixel_y = 32
		fleaves3x1
			icon = 'plants.dmi'
			icon_state = "fleaves 3x1"
		fleaves3x2
			icon = 'plants.dmi'
			icon_state = "fleaves 3x2"
			pixel_y = 32
			pixel_x = 32
		fleaves1x1
			icon = 'plants.dmi'
			icon_state = "fleaves 1x1"
			pixel_x = -32
		fleaves2x1
			icon = 'plants.dmi'
			icon_state = "fleaves 2x1"
		fleaves3x1
			icon = 'plants.dmi'
			icon_state = "fleaves 3x1"
			pixel_x = 32
		leaves1x1
			icon = 'plants.dmi'
			icon_state = "leaves 1x1"
			pixel_x = -32
		leaves2x1
			icon = 'plants.dmi'
			icon_state = "leaves 2x1"
		leaves3x1
			icon = 'plants.dmi'
			icon_state = "leaves 3x1"
			pixel_x = 32
		leaves21x1
			icon = 'plants.dmi'
			icon_state = "leaves2 1x1"
		leaves1x2
			icon = 'plants.dmi'
			icon_state = "leaves 1x2"
			pixel_y = 32
			pixel_x = -32
		leaves21x2
			icon = 'plants.dmi'
			icon_state = "leaves2 1x2"
			pixel_y = 32
		leaves3x2
			icon = 'plants.dmi'
			icon_state = "leaves 3x2"
			pixel_y = 32
			pixel_x = 32
		leaves2x2
			icon = 'plants.dmi'
			icon_state = "leaves 2x2"
			pixel_y = 32
		tree3x2
			icon = 'plants.dmi'
			icon_state = "tree 3x2"
			pixel_y = 32
			pixel_x = 32
		tree1x2
			icon = 'plants.dmi'
			icon_state = "tree 1x2"
			pixel_y = 32
			pixel_x = -32
		tree21x2
			icon = 'plants.dmi'
			icon_state = "tree2 1x2"
			pixel_y = 32
		tree2x2
			icon = 'plants.dmi'
			icon_state = "tree 2x2"
			pixel_y = 32
