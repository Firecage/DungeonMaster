/obj/Items/gems/RubyRing
	icon = 'Jewelry.dmi'
	icon_state = "Ruby Ring"
	weight = 5
	desc = "This is a Ruby Ring, it can be enchanted by a Mage to create a Ring of Fury"

/obj/Items/gems/RubyRing/DblClick()
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
			var/list/menu = new()
			menu += "Drop"
			menu += "Inspect"
			menu += "Cancel"
			if(M.MagicalAptitude == 1 && src.Enchanted == 0)
				menu += "Enchant"
			if(src.Enchanted == 1) if(M.UsesEquipment)
				menu += "Wear"
				menu += "Remove"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Inspect")
				usr << src.desc
			if (Result == "Enchant")
				if(M.Mana >= 40)
					if(src.icon_state == "Silver Ruby Ring")
						usr << "Enchants the ring with magical essence!"
						M.Mana -= 40
						src.Enchanted = 1
						src.name = "Ring of Fury"
					if(src.icon_state == "Ruby Ring")
						usr << "Enchants the ring with magical essence!"
						M.Mana -= 40
						src.Enchanted = 1
						src.name = "Ring of Berserker Fury"
				else
					usr << "[M] needs 40 mana to do this!"
			if (Result == "Wear")
				if(src.suffix == "(Carrying)")
					if(M.WearingRing == 0)
						src.suffix = "(Equipped)"
						M.WearingRing = 1
						usr << "[M] puts on the [src]"
						M.WeaponDamageMin += 2
						M.WeaponDamageMax += 5
						return
					else
						usr << "[M] is already wearing a ring"
			if (Result == "Remove")
				if(src.suffix == "(Equipped)")
					if(M.WearingRing == 1)
						src.suffix = "(Carrying)"
						M.WearingRing = 0
						usr << "[M] takes off the [src]"
						M.WeaponDamageMin -= 2
						M.WeaponDamageMax -= 5
						return
					else
						usr << "[M] isn't wearing a ring"
			if (Result == "Drop")
				if(src.suffix == "(Carrying)")
					var/obj/A1 = src
					A1.loc = M.loc
					A1.suffix = null
					M.weight -= A1.weight
					return

/obj/Items/gems/DiamondRing
	icon = 'Jewelry.dmi'
	icon_state = "Diamond Ring"
	weight = 5
	desc = "This is a Diamond Ring, it can be enchanted by a Mage to create a Ring of Protection"

/obj/Items/gems/DiamondRing/DblClick()
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
			var/list/menu = new()
			menu += "Drop"
			menu += "Inspect"
			menu += "Cancel"
			if(M.MagicalAptitude == 1 && src.Enchanted == 0)
				menu += "Enchant"
			if(src.Enchanted == 1) if(M.UsesEquipment)
				menu += "Wear"
				menu += "Remove"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Inspect")
				usr << src.desc
			if (Result == "Enchant")
				if(M.Mana >= 40)
					if(src.icon_state == "Silver Diamond Ring")
						usr << "Enchants the ring with magical essence!"
						M.Mana -= 40
						src.Enchanted = 1
						src.name = "Ring of Protection"
					if(src.icon_state == "Diamond Ring")
						usr << "Enchants the ring with magical essence!"
						M.Mana -= 40
						src.Enchanted = 1
						src.name = "Ring of Invulnerable Flesh"
				else
					usr << "[M] needs 40 mana to do this!"
			if (Result == "Wear")
				if(src.suffix == "(Carrying)")
					if(M.WearingRing == 0)
						src.suffix = "(Equipped)"
						M.WearingRing = 1
						usr << "[M] puts on the [src]"
						M.Defence += 10
						if(src.icon_state == "Diamond Ring")
							M.Defence += 5
							M.ImmuneToMagic = 1
						return
					else
						usr << "[M] is already wearing a ring"
			if (Result == "Remove")
				if(src.suffix == "(Equipped)")
					if(M.WearingRing)
						src.suffix = "(Carrying)"
						M.WearingRing = 0
						usr << "[M] takes off the [src]"
						M.Defence -= 10
						if(src.icon_state == "Diamond Ring")
							M.Defence -= 5
						return
					else
						usr << "[M] isn't wearing a ring"
			if (Result == "Drop")
				if(src.suffix == "(Carrying)")
					var/obj/A1 = src
					A1.loc = M.loc
					A1.suffix = null
					M.weight -= A1.weight
					return

