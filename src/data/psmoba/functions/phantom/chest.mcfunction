
from ./../item import item

item(
    'phantom', 'chest', 2, 2557802,
    { 'armor': 5 },
    color=64235, lore_count=2, special='elytra', durability=160,
    recipe=[
        ['phantom_membrane', 'iron_ingot', 'phantom_membrane'],
        ['phantom_membrane', None,         'phantom_membrane'],
        ['phantom_membrane', None,         'phantom_membrane'],
    ]
)

item_modifier ~/destroy {
    "function": "minecraft:set_damage",
    "damage": 0
}

item_modifier ~/repair {
    "function": "minecraft:set_damage",
    "damage": 1
}

predicate ~/has_landed { "condition": "minecraft:entity_properties", "entity": "this", "predicate": {
    "nbt": "{OnGround:1b}",
    "slots": {
        "armor.chest": { "predicates": {
            "minecraft:custom_data": { "psmoba": { "nid": 2 }}
        }}
    }
}}

function ~/tick:
    unless entity @s[tag=psmoba.phantom.chest] if data entity @s {OnGround:0b} tag @s add psmoba.phantom.chest
    unless entity @s[tag=psmoba.phantom.chest] return 0
    if entity @s[tag=psmoba.phantom.chest] if predicate ~/../has_landed return run function ~/../land

    if data entity @s {FallFlying:0b} return 0
    item modify entity @s armor.chest ~/../destroy
    tp @s @s
    attribute @s generic.gravity modifier add 2557-8183-490f-88eb-bba2aabe2b60 psmoba.phantom.chest.boost -.5 add_value
    scoreboard players set @s psmoba.phantom.chest.boost 2

function ~/land:
    tag @s remove psmoba.phantom.chest
    item modify entity @s armor.chest ~/../repair

function ~/boost:
    scoreboard players remove @s psmoba.phantom.chest.boost 1
    unless score @s psmoba.phantom.chest.boost matches 0 return 0
    attribute @s generic.gravity modifier remove 2557-8183-490f-88eb-bba2aabe2b60
    scoreboard players reset @s psmoba.phantom.chest.boost
