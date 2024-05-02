
from ./../item import item

item(
    'blaze', 'feet', 3, 2557803,
    { 'armor': 3, 'armor_toughness': 3 },
    color=16757261, lore_count=1, durability=429,
    recipe=[
        ['blaze_rod',      None,              'blaze_rod'     ],
        ['blaze_rod', None,              'blaze_rod'],
    ]
)

function ~/tick:
    unless score @s psmoba.feet.var.0 matches 1.. scoreboard players set @s psmoba.feet.var.0 30
    scoreboard players remove @s psmoba.feet.var.0 1
    if score @s psmoba.feet.var.0 matches 1.. return 0

    tag @s add psmoba.this
    as @e[distance=..4] function ~/../as_victim:
        scoreboard players set .bool psmoba 0
        on attacker if entity @s[tag=psmoba.this] scoreboard players set .bool psmoba 1
        if score .bool psmoba matches 0 return 0
        damage @s 1 in_fire by @a[tag=psmoba.this,limit=1,distance=..4]
        particle small_flame ~ ~.2 ~ 2 0 2 0 100
        for i in range(40):
            rot = (i * 9) - 180
            positioned ~ ~.2 ~ rotated rot 0 particle flame ^ ^ ^4 0 1 0 .02 0
        at @s particle flame ~ ~.2 ~ .3 1 .3 0 20
