#define DEFAULT_NAME "Your name here."

var/global/list/movement_organs = list(BODY_FOOT_RIGHT,BODY_FOOT_LEFT,BODY_LEG_RIGHT,BODY_LEG_LEFT)

/mob/living/advanced

	name = DEFAULT_NAME
	var/real_name

	var/species = "human"

	var/dna/dna //This is for NPC generation only.

	var/loadout/loadout //This is for NPC generation only.

	var/list/obj/item/organ/organs
	var/list/obj/item/organ/labeled_organs

	var/sex = PLURAL
	gender = PLURAL

	var/draw_inventory = TRUE
	var/list/obj/hud/inventory/inventories_by_id //List of inventory items, by id. (Assoc list).
	var/list/obj/item/worn_objects //List of worn items. For use in an easy read-only list.
	var/list/obj/item/held_objects //List of held items. For use in an easy read-only list.

	var/obj/item/left_item
	var/obj/item/right_item
	var/obj/item/holster_item

	var/list/obj/hud/button/ability/ability_buttons = list()

	health_base = 100
	stamina_base = 100
	mana_base = 100

	var/automatic_ticks = 0

	var/obj/hud/inventory/active_inventory

	var/mob/living/vehicle/driving

	random_spawn_dir = FALSE

	has_footprints = TRUE

	var/move_delay_multiplier = 1 //Read only.

	var/list/overlays_assoc

	var/list/protection_heat = TARGETABLE_LIMBS_KV
	var/list/protection_cold = TARGETABLE_LIMBS_KV
	var/list/protection_pressure = TARGETABLE_LIMBS_KV

	health = null

	value = 500

	stun_angle = -90

	var/cqc = ""

	var/list/known_cqc = list()

	size = SIZE_HUMAN

	max_level = 100 //Base max level for skills and attributes of the mob.

	death_threshold = -50

	var/handcuffed = FALSE
	var/handcuff_break_counter = 0
	var/obj/item/handcuffs/stored_handcuffs

	enable_security_hud = TRUE
	enable_medical_hud = TRUE

	var/list/using_inventories = list() //A list of /obj/items with inventories this mob is using.

	var/list/inventory_defers = list() //A list of inventory defer buttons.

	var/mood // On a scale of 0 to 200, with 100 being normal. Stabilizes to 100.
	var/last_mood_gain = 0

	var/queue_update_items = FALSE
	var/list/queue_organ_health_update = list() //List of organs that need to be updated.

	var/current_mouse_spread = 0

	var/list/overall_clothing_defense_rating = list()

/mob/living/advanced/Destroy()

	for(var/k in using_inventories)
		var/obj/item/I = k
		I.close_inventory(src)

	using_inventories?.Cut()

	remove_all_organs()
	remove_all_buttons()

	inventory_defers?.Cut()
	inventories_by_id?.Cut()

	overlays_assoc?.Cut()
	ability_buttons?.Cut()

	held_objects = null
	worn_objects = null
	active_inventory = null
	driving = null

	QDEL_NULL(stored_handcuffs)

	. = ..()

/mob/living/advanced/on_crush(var/message=TRUE)
	if(driving)
		return FALSE
	. = ..()

/mob/living/advanced/set_dir(var/desired_dir,var/force=FALSE)

	if(!force && grabbing_hand)
		desired_dir = dir
	else if(driving)
		desired_dir = driving.dir
	else
		desired_dir = get_true_4dir_advanced(dir,desired_dir)

	. = ..()

	if(. || force) //Dan updating.
		if(inventories_by_id[BODY_HAND_LEFT_HELD] && left_item && left_item.dan_mode)
			inventories_by_id[BODY_HAND_LEFT_HELD].update_held_icon(left_item)
		if(inventories_by_id[BODY_HAND_RIGHT_HELD] && right_item && right_item.dan_mode)
			inventories_by_id[BODY_HAND_RIGHT_HELD].update_held_icon(right_item)
		if(inventories_by_id[BODY_TORSO_OB] && holster_item && holster_item.dan_mode)
			inventories_by_id[BODY_TORSO_OB].update_held_icon(holster_item)

