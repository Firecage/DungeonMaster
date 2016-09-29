/obj/Items/Furniture/Doors
	Door = 1

/obj/Items/Furniture/Doors/TrapDoor
	icon = 'Cave.dmi'
	icon_state = "ClosedTrapDoor"
	weight = 100
	suffix = null
	HumanParts = 0
	HP = 10

/obj/Items/Furniture/Doors/TrapDoor/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 1)
			if(src.Locked == 1)
				if(M.Owner == src.Owner)
					var/list/menu = new()
					menu += "Lock"
					menu += "Make Key"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result == "Cancel")
						return
					if (Result == "Destroy")
						if(src in M)
							M.weight -= src.weight
						del(src)
						return
					if (Result == "Lock")
						if(src.Locked == 0)
							if(src.icon_state == "ClosedTrapDoor")
								src.Locked = 1
								view() << "[src] Locked!"
								return
						if(src.Locked == 1)
							if(src.icon_state == "ClosedTrapDoor")
								src.Locked = 0
								view() << "[src] Un-Locked!"
								return
					if (Result == "Make Key")
						var/obj/Items/Shafts/DoorKey/D = new
						D.loc = M
						M.weight += D.weight
						D.LockVar = src.LockVar
						M.Owner << "[M] makes a key to this door, it can be used by anyone to unlock it"
				else
					if(M in view(1,src))
						if(src.density == 1)
							var/list/menu = new()
							for(var/obj/Items/Shafts/LockPick/P in M)
								menu += "PickLock"
							for(var/obj/Items/Shafts/DoorKey/P in M)
								menu += "Unlock"
							if(M.Race == "Human")
								menu += "PickLock"
							if(M.SubRace == "Illithid")
								menu += "Unlock - TK"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "PickLock")
								if(M.Race != "Human")
									for(var/obj/Items/Shafts/LockPick/P in M)
										var/a
										a = prob(M.LockPickingSkill)
										if(a == 0)
											M.Owner << "Failed"
											M.LockPickingSkill += 1
											del(P)
											break
											return
										else
											M.Owner << "Unlocked!"
											src.Locked = 0
											M.LockPickingSkill += 1
											return
								else
									var/a
									a = prob(M.LockPickingSkill+5)
									if(a == 0)
										M.Owner << "Failed"
										M.LockPickingSkill += 1
										break
										return
									else
										M.Owner << "Unlocked!"
										src.Locked = 0
										M.LockPickingSkill += 1
										return
							if (Result == "Unlock")
								for(var/obj/Items/Shafts/DoorKey/P in M)
									if(P.LockVar == src.LockVar)
										view(M) << "[M] unlocks the door with a key."
										src.Locked = 0
										return
								return
							if (Result == "Unlock - TK")
								M.Owner << "[M] unlocks the trapdoor with their mind."
								src.Locked = 0
								return
			if(src.Locked == 0)
				if(M.Owner == src.Owner)
					if(M in view(1,src))
						if(src.icon_state == "OpenTrapDoor")
							src.icon_state = "ClosedTrapDoor"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.icon_state == "ClosedTrapDoor")
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.icon_state == "ClosedTrapDoor")
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
						if(src.icon_state == "ClosedTrapDoor")
							src.icon_state = "OpenTrapDoor"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								if(src in M)
									M.weight -= src.weight
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
				else
					if(M in view(1,src))
						if(src.icon_state == "OpenTrapDoor")
							src.icon_state = "ClosedTrapDoor"
							return
						if(src.icon_state == "ClosedTrapDoor")
							src.icon_state = "OpenTrapDoor"
							return





			if(M in view(1,src))
				if(src.icon_state == "OpenTrapDoor")
					src.icon_state = "ClosedTrapDoor"
					return
				if(src.icon_state == "ClosedTrapDoor")
					src.icon_state = "OpenTrapDoor"
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
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					src.Owner = null
					src.Locked = 0
					return

/obj/Items/Furniture/Doors/BoneDoor
	icon = 'Cave.dmi'
	icon_state = "BoneDoor"
	weight = 100
	suffix = null
	HumanParts = 0
	HP = 10

