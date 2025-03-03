/obj/item/weapon/ranged/bullet/magazine/pistol/gyrojet
	name = "\improper 20mm GyroPistol"
	desc = "Overdesigned and a little overpowered."
	desc_extended = "A prototype syndicate pistol that uses minature rockets as projectiles."
	icon = 'icons/obj/item/weapons/ranged/pistol/gyrojet.dmi'
	icon_state = "inventory"
	value = 800

	company_type = "Syndicate"

	shoot_delay = 8

	movement_spread_base = 0.01
	inaccuracy_modifier = 1
	movement_inaccuracy_modifier = 0.75

	automatic = FALSE

	shoot_sounds = list('sound/weapons/gyrojet/shoot.ogg')

	size = SIZE_3
	weight = 12

	heat_max = 0

	bullet_length_min = 48
	bullet_length_best = 50
	bullet_length_max = 52

	bullet_diameter_min = 19
	bullet_diameter_best = 20
	bullet_diameter_max = 21

	attachment_whitelist = list(
		/obj/item/attachment/barrel/charger = FALSE,
		/obj/item/attachment/barrel/compensator = FALSE,
		/obj/item/attachment/barrel/extended = TRUE,
		/obj/item/attachment/barrel/gyro = TRUE,
		/obj/item/attachment/barrel/laser_charger = FALSE,
		/obj/item/attachment/barrel/suppressor = FALSE,
		/obj/item/attachment/barrel_mod/reinforced_barrel = TRUE,
		/obj/item/attachment/stock_mod/reinforced_stock = TRUE,

		/obj/item/attachment/sight/laser_sight = TRUE,
		/obj/item/attachment/sight/quickfire_adapter = TRUE,
		/obj/item/attachment/sight/red_dot = TRUE,
		/obj/item/attachment/sight/scope = TRUE,
		/obj/item/attachment/sight/scope/large = FALSE,
		/obj/item/attachment/sight/targeting_computer = TRUE,



		/obj/item/attachment/undermount/angled_grip = TRUE,
		/obj/item/attachment/undermount/bipod = FALSE,
		/obj/item/attachment/undermount/burst_adapter = FALSE,
		/obj/item/attachment/undermount/vertical_grip = TRUE
	)

	attachment_barrel_offset_x = 29 - 16
	attachment_barrel_offset_y = 22 - 16

	attachment_sight_offset_x = 20 - 16
	attachment_sight_offset_y = 21 - 16

	attachment_undermount_offset_x = 24 - 16
	attachment_undermount_offset_y = 12 - 16

	tier = 3
	bypass_balance_check = TRUE



/obj/item/weapon/ranged/bullet/magazine/pistol/gyrojet/get_static_spread()
	return 0

/obj/item/weapon/ranged/bullet/magazine/pistol/gyrojet/get_skill_spread(var/mob/living/L)
	return max(0,0.10 - (0.15 * L.get_skill_power(SKILL_RANGED)) )