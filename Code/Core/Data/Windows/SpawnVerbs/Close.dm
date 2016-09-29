mob/verb/CloseRaceMenu()
	set hidden = 1
	winshow(src,"RaceSelection",0)
	restartpressed=0
	alert(src,"You have closed the race selection menu. You may reopen the menu by pressing R on your keyboard or by pressing the restart button.","Race-Selection Menu Closed")
mob/verb/CloseInteractMenu()
	set hidden = 1
	winshow(src,"InteractChoices",0)
	winshow(src,"MagicalInteractChoices",0)
	minteractopen = 0
	interactopen = 0
	alert(src,"You have closed the interact menu. You may reopen the menu by pressing I on your keyboard.","Interact Menu Closed")