/obj/Items/Furniture/Doors/BoneDoor/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 1)
			if(src.Locked == 1)
				if(M.Owner == src.Owner)
					var/list/menu = new()
					menu += "Lock"
					menu += "Make Key"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result == "Cancel")
						return
					if (Result == "Destroy")
						if(src in M)
							M.weight -= src.weight
						del(src)
						return
					if (Result == "Lock")
						if(src.Locked == 0)
							if(src.density == 1)
								src.Locked = 1
								view() << "[src] Locked!"
								return
						if(src.Locked == 1)
							if(src.density == 1)
								src.Locked = 0
								view() << "[src] Un-Locked!"
								return
					if (Result == "Make Key")
						var/obj/Items/Shafts/DoorKey/D = new
						D.loc = M
						M.weight += D.weight
						D.LockVar = src.LockVar
						M.Owner << "[M] makes a key to this door, it can be used by anyone to unlock it"
				else
					if(M in view(1,src))
						if(src.density == 1)
							var/list/menu = new()
							for(var/obj/Items/Shafts/LockPick/P in M)
								menu += "PickLock"
							for(var/obj/Items/Shafts/DoorKey/P in M)
								menu += "Unlock"
							if(M.Race == "Human")
								menu += "PickLock"
							if(M.SubRace == "Illithid")
								menu += "Unlock - TK"
							menu += "Attack"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Attack")
								M.destination = src
								src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
								return
							if (Result == "PickLock")
								if(M.Race != "Human")
									for(var/obj/Items/Shafts/LockPick/P in M)
										var/a
										a = prob(M.LockPickingSkill)
										if(a == 0)
											M.Owner << "Failed"
											M.LockPickingSkill += 1
											del(P)
											break
											return
										else
											M.Owner << "Unlocked!"
											src.Locked = 0
											M.LockPickingSkill += 1
											return
								else
									var/a
									a = prob(M.LockPickingSkill+5)
									if(a == 0)
										M.Owner << "Failed"
										M.LockPickingSkill += 1
										break
										return
									else
										M.Owner << "Unlocked!"
										src.Locked = 0
										M.LockPickingSkill += 1
										return
							if (Result == "Unlock")
								for(var/obj/Items/Shafts/DoorKey/P in M)
									if(P.LockVar == src.LockVar)
										view(M) << "[M] unlocks the door with a key."
										src.Locked = 0
										return
								return
							if (Result == "Unlock - TK")
								M.Owner << "[M] unlocks the door with their mind."
								src.Locked = 0
								return
			if(src.Locked == 0)
				if(M.Owner == src.Owner)
					if(M in view(1,src))
						if(src.density == 0)
							src.density = 1
							src.opacity = 1
							src.icon_state = "BoneDoor"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
						if(src.density == 1)
							src.density = 0
							src.opacity = 0
							src.icon_state = "Open"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								if(src in M)
									M.weight -= src.weight
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
				else
					if(M in view(1,src))
						if(src.density == 0)
							src.density = 1
							src.opacity = 1
							src.icon_state = "BoneDoor"
							return
						if(src.density == 1)
							src.density = 0
							src.opacity = 0
							src.icon_state = "Open"
							return





			if(M in view(1,src))
				if(src.density == 0)
					src.density = 1
					src.opacity = 1
					src.icon_state = "BoneDoor"
					return
				if(src.density == 1)
					src.density = 0
					src.opacity = 0
					src.icon_state = "Open"
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
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					src.Owner = null
					src.Locked = 0
					return

/obj/Items/Furniture/Doors/GoldDoor
	icon = 'GoldItems.dmi'
	icon_state = "GoldDoor"
	weight = 100
	suffix = null
	HumanParts = 0
	HP = 10