/mob/living/advanced/New(loc,desired_client,desired_level_multiplier)

	real_name = name

	icon = 'icons/invisible.dmi'
	icon_state = "0"

	organs = list()
	inventories_by_id = list()
	held_objects = list()
	worn_objects = list()
	labeled_organs = list()
	overlays_assoc = list()

	. = ..()

/mob/living/advanced/proc/drop_all_items(var/atom/drop_location = get_turf(src), var/exclude_soulbound=FALSE,var/exclude_containers=TRUE)

	. = list()

	for(var/k in inventories_by_id)
		var/obj/hud/inventory/O = inventories_by_id[k]
		if(exclude_containers && is_item(O.loc))
			var/obj/item/I = O.loc
			if(I.is_container)
				continue
		. += O.drop_objects(drop_location,exclude_soulbound)

	return .

/mob/living/advanced/proc/delete_all_items()
	for(var/k in inventories_by_id)
		var/obj/hud/inventory/I = inventories_by_id[k]
		I.delete_objects()

/mob/living/advanced/proc/equip_objects_in_list(var/list/clothing_list)
	for(var/k in clothing_list)
		var/obj/item/clothing/C = k
		C.quick_equip(src,silent=TRUE)

mob/living/advanced/Login()
	. = ..()
	restore_buttons()
	restore_inventory()
	restore_stat_elements()
	restore_local_machines()
	QUEUE_HEALTH_UPDATE(src)

/mob/living/advanced/proc/restore_local_machines()
	for(var/k in local_machines)
		var/obj/structure/interactive/localmachine/L = k
		L.update_for_mob(src)

/mob/living/advanced/Initialize()
	. = ..()
	species_initialize()
	add_overlay_tracked("handcuffs", desired_icon = 'icons/mob/living/advanced/overlays/handcuffs.dmi', desired_icon_state = "none", desired_layer = 100)

/mob/living/advanced/Finalize()
	. = ..()
	if(loadout) equip_loadout(loadout)
	update_items(force=TRUE)

/mob/living/advanced/setup_name()

	if(name == DEFAULT_NAME) //Give a human name
		name = "[gender == MALE ? FIRST_NAME_MALE : FIRST_NAME_FEMALE] [LAST_NAME]"
		real_name = name
		return TRUE

	real_name = name

	. = ..()

/mob/living/advanced/proc/change_organ_visual(var/desired_id, var/desired_icon,var/desired_icon_state,var/desired_color,var/desired_blend, var/desired_type,var/desired_layer,var/debug_message)
	for(var/k in organs)
		var/obj/item/organ/O = k
		if(!length(O.additional_blends))
			continue
		if(O.additional_blends[desired_id])
			O.add_blend(desired_id, desired_icon, desired_icon_state, desired_color, desired_blend, desired_type, desired_layer, debug_message)

/mob/living/advanced/can_sprint()

	if(health?.stamina_current <= 0 || has_status_effect(STAMCRIT))
		return FALSE

	for(var/k in movement_organs)
		var/obj/item/organ/O = labeled_organs[k]
		if(!O || (O.health && (O.health.health_current <= 0 || O.broken)))
			return FALSE

	return ..()

