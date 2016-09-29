var/humanhasbeensaid = 0
var/dwarfhasbeensaid = 0
var/goblinhasbeensaid = 0
var/elfhasbeensaid = 0
var/orchasbeensaid = 0
var/lizardmanhasbeensaid = 0
var/frogmanhasbeensaid = 0
var/koboldhasbeensaid = 0
var/ratmenhasbeensaid = 0
//var/svarthasbeensaid = 0
//var/spiderhasbeensaid = 0
//var/dragonhasbeensaid = 0
//var/devhasbeensaid = 0

proc/humanstartalert()
	switch(humanhasbeensaid)
		if(0)
			alert(usr,"As part of the Human empire you were ordered to scout out new lands suitable for settlements, though it seems your search has come to an end! It might be best if you set up camp for the winter ahead.","Humans")
			humanhasbeensaid+=1
		if(1)
			humanhasbeensaid+=1
			return
		if(2)
			humanhasbeensaid+=1
			return
		if(3)
			humanhasbeensaid=0
			return

proc/dwarfstartalert()
	switch(dwarfhasbeensaid)
		if(0)
			alert(usr,"Your companions & you have traveled far and wide to find tresures, perhaps these new lands will hold the fortune you seek... Here many adventures and dangers await you. You should think about creating a secure place to live deep in the mountains so that you may start to create a vast dwarven city.","Dwarves")
			dwarfhasbeensaid+=1
		if(1)
			dwarfhasbeensaid+=1
			return
		if(2)
			dwarfhasbeensaid+=1
			return
		if(3)
			dwarfhasbeensaid=0
			return

proc/goblintartalert()
	switch(goblinhasbeensaid)
		if(0)
			alert(usr,"Lured to this land in search sustenance, Your companions and you have decided to make these new lands the home of your dark goblin empire! ","Goblins")
			goblinhasbeensaid+=1
		if(1)
			goblinhasbeensaid+=1
			return
		if(2)
			goblinhasbeensaid+=1
			return
		if(3)
			goblinhasbeensaid=0
			return

proc/elfstartalert()
	switch(elfhasbeensaid)
		if(0)
			alert(usr,"Long have your kind called these lands home..Your lands have been invaded by all sorts of foul selfish races..Will you hide in your forest for fear of your lives?Or will your companions and you fight to reclaim your lands!","Elves")
			elfhasbeensaid+=1
		if(1)
			elfhasbeensaid+=1
			return
		if(2)
			elfhasbeensaid+=1
			return
		if(3)
			elfhasbeensaid=0
			return

proc/orcstartalert()
	switch(orchasbeensaid)
		if(0)
			alert(usr,"Climbing straight from the gates of the abyess where your dark elven kind have been damned.. You seek blood and venegance for your imprisonment..But take care for the guardians of the underworld are not to be taken lightly..Will your companions and you rule your old homeland, Or will you see it covered in blood & ash!","Orcs")
			orchasbeensaid+=1
		if(1)
			orchasbeensaid+=1
			return
		if(2)
			orchasbeensaid+=1
			return
		if(3)
			orchasbeensaid=0
			return

proc/lizardmanstartalert()
	switch(lizardmanhasbeensaid)
		if(0)
			alert(usr,"Native to this land the lizardmen live a harsh life in a horrific enviroment, disturbed by the other races your lizardmen decide to hunt down and kill the inruders so that this land may be yours once more.","Lizardmen")
			lizardmanhasbeensaid+=1
		if(1)
			lizardmanhasbeensaid+=1
			return
		if(2)
			lizardmanhasbeensaid+=1
			return
		if(3)
			lizardmanhasbeensaid=0
			return

proc/frogmanstartalert()
	switch(frogmanhasbeensaid)
		if(0)
			alert(usr,"Since anyone can remember the frogmen and the lizardmen have been at war for control of the swamps. Every day there is mass bloodshed. It's up to you if you wish to partake in this, or simply flee the land and find somewhere a bit more safe to live. Whatever your choice, watch out for swamp dragons.","Frogmen")
			frogmanhasbeensaid+=1
		if(1)
			frogmanhasbeensaid+=1
			return
		if(2)
			frogmanhasbeensaid+=1
			return
		if(3)
			frogmanhasbeensaid=0
			return

proc/koboldstartalert()
	switch(koboldhasbeensaid)
		if(0)
			alert(usr,"Tempted by the un-found treasures of this new land you finally arive, it might be best to create a secure cave so that you may one day make a vast Kobold army to raid this land with.","Kobolds")
			koboldhasbeensaid+=1
		if(1)
			koboldhasbeensaid+=1
			return
		if(2)
			koboldhasbeensaid+=1
			return
		if(3)
			koboldhasbeensaid=0
			return

proc/ratmenstartalert()
	switch(ratmenhasbeensaid)
		if(0)
			alert(usr,"Driven from your home by hordes of dangerous predators, you have arrived in this new land to propagate your kind... and eat cheese.","Ratmen")
			ratmenhasbeensaid+=1
		if(1)
			ratmenhasbeensaid+=1
			return
		if(2)
			ratmenhasbeensaid+=1
			return
		if(3)
			ratmenhasbeensaid=0
			return