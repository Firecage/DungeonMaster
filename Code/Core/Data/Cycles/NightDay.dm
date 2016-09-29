/proc/NightChange()
	switch(night)
		if(0)
			Night()
			spawn(1500)//4000
				NightChange()
		if(1)
			Night()
			spawn(1500)//4000
				NightChange()
/proc/Night()
	if(night)
		world << "<p><b><h2><font color=#E0C200>It Starts To Get Lighter<p>"
		SeasonsCneck()
		spawn(20)
			Seasons()
		spawn(400)//400
			night = 0
			world << "<p><b><h2><font color=#E0C200>Day Rises ¤<p>"
			Day += 1
			if(Day >= 11)
				if(Month ==12)
					Month = 0
					Year += 1
				Month += 1
				world.Repop()
				Army()
				Day = 1
			world << "<p><b><h2><font color=gold>It is now [Season]  Day [Day]  Month [Month]  of year [Year]!<p>"
			SeasonsCneck()
			spawn(20)
				Seasons()
			SayBossCoords()
			for(var/mob/X in Players2) if(X.client) for(var/obj/Hud/Day/D in X.client.screen)
				D.icon_state = "Sun"
				D.name = "Day"
				D.text = "<font color=yellow>¤"
			for(var/mob/Monsters/m in world)
				if(m.SubRace == "Werewolf") m.WerewolfTransformation()
				m.SunLight()
	else
		world << "<p><b><h2><font color=#008ADA>It Starts To Get Darker<p>"
		SeasonsCneck()
		spawn(20)
			Seasons()
		spawn(400)//400
			night = 1
			world << "<p><b><h2><font color=#008ADA>Night Falls<p>"
			if(prob(10)) spawn(300)
				world << "<p><b><h1><font color=#D0A020>A comet starts to pass by the planet.<p>"
				if(Event("Shooting Star",600))
					ExperienceMultiplier+=9
					spawn(300)
						if(prob(50))
							Comet()
							ExperienceMultiplier-=9
						else
							ExperienceMultiplier-=9//comet here
							world << "<p><b><h1><font color=#D0A020>The comet passed by the planets orbit. <p>"
			for(var/mob/X in Players2) if(X.client) for(var/obj/Hud/Day/D in X.client.screen)
				D.icon_state = "Moon"
				D.name = "Night"
				D.text = "<font color=blue>°"
			for(var/mob/Monsters/m in world)
				if(m.SubRace == "Werewolf") m.WerewolfTransformation()