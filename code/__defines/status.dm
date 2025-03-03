#define STUN "stun"
//Disarms weapons on stun.
//Move delay multiplied by 3.
//Cannot dodge, parry, block, and you have a 100% chance to be hit.
//Knocked to the ground.
//Cannot use items.

#define SLEEP "sleep"
//Health, Stamina, Mana regenerates 5 times faster.
//Cannot attack or use items.
//Cannot move.
//Cannot dodge, parry, block, and you have a 100% chance to be hit.
//Taking health damage removes this status effect. (TODO)
//Knocked to the ground.

#define PARALYZE "paralyze"
//Cannot attack or use items.
//Cannot move.
//Cannot dodge, parry, block, and you have a 100% chance to be hit.

#define STAMCRIT "stamcrit"
//Removes initial stamina regeneration delay.
//Stamina regenrates 5 times faster.
//Move delay multiplied by 4.
//Cannot dodge, parry, block, and you have a 100% chance to be hit.
//Knocked to the ground.


#define STAGGER "stagger"
//Cannot dodge, parry, block, and you have a 100% chance to be hit.
//Cannot move.
//Moves 1 step away from the stagger source, if any.
//Applies stun if you collide with something while staggered.

#define CONFUSED "confused"
//Random movement.

#define CRIT "critical"
//Cannot dodge, parry, block, and you have a 100% chance to be hit.
//Move very slow.

#define PAINCRIT "pain"
//Cannot dodge, parry, block, and you have a 100% chance to be hit.
//Move very slow.

#define ADRENALINE "adrenaline"
//Prevents death by reducing the death threshold relative the the current value.
//Move faster.

#define PAINKILLER "painkiller"
//Ignores pain.
//Health HUD kidden.

#define REST "rest"
//Move delay multiplied by 4.
//Cannot dodge, parry, block, and you have a 100% chance to be hit.
//Knocked to the ground.

#define DISARM "disarm"
//Disarms the target's weapons, if it is an advanced target


#define DRUGGY "druggy"
//Plays visuals

#define GRAB "grab"
//This actually does nothing but visual effects, and is used to check if objects can actually be grabbed.

#define FIRE "fire"
//Sets you on fire!


#define SLIP "slip"
//Honk

#define SOULTRAP "soultrap"
//Converting kills to souls

#define PARRIED "parried"

#define STRESSED "stressed"

#define SHOVED "shoved"

#define SLOW "slow"

#define MANAVOID "manavoid"

#define CONSECRATED "consecrated"

#define CURSED "cursed"

#define BLIGHTED "blighted"

#define ZOMBIE "zombie"

#define UNDYING "undying"

#define IMMORTAL "immortal"

#define CRITPROTECTION "critprotection"

//provides base 10 to BRUTE BURN and TOX armor.
#define TEMP_ARMOR "temp_armor"
//provides  0.05 regen of BRUTE BURN and TOX damage - magnifier damages instead.
#define TEMP_REGEN "temp_regeneration"