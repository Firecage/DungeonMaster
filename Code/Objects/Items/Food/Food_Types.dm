/obj/Items/Food
	icon='Food.dmi'
	ItemType="Food"
	weight = 10

/obj/Items/Food/New()
	ItemDecay()

/obj/Items/Food/Cheese
	icon_state = "Cheese"
	desc = "This is a chunk of cheese, it can be eaten"

/obj/Items/Food/Grape
	icon_state = "Grape"
	desc = "This is a grape, once eaten it will provide a seed, it can also be used to create wines."
	FoodPower=30

/obj/Items/Food/Tomato
	icon_state = "Tomato"
	desc = "This is a tomato, it can be used as food and will provide seeds as well."
	FoodPower=50

/obj/Items/Food/Fungus
	icon_state = "Fungus"
	desc = "This is a chunk of fungus, it can be eaten by some creatures such as Kobolds and Goblins"

/obj/Items/Food/Meat
	icon_state = "RawMeat"
	desc = "This is a chunk of meat, it can be eaten."
	FoodPower=125

/obj/Items/Food/Meat/Cooked_Meat //Just for quick create.
	icon_state="CookedMeat"
	FoodPower=150
