/turf/simulated/wall/metal
	name = "steel wall"
	desc = "Try getting through that"
	desc_extended = "It's a wall made of solid steel, pretty tough."
	icon = 'icons/turf/wall/metal/nanotrasen.dmi'
	icon_state = "wall"
	corner_icons = TRUE
	corner_category = "wall"

	destruction_turf = /turf/simulated/floor/plating

	color = COLOR_STEEL
	material_id = /material/steel
	health_base = 1000

	window_blend = TRUE
	reinforced_blend = BLEND_MULTIPLY

/turf/simulated/wall/metal/on_destruction(var/mob/caller,var/damage = FALSE)

	var/obj/structure/interactive/construction/girder/G = new(src)
	G.material_id = material_id
	G.color = color
	INITIALIZE(G)
	FINALIZE(G)

	create_destruction(src,list(/obj/item/material/sheet/ = 1),material_id)

	return ..()

/*
/turf/simulated/wall/metal/rusted
	name = "metal wall"
	icon = 'icons/turf/wall/metal_rusty.dmi'
	icon_state = "wall"
	corner_icons = TRUE
*/

/turf/simulated/wall/metal/crew
	color = "#3D4A4A"

/turf/simulated/wall/metal/reinforced
	name = "plasteel reinforced steel wall"
	desc = "Try getting through that"
	desc_extended = "It's a wall made of steel reinforced with plasteel, really tough."
	icon_state = "wall_ref"
	reinforced_material_id = /material/plasteel
	reinforced_color = COLOR_PLASTEEL
	health_base = 3000

/turf/simulated/wall/metal/reinforced/constructed
	name = "plasteel reinforced steel wall"
	desc = "Try getting through that"
	desc_extended = "It's a wall made of steel reinforced with plasteel, really tough."
	icon_state = "wall_ref"
	health_base = 3000

/turf/simulated/wall/metal/reinforced/constructed/proc/recalc(var/material/M)
	var/material_name = initial(M.name)
	name = "[material_name] reinforced wall"
	desc_extended = "Its a [material_name] wall, but reinforced with extra [material_name]."
	material_id = M
	reinforced_material_id = M
	color = initial(M.color)
	reinforced_color = initial(M.color)
	health_base += initial(M.bonus_wall_health)
	update_sprite()

/turf/simulated/wall/metal/reinforced/hull
	name = "adamantium-carbon reinforced plasteel wall"
	desc = "Try getting through that"
	desc_extended = "It's a wall made of plasteel reinforced with an adamantium-carbon alloy, extremely tough."
	reinforced_material_id = /material/adamantium_carbon
	color = "#48482B"
	reinforced_color = COLOR_ADAMANITUM_CARBON
	health = null

/turf/simulated/wall/metal/reinforced/syndicate
	icon = 'icons/turf/wall/metal/syndicate.dmi'
	desc = "Dont even bother."
	color = COLOR_IRON
	material_id = /material/adamantium_carbon
	reinforced_material_id = /material/adamantium_carbon
	reinforced_color = "#FF0000"
	health = null
	health_base = INFINITY //TRY BREAKING IT NOW I DARE YOU.

/turf/simulated/wall/metal/reinforced/syndicate/on_damage_received(atom/atom_damaged, atom/attacker, atom/weapon, damagetype/DT, list/damage_table, damage_amount, critical_hit_multiplier, stealthy)
	health.health_current = INFINITY //BREAK IT NOW I FUCKING DARE YOU.
	. = ..()


/turf/simulated/wall/metal/reinforced/syndicate/shuttle
	plane = PLANE_SHUTTLE

/*
/turf/simulated/wall/metal/reinforced/rusted
	name = "reinforced metal wall"
	icon = 'icons/turf/wall/metal_reinforced_rusty.dmi'
	icon_state = "wall"
	corner_icons = TRUE
*/

/*
/turf/simulated/wall/metal/colored
	name = "metal wall"
	icon = 'icons/turf/wall/composite_solid.dmi'

/turf/simulated/wall/metal/colored/grey
	color = "#727272"


/turf/simulated/wall/metal/colored/cargo
	color = COLOR_CARGO
*/


/turf/simulated/wall/metal/syndicate
	name = "dark steel wall"
	icon = 'icons/turf/wall/metal/syndicate.dmi'
	icon_state = "wall"
	corner_icons = TRUE

	destruction_turf = /turf/simulated/floor/plating

	color = COLOR_STEEL_DARK
	material_id = /material/steel
	health_base = 1000

/turf/simulated/wall/metal/syndicate/reinforced
	name = "plasteel reinforced dark steel wall"
	icon_state = "wall_ref"
	reinforced_material_id = /material/plasteel
	reinforced_color = "#FFFFFF"
	health_base = 3000


/turf/simulated/wall/metal/rev
	name = "tinted steel wall"
	icon = 'icons/turf/wall/metal/rev.dmi'
	icon_state = "wall"
	corner_icons = TRUE

	destruction_turf = /turf/simulated/floor/plating

	color = "#626A3B"
	material_id = /material/steel
	health_base = 1000

/turf/simulated/wall/metal/rev/reinforced
	name = "plasteel reinforced tinted steel wall"
	icon_state = "wall_ref"
	reinforced_material_id = /material/plasteel
	reinforced_color = "#FFFFFF"
	health_base = 3000


/turf/simulated/wall/metal/shuttle
	name = "shuttle-grade steel wall"
	desc = "Brace for landing"
	desc_extended = "The wall of a shuttle."
	icon = 'icons/turf/wall/metal/shuttle.dmi'
	icon_state = "wall"

	plane = PLANE_SHUTTLE

	color = "#FFFFFF"
	map_color = "#AAAAAA"


/turf/simulated/wall/metal/shuttle/off_white
	color = "#A2A6AA"

/turf/simulated/wall/metal/circuit
	name = "techno steel wall"
	icon = 'icons/turf/wall/metal/circuit.dmi'
	icon_state = "wall"
	corner_icons = TRUE

	destruction_turf = /turf/simulated/floor/plating

	color = COLOR_STEEL
	material_id = /material/steel
	health_base = 1000
