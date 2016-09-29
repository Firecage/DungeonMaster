proc/SeasonChange()
	..()
	Seasons()
	spawn(2200)
		SeasonChange()
proc/SeasonsCneck()
	..()
	switch(Month)
		if(6,7,8)
			Season = "Summer"
		if(9,10,11)
			Season = "Fall"
		if(12,1,2)
			Season = "Winter"
		if(3,4,5)
			Season = "Spring"

proc/Seasons()	switch(Season)
	if("Summer")	switch(Month)
		if(6)
			weathersummer()
		if(7)
			critterage()
			weathersummer()
		if(8)
			weathersummer()
		if(9)
			Season = "Fall"
			weatherfall()
			humanage()
	if("Fall")	switch(Month)
		if(9)
			weatherfall()
		if(10)
			weatherfall()
		if(11)
			weatherfall()
		if(12)
			Season = "Winter"
			sayfreeze()
			humanage()
			weatherwinter()

	if("Winter")	switch(Month)
		if(12)
			weatherwinter()
		if(1)
			sayfreeze()
			weatherwinter()

		if(2)
			sayfreeze()
			weatherwinter()
			return
		if(3)
			Season = "Spring"
			weatherspring()
			humanage()
			world << "<b><font color=gold>It is warming up!The great thaw!"
	if("Spring")	switch(Month)
		if(3)
			Season = "Spring"
			weatherspring()
		if(4)
			weatherspring()


		if(5)
			weatherspring()
		if(6)
			Season="Summer"
			weathersummer()
			humanage()
var
	saidfreeze=0
	isfrozen=0
proc/sayfreeze()
	if(saidfreeze==0)
		world << "It is getting colder!The great freeze!"
		saidfreeze=1



/*proc/changecoldness()
	applycoldness()
	spawn(3000)
		changecoldness()

proc/applycoldness(Temperature)
	for(var/mob/Monsters/M in world)
		if(!M.ImmuneToTemperature)
			if(!M.Undead)
				if(!M.CanBeSlaved)
					if(Season=="Winter")
						//for(var/turf/grounds/grass/g in world)
						if(usr.Coldness >= 100)
							usr.Coldness -= 5
							M.destination = null
							M.Owner << "[M] starts to get frost bite!"
							M.HP -= 20
							if(M.HP <= 0)
								M.GoingToDie = 1
								M.Killer = "Frost Bite"
								M.DeathType = "Coldness"
								M.Death()
								return
							return
						else
							if(usr.Coldness <= -100)
								usr.Coldness += 5
								M.Owner << "[M] starts to get colder!"
								return*/
/*					if(Season=="Spring")
						for(var/turf/grounds/grass/g in world)
					if(Season=="Summer")
						for(var/turf/grounds/grass/g in world)
					if(Season=="Fall")
						for(var/turf/grounds/grass/g in world)*/








		/*				if(Temperature>0&&!night)
							usr.Coldness -= Temperature
						if(Temperature<0&&night)
							usr.Coldness -= Temperature
						if(usr.Coldness >= 100)
							usr.Coldness -= 5
							usr.destination = null
							usr.Owner << "[usr] starts to get frost bite!"
							usr.HP -= 20
							if(usr.HP <= 0)
								usr.GoingToDie = 1
								usr.Killer = "Frost Bite"
								usr.DeathType = "Coldness"
								usr.Death()
								return
						else if(usr.Coldness <= -100)
							usr.Coldness += 5
							usr.destination = null
							usr.Owner << "The heat damages [usr]"
							usr.HP -= 20
							if(usr.HP <= 0)
								usr.GoingToDie = 1
								usr.Killer = "Heat Stroke"
								usr.DeathType = "Overheating"
								usr.Death()
								return*/