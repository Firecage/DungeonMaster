client/var/list/dragselect = list()

/mob/proc/ToggleSelect(Player/USR=Owner)
	if(USR.Selected.Find(src))
		src.Deselect(USR)
	else
		src.Select(USR)

/mob/proc/Select(mob/USER=Owner) if(ismob(USER))
	if(src.Egg || src.InHole || src.Sleeping)
		return
	if(!ismob(loc)&&!isobj(loc))
		if(!USER.Selected.Find(src))
			USER.Selected.Add(src)
			if(USER.client)
				USER.client.images += Star

/mob/proc/Deselect(Player/USER=Owner) if(ismob(USER)) if(USER.Selected.Find(src))
	USER.Selected.Remove(src)
	if(USER.client)
		USER.client.images -= Star

/mob/Monsters/DblClick()
	if(Owner==usr)
		src.ToggleSelect()
	else
		if(usr.DE && usr.FreeSelect)
			src.ToggleSelect(usr)

client/MouseDrag(atom/B,atom/A,  src_location,over_location,src_control,over_control,params)
	..()
	var/list/P = params2list(params)
	if(P["left"])
		if(!isturf(A))
			A = A.loc
		if(!isturf(B))
			B = B.loc
		var/turf/Loc2 = A
		var/turf/Loc1 = B
		var/list/L = block(Loc1, Loc2)
		for(var/turf/T in L)
			for(var/mob/Monsters/M in range(0,T))
				if(M in dragselect)
					..()
				else
					dragselect += M
			//T.color="#ffff66"

client/MouseDrop(atom/src_B,atom/A,  src_location,over_location,src_control,over_control,params)
	..()
	for(var/mob/Monsters/M in dragselect)
		dragselect-=M
		if(M.Owner==usr)
			if(M in usr.Selected)
				M.Deselect(usr)
			else
				M.Select(usr)