/mob/living/advanced/proc/put_in_hands(var/obj/item/I,var/params,var/silent=FALSE)

	if(client && client.selected_hand)
		if(client.selected_hand == RIGHT_HAND && inventories_by_id[BODY_HAND_RIGHT_HELD] && inventories_by_id[BODY_HAND_RIGHT_HELD].can_slot_object(I,FALSE))
			return inventories_by_id[BODY_HAND_RIGHT_HELD].add_object(I,silent=silent)
		else if(inventories_by_id[BODY_HAND_LEFT_HELD] && inventories_by_id[BODY_HAND_LEFT_HELD].can_slot_object(I,FALSE))
			return inventories_by_id[BODY_HAND_LEFT_HELD].add_object(I,silent=silent)
	else if(length(params))
		if(params["left"] && inventories_by_id[BODY_HAND_RIGHT_HELD] && inventories_by_id[BODY_HAND_RIGHT_HELD].can_slot_object(I,FALSE))
			return inventories_by_id[BODY_HAND_RIGHT_HELD].add_object(I,silent=silent)
		else if(params["right"] && inventories_by_id[BODY_HAND_LEFT_HELD] && inventories_by_id[BODY_HAND_LEFT_HELD].can_slot_object(I,FALSE))
			return inventories_by_id[BODY_HAND_LEFT_HELD].add_object(I,silent=silent)
	else if(inventories_by_id[BODY_HAND_RIGHT_HELD] && inventories_by_id[BODY_HAND_LEFT_HELD])
		if(inventories_by_id[BODY_HAND_RIGHT_HELD])
			if(inventories_by_id[BODY_HAND_RIGHT_HELD].can_slot_object(I,FALSE))
				return inventories_by_id[BODY_HAND_RIGHT_HELD].add_object(I,silent=silent)
			else if(inventories_by_id[BODY_HAND_LEFT_HELD].can_slot_object(I,FALSE))
				return inventories_by_id[BODY_HAND_LEFT_HELD].add_object(I,silent=silent)
		else
			if(inventories_by_id[BODY_HAND_RIGHT_HELD].can_slot_object(I,FALSE))
				return inventories_by_id[BODY_HAND_RIGHT_HELD].add_object(I,silent=silent)
			else if(inventories_by_id[BODY_HAND_LEFT_HELD].can_slot_object(I,FALSE))
				return inventories_by_id[BODY_HAND_LEFT_HELD].add_object(I,silent=silent)
	else
		if(inventories_by_id[BODY_HAND_LEFT_HELD])
			return inventories_by_id[BODY_HAND_LEFT_HELD].add_object(I,silent=silent)
		else if(inventories_by_id[BODY_HAND_RIGHT_HELD])
			return inventories_by_id[BODY_HAND_RIGHT_HELD].add_object(I,silent=silent)

	return FALSE

/mob/living/advanced/proc/get_held_left()
	return inventories_by_id[BODY_HAND_LEFT_HELD]?.get_top_object()

/mob/living/advanced/proc/get_held_right()
	return inventories_by_id[BODY_HAND_RIGHT_HELD]?.get_top_object()

/mob/living/advanced/mod_speech(var/text)
	var/species/S = SPECIES(species)
	if(!S)
		return text
	text = S.mod_speech(src,text)
	return ..()

/mob/living/advanced/do_explosion_damage(var/atom/owner,var/atom/source,var/atom/epicenter,var/magnitude,var/desired_loyalty_tag)
	for(var/i=1,i<=5,i++)
		var/list/params = list()
		params[PARAM_ICON_X] = rand(0,32)
		params[PARAM_ICON_Y] = rand(0,32)
		var/atom/object_to_damage = src.get_object_to_damage(owner,source,/damagetype/explosion,params,TRUE,TRUE)
		var/damagetype/D = all_damage_types[/damagetype/explosion/]
		D.process_damage(source,src,source,object_to_damage,owner,magnitude*(1/5))
	return TRUE

/mob/living/advanced/act_emp(var/atom/owner,var/atom/source,var/atom/epicenter,var/magnitude,var/desired_loyalty_tag)

	. = ..()

	for(var/k in organs)
		var/obj/item/organ/O = k
		O.act_emp(owner,source,epicenter,magnitude,desired_loyalty_tag)

/mob/living/advanced/gib(var/gib_direction=0x0,var/hard=FALSE)
	if(qdeleting)
		return FALSE
	if(gibbed)
		return FALSE
	gibbed = TRUE
	var/obj/item/organ/O = labeled_organs[BODY_TORSO]
	if(O) return O.gib(gib_direction,hard)
	gibbed = FALSE //Hacky, but it works.
	return FALSE
