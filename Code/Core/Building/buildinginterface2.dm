client
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



			screen += B6
			screen += B5
			screen += B4
			screen += B3
			screen += B2
			screen += B1
			screen += BS

			screen += Wall
			screen += Floor
			screen += Station
			screen += Trap
			screen += Other

			screen += S1
			screen += S2
			screen += S3
			screen += S4
			screen += S5


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
			screen += O
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
						screen += B
						Slider.HUD += B


						var/obj/Obj = Buildings[Buildable[i]]
						var/obj/HUD/Building_Interface/Buildings/O = new Obj.type()
						O.overlays += icon('Building Interface.dmi',"Border")
						O.screen_loc = "[div((L_Num+4),32)]:[(L_Num+4)%32],[div((103+34*(i-1)+4),32)]:[(103+34*(i-1)+4)%32]"
						screen += O
						Slider.HUD += O
						O.Slider = Slider

					var/obj/HUD/Building_Interface/Sub_BG/End/BT = new()
					BT.screen_loc = "[L],[div((103+34*Buildable.len+6),32)]:[(103+34*Buildable.len+6)%32]"
					if(Buildable.len == 0)
						BT.screen_loc = "[L],[div(103,32)]:[103%32]"
					screen += BT
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


					screen += B6
					screen += B5
					screen += B4
					screen += B3
					screen += B2
					screen += B1

					screen += BL3
					screen += BL2
					screen += BL1

					screen += BR3
					screen += BR2
					screen += BR1

					screen += BT2
					screen += BT1

					screen += BTL
					screen += BTR


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
						screen += O
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


					screen += B8
					screen += B7
					screen += B6
					screen += B5
					screen += B4
					screen += B3
					screen += B2
					screen += B1

					screen += BL4
					screen += BL3
					screen += BL2
					screen += BL1

					screen += BR4
					screen += BR3
					screen += BR2
					screen += BR1

					screen += BT2
					screen += BT1

					screen += BTL
					screen += BTR


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
						screen += O
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



					screen += B9
					screen += B8
					screen += B7
					screen += B6
					screen += B5
					screen += B4
					screen += B3
					screen += B2
					screen += B1

					screen += BL3
					screen += BL2
					screen += BL1

					screen += BR3
					screen += BR2
					screen += BR1

					screen += BT3
					screen += BT2
					screen += BT1

					screen += BTL
					screen += BTR



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
						screen += O
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

					screen += B10
					screen += B9
					screen += B8
					screen += B7
					screen += B6
					screen += B5
					screen += B4
					screen += B3
					screen += B2
					screen += B1

					screen += BL5
					screen += BL4
					screen += BL3
					screen += BL2
					screen += BL1

					screen += BR5
					screen += BR4
					screen += BR3
					screen += BR2
					screen += BR1

					screen += BT2
					screen += BT1

					screen += BTL
					screen += BTR


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
						screen += O
						Slider.HUD += O
						O.Slider = Slider