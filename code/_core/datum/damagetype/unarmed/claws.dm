/damagetype/unarmed/claw/
	attack_verbs = list("claw")

	hit_effect = /obj/effect/temp/impact/combat/claw

	impact_sounds = list(
		'sound/weapons/fists/claw_flesh_01.ogg',
		'sound/weapons/fists/claw_flesh_02.ogg',
		'sound/weapons/fists/claw_flesh_03.ogg'
	)

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLADE = 30*0.3,
		PIERCE = 30*0.1
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLADE = 20*0.5,
		PIERCE = 20*0.5
	)

	attribute_stats = list(
		ATTRIBUTE_STRENGTH = 30*0.25,
		ATTRIBUTE_DEXTERITY = 30*0.25
	)

	attribute_damage = list(
		ATTRIBUTE_STRENGTH = list(BLADE,PIERCE),
		ATTRIBUTE_DEXTERITY = list(BLADE,PIERCE)
	)

	skill_stats = list(
		SKILL_UNARMED = 30*0.1
	)

	skill_damage = list(
		SKILL_UNARMED = list(BLADE,PIERCE),
	)

	throw_mul = 1

	attack_delay = 10*0.5
	attack_delay_max = 10
damagetype/unarmed/claw/boss

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLADE = 30*0.5,
		PIERCE = 30*0.2
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLADE = 20*0.75,
		PIERCE = 20*0.75
	)