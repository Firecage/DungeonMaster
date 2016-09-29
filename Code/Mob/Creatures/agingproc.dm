/*proc/spiderage()
	for(var/mob/Monsters/m in world) if(ismob(m.Owner)) if(m.Owner:client)
		if(m.Race=="Spider")
			m.Age+=1
		m.SpiderAgeGains()
		if(m.Age<=5)
			m.SpiderAgeGains()
		if(m.Critter) switch(m.Race) if("CaveSpider","DeathBeatle","Mole","TowerCap")
			m.GoingToDie = 1
			m.Killer = "time"
			m.DeathType = "old age"
			m.Death()*/
proc/critterage()
	for(var/mob/Monsters/m in world) if(ismob(m.Owner)) if(m.Owner:client)
		if(m.Critter) switch(m.Race) if("CaveSpider","DeathBeatle","Mole","TowerCap")
			m.GoingToDie = 1
			m.Killer = "time"
			m.DeathType = "old age"
			m.Death()
proc/humanage()
	for(var/mob/Monsters/m in world) if(ismob(m.Owner)) if(m.Owner:client)
		m.Age+=1
		if(m.Age>100) switch(m.Race) if("Human")
			if(prob(45))
				m.GoingToDie = 1
				m.Killer = "time"
				m.DeathType = "old age"
				m.Death()
			else
				m.Owner<< "[m] Is starting to die of old age."
/*proc/skage()
	for(var/mob/Monsters/m in world) if(ismob(m.Owner)) if(m.Owner:client)
		if(m.Race=="SandKing")
			if(m.Level >= 100)
				m.Owner << "[m] is strong enough to make a mobile cacoon and can not get any stronger till it does."
			else
				m.Level += 10
				m.Owner << "[m] gets stronger."
proc/dragonage()
	for(var/mob/Monsters/m in world) if(ismob(m.Owner)) if(m.Owner:client)
		if(m.Race=="Dragon")
			if(m.Age<5)
				m.Age+=5
				m.EggContent +=5
			else
				m.Age +=1
				m.EggContent +=1*/



