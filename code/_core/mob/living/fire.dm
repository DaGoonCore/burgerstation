#define MAX_FIRE_STACKS 300
#define MIN_FIRE_STACKS -300

/mob/living/proc/adjust_fire_stacks(var/added_fire_stacks = 10)
	if(!added_fire_stacks)
		return FALSE
	fire_stacks = clamp(fire_stacks + added_fire_stacks,MIN_FIRE_STACKS,MAX_FIRE_STACKS)
	if(fire_stacks <= 0)
		extinguish()
	else if(on_fire)
		if(!fire_overlay)
			CRASH("Warning: [src.get_debug_name()] did not have a fire overlay!")
		else
			fire_overlay.icon_state = "[clamp(FLOOR(1 + (fire_stacks/MAX_FIRE_STACKS)*3,1),1,3)]"
	return TRUE

/mob/living/proc/ignite(var/added_fire_stacks = 0,var/atom/source)

	if(on_fire)
		if(added_fire_stacks) adjust_fire_stacks(added_fire_stacks)
		return FALSE

	on_fire = TRUE
	play_sound('sound/weapons/magic/fireball.ogg',get_turf(src),range_max=VIEW_RANGE,volume = 25)

	if(ai)
		ai.on_damage_received(null,source,null,null,null,added_fire_stacks*5,null,FALSE)

	if(added_fire_stacks) adjust_fire_stacks(added_fire_stacks)

	if(fire_stacks <= 0)
		return FALSE

	return TRUE

/mob/living/proc/extinguish()

	if(!on_fire)
		return FALSE

	on_fire = FALSE

	if(!fire_overlay)
		CRASH("Warning: [src.get_debug_name()] did not have a fire overlay!")
	else
		fire_overlay.icon_state = "0"

	return TRUE