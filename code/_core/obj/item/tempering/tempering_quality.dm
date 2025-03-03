/obj/item/tempering/quality
	name = "quality improvement"
	desc = "You shouldn't be seeing this..."
	desc_extended = "Report this to burger."
	has_quick_function = TRUE

/obj/item/tempering/quality/quick(var/mob/caller,var/atom/object,location,params)

	if(!is_advanced(caller) || !is_inventory(src.loc))
		return FALSE

	var/mob/living/advanced/A = caller

	return A.put_in_hands(src,params)

/obj/item/tempering/quality/can_temper(var/mob/caller,var/obj/item/I)

	if(I.quality >= limit)
		caller.to_chat(span("warning","\The [I.name] cannot be improved any further!"))
		return FALSE

	return ..()

/obj/item/tempering/quality/on_temper(var/mob/caller,var/obj/item/I)
	
	if(I.quality + increase > limit)
		var/to_consume = limit - I.quality
		left -= to_consume
		I.quality = limit
	else if(I.quality + increase < minimum)
		I.quality = minimum
		left -= increase
	else
		I.quality += increase
		left -= increase
	return ..()

/obj/item/tempering/quality/examine()
	if(!unlimited)
		desc_extended += "\nCan add <b>[left]</b> more quality."
	. = ..()

/obj/item/tempering/quality/melee
	name = "warrior's whetstone"
	desc = "Stay sharp!"
	desc_extended = "A special whetstone that improves the quality of a melee weapon by 5%, up to 125%. If the improvement results in a quality value less than 100%, it will set the quality to 100%.  Even works on non-sharp objects, somehow."
	icon_state = "quality_melee"

	temper_whitelist = /obj/item/weapon/melee

	value = 500

/obj/item/tempering/quality/clothing
	name = "durathread"
	desc = "Stay classy!"
	desc_extended = "A large patch of durathread that improves the quality of clothing by 5%, up to 125%. If the improvement results in a quality value less than 100%, it will set the quality to 100%."
	icon_state = "quality_clothing"

	temper_whitelist = /obj/item/clothing

	value = 500

/obj/item/tempering/quality/clothing/repair
	name = "sewing kit"
	desc = "Stay classy!"
	desc_extended = "A simple thread and needle, capable of repairing clothes back up to 100%"
	icon_state = "quality_clothing_repair"

	temper_whitelist = /obj/item/clothing

	increase = 100
	limit = 100
	minimum = 0

	left = 1

/obj/item/tempering/quality/ranged
	name = "brass tinker's box"
	desc = "Stay on top of things."
	desc_extended = "A special kit of special screws, platings, and mechanical parts that improves the quality of guns by 5%, up to 125%. If the improvement results in a quality value less than 100%, it will set the quality to 100%."
	icon_state = "quality_ranged"

	temper_whitelist = /obj/item/weapon/ranged/bullet

	value = 500

/obj/item/tempering/quality/ranged_bow
	name = "bow limb reinforcements"
	desc = "Stay on top of things."
	desc_extended = "A special kit of special screws, platings, and mechanical parts that improves the quality of bows by 5%, up to 125%. If the improvement results in a quality value less than 100%, it will set the quality to 100%."
	icon_state = "quality_ranged_bow"

	temper_whitelist = /obj/item/weapon/ranged/bow

	value = 500


/obj/item/tempering/quality/lesser_consumable
	name = "gun repair kit"
	desc = "Help my gun needs cleaning."
	desc_extended = "A kit of some spare parts, bits and bobs, and mechanicl parts that improve the quality of any weapon back up to 100%"
	icon_state = "gun_cleaning"

	temper_whitelist = /obj/item/weapon/

	increase = 100
	limit = 100
	minimum = 0

	left = 1
	
	value = 100

	value_burgerbux = 0

/obj/item/tempering/quality/ranged/lesser
	name = "gun cleaning kit"
	desc = "Help my gun needs cleaning."
	desc_extended = "A special kit of cleaning rods, lube, sharpening tools, and grease (not the country) to help maintain ranged weapons. This increases the quality of guns by 1%, up to 75%. Has unlimited uses."
	icon_state = "gun_cleaning"

	temper_whitelist = /obj/item/weapon/ranged

	increase = 5
	limit = 75
	minimum = 0

	unlimited = TRUE

	value = 100

	value_burgerbux = 0

/obj/item/tempering/quality/magic
	name = "magician's gem"
	desc = "Stay on top of things."
	desc_extended = "A fragile, yet magical gem that improves the quality of spellgems by 5%, up to 125%. If the improvement results in a quality value less than 100%, it will set the quality to 100%."
	icon_state = "quality_magic"

	temper_whitelist = /obj/item/weapon/ranged/spellgem

	value = 500

/obj/item/tempering/quality/energy
	name = "focusing crystal"
	desc = "Stay on top of things."
	desc_extended = "A rare focusing crystal that can improve the quality of energy weapons by 5%, up to 125%. If the improvement results in a quality value less than 100%, it will set the quality to 100%."
	icon_state = "quality_energy"

	temper_whitelist = /obj/item/weapon/ranged/energy

	value = 500

/obj/item/tempering/quality/greater
	name = "repair kit"
	desc = "Help my equipment needs repairs."
	desc_extended = "A special kit of pieces of cloth, spare parts, pieces of plastics, and glue to help repair armor, weapons and virtually anything else. This increases the quality of equipment to 100%."
	icon_state = "repair_kit"

	temper_whitelist = /obj/item/

	increase = 100
	limit = 100
	minimum = 0

	size = SIZE_7
	weight = WEIGHT_5

	value = 2000

	value_burgerbux = 0

/obj/item/tempering/quality/greater/click_on_object(var/mob/caller,var/atom/object,location,control,params)

	if(is_item(object) && can_temper(caller,object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		on_temper(caller,object)
		return TRUE
	return ..()