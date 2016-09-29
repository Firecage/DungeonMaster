/*proc
	fixbamboo()
		for(var/turf/grounds/Trees/Bamboo/b in world)
			b.icon = 'bamboo.dmi'
			b.icon_state = "Bamboo"
			b.Tree = 1
			b.Bamboo = 1
			b.name = "Bamboo"
			b.Content = "Marsh"
			b.IsWood = 1
			b.density = 1
			b.OIcon = "Marsh"
			b.text = "<font color=#99FF00>B"
		for(var/obj/Tree/Bamboo/bb in world)
			bb.icon = 'bamboo.dmi'
			bb.icon_state = "Bamboo"
			bb.Tree = 1
			bb.Bamboo = 1
			bb.density = 1
			bb.name = "Bamboo"
			bb.Content = "Marsh"
			bb.IsWood = 1
			//bb.OIcon = "Marsh"
			bb.text = "<font color=#99FF00>B"
		for(var/obj/Tree/Cactus/c in world)
			c.icon = 'cactus.dmi'
			c.icon_state = "Cactus"
			c.Tree = 1
			c.Cactus = 1
			c.density = 1
			c.name = "Cactus"
			//c.OIcon = "Desert"
			c.text = "<font color=#99FF00>C"
proc
	fixbambooloop()
		fixbamboo()
		spawn(3000)
			fixbambooloop()*/
obj
	Tree
		Tree = 1
		Bamboo
			icon = 'bamboo.dmi'
			icon_state = "Bamboo"
			Tree = 1
			Bamboo = 1
			name = "Bamboo"
			Content = "Marsh"
			IsWood = 1
			density = 1
			pixel_x = 0
			//OIcon = "Marsh"
			text = "<font color=#99FF00>B"
		Cactus
			icon = 'cactus.dmi'
			icon_state = "Cactus"
			Tree = 1
			Cactus = 1
			density = 1
			name = "Cactus"
			pixel_x = 0
			//OIcon = "Desert"
			text = "<font color=#99FF00>C"
