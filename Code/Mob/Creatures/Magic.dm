mob/var/list/marked
var/list/marked
mob/var/markedloc
mob/verb/recall()
	for(var/mob/Monsters/M in usr.Selected)
		for(var/obj/O as turf in M.marked)
		//var/T = input("Select Player Here")as null|anything in M.marked
		//if(!T)
			//..()
		//else
			M.loc = O
			return

mob/verb/mark()
	for(var/mob/M in world)
		if(M == usr)
			M.markedloc = M.loc
			M.marked += M.loc
			//LOC = M.x&M.y&M.z
			//M.marked += M.x
			//M.marked += M.y
			//M.marked += M.z
			usr << "saved [M.loc]"
			//return