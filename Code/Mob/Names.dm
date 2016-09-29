var/list/malehumanfirstnamelist=new()
var/list/malehumanlastnamelist=new()

var/list/femalehumanfirstnamelist=new()
var/list/femalehumanlastnamelist=new()

var/list/maledwarffirstnamelist=new()
var/list/maledwarflastnamelist=new()

var/list/femaledwarffirstnamelist=new()
var/list/femaledwarflastnamelist=new()

/*mob/proc/loadmalehumannames(var/order)
	var/text = file2text("config/name_gen/human/male/firstname.txt")
	var/text2 = file2text("config/name_gen/human/male/lastname.txt")
	if (!text || !text2)
	else
		var/list/lines = dd_text2list(text, "\n")
		var/list/lines2 = dd_text2list(text2, "\n")
		malehumanfirstnamelist += lines
		malehumanlastnamelist += lines2

mob/proc/loadfemalehumannames(var/order)
	var/text = file2text("config/name_gen/human/female/firstname.txt")
	var/text2 = file2text("config/name_gen/human/female/lastname.txt")
	if (!text || !text2)
	else
		var/list/lines = dd_text2list(text, "\n")
		var/list/lines2 = dd_text2list(text2, "\n")
		femalehumanfirstnamelist += lines
		femalehumanlastnamelist += lines2*/

mob/proc/loadmalenames(var/genrace)
	var/text = file2text("config/name_gen/[genrace]/male/firstname.txt")
	var/text2 = file2text("config/name_gen/[genrace]/male/lastname.txt")
	if (!text || !text2)
	else
		var/list/lines = dd_text2list(text, "\n")
		var/list/lines2 = dd_text2list(text2, "\n")
		switch(genrace)
			if("human")
				malehumanfirstnamelist += lines
				malehumanlastnamelist += lines2
			if("dwarf")
				maledwarffirstnamelist += lines
				maledwarflastnamelist += lines2
			if("elf")
				return
			if("goblin")
				return
			if("orc")
				return
			if("kobold")
				return
			if("lizardman")
				return
			if("frogman")
				return
			if("demon")
				return

mob/proc/loadfemalenames(var/genrace)
	var/text = file2text("config/name_gen/[genrace]/female/firstname.txt")
	var/text2 = file2text("config/name_gen/[genrace]/female/lastname.txt")
	if (!text || !text2)
	else
		var/list/lines = dd_text2list(text, "\n")
		var/list/lines2 = dd_text2list(text2, "\n")
		switch(genrace)
			if("human")
				femalehumanfirstnamelist += lines
				femalehumanlastnamelist += lines2
			if("dwarf")
				femaledwarffirstnamelist += lines
				femaledwarflastnamelist += lines2
			if("elf")
				return
			if("goblin")
				return
			if("orc")
				return
			if("kobold")
				return
			if("lizardman")
				return
			if("frogman")
				return
			if("demon")
				return

mob/proc/NPCHumanName()
	switch(Gender)
		if("Male")
			loadmalenames("human")
			spawn(20)
				var/name1 = pick(malehumanfirstnamelist)
				var/name2 = pick(malehumanlastnamelist)
				name = "[Owner] [name1] [name2]"
		if("Female")
			loadfemalenames("human")
			spawn(20)
				var/name1 = pick(femalehumanfirstnamelist)
				var/name2 = pick(femalehumanlastnamelist)
				name = "[Owner] [name1] [name2]"

mob/proc/NPCDawrfName()
	switch(Gender)
		if("Male")
			loadmalenames("dwarf")
			spawn(20)
				var/name1 = pick(maledwarffirstnamelist)
				var/name2 = pick(maledwarflastnamelist)
				name = "[Owner] [name1] [name2]"
		if("Female")
			loadfemalenames("dwarf")
			spawn(20)
				var/name1 = pick(femaledwarffirstnamelist)
				var/name2 = pick(femaledwarflastnamelist)
				name = "[Owner] [name1] [name2]"

