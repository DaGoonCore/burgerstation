/obj/item/clothing/overwear/coat/wizard
	name = "wizard's robes"
	icon = 'icons/obj/item/clothing/suit/wizard.dmi'

	desc = "EI NATH!!"
	desc_extended = "Not necessairly required to use magic, but wearing this, or any other clothing with high Magic protection will make your spells stronger."

	armor = /armor/dark/arcane

	size = SIZE_3

	value = 120

	dyeable = TRUE

	mob_values_add = list(
		SKILL_MAGIC_DEFENSIVE = 3,
		SKILL_MAGIC_OFFENSIVE = 3,
		SKILL_MAGIC_SUMMONING = 3,
		SKILL_MAGIC_ENCHANTING = 3
	)

/obj/item/clothing/overwear/coat/wizard/red
	color = "#FF0000"

/obj/item/clothing/overwear/coat/wizard/blue
	color = "#0065FF"

/obj/item/clothing/overwear/coat/wizard/real
	name = "authentic wizard robes"
	desc = "The real deal."
	desc_extended = "A real, totally authentic wizard robes with all the protection a wizard needs."

	armor = /armor/cloth/arcane/bonus

	rarity = RARITY_RARE

/obj/item/clothing/overwear/coat/wizard/real/purple
	color = "#B05FE2"

/obj/item/clothing/overwear/coat/wizard/real/blue
	color = "#0751C0"

/obj/item/clothing/overwear/coat/wizard/real/red
	color = "#F62A12"