/obj/Items/gems/EmeraldRing
	icon = 'Jewelry.dmi'
	icon_state = "Emerald Ring"
	weight = 5
	desc = "This is a Emerald Ring, it can be enchanted by a Mage to create a Ring of Poison Resistance"

/obj/Items/gems/EmeraldRing/DblClick()
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
			var/list/menu = new()
			menu += "Drop"
			menu += "Inspect"
			menu += "Cancel"
			if(M.MagicalAptitude == 1 && src.Enchanted == 0)
				menu += "Enchant"
			if(src.Enchanted == 1) if(M.UsesEquipment)
				if(!M.WearingRing)
					menu += "Wear"
				if(M.WearingRing)
					menu += "Remove"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Inspect")
				usr << src.desc
			if (Result == "Enchant")
				if(M.Mana >= 40)
					if(src.icon_state == "Silver Emerald Ring")
						usr << "Enchants the ring with magical essence!"
						M.Mana -= 40
						src.Enchanted = 1
						src.name = "Ring of Poison Resistance"
					if(src.icon_state == "Emerald Ring")
						usr << "Enchants the ring with magical essence!"
						M.Mana -= 40
						src.Enchanted = 1
						src.name = "Ring of Pestilence"
				else usr << "[M] needs 40 mana to do this!"
			if (Result == "Wear")
				if(src.suffix == "(Carrying)")
					if(!M.WearingRing)
						if(M.ImmunePoison == 0)
							src.suffix = "(Equipped)"
							M.WearingRing = 1
							usr << "[M] puts on the [src]"
							M.ImmunePoison = 1
							return
						else usr << "[M] is already immune to poison!"
					else usr << "[M] is already wearing a ring"
			if (Result == "Remove")
				if(src.suffix == "(Equipped)")
					if(M.WearingRing)
						src.suffix = "(Carrying)"
						M.WearingRing = 0
						usr << "[M] takes off the [src]"
						M.ImmunePoison = 0
						return
					else usr << "[M] isn't wearing a ring"
			if (Result == "Drop")
				if(src.suffix == "(Carrying)")
					var/obj/A1 = src
					A1.loc = M.loc
					A1.suffix = null
					M.weight -= A1.weight
					return

/obj/Items/gems/PlantFibreRing
	icon = 'Jewelry.dmi'
	icon_state = "Lycan Ring"
	weight = 5
	desc = "This is a Plant Fibre Ring, it can be enchanted by a Mage to create a Ring of Lycanthropy"

/obj/Items/gems/PlantFibreRing/DblClick()
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
			if(M)
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				menu += "Cancel"
				if(M.MagicalAptitude == 1 && src.Enchanted == 0)
					menu += "Enchant"
				if(src.Enchanted == 1)
					if(!M.WearingRing) if(M.UsesEquipment)
						menu += "Wear"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Enchant")
					if(M.Mana >= 60)
						usr << "Enchants the ring with magical essence!"
						M.Mana -= 60
						src.Enchanted = 1
						src.name = "Ring of Lycanthropy"
					else
						usr << "[M] needs 60 mana to do this!"
				if (Result == "Wear")
					if(src.suffix == "(Carrying)")
						if(!M.WearingRing)
							if(!M.SubRace && M.Race != "Vampire" && M.Race != "Spider" && M.Race != "Gargoyle" && M.Wagon == 0 && M.Race != "Skeleton" )
								M.WearingRing = 1
								usr << "[M] puts on the ring of Lycanthropy, it bonds to their flesh and eats into their hand!"
								M.SubRace = "Werewolf"
								M.Carn = 1
								M.Strength += 4
								M.Agility += 4
								M.Defence += 15
								M.Delay -= 1
								M.Regen()
								if(M.DropItem(src)) del(src)
							else
								usr << "[M] attempts to wear the ring but it slips off their finger leaving large, bloody gashes"
								M.BloodLoss()
								M.BloodContent -= 10
								if(M.Race == "Vampire")
									usr << "[M]'s ring finger is sliced off!"
									M.WearingRing = 1
						else
							usr << "[M] is already wearing a ring"
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return