mob/proc/NPCGoblinName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Gud'don"
		if(2)
			name1 = "Smex'ma"
		if(3)
			name1 = "Lug'ex"
		if(4)
			name1 = "Gugo'plux"
		if(5)
			name1 = "Slash'da"
		if(6)
			name1 = "Qux'lix"
		if(7)
			name1 = "Te'lax"
		if(8)
			name1 = "Smo'mux"
		if(9)
			name1 = "Smaz'sma"
		if(10)
			name1 = "Gug'lu"
		if(11)
			name1 = "Quin'qui"
		if(12)
			name1 = "Plux'meg"
		if(13)
			name1 = "Blah'sma"
		if(14)
			name1 = "Puke'lex"
		if(15)
			name1 = "Snag'la"
		if(16)
			name1 = "Smog'liz"
		if(17)
			name1 = "Yug'lux"
		if(18)
			name1 = "Smas'max"
		if(19)
			name1 = "Xe'loh"
		if(20)
			name1 = "Qel'lex"
	Pick2 = rand(1,20)
	switch(Pick2)
		if(1)
			name2 = "Snag'ma"
		if(2)
			name2 = "Smo'balix"
		if(3)
			name2 = "Ba'lix"
		if(4)
			name2 = "Kil'la"
		if(5)
			name2 = "Squah'lug"
		if(6)
			name2 = "Ash'meag"
		if(7)
			name2 = "Spog'mex"
		if(8)
			name2 = "Puk'wa"
		if(9)
			name2 = "Rux'pa"
		if(10)
			name2 = "Pug'pex"
		if(11)
			name2 = "Smack'erlex"
		if(12)
			name2 = "Cug'ma"
		if(14)
			name2 = "Cel'ix"
		if(15)
			name2 = "Trus'lus"
		if(16)
			name2 = "Bug'liz"
		if(17)
			name2 = "Rup'ture"
		if(18)
			name2 = "Diz'miz"
		if(19)
			name2 = "Ug'lex"
		if(20)
			name2 = "Tez'lek"
	src.name = "[Owner] [name1] [name2]"
	name = "[Owner] [name1] [name2]"

mob/proc/NPCKoboldName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Smug"
		if(2)
			name1 = "Ug"
		if(3)
			name1 = "Lum"
		if(4)
			name1 = "Sharpy"
		if(5)
			name1 = "Oglux"
		if(6)
			name1 = "Megma"
		if(7)
			name1 = "Frug"
		if(8)
			name1 = "Snat"
		if(9)
			name1 = "Snoter"
		if(10)
			name1 = "Lux"
		if(11)
			name1 = "Pok"
		if(12)
			name1 = "Pleg"
		if(13)
			name1 = "Hugx"
		if(14)
			name1 = "Welb"
		if(15)
			name1 = "Smag"
		if(16)
			name1 = "Quag"
		if(17)
			name1 = "Quxlux"
		if(18)
			name1 = "Rebspa"
		if(19)
			name1 = "Xelog"
		if(20)
			name1 = "Slashma"
	Pick2 = rand(1,20)
	switch(Pick2)
		if(1)
			name2 = "Snagtooth"
		if(2)
			name2 = "Slash"
		if(3)
			name2 = "Smorg"
		if(4)
			name2 = "Alag"
		if(5)
			name2 = "Egad"
		if(6)
			name2 = "Gad"
		if(7)
			name2 = "Icul"
		if(8)
			name2 = "Pukpuk"
		if(9)
			name2 = "Plem"
		if(10)
			name2 = "Deg"
		if(11)
			name2 = "Quickclaw"
		if(12)
			name2 = "Sneakers"
		if(14)
			name2 = "Trickster"
		if(15)
			name2 = "Smegle"
		if(16)
			name2 = "Trug'ug"
		if(17)
			name2 = "Po'log"
		if(18)
			name2 = "Mo'meg"
		if(19)
			name2 = "Ug'lex"
		if(20)
			name2 = "Ty'sme"
	src.name = "[Owner] [name1] [name2]"
	name = "[Owner] [name1] [name2]"
mob/proc/NPCLizardmanName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Chig"
		if(2)
			name1 = "Tog"
		if(3)
			name1 = "Ruf"
		if(4)
			name1 = "Erp"
		if(5)
			name1 = "Koon"
		if(6)
			name1 = "Pal"
		if(7)
			name1 = "Auti"
		if(8)
			name1 = "Noor"
		if(9)
			name1 = "Zoog"
		if(10)
			name1 = "Froop"
		if(11)
			name1 = "Novp"
		if(12)
			name1 = "Fly"
		if(13)
			name1 = "Goop"
		if(14)
			name1 = "Ju"
		if(15)
			name1 = "Ho"
		if(16)
			name1 = "Go"
		if(17)
			name1 = "Red"
		if(18)
			name1 = "Hop"
		if(19)
			name1 = "Heskin"
		if(20)
			name1 = "Topamak"
	Pick2 = rand(1,20)
	switch(Pick2)
		if(1)
			name2 = "Smith"
		if(2)
			name2 = "Megs"
		if(3)
			name2 = "Julip"
		if(4)
			name2 = "Tolan"
		if(5)
			name2 = "Tukoms"
		if(6)
			name2 = "Inles"
		if(7)
			name2 = "Curtious"
		if(8)
			name2 = "Mobaine"
		if(9)
			name2 = "Wesman"
		if(10)
			name2 = "Polom"
		if(11)
			name2 = "Cherly"
		if(12)
			name2 = "Statious"
		if(14)
			name2 = "Huknos"
		if(15)
			name2 = "Trucken"
		if(16)
			name2 = "Lilo"
		if(17)
			name2 = "Fredus"
		if(18)
			name2 = "Miloms"
		if(19)
			name2 = "Hobomes"
		if(20)
			name2 = "Tyken"
	src.name = "[Owner] [name1] Lizmord"
	name = "[Owner] [name1] Lizmord"
