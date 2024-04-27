
from ./../loot_table import item

loot_table ~/ item(
    'wither_skeleton', 'legs', 1, 2557801,
    { 'armor': 6, 'armor_toughness': 3 },
    color=9534584, lore_count=2, durability=495,
)

function ~/player_hurt_entity:
    effect give @s wither 10 0
