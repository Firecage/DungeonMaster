/mob
	HP = 350
	MAXHP = 350
	IsWood = 1
	var/Critter = 0

	//Reason it's temp is so as to evade saving duplicates of particular units and to not have breeding details carry in saves.
	//Reason these two are named "MALE" and "FEMALE" rather than FutureFather/Mother, is simply to keep em close to the vars used in "BreedWith()"
	var/tmp/mob/CHILDMALE //Doubles as a "IsPregnent" var by use of "if(CHILDMALE)"
	var/tmp/mob/CHILDFEMALE //This is mostly used for eggs, but having it in the code allows for complicated things like having someone have someone elses kid or something.
	var/tmp/CHILDTYPE //This holds the actual type value that the child will be. In most cases equal to FEMALE's racetype durring births, but needs to be set for eggs.
	var/tmp/CHILDCOUNT //This holds the ammount of children that will be created upon "GiveBirth()".

	var/IsRoyal

	var/UsesEquipment="Normal" //Simply set to 0 to stop use of equipment.
	var/HoldingWeapon
	var/WearingChest
	var/WearingShield
	var/WearingHelmet
	var/WearingLegs
	var/WearingBack
	var/WearingCape
	var/WearingLeftArm
	var/WearingRightArm
	var/WearingFullPlateHelm
	var/WearingRing = 0
	var/WearingCrown

	var/tmp/Function = null
	var/tmp/SubFunction = null

	var/tmp/SavedDest = null
	var/tmp/InfectedBy = null
	var/tmp/MagicTarget = null
	var/tmp/TemporaryUnitTarget = null
	var/tmp/BrainWasher = null
	var/tmp/Meditating = 0
	var/tmp/PracticeSkill = 0
	var/tmp/DigTarget = null
	var/tmp/CanUseLeftArm = 1
	var/tmp/CanUseRightArm = 1
	var/tmp/CanWalk = 1
	var/tmp/WalkNumber = 0
	var/tmp/HealNumber = 0
	var/tmp/LoggedIn = 0
	var/tmp/Killer = null
	var/tmp/Sleeping = 0
	var/tmp/Running = 0

	var/EmoteLog = null
	var/ChatLog = null
	var/Kills = 0
	var/Faction = "Player"
	var/Loaded = 0
	var/DMID = null
	var/IsClanLeader = 0

	var/CantBeGiven
	var/Waypoint = null
	var/Waypoint2 = null
	var/Waypoint3 = null
	var/SaidBleed = 0
	var/DeathType = null
	var/BloodContent = 0
	var/MaxBloodContent = 0
	var/HasLeftEye
	var/HasRightEye
	var/HasRightLung
	var/HasLeftLung
	var/HitWings
	var/Wings
	var/WingsHP
	var/Morphed = 0
	var/HasSpleen
	var/WingsOut = 0
	var/HasTeeth
	var/HasLeftArm
	var/HasRightArm
	var/HasLeftLeg
	var/HasRightLeg
	var/CanBreed = 0
	var/HasHead
	var/HasLeftEar
	var/HasRightEar
	var/HasGuts
	var/HasStomach
	var/HasLeftKidney
	var/HasRightKidney
	var/HasLiver
	var/HasBrain
	var/HasHeart
	var/SkillDMG
	var/HasThroat
	var/HasNose
	var/BleedType
	var/Stunned = 0
	var/Fainted = 0
	var/LeftEye

	var/RightEye

	var/RightLung


	var/LeftLung
	var/Spleen
	var/Teeth
	var/LeftArm
	var/RightArm
	var/LeftLeg
	var/RightLeg
	var/Head
	var/LeftEar
	var/RightEar
	var/Guts
	var/Stomach
	var/LeftKidney
	var/RightKidney
	var/CanSee = 1
	var/Liver
	var/Brain
	var/Heart
	var/Throat
	var/Nose
	var/HitHead
	var/HitLeftArm
	var/HitRightArm
	var/HitLeftLeg
	var/HitRightLeg
	var/HitLowerBody
	var/HitUpperBody
	var/BowOn = 0
	var/HitLeftEar
	var/HitRightEar
	var/HitGuts
	var/HitStomach
	var/HitLeftKidney
	var/HitRightKidney
	var/HitLiver
	var/HitBrain
	var/HitHeart
	var/HitThroat
	var/HitNose
	var/HitLeftEye
	var/HitRightEye
	var/HitRightLung
	var/HitLeftLung
	var/HitSpleen
	var/HitTeeth
	var/HitSkull

	var/LeftEyeHP = 100
	var/RightEyeHP = 100
	var/RightLungHP = 100
	var/LeftLungHP = 100
	var/SpleenHP = 100
	var/TeethHP = 100
	var/LeftArmHP = 100
	var/RightArmHP = 100
	var/LeftLegHP = 100
	var/RightLegHP = 100
	var/HeadHP = 100
	var/LeftEarHP = 100
	var/RightEarHP = 100

	var/GutsHP = 100
	var/StomachHP = 100
	var/LeftKidneyHP = 100
	var/RightKidneyHP = 100
	var/LiverHP = 100
	var/BrainHP = 100
	var/HeartHP = 100
	var/ThroatHP = 100
	var/NoseHP = 100
	var/OrganMaxHP = 100
	var/TeethHPMax = 100

	var/DamageType
	var/CraftCount = 0
	var/Age = 0
	var/Flying = 0
	var/Muted = 0
	var/SavedIcon
	var/SavedDefence
	var/SandWorker = 0
	var/ShieldSkill = 0
	var/Mana = 0
	var/MaxMana = 0
	var/NetherManCount = 0
	var/Egg = 0
	var/Mutated = 0
	var/AxeSkill = 0
	var/CliffClimber = 0
	var/DaggerSkill = 0
	var/Delay = 4
	var/ButcherySkill = 0
	var/Shielded = 0
	var/LeatherCraftingSkill = 0
	var/StoneCraftingSkill = 0
	var/CantLoseLimbs = 0
	var/UsesPoison = 0
	var/Fling = 0
	var/Caged = 0
	var/CanBeCaged = 0
	var/BuildingSkill = 0

	var/WoodCraftingSkill = 0
	var/MagicalAptitude = 0
	var/MagicalWill = 0
	var/MagicalMind = 0
	var/MagicalAnger = 0
	var/MagicalConcentration = 0
	var/DodgeDelay = 0
	var/ImmuneToMagic = 0
	var/ImmuneToTemperature = 0
	var/Berserking = 0
	var/DefensiveFight = 0
	var/ImmuneToVampire = 0
	var/VampPick = 0
	var/MetalCraftingSkill = 0
	var/NotInLight = 0
	var/SkinningSkill = 1
	var/Machinery = 1
	var/SpecialUnit = 0
	var/NecromancySkill = 0
	var/GargRuby = 0
	var/GargEmerald = 0
	var/HolySkill = 0
	var/DestructionSkill = 0
	var/AstralSkill = 0
	var/ChaosSkill = 0
	var/SpearSkill = 0
	var/OldOwner = null
	var/SaveToggle1 = 0
	var/FishingSkill = 0
	var/HasWings = 0
	var/DayWalker = 0
	var/Infects = 0
	var/ImmunePoison = 0
	var/Cantame = 0
	var/ReturningHome = 0
	var/AttackModeOn = 1
	var/JewlCraftingSkill = 0
	var/BoneCraftingSkill = 0
	var/SneakingSkill = 0
	var/DieAge = 0
	var/ImmuneToDevourer = 0
	var/MaceSkill = 0
	var/PreviousOwner = null
	var/PotionSkill = 0
	var/EXPNeeded = 100
	var/LockPickingSkill = 0
	var/Unholy = 0
	var/EggContent = 0

	var/ColdBreath = 15
	var/FirePoints = 0
	var/IcePoints = 0
	var/SandPoints = 0
	var/PoisonPoints = 0
	var/MagmaPoints = 0
	var/ZombiePoints = 0
	var/WaterPoints = 0

	var/UsesPicks = 0
	var/Hunger = 100
	var/MaxHunger = 100
	var/UnArmedSkill = 0
	var/Tiredness = 100
	var/CookingSkill = 0
	var/MineingSkill = 0
	var/WoodCuttingSkill = 0
	var/Gender = "None"

	var/list/tmp/Selected=new()
	var/list/tmp/IgnoreList=new()
	var/list/Rares = new()
	var/list/UnitList = new()
	var/list/AllyList = new()

/mob/Test
	density = 0
	IsMist = 1