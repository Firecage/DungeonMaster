obj/proc/success(craftingSkill,material,var/success)
	for(var/mob/Monsters/M in usr.Selected)
		success = prob(craftingSkill*2)
		if(success == 0)
			usr<< "failed!"
			break(craft())
			return
		else
			return