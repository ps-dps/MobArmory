

append function_tag tungsten:swap/head {"values":["psmoba:tungsten/head"]}
append function_tag tungsten:swap/chest {"values":["psmoba:tungsten/chest"]}
append function_tag tungsten:swap/legs {"values":["psmoba:tungsten/legs"]}
append function_tag tungsten:swap/feet {"values":["psmoba:tungsten/feet"]}


predicate ~/head { "condition": "minecraft:entity_properties", "entity": "this", "predicate": { "equipment": {
    "head": { "predicates": { "minecraft:custom_data": { "psmoba": {}}}}
}}}
predicate ~/chest { "condition": "minecraft:entity_properties", "entity": "this", "predicate": { "equipment": {
    "chest": { "predicates": { "minecraft:custom_data": { "psmoba": {}}}}
}}}
predicate ~/legs { "condition": "minecraft:entity_properties", "entity": "this", "predicate": { "equipment": {
    "legs": { "predicates": { "minecraft:custom_data": { "psmoba": {}}}}
}}}
predicate ~/feet { "condition": "minecraft:entity_properties", "entity": "this", "predicate": { "equipment": {
    "feet": { "predicates": { "minecraft:custom_data": { "psmoba": {}}}}
}}}


function ~/head:
    if score @s psmoba.head matches 2 effect clear @s night_vision

    unless predicate ~/ return run scoreboard players reset @s psmoba.head
    store result score @s psmoba.head data get entity @s Inventory[{Slot:103b}].components.minecraft:custom_data.psmoba.nid

    if score @s psmoba.head matches 2 effect give @s night_vision infinite 0 true


function ~/chest:
    attribute @s[scores={psmoba.chest=2}] generic.gravity modifier remove 2557-8183-490f-88eb-bba2aabe2b60

    scoreboard players reset @s psmoba.chest.var.0
    unless predicate ~/ return run scoreboard players reset @s psmoba.chest
    store result score @s psmoba.chest data get entity @s Inventory[{Slot:102b}].components.minecraft:custom_data.psmoba.nid


function ~/legs:
    if score @s psmoba.legs matches 3 function ./blaze/legs/unequip

    unless predicate ~/ return run scoreboard players reset @s psmoba.legs
    store result score @s psmoba.legs data get entity @s Inventory[{Slot:101b}].components.minecraft:custom_data.psmoba.nid


function ~/feet:
    if score @s psmoba.feet matches 1 effect clear @s fire_resistance
    if score @s psmoba.feet matches 2 effect clear @s slow_falling

    unless predicate ~/ return run scoreboard players reset @s psmoba.feet
    store result score @s psmoba.feet data get entity @s Inventory[{Slot:100b}].components.minecraft:custom_data.psmoba.nid

    if score @s psmoba.feet matches 1 effect give @s fire_resistance infinite 0 true
    if score @s psmoba.feet matches 2 effect give @s slow_falling infinite 0 true
