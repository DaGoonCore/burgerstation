/obj/item/organ/arm
	name = "right arm"
	id = BODY_ARM_RIGHT
	desc = "A right arm."
	icon_state = BODY_ARM_RIGHT
	worn_layer = LAYER_MOB_ARMS
	attach_flag = BODY_TORSO

	enable_wounds = TRUE

	hud_id = "body_arm_right"

	can_be_targeted = TRUE

	target_bounds_x_min = 8
	target_bounds_x_max = 11

	target_bounds_y_min = 15
	target_bounds_y_max = 22

	base_miss_chance = 10

	health_base = 50

	damage_coefficient = 0.75

	has_pain = TRUE

	gib_icon_state = "gibarm"

	has_life = TRUE

/obj/item/organ/arm/left
	name = "left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT
	desc = "A left arm."

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//Reptile Feral
/obj/item/organ/arm/reptile
	name = "reptile right arm"
	icon = 'icons/mob/living/advanced/species/reptile.dmi'

	armor = /armor/reptile

/obj/item/organ/arm/reptile/left
	name = "reptile left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22

//Reptile Advanced
/obj/item/organ/arm/reptile_advanced
	name = "reptile advanced right arm"
	icon = 'icons/mob/living/advanced/species/reptile_advanced.dmi'

	armor = /armor/reptile

/obj/item/organ/arm/reptile_advanced/left
	name = "reptile advanced left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22

//Diona
/obj/item/organ/arm/diona
	name = "diona right arm"
	icon = 'icons/mob/living/advanced/species/diona.dmi'
	enable_glow = TRUE
	enable_detail = TRUE

	armor = /armor/diona

/obj/item/organ/arm/diona/left
	name = "diona left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22

//Cyborg
/obj/item/organ/arm/cyborg
	name = "cyborg right arm"
	icon = 'icons/mob/living/advanced/species/cyborg.dmi'

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic

/obj/item/organ/arm/cyborg/left
	name = "cyborg left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22



//Beefman
/obj/item/organ/arm/beefman
	name = "beef right arm"
	icon = 'icons/mob/living/advanced/species/beefman.dmi'

	armor = /armor/beefman

/obj/item/organ/arm/beefman/left
	name = "beef left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22



//Beefman
/obj/item/organ/arm/skeleton
	name = "skeleton right arm"
	icon = 'icons/mob/living/advanced/species/skeleton.dmi'

	armor = /armor/skeleton

	projectile_dodge_chance = 20

	can_gib = FALSE

/obj/item/organ/arm/skeleton/left
	name = "skeleton left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//STANDU
/obj/item/organ/arm/stand
	name = "stand right arm"
	icon = 'icons/mob/living/advanced/species/stand.dmi'

/obj/item/organ/arm/stand/left
	name = "stand left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//Monkey
/obj/item/organ/arm/monkey
	name = "monkey right arm"
	icon = 'icons/mob/living/advanced/species/monkey.dmi'

/obj/item/organ/arm/monkey/left
	name = "monkey left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//Goblin
/obj/item/organ/arm/goblin
	name = "goblin right arm"
	icon = 'icons/mob/living/advanced/species/goblin.dmi'

	armor = /armor/goblin

/obj/item/organ/arm/goblin/left
	name = "goblin left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22

//Moth
/obj/item/organ/arm/moth
	name = "moth right arm"
	icon = 'icons/mob/living/advanced/species/moth.dmi'

/obj/item/organ/arm/moth/left
	name = "moth left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//Golem
/obj/item/organ/arm/golem
	name = "golem right arm"
	icon = 'icons/mob/living/advanced/species/golem.dmi'

/obj/item/organ/arm/golem/left
	name = "golem left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//Abductor
/obj/item/organ/arm/abductor
	name = "abductor right arm"
	icon = 'icons/mob/living/advanced/species/abductor.dmi'

/obj/item/organ/arm/abductor/left
	name = "abductor left arm"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22