/obj/Items/Furniture/Doors/GoldDoor/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 1)
			if(src.Locked == 1)
				if(M.Owner == src.Owner)
					var/list/menu = new()
					menu += "Lock"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result == "Cancel")
						return
					if (Result == "Destroy")
						if(src in M)
							M.weight -= src.weight
						del(src)
						return
					if (Result == "Lock")
						if(src.Locked == 0)
							if(src.density == 1)
								src.Locked = 1
								view() << "[src] Locked!"
								return
						if(src.Locked == 1)
							if(src.density == 1)
								src.Locked = 0
								view() << "[src] Un-Locked!"
								return
				else
					if(M in view(1,src))
						if(src.density == 1)
							var/list/menu = new()
							for(var/obj/Items/Shafts/LockPick/P in M)
								menu += "PickLock"
							for(var/obj/Items/Shafts/DoorKey/P in M)
								menu += "Unlock"
							if(M.Race == "Human")
								menu += "PickLock"
							if(M.SubRace == "Illithid")
								menu += "Unlock - TK"
							menu += "Attack"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Attack")
								M.destination = src
								src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
								return
							if (Result == "PickLock")
								if(M.Race != "Human")
									for(var/obj/Items/Shafts/LockPick/P in M)
										var/a
										a = prob(M.LockPickingSkill)
										if(a == 0)
											M.Owner << "Failed"
											M.LockPickingSkill += 1
											del(P)
											break
											return
										else
											M.Owner << "Unlocked!"
											src.Locked = 0
											M.LockPickingSkill += 1
											return
								else
									var/a
									a = prob(M.LockPickingSkill+5)
									if(a == 0)
										M.Owner << "Failed"
										M.LockPickingSkill += 1
										break
										return
									else
										M.Owner << "Unlocked!"
										src.Locked = 0
										M.LockPickingSkill += 1
										return
							if (Result == "Unlock")
								for(var/obj/Items/Shafts/DoorKey/P in M)
									if(P.LockVar == src.LockVar)
										M.Owner << "[M] unlocks the door with a key."
										src.Locked = 0
										return
								return
							if (Result == "Unlock - TK")
								M.Owner << "[M] unlocks the door with their mind."
								src.Locked = 0
								return
			if(src.Locked == 0)
				if(M.Owner == src.Owner)
					if(M in view(1,src))
						if(src.density == 0)
							src.density = 1
							src.opacity = 1
							src.icon_state = "GoldDoor"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
						if(src.density == 1)
							src.density = 0
							src.opacity = 0
							src.icon_state = "Open"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
				else
					if(M in view(1,src))
						if(src.density == 0)
							src.density = 1
							src.opacity = 1
							src.icon_state = "GoldDoor"
							return
						if(src.density == 1)
							src.density = 0
							src.opacity = 0
							src.icon_state = "Open"
							return





			if(M in view(1,src))
				if(src.density == 0)
					src.density = 1
					src.opacity = 1
					src.icon_state = "GoldDoor"
					return
				if(src.density == 1)
					src.density = 0
					src.opacity = 0
					src.icon_state = "Open"
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
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					src.Owner = null
					src.Locked = 0
					return

/obj/Items/Furniture/Doors/MetalDoor
	icon = 'MetalObjects.dmi'
	icon_state = "MetalDoor"
	weight = 100
	suffix = null
	HumanParts = 0
	HP = 10

/obj/Items/Furniture/Doors/MetalDoor/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 1)
			if(src.Locked == 1)
				if(M.Owner == src.Owner)
					var/list/menu = new()
					menu += "Lock"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result == "Cancel")
						return
					if (Result == "Destroy")
						if(src in M)
							M.weight -= src.weight
						del src
						return
					if (Result == "Lock")
						if(src.Locked == 0)
							if(src.density == 1)
								src.Locked = 1
								view() << "[src] Locked!"
								return
						if(src.Locked == 1)
							if(src.density == 1)
								src.Locked = 0
								view() << "[src] Un-Locked!"
								return
				else
					if(M in view(1,src))
						if(src.density == 1)
							var/list/menu = new()
							for(var/obj/Items/Shafts/LockPick/P in M)
								menu += "PickLock"
							for(var/obj/Items/Shafts/DoorKey/P in M)
								menu += "Unlock"
							if(M.Race == "Human")
								menu += "PickLock"
							if(M.SubRace == "Illithid")
								menu += "Unlock - TK"
							menu += "Attack"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Attack")
								M.destination = src
								src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
								return
							if (Result == "PickLock")
								if(M.Race != "Human")
									for(var/obj/Items/Shafts/LockPick/P in M)
										var/a
										a = prob(M.LockPickingSkill)
										if(a == 0)
											M.Owner << "Failed"
											M.LockPickingSkill += 1
											del(P)
											break
											return
										else
											M.Owner << "Unlocked!"
											src.Locked = 0
											M.LockPickingSkill += 1
											return
								else
									var/a
									a = prob(M.LockPickingSkill+5)
									if(a == 0)
										M.Owner << "Failed"
										M.LockPickingSkill += 1
										break
										return
									else
										M.Owner << "Unlocked!"
										src.Locked = 0
										M.LockPickingSkill += 1
										return
							if (Result == "Unlock")
								for(var/obj/Items/Shafts/DoorKey/P in M)
									if(P.LockVar == src.LockVar)
										M.Owner << "[M] unlocks the door with a key."
										src.Locked = 0
										return
								return
							if (Result == "Unlock - TK")
								M.Owner << "[M] unlocks the door with their mind."
								src.Locked = 0
								return
			if(src.Locked == 0)
				if(M.Owner == src.Owner)
					if(M in view(1,src))
						if(src.density == 0)
							src.density = 1
							src.opacity = 1
							src.icon_state = "MetalDoor"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
						if(src.density == 1)
							src.density = 0
							src.opacity = 0
							src.icon_state = "Open"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
				else
					if(M in view(1,src))
						if(src.density == 0)
							src.density = 1
							src.opacity = 1
							src.icon_state = "MetalDoor"
							return
						if(src.density == 1)
							src.density = 0
							src.opacity = 0
							src.icon_state = "Open"
							return





			if(M in view(1,src))
				if(src.density == 0)
					src.density = 1
					src.opacity = 1
					src.icon_state = "MetalDoor"
					return
				if(src.density == 1)
					src.density = 0
					src.opacity = 0
					src.icon_state = "Open"
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
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					src.Owner = null
					src.Locked = 0
					return

