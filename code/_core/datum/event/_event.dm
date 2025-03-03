/event/
	var/name = "event name"

	var/active = FALSE

	var/probability = 0 //Relative probability of this event occuring.
	var/duration = 0 //How long does this event process for, in deciseconds. Set to -1 to make it end when it wants to end.

	var/start_time = 0
	var/end_time = 0

	var/lifetime = 0 //How long as this event been triggering for? In deciseconds.

	var/occurances_current = 0
	var/occurances_max = 3

	var/list/gamemode_blacklist = list()

	var/minor_event = FALSE

/event/proc/force_end()
	end_time = 0
	return TRUE

/event/proc/on_start()
	lifetime = 0
	return TRUE

/event/proc/on_life()
	lifetime += TICKS_TO_DECISECONDS(SSevents.tick_rate)
	return TRUE

/event/proc/on_end()
	return TRUE

/event/proc/on_fail()
	return TRUE



/proc/find_safe_turf_for_event(var/desired_z=1,var/attempts=10)

	var/offset = 0

	while(attempts > 0)
		attempts--

		var/turf/T = locate(rand(1+offset,world.maxx-offset),rand(1+offset,world.maxy-offset),desired_z)

		if(!T.density && T.is_safe() && T.is_safe_move())
			var/area/A = T.loc
			if(!(A.flags_area & FLAG_AREA_NO_EVENTS))
				return T

		for(var/turf/T2 in range(VIEW_RANGE,T))
			if(T.density || !T2.is_safe() || !T2.is_safe_move())
				continue
			var/area/A = T2.loc
			if(A.flags_area & FLAG_AREA_NO_EVENTS)
				continue
			return T2

		offset += min(world.maxx,world.maxy)/(attempts*4)
		offset = FLOOR(offset,1)





