/*/var/Hour = 1
/var/Minute = 0
/var/Second = 0

proc
	get_time()
		time = ("[hour]:[minutes2][minutes1] [ToD] - [seconds]")


var
	seconds = 0
	minutes1 = 0
	minutes2 = 0
	hour = 12
	ToD = "PM"
	time
	FullTime=""


proc/TimeUp()
	FullTime=GameTime()
	spawn(72) TimeUp()
proc/GameTime()
	return	"[hour]:[minutes2][minutes1] [ToD] - [seconds]"

world
	New()
		set background = 1
		..()
		sleep(10) // sleep 10 ticks
		seconds++ // increment sec
		if(seconds >= 3) // if 3 secs passed
			seconds = 0 // reset sec
			minutes1++ // increment min1
			if(minutes1 >= 10) // every 10 min1
				minutes1 = 0 // reset min1
				minutes2++ // increment min2
				if(minutes2 >= 6) // every 6 min2
					minutes2 = 0 // reset min2
					hour++ // increment hours
					if(hour==12) // change of tod during 12:00
						if(ToD=="AM") // if tod is AM
							ToD = "PM" // change to PM
						else // otherwise
							ToD = "AM" // change to AM
					else if(hour>12) // after 12 hr
						hour = 1 // reset hr to 1
		get_time()
		spawn TimeUp()*/


world
	New()
		..()
		spawn TimeUp()
proc
	TimeH()
		return round((world.time*TimeScale)/36000)
	TimeM()
		return round((world.time*TimeScale)%3600/600)
	GameTime()
		return "[TimeH()]:[TimeM()]"
	TimeUp()
		FullTime=GameTime()
		spawn(72) TimeUp()
var
	TimeScale=7.2
	FullTime=GameTime()
	TimeH=TimeH()
//mob/Stat()
//    stat("Time",FullTime)


