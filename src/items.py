
armors = [{
    "id": "wither_skeleton",
    "nid": 1,
    "cmd": 2557801,
    "color": 9534584,
    "stats": {
        "head": { "armor": 3, "armor_toughness": 3 },
        "chest": { "armor": 8, "armor_toughness": 3 },
        "legs": { "armor": 6, "armor_toughness": 3 },
        "feet": { "armor": 3, "armor_toughness": 3 },
    },
    "durability": {
        "head": 363,
        "chest": 528,
        "legs": 495,
        "feet": 429,
    },
    "recipes": {
        "head": [
            ["coal_block", "netherite_scrap",       "coal_block"],
            ["gold_block", "wither_skeleton_skull", "gold_block"],
            [ None,        "netherite_scrap",        None       ],
        ],
        "chest": [
            ["netherite_scrap",  None,             "netherite_scrap"],
            ["gold_block",      "coal_block",      "gold_block"     ],
            [ None,             "netherite_scrap",  None            ],
        ],
        "legs": [
            ["coal_block",      "netherite_scrap", "coal_block"     ],
            ["netherite_scrap",  None,             "netherite_scrap"],
            ["gold_block",       None,             "gold_block"     ],
        ],
        "feet": [
            ["gold_block",      None, "gold_block"     ],
            ["netherite_scrap", None, "netherite_scrap"],
        ],
    },
    "name": {
        "head": "Withered Bone Helmet",
        "chest": "Withered Ripcage",
        "legs": "Withered Bone Leggings",
        "feet": "Withered Bone Boots", 
    },
    "lore": {
        "head": """
            Rejuvenation:
            Heal when hitting a withering
            or burning enemy
        """,
        "chest": """
            Cinder:
            Set any arrows you fire aflame
        """,
        "legs": """
            Withering Touch:
            Apply withering to any enemy
            you damage
        """,
        "feet": """
            Unmelting Bones:
            You are immune to fire damage
        """,
    },
    "item_textures": {
        "head": "psmoba:item/armor/wither_skeleton_helmet",
        "chest": "psmoba:item/armor/wither_skeleton_chestplate",
        "legs": "psmoba:item/armor/wither_skeleton_leggings",
        "feet": "psmoba:item/armor/wither_skeleton_boots",
    },
    "armor_textures": {
        "layer1": "wither_skeleton_layer_1",
        "layer2": "wither_skeleton_layer_2",
    },
}, {
    "id": "phantom",
    "nid": 2,
    "cmd": 2557802,
    "color": 64235,
    "stats": {
        "head": { "armor": 2 },
        "chest": { "armor": 5 },
        "legs": { "armor": 5 },
        "feet": { "armor": 2 },
    },
    "durability": {
        "head": 165,
        "chest": 160,
        "legs": 225,
        "feet": 195,
    },
    "recipes": {
        "head": [
            ["phantom_membrane", "iron_ingot",       "phantom_membrane"],
            ["glow_ink_sac",     "phantom_membrane", "glow_ink_sac"    ],
        ],
        "chest": [
            ["phantom_membrane", "iron_ingot", "phantom_membrane"],
            ["phantom_membrane",  None,        "phantom_membrane"],
            ["phantom_membrane",  None,        "phantom_membrane"],
        ],
        "legs": [
            ["phantom_membrane", "iron_ingot", "phantom_membrane"],
            ["iron_ingot",        None,        "iron_ingot"      ],
            ["phantom_membrane",  None,        "phantom_membrane"],
        ],
        "feet": [
            ["feather",          None, "feather"         ],
            ["phantom_membrane", None, "phantom_membrane"],
            ["iron_ingot",       None, "iron_ingot"      ],
        ],
    },
    "name": {
        "head": "Phantom Eyes",
        "chest": "Phantom Wings",
        "legs": "Phantom Leggings",
        "feet": "Phantom Boots", 
    },
    "lore": {
        "head": """
            Night Vision:
            You can see in the dark
        """,
        "chest": """
            Flap:
            Jump while in the air to soar
            into the sky
        """,
        "legs": """
            Night Stride:
            Gain a speed boost at night
            and in the dark
        """,
        "feet": """
            Glide:
            You fall slowly and take
            no fall damage
        """,
    },
    "item_textures": {
        "head": "psmoba:item/armor/phantom_helmet",
        "chest": "psmoba:item/armor/phantom_chestplate",
        "legs": "psmoba:item/armor/phantom_leggings",
        "feet": "psmoba:item/armor/phantom_boots",
    },
    "armor_textures": {
        "layer1": "phantom_layer_1",
        "layer2": "phantom_layer_2",
    },
}, {
    "id": "blaze",
    "nid": 3,
    "cmd": 2557803,
    "color": 16757261,
    "stats": {
        "head": { "armor": 2 },
        "chest": { "armor": 4 },
        "legs": { "armor": 4 },
        "feet": { "armor": 2 },
    },
    "durability": {
        "head": 165,
        "chest": 240,
        "legs": 225,
        "feet": 195,
    },
    "recipes": {
        "head": [
            ["blaze_rod",  None,       "blaze_rod"],
            ["blaze_rod", "blaze_rod", "blaze_rod"],
        ],
        "chest": [
            ["blaze_rod",      None,           "blaze_rod"    ],
            ["blaze_rod",     "blaze_rod",     "blaze_rod"    ],
            ["weeping_vines", "weeping_vines", "weeping_vines"],
        ],
        "legs": [
            ["blaze_rod", "weeping_vines", "blaze_rod"],
            ["blaze_rod", "weeping_vines", "blaze_rod"],
            ["blaze_rod",  None,           "blaze_rod"],
        ],
        "feet": [
            ["weeping_vines", None, "weeping_vines"],
            ["blaze_rod",     None, "blaze_rod"    ],
        ],
    },
    "name": {
        "head": "Blazing Mask",
        "chest": "Blazing Chestplate",
        "legs": "Blazing Cuisses",
        "feet": "Blazing Boots", 
    },
    "lore": {
        "head": """
            Blaze Hot Bolt:
            Instead of arrows, you shoot
            charged fire beams
        """,
        "chest": """
            Inferno:
            Raise your shield to send out a
            volley of fireballs
        """,
        "legs": """
            Updraft:
            Sneak in the air to start hovering
        """,
        "feet": """
            Heat Sense:
            Highlight any enemy you damage
        """,
    },
    "item_textures": {
        "head": "psmoba:item/armor/blaze_helmet",
        "chest": "psmoba:item/armor/blaze_chestplate",
        "legs": "psmoba:item/armor/blaze_leggings",
        "feet": "psmoba:item/armor/blaze_boots",
    },
    "armor_textures": {
        "layer1": "blaze_layer_1",
        "layer2": "blaze_layer_2",
    },
}]
