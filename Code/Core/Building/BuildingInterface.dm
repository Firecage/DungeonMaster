#define div(X,Y) ((X)-(X)%(Y))/(Y)
var
	isbopen = 0
obj/HUD
	Building_Interface
		icon = 'Building Interface.dmi'
		New()
		Open
			layer = 6
			icon_state = "Build"
			Click()
			//	..()
				usr:Build_Interface()

		BG
			layer = 7
			Start
				icon_state = "Start"

			Close
				icon_state = "Close"
				Click()
				//	..()
					usr:Build_Interface("delete")
		Sub_BG
			layer = 10
			icon_state = "B_U"
			End
				icon_state = "B_UT"

		Sub_BG_Big
			layer = 10
			icon_state = "U"
			Left
				icon_state = "U_L"
			Right
				icon_state = "U_R"
			Top
				icon_state = "U_T"
			Top_Left
				icon_state = "U_TL"
			Top_Right
				icon_state = "U_TR"


		Main
			layer = 8
			Wall
				icon_state = "Wall"
			Floor
				icon_state = "Floor"
			Station
				icon_state = "Station"
			Trap
				icon_state = "Traps"
			Other
				icon_state = "Other"

			Slider
				layer = 16
				var
					Menu
					list/HUD = list()
				icon_state = "SliderUp"

				New(M)
					..()
					Menu = M

				Click()
				//	..()
					if(icon_state == "SliderUp")
						var/list/Buildable = list()
						for(var/mob/Monsters/M in usr.Selected)
							if(Menu == "Wall")
								for(var/i in M.Can_Build_Walls)
									if(!(i in Buildable))
										Buildable += i
							if(Menu == "Floor")
								for(var/i in M.Can_Build_Floor)
									if(!(i in Buildable))
										Buildable += i
							if(Menu == "Station")
								for(var/i in M.Can_Build_Station)
									if(!(i in Buildable))
										Buildable += i
							if(Menu == "Trap")
								for(var/i in M.Can_Build_Traps)
									if(!(i in Buildable))
										Buildable += i
							if(Menu == "Other")
								for(var/i in M.Can_Build_Other)
									if(!(i in Buildable))
										Buildable += i
						if(Buildable)
							usr:Build_Interface("Sub-menu", Buildable, src.Menu ,src)
						icon_state = "SliderDown"

					else if(icon_state == "SliderDown")
						icon_state = "SliderUp"
						for(var/obj/O in src.HUD)
							del O

				Del()
					for(var/obj/O in src.HUD)
						del O
					..()


		Buildings
			layer = 15
			var/Object
			var/obj/HUD/Building_Interface/Main/Slider/Slider
			var/Slot = 1
			var/Active = 0
			var/Material
			var/MatCost = 1
			var/SpecBlueprint
			var/True_icon
			var/True_icon_state
			var/Drag_Option = 0
			New()
				..()
				if(!True_icon)
					True_icon = icon
				if(!True_icon_state)
					True_icon_state = icon_state

			Click()
			//	..()
				if(Active == 0)
					var/obj/HUD/Building_Interface/Buildings/O = new src.type()
					O.screen_loc = "[div((169+40*Slot+4),32)]:[(169+40*Slot+4)%32],2:1"
					usr.client.screen += O
					if(usr:Build_Picks[Slot])
						var/obj/O2 = usr:Build_Picks[Slot]
						usr:Build_Picks[Slot] = null
						del O2
					usr:Build_Picks[Slot] = O
					O.Active = 1
					usr:Building_Interface += O
					Slider.Click()
				if(Active == 1)
					var/obj/HUD/Building_Interface/Buildings/Blueprint/B
					if(!SpecBlueprint)
						B = new(null, src.True_icon, src.True_icon_state, src.Object, src.Material, src.bound_height, src.bound_width, MatCost, Drag_Option)
					else
						B = new SpecBlueprint(null, src.True_icon, src.True_icon_state, src.Object, src.Material, src.bound_height, src.bound_width, MatCost, Drag_Option)
					B.Image.icon += rgb(0,0,128)
					B.Image.alpha = 192
					usr:Blueprint = B
					usr << B.Image
					B.ImageBlocked.icon += rgb(128,0,0)
					B.ImageBlocked.alpha = 192


			Walls
				Drag_Option = 1

				Wood_Wall
					icon = 'Cave.dmi'
					icon_state = "WoodWall"
					Object = /turf/grounds/WoodWall
					Material = "Wood"
					MatCost = 0
				Stone_Wall
					icon = 'Cave.dmi'
					icon_state = "DetailedWall"
					Object = /turf/grounds/DetailedWall
					Material = "Stone"
					MatCost = 0

				Secret_Wall
					icon = 'Cave.dmi'
					icon_state = "CaveWall"
					Object = /turf/grounds/cavefloor
					Material = "Stone"
					MatCost = 0

				Elf_Wall
					icon = 'Cave.dmi'
					icon_state = "Elf Wall"
					Object = /turf/grounds/ElfWall
					Material = "Wood"
					MatCost = 0
				Bone_Wall
					icon = 'Cave.dmi'
					icon_state = "BoneWall"
					Object = /turf/grounds/BoneWall
					Material = "Bone"
					MatCost = 0
				Tribal_Wall
					icon = 'Cave.dmi'
					icon_state = "TribalWall"
					Object = /turf/grounds/TribalWall
					Material = "Wood"
					MatCost = 0
				Goblin_Wall
					icon = 'Cave.dmi'
					icon_state = "GoblinWall"
					Object = /turf/grounds/GoblinWall
					Material = "Stone"
					MatCost = 0
				Silk_Wall
					Material = "Silk"
					MatCost = 25
					icon = 'Cave.dmi'
					icon_state = "SilkWall"
					Object = /turf/grounds/SilkWall

				Flesh_Wall
					icon = 'Cave.dmi'
					icon_state = "DevourerWall1"
					Object = /turf/grounds/Devourer_Wall
					Material = "Eggs"
					MatCost = 0.25

			Floor
				Slot = 2
				Drag_Option = 2
				Wood_Floor
					icon = 'Cave.dmi'
					icon_state = "WoodFloor"
					Object = /turf/grounds/WoodFloor
					Material = "Wood"

				Stone_Floor
					icon = 'Cave.dmi'
					icon_state = "DetailedFloor"
					Object = /turf/grounds/DetailedFloor
					Material = "Stone"
					MatCost = 0
				Bone
					icon = 'Cave.dmi'
					icon_state = "BoneFloor"
					Object = /turf/grounds/BoneFloor
					Material = "Bone"
					MatCost = 0
				Tribal
					icon = 'Cave.dmi'
					icon_state = "Tribal"
					Object = /turf/grounds/TribalFloor
					Material = "Wood"
					MatCost = 0
				Goblin_Floor
					icon = 'Cave.dmi'
					icon_state = "GoblinFloor"
					Object = /turf/grounds/GoblinFloor
					Material = "Stone"
					MatCost = 0

				Flesh_Floor
					icon = 'Cave.dmi'
					icon_state = "DevourerFloor"
					Object = /turf/grounds/Devourer_Floor
					MatCost = 0

				Destroy
					icon = 'Cave.dmi'
					icon_state = "CaveFloor"
					SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/DestoyTile
					MatCost = 0

				DigChannel
					icon = 'HUD2.dmi'
					icon_state = "Channel"
					SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/DigChannel
					MatCost = 0

				Bridge
					icon = 'Cave.dmi'
					SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Bridge
					Wood
						icon_state = "WoodBridge"
						Material = "Wood"
						MatCost = 0
					Bone
						icon_state = "BoneBridge"
						Material = "Bone"
						MatCost = 0
					Tribal
						icon_state = "TribalBridge"
						Material = "Wood"
						MatCost = 0
					Stone
						icon_state = "Bridge"
						Material = "Stone"
						SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Bridge/Stone
						MatCost = 0

					Silk
						icon_state = "SilkWall2"
						Material = "Silk"
						MatCost = 25
						SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Bridge

			Station
				Slot = 3
				icon = 'HUD2.dmi'
				True_icon = 'Workshop.dmi'
				bound_width = 64
				Carpentry
					icon_state = "Carp"
					True_icon_state = "Carpentry"
					Object = /obj/WorkShops/Carpentry
					Material = "Wood"
					MatCost = 0

				Bonecraft
					icon_state = "Bone"
					True_icon_state = "Bonecraft"
					Object = /obj/WorkShops/BoneCraft
					Material = "Wood"
					MatCost = 0

				Kitchen
					icon_state = "Kit"
					True_icon_state = "Kitchen"
					Object = /obj/WorkShops/Kitchen
					Material = "Wood"
					MatCost = 0

				Leather
					icon_state = "Let"
					True_icon_state = "Leather"
					Object = /obj/WorkShops/LeatherWorks
					Material = "Wood"
					MatCost = 0

				Poison
					icon_state = "Pos"
					True_icon_state = "Poison"
					Object = /obj/WorkShops/PoisonStation
					Material = "Wood"
					MatCost = 0

				Potion
					icon_state = "Potion"
					Object = /obj/WorkShops/PotionStation
					Material = "Wood"
					MatCost = 0

				Masonry
					icon_state = "Mas"
					True_icon_state = "Masonry"
					Object = /obj/WorkShops/Masonary
					Material = "Stone"
					MatCost = 0

				Gemcutting
					icon_state = "Gem"
					True_icon_state = "Gemcutting"
					Object = /obj/WorkShops/GemCutter
					Material = "Stone"
					MatCost = 0

				Smelter
					icon_state = "Smelt"
					True_icon_state = "Smelter"
					Object = /obj/WorkShops/Smelters
					Material = "Stone"
					MatCost = 0

				Forge
					icon_state = "Forge"
					Object = /obj/WorkShops/Forge
					Material = "Stone"
					MatCost = 0

				Machinery
					icon_state = "Forge"
					Object = /obj/WorkShops/Forge
					Material = "Stone"
					MatCost = 0

				Melter
					icon_state = "Melt"
					True_icon_state = "Smelter"
					Object = /obj/WorkShops/Melter
					Material = "Stone"
					MatCost = 0
				Tinkertable
					icon_state = "Mach"
					True_icon_state = "Machinery"
					Object = /obj/WorkShops/Tinkertable
					Material = "Gold"
					MatCost = 0

			Trap
				Slot = 4
				icon = 'HUD2.dmi'
				Stone_Fall // Need to assign Owner
					icon_state = "StoneFall"
					True_icon = 'Cave.dmi'
					True_icon_state = "FallTrap"
					Material = "Stone"
					Object = /obj/Items/Traps/StoneTrap
					SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/GeneralTrap
					MatCost = 0

				PitTrap
					icon_state = "Trap"
					True_icon = 'Cave.dmi'
					True_icon_state = "Hole"
					Material = "Stone"
					Object = /obj/Items/Traps/PitTrap
					SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/GeneralTrap
					MatCost = 0

				RibTrap
					icon_state = "RibTrap"
					True_icon = 'Cave.dmi'
					True_icon_state = "RibTrap"
					Material = "Bone"
					Object = /obj/Items/Traps/RibTrap
					SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/GeneralTrap
					MatCost = 0

				BST
					icon_state = "BST"
					True_icon = 'Cave.dmi'
					True_icon_state = "BST"
					Material = "Bone"
					Object = /obj/Items/Traps/BST
					SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/GeneralTrap
					MatCost = 0

				/*CacoonTrap
					icon_state = "DevourerCacoonTrap"
					True_icon = 'Devourer.dmi'
					True_icon_state = "TinyCacoon"
					Material = "Eggs"
					MatCost = 1
					Object = /obj/Items/Traps/CacoonTrap
					SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/GeneralTrap
					MatCost = 0*/



			Other
				Slot = 5
				Campfire
					icon = 'HUD2.dmi'
					icon_state = "Fire"
					True_icon = 'Cave.dmi'
					Material = "Wood"
					Object = /obj/WorkShops/CampFires/Fire
					MatCost = 0

				Farm
					icon = 'HUD2.dmi'
					icon_state = "Farming"
					True_icon = 'Farmland.dmi'
					True_icon_state = "FarmLand"
					bound_width  = 96
					bound_height = 96
					SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Farmland
					MatCost = 0

				Stairs
					icon='Stairs.dmi'
					icon_state = "AncientDown"
					Wood
						Material = "Wood"
						Up
							icon_state = "WoodUp"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Up
							MatCost = 0
						Down
							icon_state = "WoodDown"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Down
							MatCost = 0
					Stone
						Material = "Stone"
						Up
							icon_state = "StoneUp"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Up
							MatCost = 0
						Down
							icon_state = "StoneDown"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Down
							MatCost = 0
					Ancient
						Material = "Stone"
						Up
							icon_state = "AncientUp"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Up
							MatCost = 0
						Down
							icon_state = "AncientDown"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Down
							MatCost = 0


					Spider
						Material = "Silk"
						MatCost = 100
						Up
							icon_state = "SpiderUp"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Up
						Down
							icon_state = "SpiderDown"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Down
					Bamboo
						Material = "Wood"
						Up
							icon_state = "BambooUp"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Up
							MatCost = 0
						Down
							icon_state = "BambooDown"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Down
							MatCost = 0
					Bone
						Material = "Bone"
						Up
							icon_state = "BoneUp"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Up
							MatCost = 0
						Down
							icon_state = "BoneDown"
							SpecBlueprint = /obj/HUD/Building_Interface/Buildings/Blueprint/Stairs/Down
							MatCost = 0



			Blueprint
				var/IsPlaced
				var/image/Image
				var/image/ImageBlocked
				var/IsBlocked = 0
				var/Dense = 1
				var/SpecFunc
				layer = 3
				icon = null
				icon_state = ""
				glide_size = 32
				New(loc, I, IS, object, material, BH = 32, BW = 32, MC, DO)
					..()
					Image = image(I, src, IS, layer)
					ImageBlocked = image(I, src, IS, layer)
					bound_height = BH
					bound_width = BW
					Object = object
					Material = material
					MatCost = MC//hammer
					Drag_Option = DO

				Click(location,control,params)
					var/list/P = params2list(params)
					if(P["left"])
						if(!IsBlocked)
							usr:Blueprint = null
							for(var/mob/Monsters/M in usr.Selected)
								M.Blueprints += src

					if(P["right"])
						usr:Blueprint = null
						del src

				proc/SpecFunc(mob/Builder = null)
					return 1

				proc/IsBlocked()
					for(var/turf/A in src.locs)
						var/obj/HUD/Building_Interface/Buildings/Blueprint/B = locate(/obj/HUD/Building_Interface/Buildings/Blueprint) in A
						if( (A.density == 1) || (A.Detailed) || (B && (B != src)) )
							return 1
					return 0


				DestoyTile
					SpecFunc = 1
					SpecFunc()
						var/turf/T = src.loc
						T.ClearTurf()
						return 1

				DigChannel
					SpecFunc = 1
					IsBlocked()
						var/turf/S = src.loc
						for(var/turf/T in oview(1,S))
							if(T.isbridge == 0)
								if((T.icon_state == "Lava")||(T.icon_state == "water"))
									if((S.icon_state == "Lava")||(S.icon_state == "water")||(S.isbridge == 1))
										return 1
									return 0
						return 1

					SpecFunc()
						var/turf/S = src.loc
						for(var/turf/T in oview(1,S))
							if(T.isbridge == 0)
								if(T.icon_state == "Lava")
									S.name = "Magma"
									S.icon = 'Lava.dmi'
									S.icon_state = "Lava"
									S.density = 1
									S.Content3 = "Lava"
									S.text = "<font color=#FF0000>LLLLL<font color=#CC0033>LLLLL"
									return 1
								if(T.icon_state == "water")
									S.icon = 'water.dmi'
									S.icon_state = "water"
									S.CanFish = 1
									S.Detailed = 1
									S.Content3 = "Liquid"
									S.OIcon = "water"
									S.density = 1
									S.text = "<font color=#0000FF>WWWWW<font color=#0000CC>WWWWW"
									return 1
				Stairs
					SpecFunc = 1
					Up
						SpecFunc()
							var/LEVEL
							switch(src.z)
								if(GROUND_LAYER) LEVEL=SKY_LAYER
								if(UNDERGROUND_LAYER) LEVEL=GROUND_LAYER
								if(SKY_LAYER) return list(0,"You can't build any higher.")
							var/turf/LOC1=src.loc
							var/turf/LOC2=locate(LOC1.x,LOC1.y,LEVEL)
							if(LOC2.density || LOC2.opacity) if(LOC2.icon_state!="CaveWall")
								return list(0,"There's something blocking you from building stairs here.")
							if(LOC1.density || LOC1.opacity || LOC1.icon=='Stairs.dmi' || LOC2.icon=='Stairs.dmi')
								return list(0,"There's something blocking you from building stairs here.")

							LOC2.ClearTurf()
							for(var/turf/T in list(LOC1,LOC2))
								T.underlays+=icon(T.icon,T.icon_state)
								T.icon='Stairs.dmi'
								T.Detailed=1
							LOC1.icon_state= src.Image.icon_state
							var/TYPE = copytext(LOC1.icon_state,1, findtext(LOC1.icon_state,"Up"))
							LOC2.icon_state="[TYPE]Down"
							return 1

					Down
						SpecFunc()
							var/LEVEL
							switch(src.z)
								if(GROUND_LAYER) LEVEL=UNDERGROUND_LAYER
								if(UNDERGROUND_LAYER) return list(0,"You can't dig any deeper.")
								if(SKY_LAYER) LEVEL=GROUND_LAYER
							var/turf/LOC1=src.loc
							var/turf/LOC2=locate(LOC1.x,LOC1.y,LEVEL)
							if(LOC2.density || LOC2.opacity) if(LOC2.icon_state!="CaveWall")
								return list(0,"There's something blocking you from building stairs here.")
							if(LOC1.density || LOC1.opacity || LOC1.icon=='Stairs.dmi' || LOC2.icon=='Stairs.dmi')
								return list(0,"There's something blocking you from building stairs here.")
							if(LOC2.Detailed)
								return list(0,"There's something blocking you from building stairs here.")

							LOC2.ClearTurf()
							for(var/turf/T in list(LOC1,LOC2))
								T.underlays+=icon(T.icon,T.icon_state)
								T.icon='Stairs.dmi'
								T.Detailed=1
							LOC1.icon_state= src.Image.icon_state
							var/TYPE = copytext(LOC1.icon_state,1, findtext(LOC1.icon_state,"Down"))
							LOC2.icon_state="[TYPE]Up"
							return 1
				Farmland
					SpecFunc = 1
					SpecFunc()
						for(var/turf/T in src.locs)
							new/turf/grounds/Farmland(T)
						return 0

				Bridge
					SpecFunc = 1
					SpecFunc()
						var/turf/S = src.loc
						if(S.Content == "Chasm") S.Content = null
						S.density = 0
						S.CanFish = 0
						S.isbridge = 1
						S.name = null
						S.Detailed = 1
						S.Cant = 1
						if(S.CaveWater == 1)
							S.CaveWater = 0
						S.icon = src.Image.icon-rgb(0,0,128)
						S.icon_state = src.Image.icon_state
						S.text = "<font color=#909090>×"
						return 1
					IsBlocked()
						if(src.loc.isbridge == 0)
							if((src.loc.Content3 == "Liquid") || (src.loc.Content == "Chasm"))
								return 0
						return 1

					Stone
						SpecFunc()
							var/turf/S = src.loc
							if(S.Content == "Chasm") S.Content = null
							S.density = 0
							S.CanFish = 0
							S.isbridge = 1
							S.name = null
							S.Detailed = 1
							S.Cant = 1
							if(S.CaveWater == 1)
								S.CaveWater = 0
							S.icon = 'Cave.dmi'
							S.icon_state = "Bridge"
							if(src.loc.Content3 == "Lava")
								S.icon_state = "LavaBridge"
							S.text = "<font color=#909090>×"
							return 1
						IsBlocked()
							if(src.loc.isbridge == 0)
								if((src.loc.Content3 == "Liquid") || (src.loc.Content == "Chasm") || (src.loc.Content3 == "Lava"))
									return 0
							return 1
				GeneralTrap
					SpecFunc = 1
					SpecFunc(mob/Builder)
						for(var/mob/Monsters/X in range(0,src))
							if(X.Owner != Builder.Owner)
								return list(0,"You can't place traps under someone else's unit.")
						for(var/obj/Items/Traps/X in range(0,src))
							return list(0,"You can't place traps under other traps.")
						var/obj/Items/Traps/L = new Object()
						L.loc = src.loc
						L.Owner = Builder.Owner
						Builder.StoneCraftingSkill += 1
						return 1



