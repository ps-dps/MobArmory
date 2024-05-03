
from ./../item import item

item(
    'blaze', 'chest', 3, 2557803,
    { 'armor': 4 },
    color=16757261, lore_count=2, durability=240,
    recipe=[
        ['blaze_rod',      None,           'blaze_rod'    ],
        ['blaze_rod',     'blaze_rod',     'blaze_rod'    ],
        ['weeping_vines', 'weeping_vines', 'weeping_vines'],
    ],
)

function ~/using_shield:
    if score @s psmoba.chest.var.0 matches 1.. return 0

    scoreboard players set @s psmoba.chest.var.0 30
    playsound minecraft:entity.blaze.shoot player @a ~ ~ ~ 1 0.8

    data modify storage psmoba:temp owner set from entity @s UUID
    anchored eyes positioned ^ ^ ^ positioned ~ ~-.4 ~ facing ^.2 ^ ^1 summon small_fireball function ~/../summon_fireball
    anchored eyes positioned ^ ^ ^ positioned ~ ~-.4 ~ facing ^-.2 ^ ^1 summon small_fireball function ~/../summon_fireball
    anchored eyes positioned ^ ^ ^ positioned ~ ~-.4 ~ summon small_fireball function ~/../summon_fireball:
        data modify entity @s Owner set from storage psmoba:temp owner
        positioned 0. 0. 0. tp ^ ^ ^.1
        data modify entity @s power set from entity @s Pos
        tp ~ ~ ~
        tag @s add psmoba.destroy
        scoreboard players operation @s psmoba.destroy = .gametime psmoba
        scoreboard players add @s psmoba.destroy 80
