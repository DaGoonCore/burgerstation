/obj/item/weapon/ranged/bullet/magazine/rifle/standard
	name = "\improper 5.56 AR-SS13"
	desc = "For the basic soldier."
	desc_extended = "A cheap yet still reliable assault rifle primarily used and mass produced by NanoTrasen PMCs."
	icon = 'icons/obj/item/weapons/ranged/rifle/nanotrasen/556_1.dmi'
	icon_state = "inventory"
	value = 1100

	company_type = "NanoTrasen"

	tier = 1

	shoot_delay = 2

	automatic = TRUE

	firemodes = list("automatic","semi-automatic")

	shoot_sounds = list('sound/weapons/223/rifle.ogg')

	can_wield = TRUE

	size = SIZE_4
	weight = 13

	heat_max = 0.05

	bullet_length_min = 40
	bullet_length_best = 45
	bullet_length_max = 46

	bullet_diameter_min = 5.5
	bullet_diameter_best = 5.56
	bullet_diameter_max = 5.6

	ai_heat_sensitivity = 0.5

	attachment_whitelist = list(
		/obj/item/attachment/barrel/charger = TRUE, /obj/item/attachment/barrel/charger/advanced = TRUE,
		/obj/item/attachment/barrel/compensator = TRUE,
		/obj/item/attachment/barrel/extended = TRUE,
		/obj/item/attachment/barrel/gyro = TRUE,
		/obj/item/attachment/barrel/laser_charger = FALSE,
		/obj/item/attachment/barrel/suppressor = TRUE,
		/obj/item/attachment/barrel_mod/reinforced_barrel = TRUE,
		/obj/item/attachment/stock_mod/reinforced_stock = TRUE,

		/obj/item/attachment/sight/laser_sight = TRUE,
		/obj/item/attachment/sight/quickfire_adapter = TRUE,
		/obj/item/attachment/sight/red_dot = TRUE,
		/obj/item/attachment/sight/scope = TRUE,
		/obj/item/attachment/sight/scope/large = TRUE,
		/obj/item/attachment/sight/targeting_computer = TRUE,



		/obj/item/attachment/undermount/angled_grip = TRUE,
		/obj/item/attachment/undermount/bipod = TRUE,
		/obj/item/attachment/undermount/burst_adapter = TRUE,
		/obj/item/attachment/undermount/vertical_grip = TRUE,
		/obj/item/attachment/undermount/gun/grenade_launcher = TRUE
	)

	attachment_barrel_offset_x = 31 - 16
	attachment_barrel_offset_y = 19 - 16

	attachment_sight_offset_x = 15 - 16
	attachment_sight_offset_y = 21 - 16

	attachment_undermount_offset_x = 25 - 16
	attachment_undermount_offset_y = 17 - 16

	dan_mode = TRUE

	inaccuracy_modifier = 0.25
	movement_inaccuracy_modifier = 0.75
	movement_spread_base = 0.02


/obj/item/weapon/ranged/bullet/magazine/rifle/standard/get_static_spread()
	return 0.002

/obj/item/weapon/ranged/bullet/magazine/rifle/standard/get_skill_spread(var/mob/living/L)
	return max(0,0.01 - (0.04 * L.get_skill_power(SKILL_RANGED)))