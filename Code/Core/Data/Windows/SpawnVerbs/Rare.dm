mob/verb/spawnRandom()
	set hidden = 1
	var/RaceList = pick(1,2,3,4,5,6,7,8,9)//,10,11,12,13)
	if(RaceList ==1)
		spawnHuman()
		restartpressed=0
		return
	if(RaceList ==2)
		spawnDwarf()
		restartpressed=0
		return
	if(RaceList ==3)
		spawnLizardman()
		restartpressed=0
		return
	if(RaceList ==4)
		spawnFrogman()
		restartpressed=0
		return
	if(RaceList ==5)
		spawnKobold()
		restartpressed=0
		return
	/*if(RaceList ==6)
		spawnDev()
		restartpressed=0
		return
	if(RaceList ==7)
		spawnDragon()
		restartpressed=0
		return
	if(RaceList ==8)
		spawnSpider()
		restartpressed=0
		return
	if(RaceList ==9)
		spawnSvart()
		restartpressed=0
		return*/
	if(RaceList ==6)
		spawnElf()
		restartpressed=0
		return
	if(RaceList ==7)
		spawnRatman()
		restartpressed=0
		return
	if(RaceList ==8)
		spawnOrc()
		restartpressed=0
		return
	if(RaceList ==9)
		spawnGoblin()
		restartpressed=0
		return
mob/verb/spawnRare()
	set hidden = 1
	if("SandKing" in usr.Rares)
		if("Illithid" in usr.Rares)
			switch(alert("You have multiple rares, which would you like to be?","Rare Selection","Illithid","SandKing"))
				if("Illithid")
					usr.spawnIllithid()
					restartpressed=0
					world << "<font color = purple><b>An Illithid has been spotted in the world."
					return
				if("SandKing")
					usr.spawnSandKing()
					world << "<font color = purple><b>An SandKing has been spotted in the world."
					return
		else
			if("SandKing" in usr.Rares)
				usr.spawnSandKing()
				restartpressed=0
				world << "<font color = purple><b>An SandKing has been spotted in the world."
				return
			else
				if("Illithid" in usr.Rares)
					usr.spawnIllithid()
					restartpressed=0
					world << "<font color = purple><b>An Illithid has been spotted in the world."
					return
				else
					usr << "<font color = gold><b>You do not have any rares."
					return


