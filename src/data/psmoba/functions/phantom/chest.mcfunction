
from ./../loot_table import item

loot_table ~/ item(
    'phantom', 'chest', 2, 2557802,
    { 'armor': 5 },
    color=64235, lore=2, special='elytra'
)

item_modifier ~/destroy {
    "function": "minecraft:set_damage",
    "damage": 0
}

item_modifier ~/repair {
    "function": "minecraft:set_damage",
    "damage": 1
}

function ~/tick:
    unless entity @s[tag=psmoba.phantom.chest] if data entity @s {OnGround:0b} tag @s add psmoba.phantom.chest
    unless entity @s[tag=psmoba.phantom.chest] return 0
    if data entity @s[tag=psmoba.phantom.chest] {OnGround:1b} return run function ~/../land

    if data entity @s {FallFlying:0b} return 0
    item modify entity @s armor.chest ~/../destroy
    effect give @s levitation 1 60 true
    unless score @s psmoba.clear.levitation matches 4.. scoreboard players set @s psmoba.clear.levitation 3

function ~/land:
    tag @s remove psmoba.phantom.chest
    if data entity @s {Inventory:[{Slot:102b,tag:{psmoba:{nid:2}}}]} item modify entity @s armor.chest ~/../repair
