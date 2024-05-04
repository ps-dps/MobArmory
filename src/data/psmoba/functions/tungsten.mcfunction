

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
    unless predicate ~/ return run scoreboard players reset @s psmoba.head
    store result score @s psmoba.head data get entity @s Inventory[{Slot:103b}].components.minecraft:custom_data.psmoba.nid

function ~/chest:
    scoreboard players reset @s psmoba.chest.var.0
    unless predicate ~/ return run scoreboard players reset @s psmoba.chest
    store result score @s psmoba.chest data get entity @s Inventory[{Slot:102b}].components.minecraft:custom_data.psmoba.nid

function ~/legs:
    unless predicate ~/ return run scoreboard players reset @s psmoba.legs
    store result score @s psmoba.legs data get entity @s Inventory[{Slot:101b}].components.minecraft:custom_data.psmoba.nid

function ~/feet:
    unless predicate ~/ return run scoreboard players reset @s psmoba.feet
    store result score @s psmoba.feet data get entity @s Inventory[{Slot:100b}].components.minecraft:custom_data.psmoba.nid