/obj/Items/Furniture/Doors/StoneDoor
	icon = 'StoneItems.dmi'
	icon_state = "StoneDoor"
	weight = 100
	suffix = null
	HumanParts = 0
	HP = 10

/obj/Items/Furniture/Doors/StoneDoor/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 1)
			if(src.Locked == 1)
				if(M.Owner == src.Owner)
					var/list/menu = new()
					menu += "Lock"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result == "Cancel")
						return
					if (Result == "Destroy")
						if(src in M)
							M.weight -= src.weight
						del src
						return
					if (Result == "Lock")
						if(src.Locked == 0)
							if(src.density == 1)
								src.Locked = 1
								view() << "[src] Locked!"
								return
						if(src.Locked == 1)
							if(src.density == 1)
								src.Locked = 0
								view() << "[src] Un-Locked!"
								return
				else
					if(M in view(1,src))
						if(src.density == 1)
							var/list/menu = new()
							for(var/obj/Items/Shafts/LockPick/P in M)
								menu += "PickLock"
							for(var/obj/Items/Shafts/DoorKey/P in M)
								menu += "Unlock"
							if(M.Race == "Human")
								menu += "PickLock"
							if(M.SubRace == "Illithid")
								menu += "Unlock - TK"
							menu += "Attack"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Attack")
								M.destination = src
								src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
								return
							if (Result == "PickLock")
								if(M.Race != "Human")
									for(var/obj/Items/Shafts/LockPick/P in M)
										var/a
										a = prob(M.LockPickingSkill)
										if(a == 0)
											M.Owner << "Failed"
											M.LockPickingSkill += 1
											del(P)
											break
											return
										else
											M.Owner << "Unlocked!"
											src.Locked = 0
											M.LockPickingSkill += 1
											return
								else
									var/a
									a = prob(M.LockPickingSkill+5)
									if(a == 0)
										M.Owner << "Failed"
										M.LockPickingSkill += 1
										break
										return
									else
										M.Owner << "Unlocked!"
										src.Locked = 0
										M.LockPickingSkill += 1
										return
							if (Result == "Unlock")
								for(var/obj/Items/Shafts/DoorKey/P in M)
									if(P.LockVar == src.LockVar)
										M.Owner << "[M] unlocks the door with a key."
										src.Locked = 0
										return
								return
							if (Result == "Unlock - TK")
								M.Owner << "[M] unlocks the door with their mind."
								src.Locked = 0
								return
			if(src.Locked == 0)
				if(M.Owner == src.Owner)
					if(M in view(1,src))
						if(src.density == 0)
							src.density = 1
							src.opacity = 1
							src.icon_state = "StoneDoor"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
						if(src.density == 1)
							src.density = 0
							src.opacity = 0
							src.icon_state = "StoneOpen"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
				else
					if(M in view(1,src))
						if(src.density == 0)
							src.density = 1
							src.opacity = 1
							src.icon_state = "StoneDoor"
							return
						if(src.density == 1)
							src.density = 0
							src.opacity = 0
							src.icon_state = "StoneOpen"
							return





			if(M in view(1,src))
				if(src.density == 0)
					src.density = 1
					src.opacity = 1
					src.icon_state = "StoneDoor"
					return
				if(src.density == 1)
					src.density = 0
					src.opacity = 0
					src.icon_state = "StoneOpen"
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
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					src.Owner = null
					src.Locked = 0
					return

