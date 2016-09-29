mob/verb/Update() usr.Intro()
mob/proc/Updates() Intro()
mob/proc/Intro() //**********************Remember to carry "CanBeCaged" or whatever on births, as well as add mage chances. Just look over the old stuff to see if we're missing anything.
	src << browse('web/home.html', "window=browserwindow")
client
	New()
		..()
		mob << browse('web/guide.html', "window=guide")
		mob << browse('web/home.html', "window=browserwindow")