/*
mob/verb/test_Blueprints()
	for(var/mob/Monsters/M in usr.Selected)
		world<<M.Blueprints.len
		for(var/atom/A in M.Blueprints)
			world<<A.type*/


var/list/Buildings = list()

world/New()
	..()
	BuildingsList()

proc/BuildingsList()
	Buildings["Wood Wall"] = new/obj/HUD/Building_Interface/Buildings/Walls/Wood_Wall
	Buildings["Stone Wall"] = new/obj/HUD/Building_Interface/Buildings/Walls/Stone_Wall
	Buildings["Secret Wall"] = new/obj/HUD/Building_Interface/Buildings/Walls/Secret_Wall
	Buildings["Elf Wall"] = new/obj/HUD/Building_Interface/Buildings/Walls/Elf_Wall
	Buildings["Tribal Wall"] = new/obj/HUD/Building_Interface/Buildings/Walls/Tribal_Wall
	Buildings["Goblin Wall"] = new/obj/HUD/Building_Interface/Buildings/Walls/Goblin_Wall
	Buildings["Bone Wall"] = new/obj/HUD/Building_Interface/Buildings/Walls/Bone_Wall
	Buildings["Silk Wall"] = new/obj/HUD/Building_Interface/Buildings/Walls/Silk_Wall
	Buildings["Flesh Wall"] = new/obj/HUD/Building_Interface/Buildings/Walls/Flesh_Wall

	Buildings["Wood Floor"] = new/obj/HUD/Building_Interface/Buildings/Floor/Wood_Floor
	Buildings["Stone Floor"] = new/obj/HUD/Building_Interface/Buildings/Floor/Stone_Floor
	Buildings["Bone Floor"] = new/obj/HUD/Building_Interface/Buildings/Floor/Bone
	Buildings["Tribal Floor"] = new/obj/HUD/Building_Interface/Buildings/Floor/Tribal
	Buildings["Goblin Floor"] = new/obj/HUD/Building_Interface/Buildings/Floor/Goblin_Floor
	Buildings["Flesh Floor"] = new/obj/HUD/Building_Interface/Buildings/Floor/Flesh_Floor

	Buildings["Destroy Tile"] = new/obj/HUD/Building_Interface/Buildings/Floor/Destroy
	Buildings["Dig Channel"] = new/obj/HUD/Building_Interface/Buildings/Floor/DigChannel

	Buildings["Wood Bridge"] = new/obj/HUD/Building_Interface/Buildings/Floor/Bridge/Wood
	Buildings["Stone Bridge"] = new/obj/HUD/Building_Interface/Buildings/Floor/Bridge/Stone
	Buildings["Bone Bridge"] = new/obj/HUD/Building_Interface/Buildings/Floor/Bridge/Bone
	Buildings["Tribal Bridge"] = new/obj/HUD/Building_Interface/Buildings/Floor/Bridge/Tribal

	Buildings["Bonecraft"] = new/obj/HUD/Building_Interface/Buildings/Station/Bonecraft
	Buildings["Carpentry"] = new/obj/HUD/Building_Interface/Buildings/Station/Carpentry
	Buildings["Forge"] = new/obj/HUD/Building_Interface/Buildings/Station/Forge
	Buildings["Gemcutting"] = new/obj/HUD/Building_Interface/Buildings/Station/Gemcutting
	Buildings["Kitchen"] = new/obj/HUD/Building_Interface/Buildings/Station/Kitchen
	Buildings["Leather"] = new/obj/HUD/Building_Interface/Buildings/Station/Leather
	Buildings["Machinery"] = new/obj/HUD/Building_Interface/Buildings/Station/Machinery
	Buildings["Masonry"] = new/obj/HUD/Building_Interface/Buildings/Station/Masonry
	Buildings["Poison"] = new/obj/HUD/Building_Interface/Buildings/Station/Poison
	Buildings["Potion"] = new/obj/HUD/Building_Interface/Buildings/Station/Potion
	Buildings["Smelter"] = new/obj/HUD/Building_Interface/Buildings/Station/Smelter
	Buildings["Melter"] = new/obj/HUD/Building_Interface/Buildings/Station/Melter
	Buildings["Tinkertable"] = new/obj/HUD/Building_Interface/Buildings/Station/Tinkertable

	Buildings["StoneFall"] = new/obj/HUD/Building_Interface/Buildings/Trap/Stone_Fall
	Buildings["PitFall"] = new/obj/HUD/Building_Interface/Buildings/Trap/PitTrap
	Buildings["RibTrap"] = new/obj/HUD/Building_Interface/Buildings/Trap/RibTrap
	Buildings["BST"] = new/obj/HUD/Building_Interface/Buildings/Trap/BST
	//Buildings["CacoonTrap"] = new/obj/HUD/Building_Interface/Buildings/Trap/CacoonTrap

	Buildings["Campfire"] = new/obj/HUD/Building_Interface/Buildings/Other/Campfire
	Buildings["Farmland"] = new/obj/HUD/Building_Interface/Buildings/Other/Farm

	Buildings["Wood Stairs Up"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Wood/Up
	Buildings["Wood Stairs Down"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Wood/Down
	Buildings["Stone Stairs Up"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Stone/Up
	Buildings["Stone Stairs Down"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Stone/Down
	Buildings["Ancient Stairs Up"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Ancient/Up
	Buildings["Ancient Stairs Down"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Ancient/Down
	Buildings["Bamboo Stairs Up"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Bamboo/Up
	Buildings["Bamboo Stairs Down"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Bamboo/Down
	Buildings["Bone Stairs Up"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Bone/Up
	Buildings["Bone Stairs Down"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Bone/Down

	Buildings["Silk Bridge"] = new/obj/HUD/Building_Interface/Buildings/Floor/Bridge/Silk
	Buildings["Spider Stairs Up"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Spider/Up
	Buildings["Spider Stairs Down"] = new/obj/HUD/Building_Interface/Buildings/Other/Stairs/Spider/Down


proc/walkitbuild(src,B)
	if(get_dist(src,B) > 1)
		walk_to(src, B, 1,4)
		walkitbuild()
mob/Monsters
	var/list/Blueprints = list()
	proc/Build_From_Blueprint()
		var/mob/M = src.Owner
		while(src)
			for(var/obj/HUD/Building_Interface/Buildings/Blueprint/B in Blueprints)
				var/MP
				var/Amount = B.MatCost
				//world << "step one"
				switch(B.Material)
					if("Wood")
						MP = M.log
					if("Stone")
						MP = M.stone
					if("Bone")
						MP = M.bone
					if("Gold")
						MP = M.gold
				if((MP>=1)||((Amount <= src.WebContent) && (B.Material == "Silk")))
					//world << "step two"
					if(get_dist(src,B) > 1)
						walkitbuild(src,B)
					else
						if(src.z==B.z)
							if(!B.SpecFunc)
								if(B.Material)
									if(B.Material == "Silk")
										src.WebContent-=Amount
									else if(B.Material == "Eggs")
										src.EggContent-=Amount
									else
										//world << "step four"
										switch(B.Material)
											if("Wood")
												M.log	-= 1
											if("Stone")
												if(M.stone<=0)
												else
													M.stone-=1
											if("Bone")
												M.bone-=1
											if("Gold")
												M.gold-=1
								new B.Object(B.loc)
								src.Blueprints -= B
								del B
							else
								var/Action = B.SpecFunc(src)
								if(istype(Action,/list))
									var/list/L = Action
									src.Owner << L[2]
									Action = L[1]
								if(Action == 1)
									if(B.Material)
										if(B.Material == "Silk")
											src.WebContent-=Amount
										else if(B.Material == "Eggs")
											src.EggContent-=Amount
										else
											switch(B.Material)
												if("Wood")
													M.log-= 1
												if("Stone")
													if(M.stone<=0)
													else
														M.stone-=1
												if("Bone")
													M.bone-=1
												if("Gold")
													M.gold-=1
									src.Blueprints -= B
									del B
								if(Action == 0)
									src.Blueprints -= B
									del B
				//else
					//world << "Failed"
			sleep(10)


Player
	var/list/Blueprints = list()
	Login()
		..()
		var/var/obj/HUD/Building_Interface/Open/O = new()
		O.screen_loc = "12:25,1:31"
		src.client.screen += O
		src.Building_Interface += O

/*client
	var/list/Blueprints = list()
	New()
		..()
		var/var/obj/HUD/Building_Interface/Open/O = new()
		O.screen_loc = "12:25,1:31"
		screen += O
		Building_Interface += O*/

client
	MouseEntered(atom/A)
		..()
		if(mob:Blueprint)
			if(!isturf(A))
				A = A.loc

			mob:Blueprint.loc = A
			var/Blocked = mob:Blueprint.IsBlocked()
			if(Blocked)
				if(mob:Blueprint.Image in images)
					images -= mob:Blueprint.Image
					images += mob:Blueprint.ImageBlocked
					mob:Blueprint.IsBlocked = 1
			else
				if(mob:Blueprint.ImageBlocked in images)
					images -= mob:Blueprint.ImageBlocked
					images += mob:Blueprint.Image
					mob:Blueprint.IsBlocked = 0
	MouseDrag(atom/src_B,atom/A,  src_location,over_location,src_control,over_control,params)
		..()
		var/list/P = params2list(params)
		if(P["left"])
			if(mob:Blueprint)
				if(mob:Blueprint.Drag_Option != 0)
					if(!isturf(A))
						A = A.loc

					if(!isturf(src_B))
						src_B = src_B.loc

					var/turf/Loc2 = A
					var/turf/Loc1 = src_B
					for(var/I in mob:Blueprints)
						del I
					mob:Blueprints = list()

					images -= mob:Blueprint.Image
					images -= mob:Blueprint.ImageBlocked
					var/list/L = block(Loc1, Loc2)
					for(var/T in L)
						var/obj/HUD/Building_Interface/Buildings/Blueprint/B
						B = new mob:Blueprint.type(T, mob:Blueprint.Image.icon/* - rgb(0,0,128)*/, mob:Blueprint.Image.icon_state, mob:Blueprint.Object, mob:Blueprint.Material, mob:Blueprint.bound_height, mob:Blueprint.bound_width, mob:Blueprint.MatCost)
						mob:Blueprints += B
						B.alpha = 192
						B.ImageBlocked.icon = mob:Blueprint.ImageBlocked.icon
						src <<B.Image

						var/Blocked
						if(T == src_B)
							Blocked = mob:Blueprint.IsBlocked
						else
							Blocked = B.IsBlocked()

						if(Blocked)
							if(B.Image in images)
								images -= B.Image
								images += B.ImageBlocked
								B.IsBlocked = 1
						else
							if(B.ImageBlocked in images)
								images -= B.ImageBlocked
								images += B.Image
								B.IsBlocked = 0
			//else

							//if(M.Owner==usr)
								//M.ToggleSelect()
							//else
								//if(usr.DE && usr.FreeSelect)
									//M.ToggleSelect(usr)


		if(P["right"])
			if(!isturf(A))
				A = A.loc
			if(!isturf(src_B))
				src_B = src_B.loc
			var/turf/Loc2 = A
			var/turf/Loc1 = src_B
			for(var/turf/T in block(Loc2, Loc1))
				for(var/obj/HUD/Building_Interface/Buildings/Blueprint/B in T)
					del B

	MouseDrop(src_object,over_object,src_location,over_location,src_control,over_control,params)
		..()
		if(mob:Blueprint)
			del mob:Blueprint
			for(var/obj/HUD/Building_Interface/Buildings/Blueprint/B in mob:Blueprints)
				if(B.IsBlocked == 0)
					B.Click(,,params)
				else
					del B
			mob:Blueprints = list()

Player
	var
		list
			Building_Interface = list()
			Build_Picks[5]
		Building_Current_Pick
		var/obj/HUD/Building_Interface/Buildings/Blueprint/Blueprint

	proc/Build_Interface(state = "default", list/Buildable, Menu_loc, obj/HUD/Building_Interface/Main/Slider/Slider)
		if(state == "default")

			for(var/obj/O in Building_Interface)
				del O

			var/obj/HUD/Building_Interface/BG/Start/BS  = new()
			var/obj/HUD/Building_Interface/BG/B1	    = new()
			var/obj/HUD/Building_Interface/BG/B2 	    = new()
			var/obj/HUD/Building_Interface/BG/B3	    = new()
			var/obj/HUD/Building_Interface/BG/B4	    = new()
			var/obj/HUD/Building_Interface/BG/B5	    = new()
			var/obj/HUD/Building_Interface/BG/Close/B6  = new()

			var/obj/HUD/Building_Interface/Main/Wall/Wall       = new()
			var/obj/HUD/Building_Interface/Main/Floor/Floor     = new()
			var/obj/HUD/Building_Interface/Main/Station/Station = new()
			var/obj/HUD/Building_Interface/Main/Trap/Trap       = new()
			var/obj/HUD/Building_Interface/Main/Other/Other     = new()

			var/obj/HUD/Building_Interface/Main/Slider/S1 = new("Wall")
			var/obj/HUD/Building_Interface/Main/Slider/S2 = new("Floor")
			var/obj/HUD/Building_Interface/Main/Slider/S3 = new("Station")
			var/obj/HUD/Building_Interface/Main/Slider/S4 = new("Trap")
			var/obj/HUD/Building_Interface/Main/Slider/S5 = new("Other")



		//	B10.screen_loc = "17:25,1:31"
		//	B9.screen_loc  = "16:17,1:31"
		//	B8.screen_loc  = "15:9,1:31"
		//	B7.screen_loc  = "14:1,1:31"
			B6.screen_loc  = "12:25,1:31"
			B5.screen_loc  = "11:17,1:31"
			B4.screen_loc  = "10:9,1:31"
			B3.screen_loc  = "9:1,1:31"
			B2.screen_loc  = "7:25,1:31"
			B1.screen_loc  = "6:17,1:31"
			BS.screen_loc  = "5:9,1:31"

			Wall.screen_loc    = "6:17,1:31"
			Floor.screen_loc   = "7:25,1:31"
			Station.screen_loc = "9:1,1:31"
			Trap.screen_loc    = "10:9,1:31"
			Other.screen_loc   = "11:17,1:31"

			S1.screen_loc = "6:17,2:1"
			S2.screen_loc = "7:25,2:1"
			S3.screen_loc = "9:1,2:1"
			S4.screen_loc = "10:9,2:1"
			S5.screen_loc = "11:17,2:1"



			src.client.screen += B6
			src.client.screen += B5
			src.client.screen += B4
			src.client.screen += B3
			src.client.screen += B2
			src.client.screen += B1
			src.client.screen += BS

			src.client.screen += Wall
			src.client.screen += Floor
			src.client.screen += Station
			src.client.screen += Trap
			src.client.screen += Other

			src.client.screen += S1
			src.client.screen += S2
			src.client.screen += S3
			src.client.screen += S4
			src.client.screen += S5


			src.Building_Interface += B6
			src.Building_Interface += B5
			src.Building_Interface += B4
			src.Building_Interface += B3
			src.Building_Interface += B2
			src.Building_Interface += B1
			src.Building_Interface += BS

			src.Building_Interface += Wall
			src.Building_Interface += Floor
			src.Building_Interface += Station
			src.Building_Interface += Trap
			src.Building_Interface += Other

			src.Building_Interface += S1
			src.Building_Interface += S2
			src.Building_Interface += S3
			src.Building_Interface += S4
			src.Building_Interface += S5


		if(state == "delete")
			for(var/obj/O in Building_Interface)
				del O

			var/var/obj/HUD/Building_Interface/Open/O = new()
			O.screen_loc = "12:25,1:31"
			src.client.screen += O
			src.Building_Interface += O

		if(state == "Sub-menu")
			var
				L
				L_Num
			if(Menu_loc == "Wall")
				L = "6:17"
				L_Num = 209
			if(Menu_loc == "Floor")
				L = "7:25"
				L_Num = 249
			if(Menu_loc == "Station")
				L = "9:1"
				L_Num = 289
			if(Menu_loc == "Trap")
				L = "10:9"
				L_Num = 329
			if(Menu_loc == "Other")
				L = "11:17"
				L_Num = 369


			switch(Buildable.len)
				if(1 to 5)
					for(var/i= 1, i <= Buildable.len, i++)
						var/obj/HUD/Building_Interface/Sub_BG/B = new()
						B.screen_loc = "[L],[div((103+34*(i-1)),32)]:[(103+34*(i-1))%32]"
						src.client.screen += B
						Slider.HUD += B


						var/obj/Obj = Buildings[Buildable[i]]
						var/obj/HUD/Building_Interface/Buildings/O = new Obj.type()
						O.overlays += icon('Building Interface.dmi',"Border")
						O.screen_loc = "[div((L_Num+4),32)]:[(L_Num+4)%32],[div((103+34*(i-1)+4),32)]:[(103+34*(i-1)+4)%32]"
						src.client.screen += O
						Slider.HUD += O
						O.Slider = Slider

					var/obj/HUD/Building_Interface/Sub_BG/End/BT = new()
					BT.screen_loc = "[L],[div((103+34*Buildable.len+6),32)]:[(103+34*Buildable.len+6)%32]"
					if(Buildable.len == 0)
						BT.screen_loc = "[L],[div(103,32)]:[103%32]"
					src.client.screen += BT
					Slider.HUD += BT
				if(6)
					L_Num += 3
					var/obj/HUD/Building_Interface/Sub_BG_Big/B1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B3 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B4 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B5 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B6 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL3 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR3 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Top/BT1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Top/BT2 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Top_Left/BTL  = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Top_Right/BTR = new()


					B1.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],3:7"
					B2.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],3:7"
					B3.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],4:9"
					B4.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],4:9"
					B5.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],5:11"
					B6.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],5:11"

					BL1.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],3:7"
					BL2.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],4:9"
					BL3.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],5:11"

					BR1.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],3:7"
					BR2.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],4:9"
					BR3.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],5:11"

					BT1.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],6:13"
					BT2.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],6:13"

					BTL.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],6:13"
					BTR.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],6:13"


					src.client.screen += B6
					src.client.screen += B5
					src.client.screen += B4
					src.client.screen += B3
					src.client.screen += B2
					src.client.screen += B1

					src.client.screen += BL3
					src.client.screen += BL2
					src.client.screen += BL1

					src.client.screen += BR3
					src.client.screen += BR2
					src.client.screen += BR1

					src.client.screen += BT2
					src.client.screen += BT1

					src.client.screen += BTL
					src.client.screen += BTR


					Slider.HUD += B1
					Slider.HUD += B2
					Slider.HUD += B3
					Slider.HUD += B4
					Slider.HUD += B5
					Slider.HUD += B6

					Slider.HUD += BL1
					Slider.HUD += BL2
					Slider.HUD += BL3

					Slider.HUD += BR1
					Slider.HUD += BR2
					Slider.HUD += BR3

					Slider.HUD += BT1
					Slider.HUD += BT2

					Slider.HUD += BTL
					Slider.HUD += BTR


					for(var/i= 1, i <= Buildable.len, i++)
						var/Row = 0
						switch(i)
							if(3 to 4)
								Row = 2
							if(5 to 6)
								Row = 4
						var/obj/Obj = Buildings[Buildable[i]]
						var/obj/HUD/Building_Interface/Buildings/O = new Obj.type()
						O.overlays += icon('Building Interface.dmi',"Border")
						O.screen_loc = "[div((L_Num+2-17+(i-1-Row)*34),32)]:[(L_Num+2-17+(i-1-Row)*34)%32],[div((105+(Row/2)*34),32)]:[(105+(Row/2)*34)%32]"
						src.client.screen += O
						Slider.HUD += O
						O.Slider = Slider

				if(7 to 8)
					L_Num += 3
					var/obj/HUD/Building_Interface/Sub_BG_Big/B1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B3 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B4 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B5 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B6 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B7 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B8 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL3 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL4 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR3 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR4 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Top/BT1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Top/BT2 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Top_Left/BTL  = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Top_Right/BTR = new()


					B1.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],3:7"
					B2.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],3:7"
					B3.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],4:9"
					B4.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],4:9"
					B5.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],5:11"
					B6.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],5:11"
					B7.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],6:13"
					B8.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],6:13"

					BL1.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],3:7"
					BL2.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],4:9"
					BL3.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],5:11"
					BL4.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],6:13"

					BR1.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],3:7"
					BR2.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],4:9"
					BR3.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],5:11"
					BR4.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],6:13"

					BT1.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],7:15"
					BT2.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],7:15"

					BTL.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],7:15"
					BTR.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],7:15"


					src.client.screen += B8
					src.client.screen += B7
					src.client.screen += B6
					src.client.screen += B5
					src.client.screen += B4
					src.client.screen += B3
					src.client.screen += B2
					src.client.screen += B1

					src.client.screen += BL4
					src.client.screen += BL3
					src.client.screen += BL2
					src.client.screen += BL1

					src.client.screen += BR4
					src.client.screen += BR3
					src.client.screen += BR2
					src.client.screen += BR1

					src.client.screen += BT2
					src.client.screen += BT1

					src.client.screen += BTL
					src.client.screen += BTR


					Slider.HUD += B1
					Slider.HUD += B2
					Slider.HUD += B3
					Slider.HUD += B4
					Slider.HUD += B5
					Slider.HUD += B6
					Slider.HUD += B7
					Slider.HUD += B8

					Slider.HUD += BL1
					Slider.HUD += BL2
					Slider.HUD += BL3
					Slider.HUD += BL4

					Slider.HUD += BR1
					Slider.HUD += BR2
					Slider.HUD += BR3
					Slider.HUD += BR4

					Slider.HUD += BT1
					Slider.HUD += BT2

					Slider.HUD += BTL
					Slider.HUD += BTR

					for(var/i= 1, i <= Buildable.len, i++)
						var/Row = 0
						switch(i)
							if(3 to 4)
								Row = 2
							if(5 to 6)
								Row = 4
							if(7 to 8)
								Row = 6
						var/obj/Obj = Buildings[Buildable[i]]
						var/obj/HUD/Building_Interface/Buildings/O = new Obj.type()
						O.overlays += icon('Building Interface.dmi',"Border")
						O.screen_loc = "[div((L_Num+2-17+(i-1-Row)*34),32)]:[(L_Num+2-17+(i-1-Row)*34)%32],[div((105+(Row/2)*34),32)]:[(105+(Row/2)*34)%32]"
						src.client.screen += O
						Slider.HUD += O
						O.Slider = Slider

				if(9)
					L_Num += 3
					var/obj/HUD/Building_Interface/Sub_BG_Big/B1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B3 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B4 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B5 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B6 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B7 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B8 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B9 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL3 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR3 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Top/BT1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Top/BT2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Top/BT3 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Top_Left/BTL  = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Top_Right/BTR = new()


					B1.screen_loc = "[div((L_Num-34),32)]:[(L_Num-34)%32],3:7"
					B2.screen_loc = "[div(L_Num,32)]:[L_Num%32],3:7"
					B3.screen_loc = "[div((L_Num+34),32)]:[(L_Num+34)%32],3:7"
					B4.screen_loc = "[div((L_Num-34),32)]:[(L_Num-34)%32],4:9"
					B5.screen_loc = "[div(L_Num,32)]:[L_Num%32],4:9"
					B6.screen_loc = "[div((L_Num+34),32)]:[(L_Num+34)%32],4:9"
					B7.screen_loc = "[div((L_Num-34),32)]:[(L_Num-34)%32],5:11"
					B8.screen_loc = "[div(L_Num,32)]:[L_Num%32],5:11"
					B9.screen_loc = "[div((L_Num+34),32)]:[(L_Num+34)%32],5:11"

					BL1.screen_loc = "[div((L_Num-74),32)]:[(L_Num-74)%32],3:7"
					BL2.screen_loc = "[div((L_Num-74),32)]:[(L_Num-74)%32],4:9"
					BL3.screen_loc = "[div((L_Num-74),32)]:[(L_Num-74)%32],5:11"

					BR1.screen_loc = "[div((L_Num+68),32)]:[(L_Num+68)%32],3:7"
					BR2.screen_loc = "[div((L_Num+68),32)]:[(L_Num+68)%32],4:9"
					BR3.screen_loc = "[div((L_Num+68),32)]:[(L_Num+68)%32],5:11"

					BT1.screen_loc = "[div((L_Num-34),32)]:[(L_Num-34)%32],6:13"
					BT2.screen_loc = "[div(L_Num,32)]:[L_Num%32],6:13"
					BT3.screen_loc = "[div((L_Num+34),32)]:[(L_Num+34)%32],6:13"

					BTL.screen_loc = "[div((L_Num-74),32)]:[(L_Num-74)%32],6:13"
					BTR.screen_loc = "[div((L_Num+68),32)]:[(L_Num+68)%32],6:13"



					src.client.screen += B9
					src.client.screen += B8
					src.client.screen += B7
					src.client.screen += B6
					src.client.screen += B5
					src.client.screen += B4
					src.client.screen += B3
					src.client.screen += B2
					src.client.screen += B1

					src.client.screen += BL3
					src.client.screen += BL2
					src.client.screen += BL1

					src.client.screen += BR3
					src.client.screen += BR2
					src.client.screen += BR1

					src.client.screen += BT3
					src.client.screen += BT2
					src.client.screen += BT1

					src.client.screen += BTL
					src.client.screen += BTR



					Slider.HUD += B1
					Slider.HUD += B2
					Slider.HUD += B3
					Slider.HUD += B4
					Slider.HUD += B5
					Slider.HUD += B6
					Slider.HUD += B7
					Slider.HUD += B8
					Slider.HUD += B9

					Slider.HUD += BL1
					Slider.HUD += BL2
					Slider.HUD += BL3

					Slider.HUD += BR1
					Slider.HUD += BR2
					Slider.HUD += BR3

					Slider.HUD += BT1
					Slider.HUD += BT2
					Slider.HUD += BT3

					Slider.HUD += BTL
					Slider.HUD += BTR

					for(var/i= 1, i <= Buildable.len, i++)
						var/Row = 0
						if((i>=4) && (i < 7))
							Row = 3
						else if(i >= 7)
							Row = 6
						var/obj/Obj = Buildings[Buildable[i]]
						var/obj/HUD/Building_Interface/Buildings/O = new Obj.type()
						O.overlays += icon('Building Interface.dmi',"Border")
						O.screen_loc = "[div((L_Num+2-34+(i-1-Row)*34),32)]:[(L_Num+2-34+(i-1-Row)*34)%32],[div((105+(Row/3)*34),32)]:[(105+(Row/3)*34)%32]"
						src.client.screen += O
						Slider.HUD += O
						O.Slider = Slider
				if(10)
					L_Num += 3
					var/obj/HUD/Building_Interface/Sub_BG_Big/B1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B3 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B4 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B5 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B6 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B7 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B8 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B9 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/B10 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL3 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL4 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Left/BL5 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR2 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR3 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR4 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Right/BR5 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Top/BT1 = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Top/BT2 = new()

					var/obj/HUD/Building_Interface/Sub_BG_Big/Top_Left/BTL  = new()
					var/obj/HUD/Building_Interface/Sub_BG_Big/Top_Right/BTR = new()


					B1.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],3:7"
					B2.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],3:7"
					B3.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],4:9"
					B4.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],4:9"
					B5.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],5:11"
					B6.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],5:11"
					B7.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],6:13"
					B8.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],6:13"
					B9.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],7:15"
					B10.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],7:15"

					BL1.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],3:7"
					BL2.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],4:9"
					BL3.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],5:11"
					BL4.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],6:13"
					BL5.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],7:15"

					BR1.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],3:7"
					BR2.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],4:9"
					BR3.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],5:11"
					BR4.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],6:13"
					BR5.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],7:15"

					BT1.screen_loc = "[div((L_Num-17),32)]:[(L_Num-17)%32],8:17"
					BT2.screen_loc = "[div((L_Num+17),32)]:[(L_Num+17)%32],8:17"

					BTL.screen_loc = "[div((L_Num-57),32)]:[(L_Num-57)%32],8:17"
					BTR.screen_loc = "[div((L_Num+51),32)]:[(L_Num+51)%32],8:17"

					src.client.screen += B10
					src.client.screen += B9
					src.client.screen += B8
					src.client.screen += B7
					src.client.screen += B6
					src.client.screen += B5
					src.client.screen += B4
					src.client.screen += B3
					src.client.screen += B2
					src.client.screen += B1

					src.client.screen += BL5
					src.client.screen += BL4
					src.client.screen += BL3
					src.client.screen += BL2
					src.client.screen += BL1

					src.client.screen += BR5
					src.client.screen += BR4
					src.client.screen += BR3
					src.client.screen += BR2
					src.client.screen += BR1

					src.client.screen += BT2
					src.client.screen += BT1

					src.client.screen += BTL
					src.client.screen += BTR


					Slider.HUD += B1
					Slider.HUD += B2
					Slider.HUD += B3
					Slider.HUD += B4
					Slider.HUD += B5
					Slider.HUD += B6
					Slider.HUD += B7
					Slider.HUD += B8
					Slider.HUD += B9
					Slider.HUD += B10

					Slider.HUD += BL1
					Slider.HUD += BL2
					Slider.HUD += BL3
					Slider.HUD += BL4
					Slider.HUD += BL5

					Slider.HUD += BR1
					Slider.HUD += BR2
					Slider.HUD += BR3
					Slider.HUD += BR4
					Slider.HUD += BR5

					Slider.HUD += BT1
					Slider.HUD += BT2

					Slider.HUD += BTL
					Slider.HUD += BTR

					for(var/i= 1, i <= Buildable.len, i++)
						var/Row = 0
						switch(i)
							if(3 to 4)
								Row = 2
							if(5 to 6)
								Row = 4
							if(7 to 8)
								Row = 6
							if(9 to 10)
								Row = 8
						var/obj/Obj = Buildings[Buildable[i]]
						var/obj/HUD/Building_Interface/Buildings/O = new Obj.type()
						O.overlays += icon('Building Interface.dmi',"Border")
						O.screen_loc = "[div((L_Num+2-17+(i-1-Row)*34),32)]:[(L_Num+2-17+(i-1-Row)*34)%32],[div((105+(Row/2)*34),32)]:[(105+(Row/2)*34)%32]"
						src.client.screen += O
						Slider.HUD += O
						O.Slider = Slider