/obj/Items/Furniture/Doors/WoodenDoor
	icon = 'Cave.dmi'
	icon_state = "WoodenDoor"
	weight = 100
	suffix = null
	HumanParts = 0
	IsWood = 1
	HP = 10

/obj/Items/Furniture/Doors/WoodenDoor/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 1)
			if(src.Locked == 1)
				if(M.Owner == src.Owner)
					var/list/menu = new()
					menu += "Lock"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result == "Cancel")
						return
					if (Result == "Destroy")
						if(src in M)
							M.weight -= src.weight
						del src
						return
					if (Result == "Lock")
						if(src.Locked == 0)
							if(src.density == 1)
								src.Locked = 1
								view() << "[src] Locked!"
								return
						if(src.Locked == 1)
							if(src.density == 1)
								src.Locked = 0
								view() << "[src] Un-Locked!"
								return
				else
					if(M in view(1,src))
						if(src.density == 1)
							var/list/menu = new()
							for(var/obj/Items/Shafts/LockPick/P in M)
								menu += "PickLock"
							for(var/obj/Items/Shafts/DoorKey/P in M)
								menu += "Unlock"
							if(M.SubRace == "Illithid")
								menu += "Unlock - TK"
							if(M.Race == "Human")
								menu += "PickLock"
							menu += "Attack"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Attack")
								M.destination = src
								src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
								return
							if (Result == "PickLock")
								if(M.Race != "Human")
									for(var/obj/Items/Shafts/LockPick/P in M)
										var/a
										a = prob(M.LockPickingSkill)
										if(a == 0)
											M.Owner << "Failed"
											M.LockPickingSkill += 1
											del(P)
											break
											return
										else
											M.Owner << "Unlocked!"
											src.Locked = 0
											M.LockPickingSkill += 1
											return
								else
									var/a
									a = prob(M.LockPickingSkill+5)
									if(a == 0)
										M.Owner << "Failed"
										M.LockPickingSkill += 1
										break
										return
									else
										M.Owner << "Unlocked!"
										src.Locked = 0
										M.LockPickingSkill += 1
										return
							if (Result == "Unlock")
								for(var/obj/Items/Shafts/DoorKey/P in M)
									if(P.LockVar == src.LockVar)
										M.Owner << "[M] unlocks the door with a key."
										src.Locked = 0
										return
								return
							if (Result == "Unlock - TK")
								M.Owner << "[M] unlocks the door with their mind."
								src.Locked = 0
								return
			if(src.Locked == 0)
				if(M.Owner == src.Owner)
					if(M in view(1,src))
						if(src.density == 0)
							src.density = 1
							src.opacity = 1
							src.icon_state = "WoodenDoor"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
						if(src.density == 1)
							src.density = 0
							src.opacity = 0
							src.icon_state = "Open"
							var/list/menu = new()
							menu += "Lock"
							menu += "Destroy"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Cancel")
								return
							if (Result == "Destroy")
								del(src)
								return
							if (Result == "Lock")
								if(src.Locked == 0)
									if(src.density == 1)
										src.Locked = 1
										view() << "[src] Locked!"
										return
								if(src.Locked == 1)
									if(src.density == 1)
										src.Locked = 0
										view() << "[src] Un-Locked!"
										return
							return
				else
					if(M in view(1,src))
						if(src.density == 0)
							src.density = 1
							src.opacity = 1
							src.icon_state = "WoodenDoor"
							return
						if(src.density == 1)
							src.density = 0
							src.opacity = 0
							src.icon_state = "Open"
							return





			if(M in view(1,src))
				if(src.density == 0)
					src.density = 1
					src.opacity = 1
					src.icon_state = "WoodenDoor"
					return
				if(src.density == 1)
					src.density = 0
					src.opacity = 0
					src.icon_state = "Open"
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
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					src.Owner = null
					src.Locked = 0
					return