mob/proc/NPCFrogmanName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Chig"
		if(2)
			name1 = "Tog"
		if(3)
			name1 = "Ruf"
		if(4)
			name1 = "Erp"
		if(5)
			name1 = "Koon"
		if(6)
			name1 = "Pal"
		if(7)
			name1 = "Auti"
		if(8)
			name1 = "Noor"
		if(9)
			name1 = "Zoog"
		if(10)
			name1 = "Froop"
		if(11)
			name1 = "Novp"
		if(12)
			name1 = "Fly"
		if(13)
			name1 = "Goop"
		if(14)
			name1 = "Ju"
		if(15)
			name1 = "Ho"
		if(16)
			name1 = "Go"
		if(17)
			name1 = "Red"
		if(18)
			name1 = "Hop"
		if(19)
			name1 = "Heskin"
		if(20)
			name1 = "Topamak"
	Pick2 = rand(1,20)
	switch(Pick2)
		if(1)
			name2 = "Smith"
		if(2)
			name2 = "Megs"
		if(3)
			name2 = "Julip"
		if(4)
			name2 = "Tolan"
		if(5)
			name2 = "Tukoms"
		if(6)
			name2 = "Inles"
		if(7)
			name2 = "Curtious"
		if(8)
			name2 = "Mobaine"
		if(9)
			name2 = "Wesman"
		if(10)
			name2 = "Polom"
		if(11)
			name2 = "Cherly"
		if(12)
			name2 = "Statious"
		if(14)
			name2 = "Huknos"
		if(15)
			name2 = "Trucken"
		if(16)
			name2 = "Lilo"
		if(17)
			name2 = "Fredus"
		if(18)
			name2 = "Miloms"
		if(19)
			name2 = "Hobomes"
		if(20)
			name2 = "Tyken"
	src.name = "[Owner] [name1] Fougdon"
	name = "[Owner] [name1] Fougdon"
mob/proc/NPCOrcName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Dumbuk"
		if(2)
			name1 = "Omegugh"
		if(3)
			name1 = "Sunodagh"
		if(4)
			name1 = "Xegug"
		if(5)
			name1 = "Womrikug"
		if(6)
			name1 = "Naghig"
		if(7)
			name1 = "Gulrn"
		if(8)
			name1 = "Ambilge"
		if(9)
			name1 = "Eghuglat"
		if(10)
			name1 = "Gnabadug"
		if(11)
			name1 = "Dumag"
		if(12)
			name1 = "Varkgorim"
		if(13)
			name1 = "Borug"
		if(14)
			name1 = "Jukkhag"
		if(15)
			name1 = "Oogugbu"
		if(16)
			name1 = "Xnaurl"
		if(17)
			name1 = "Dulphumph"
		if(18)
			name1 = "Sugbu"
		if(19)
			name1 = "Vigdug"
		if(20)
			name1 = "Rolfish"
	Pick2 = rand(1,20)
	switch(Pick2)
		if(1)
			name2 = "Smith"
		if(2)
			name2 = "Megs"
		if(3)
			name2 = "Julip"
		if(4)
			name2 = "Tolan"
		if(5)
			name2 = "Tukoms"
		if(6)
			name2 = "Inles"
		if(7)
			name2 = "Curtious"
		if(8)
			name2 = "Mobaine"
		if(9)
			name2 = "Wesman"
		if(10)
			name2 = "Polom"
		if(11)
			name2 = "Cherly"
		if(12)
			name2 = "Statious"
		if(14)
			name2 = "Huknos"
		if(15)
			name2 = "Trucken"
		if(16)
			name2 = "Lilo"
		if(17)
			name2 = "Fredus"
		if(18)
			name2 = "Miloms"
		if(19)
			name2 = "Hobomes"
		if(20)
			name2 = "Tyken"
	src.name = "[Owner] [name1] Uzmak"
	name = "[Owner] [name1] Uzmak"

mob/proc/NPCDemonName()
	var/name1
	var/name2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Bolxor"
		if(2)
			name1 = "Nabxohn"
		if(3)
			name1 = "Bulsohr"
		if(4)
			name1 = "Eaguosuhm"
		if(5)
			name1 = "Aiziobihr"
		if(6)
			name1 = "Eexisom"
		if(7)
			name1 = "Whiexur"
		if(8)
			name1 = "Truudahra"
		if(9)
			name1 = "Cherxiesach"
		if(10)
			name1 = "Payvauxor"
		if(11)
			name1 = "Gremeran"
		if(12)
			name1 = "Bardal"
		if(13)
			name1 = "Phenabhal"
		if(14)
			name1 = "Wiamon"
		if(15)
			name1 = "Iukoluhn"
		if(16)
			name1 = "Gluudohro"
		if(17)
			name1 = "Pleorom"
		if(18)
			name1 = "Bealehualur"
		if(19)
			name1 = "Pulgaizon"
		if(20)
			name1 = "Zimtuimuhm"
	src.name = "[Owner] Lord [name1] "
	name = "[Owner] Lord [name1] "