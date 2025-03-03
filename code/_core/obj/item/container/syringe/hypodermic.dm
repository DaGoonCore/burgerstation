/obj/item/container/syringe/hypodermic/
	name = "hypodermic syringe"
	value = 5
	injection_time = SECONDS_TO_DECISECONDS(1)

	inject_amount_desired = 5
	inject_amount_precision = 5

	icon = 'icons/obj/item/container/syringe.dmi'
	icon_state = "syringe"
	var/icon_count = 7

	rarity = RARITY_UNCOMMON

	injecting = null //Auto generate.

/obj/item/container/syringe/hypodermic/update_icon()
	. = ..()
	//Plunger
	var/num_state = CEILING(clamp(reagents.volume_current/reagents.volume_max,0,1)*icon_count,1)
	icon = initial(icon)
	icon_state = initial(icon_state)
	icon_state = "[icon_state]_[num_state]"

/obj/item/container/syringe/hypodermic/update_underlays()
	. = ..()
	//Liquid
	if(reagents && reagents.volume_current)
		var/image/I = new/image(icon,"liquid")
		I.appearance_flags = src.appearance_flags | RESET_COLOR
		I.color = reagents.color
		add_underlay(I)

/obj/item/container/syringe/hypodermic/update_overlays()
	. = ..()
	//Action
	if(src.loc && is_inventory(src.loc))
		var/image/I = new/image(icon,"action_[injecting]")
		I.appearance_flags = src.appearance_flags | RESET_COLOR
		add_overlay(I)
	//Needle
	var/image/I = new/image(icon,"needle[quality <= 0 ? "_broken" : ""]")
	I.appearance_flags = src.appearance_flags | RESET_COLOR
	add_overlay(I)


/obj/item/container/syringe/hypodermic/adjust_quality(var/quality_to_add=0)
	. = ..()
	if(. && finalized) update_sprite()


/obj/item/container/syringe/hypodermic/on_pickup(var/atom/old_location,var/obj/hud/inventory/new_location) //When the item is picked up.
	. = ..()
	update_sprite()

/obj/item/container/syringe/hypodermic/drop_item(var/atom/desired_loc,var/pixel_x_offset = 0,var/pixel_y_offset = 0,var/silent=FALSE)
	. = ..()
	update_sprite()



/obj/item/container/syringe/hypodermic/epinephrine/
	name = "hypodermic syringe (epinephrine)"

/obj/item/container/syringe/hypodermic/epinephrine/Generate()
	reagents.add_reagent(/reagent/medicine/adrenaline/epinephrine,reagents.volume_max)
	return ..()

/obj/item/container/syringe/hypodermic/opium/
	name = "hypodermic syringe (opium)"

/obj/item/container/syringe/hypodermic/opium/Generate()
	reagents.add_reagent(/reagent/medicine/painkiller/opium,reagents.volume_max)
	return ..()

/obj/item/container/syringe/hypodermic/omnizine
	name = "hypodermic syringe (omnizine)"

/obj/item/container/syringe/hypodermic/omnizine/Generate()
	reagents.add_reagent(/reagent/medicine/omnizine,reagents.volume_max)
	return ..()