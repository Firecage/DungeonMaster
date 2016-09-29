mob
	var
		coloropen = 0
mob
	var
		ooccolor = 0
mob/verb/colorselection()
	set hidden = 1
	if(coloropen==0)
		coloropen = 1
		winshow(src,"ColorSelection",1)
	else
		coloropen = 0
		winshow(src,"ColorSelection",0)
mob/verb/Red()
	ooccolor=1
	winshow(src,"ColorSelection",0)
	coloropen = 0
mob/verb/Blue()
	ooccolor=2
	winshow(src,"ColorSelection",0)
	coloropen = 0
mob/verb/Green()
	ooccolor=3
	winshow(src,"ColorSelection",0)
	coloropen = 0
mob/verb/Orange()
	ooccolor=4
	winshow(src,"ColorSelection",0)
	coloropen = 0
mob/verb/Purple()
	ooccolor=5
	winshow(src,"ColorSelection",0)
	coloropen = 0
mob/verb/Pink()
	ooccolor=6
	winshow(src,"ColorSelection",0)
	coloropen = 0
mob/verb/DarkBlue()
	ooccolor=7
	winshow(src,"ColorSelection",0)
	coloropen = 0
mob/verb/LightRed()
	ooccolor=8
	winshow(src,"ColorSelection",0)
	coloropen = 0
mob/verb/Yellow()
	ooccolor=9
	winshow(src,"ColorSelection",0)
	coloropen = 0


