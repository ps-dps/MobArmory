
from ./../loot_table import item

loot_table ~/ item(
    'wither_skeleton', 'chest', 1, 2557801,
    { 'armor': 8, 'armor_toughness': 3 },
    color=9534584, lore_count=1, durability=528,
)

function ~/shoot_arrow:
    on origin unless entity @s[tag=psmoba.shooter] return 0
    tag @s add psmoba.wither_skeleton.chest
    data modify entity @s Fire set value 2000s
