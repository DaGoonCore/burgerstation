//Inventory sizes.
#define SIZE_0 0.5 //Pen
#define SIZE_1 1 //Rubber Ducky
#define SIZE_2 3 //Pistol
#define SIZE_3 6 //SMG
#define SIZE_4 10 //Rifle
#define SIZE_5 15 //Sniper

#define SIZE_6 30 //Minigun or big-ass sniper
#define SIZE_7 60 //Human
#define SIZE_8 120 //Giant
#define SIZE_9 240 //Bubblegum
#define SIZE_10 480 //Nar-sie
#define SIZE_X 1000 //Meme

//Inventory weights
#define WEIGHT_0 0.5
#define WEIGHT_1 1
#define WEIGHT_2 3
#define WEIGHT_3 5
#define WEIGHT_4 10
#define WEIGHT_5 20
#define WEIGHT_6 50
#define WEIGHT_7 75
#define WEIGHT_8 100
#define WEIGHT_X 1000

//Clothing flags
#define FLAG_CLOTHING_NONE 0x0
#define FLAG_CLOTHING_NOBEAST_FEET 0x1
#define FLAG_CLOTHING_NOBEAST_HEAD 0x2
#define FLAG_CLOTHING_NOBEAST_WINGS 0x4

var/global/list/rarity_to_number = list(
	RARITY_BROKEN = 1,
	RARITY_COMMON = 2,
	RARITY_UNCOMMON = 3,
	RARITY_RARE = 4,
	RARITY_MYTHICAL = 5,
	RARITY_LEGENDARY = 6
)

#define RARITY_BROKEN "broken"
#define RARITY_COMMON "common"
#define RARITY_UNCOMMON "uncommon"
#define RARITY_RARE "rare"
#define RARITY_MYTHICAL "mythical"
#define RARITY_LEGENDARY "legendary"

#define SLOT_NONE         (1<<0)
#define SLOT_TORSO        (1<<1)
#define SLOT_TORSO_ARMOR  (1<<3)
#define SLOT_TORSO_BACK   (1<<4)
#define SLOT_GROIN        (1<<5)
#define SLOT_GROIN_BELT   (1<<6)
#define SLOT_HEAD         (1<<7)
#define SLOT_FACE         (1<<8)
#define SLOT_EAR          (1<<9)
#define SLOT_NECK         (1<<11)
#define SLOT_FOOT         (1<<12)
#define SLOT_HAND         (1<<13)
#define SLOT_SPECIAL      (1<<14)
#define SLOT_RING         (1<<15)

#define SLOT_MOD_NONE     (1<<0)
#define SLOT_MOD_CENTER   (1<<1)
#define SLOT_MOD_LEFT     (1<<2)
#define SLOT_MOD_RIGHT    (1<<3)

#define SLOT_LAYER_NONE 0
#define SLOT_LAYER_UNDER 1
#define SLOT_LAYER_NORMAL 2
#define SLOT_LAYER_OVER 3

//Tools
#define FLAG_TOOL_NONE 0x0
#define FLAG_TOOL_SCREWDRIVER 0x1
#define FLAG_TOOL_WRENCH 0x2
#define FLAG_TOOL_CROWBAR 0x4
#define FLAG_TOOL_WELDER 0x8
#define FLAG_TOOL_WIRECUTTER 0x10
#define FLAG_TOOL_MULTITOOL 0x20

#define FLAG_TOOL_PICKAXE 0x40
#define FLAG_TOOL_SHOVEL 0x80
