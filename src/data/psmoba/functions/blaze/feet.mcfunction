
from ./../item import item

item(
    'blaze', 'feet', 3, 2557803,
    { 'armor': 3, 'armor_toughness': 3 },
    color=16747520, lore_count=1, durability=429,
    recipe=[
        ['blaze_rod',      None,              'blaze_rod'     ],
        ['blaze_rod', None,              'blaze_rod'],
    ]
)

function ~/tick:
    unless score @s psmoba.feet.var.0 matches 1.. scoreboard players set @s psmoba.feet.var.0 20
    scoreboard players remove @s psmoba.feet.var.0 1
    if score @s psmoba.feet.var.0 matches 1.. return 0

    tag @s add psmoba.this
    on attacker damage @s 1 fire by @a[tag=psmoba.this,limit=1] #! check damage type
    as @e[distance=..50] function ~/../as_victim: #! adjust range
        on attacker unless entity @s[tag=psmoba.this] return 0
        damage @s 1 fire by @a[tag=psmoba.this,limit=1] #! check damage type
    #! maybe add particles trailing to the victim
