#define CARGO_VALUE_MULTIPLIER 4

SUBSYSTEM_DEF(cargo)
	name = "Cargo Subsystem"
	desc = "Store all possible items to load from cargo."
	priority = SS_ORDER_LAST
	var/list/cargo_id_to_type = list()
	var/list/catalog_data = list() //What the catalog should look like (paper stuff)
	var/list/possible_orders = list(
		///obj/item/bulletbox,                  //Dunno why this is here Actually a useless item -v
		/obj/item/bulletbox/rifle_556,
		/obj/item/bulletbox/rifle_762,
		/obj/item/bulletbox/rifle_127,          //Crime against humanity right here -v
		/obj/item/bulletbox/rifle_127/ap,
		/obj/item/deployable/mob/sentry,
		/obj/item/weapon/ranged/bullet/magazine/rifle/tungsten,
		/obj/item/magazine/rifle_tungsten,
		/obj/item/deployable/barricade,
		///obj/item/supply_remote/mech/ripley,  //Super fucking bugged right now, overlays are fucked, zombies and other melee mobs cant target them, etc -v
		/obj/item/supply_remote/barbecue,
		/obj/item/supply_remote/drill,
		/obj/item/grenade/timed/smoke,
		/obj/item/fulton_pack,
		/obj/item/deployable/bodybag,
		/obj/item/storage/ammo/rubber
	)                                           // I'll add more down the line, as im sure a lot of other people will. I dont want to add anything unbalanced -v

/subsystem/cargo/Initialize()

	var/turf/T = locate(1,1,1)

	for(var/k in possible_orders)
		var/atom/movable/P = k
		if(!ispath(P))
			log_error("Invalid cargo entry: [k].")
			continue
		P = new P(T)
		INITIALIZE(P)
		GENERATE(P)
		FINALIZE(P)
		P.invisibility = 101
		P.loc = null
		if(P.qdeleting)
			log_error("Invalid cargo entry: [P.get_debug_name()].")
			continue
		var/md5_hash = copytext(md5("[P.type]"),1,6)
		cargo_id_to_type[md5_hash] = P
		CHECK_TICK_HARD(DESIRED_TICK_LIMIT)

	sortTim(cargo_id_to_type,/proc/cmp_path_dsc,associative=TRUE)

	var/item_count = 1

	var/list/cached_text = ""
	for(var/md5 in cargo_id_to_type)
		var/obj/item/I = cargo_id_to_type[md5]
		var/actual_name = I.name
		actual_name = replacetextEx(actual_name,"\improper","")
		var/desired_text = "# [actual_name]\n\n## [I.desc_extended]\n\n### Order Code: [md5]\n\n### Value: [CEILING(I.get_value(),1)]\n\n"
		cached_text += desired_text
		item_count++
		if(item_count >= 5)
			catalog_data += cached_text
			cached_text = ""
			item_count = 1
		CHECK_TICK_HARD(DESIRED_TICK_LIMIT)

	if(item_count < 5) //In case you have less than 5 items for some reason.
		catalog_data += cached_text

	log_subsystem(name,"Loaded [length(cargo_id_to_type)] cargo entries.")

	return ..()