mob
	Monsters
		var/list/Can_Build_Walls = list()
		var/list/Can_Build_Floor = list()
		var/list/Can_Build_Station = list()
		var/list/Can_Build_Traps = list()
		var/list/Can_Build_Other = list()
		Human
			Can_Build_Walls   = list("Wood Wall", "Stone Wall", "Secret Wall")
			Can_Build_Floor   = list("Wood Floor", "Stone Floor", "Destroy Tile","Dig Channel","Wood Bridge","Stone Bridge")
			Can_Build_Station = list("Smelter","Forge","Carpentry","Gemcutting","Kitchen","Leather","Masonry","Potion","Melter","Tinkertable")
			Can_Build_Traps   = list("StoneFall", "PitFall")
			Can_Build_Other   = list("Wood Stairs Up","Wood Stairs Down","Stone Stairs Up","Stone Stairs Down","Ancient Stairs Up","Ancient Stairs Down","Campfire","Farmland")

		Spider
			Can_Build_Walls   = list("Silk Wall","Secret Wall")
			Can_Build_Floor   = list("Silk Bridge")
			Can_Build_Other   = list("Spider Stairs Up","Spider Stairs Down")
			Can_Build_Traps   = list("StoneFall")

		Dwarf
			Can_Build_Walls   = list("Wood Wall", "Stone Wall", "Secret Wall")
			Can_Build_Floor   = list("Wood Floor", "Stone Floor", "Destroy Tile","Dig Channel","Wood Bridge","Stone Bridge")
			Can_Build_Station = list("Smelter","Forge","Carpentry","Masonry","Kitchen","Leather","Gemcutting","Melter")
			Can_Build_Other   = list("Wood Stairs Up","Wood Stairs Down","Stone Stairs Up","Stone Stairs Down","Ancient Stairs Up","Ancient Stairs Down","Campfire")
			Can_Build_Traps   = list("StoneFall", "PitFall")

		Elf
			Can_Build_Walls   = list("Elf Wall", "Secret Wall")
			Can_Build_Floor   = list("Wood Floor", "Destroy Tile","Wood Bridge")
			Can_Build_Station = list("Poison","Bonecraft","Leather","Carpentry","Melter")
			Can_Build_Other   = list("Wood Stairs Up","Wood Stairs Down","Campfire")
			Can_Build_Traps   = list("StoneFall", "PitFall")

		Frogman
			Can_Build_Walls   = list("Tribal Wall","Bone Wall", "Secret Wall")
			Can_Build_Floor   = list("Tribal Floor","Bone Floor", "Destroy Tile","Tribal Bridge")
			Can_Build_Station = list("Poison","Bonecraft","Leather","Carpentry","Melter")
			Can_Build_Other   = list("Bamboo Stairs Up","Bamboo Stairs Down","Campfire")
			Can_Build_Traps   = list("StoneFall", "PitFall")

		Goblin
			Can_Build_Walls   = list("Wood Wall","Goblin Wall","Bone Wall", "Secret Wall")
			Can_Build_Floor   = list("Wood Floor","Goblin Floor","Bone Floor", "Destroy Tile","Wood Bridge", "Stone Bridge")
			Can_Build_Station = list("Smelter","Forge","Carpentry","Bonecraft","Gemcutting","Kitchen","Leather","Masonry","Potion","Melter")
			Can_Build_Traps   = list("StoneFall", "PitFall", "RibTrap", "BST")
			Can_Build_Other   = list("Wood Stairs Up","Wood Stairs Down","Stone Stairs Up","Stone Stairs Down","Ancient Stairs Up","Ancient Stairs Down","Campfire")

		Kobold
			Can_Build_Walls   = list("Bone Wall", "Secret Wall")
			Can_Build_Floor   = list("Bone Floor", "Destroy Tile", "BoneBridge")
			Can_Build_Station = list("Smelter","Forge","Carpentry","Masonry","Poison","Bonecraft","Leather","Melter")
			Can_Build_Other   = list("Ancient Stairs Up","Ancient Stairs Down","Bone Stairs Up","Bone Stairs Down","Campfire")
			Can_Build_Traps   = list("StoneFall", "PitFall", "RibTrap", "BST")

		Lizardman
			Can_Build_Walls   = list("Tribal Wall","Bone Wall", "Secret Wall")
			Can_Build_Floor   = list("Tribal Floor","Bone Floor", "Destroy Tile","Tribal Bridge")
			Can_Build_Station = list("Poison","Bonecraft","Leather","Carpentry","Melter")
			Can_Build_Other   = list("Bamboo Stairs Up","Bamboo Stairs Down","Campfire")
			Can_Build_Traps   = list("StoneFall", "PitFall")

		Orc
			Can_Build_Walls   = list("Wood Wall", "Secret Wall")
			Can_Build_Floor   = list("Wood Floor", "Destroy Tile","Wood Bridge")
			Can_Build_Station = list("Smelter","Forge","Carpentry","Masonry","Poison","Bonecraft","Leather","Melter")
			Can_Build_Other   = list("Wood Stairs Up","Wood Stairs Down","Ancient Stairs Up","Ancient Stairs Down","Campfire")
			Can_Build_Traps   = list("StoneFall", "PitFall")

		Ratman
			Can_Build_Walls   = list("Bone Wall", "Secret Wall")
			Can_Build_Floor   = list("Bone Floor", "Destroy Tile", "BoneBridge")
			Can_Build_Station = list("Smelter","Forge","Carpentry","Masonry","Poison","Bonecraft","Leather","Melter")
			Can_Build_Other   = list("Ancient Stairs Up","Ancient Stairs Down","Bone Stairs Up","Bone Stairs Down","Campfire")
			Can_Build_Traps   = list("StoneFall", "PitFall", "RibTrap", "BST")

		Svartalfar
			Can_Build_Walls   = list("Wood Wall","Stone Wall","Bone Wall", "Secret Wall")
			Can_Build_Floor   = list("Wood Floor","Stone Floor","Bone Floor", "Destroy Tile","Wood Bridge", "Stone Bridge","BoneBridge")
			Can_Build_Station = list("Smelter","Forge","Carpentry","Bonecraft","Gemcutting","Kitchen","Leather","Masonry","Potion","Melter")
			Can_Build_Other   = list("Wood Stairs Up","Wood Stairs Down","Stone Stairs Up","Stone Stairs Down","Ancient Stairs Up","Ancient Stairs Down","Campfire")
			Can_Build_Traps   = list("StoneFall", "PitFall")

		Devourer
			Can_Build_Walls   = list("Flesh Wall")
			Can_Build_Floor   = list("Flesh Floor", "Bone Bridge")//list("Wood Floor","Stone Floor","Bone Floor", "Destroy Tile","Wood Bridge", "Stone Bridge","BoneBridge")
			Can_Build_Other   = list("Wood Stairs Up","Wood Stairs Down","Stone Stairs Up","Stone Stairs Down","Ancient Stairs Up","Ancient Stairs Down","Campfire")
			Can_Build_Traps   = list("StoneFall", "PitFall", "CacoonTrap")


