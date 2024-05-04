
function ~/tick:
    if entity @s[tag=psmoba.blaze.legs.sneaking,predicate=!~/../sneak] return run tag @s remove psmoba.blaze.legs.sneaking

    if entity @s[tag=!psmoba.blaze.legs.sneaking,tag=!psmoba.blaze.legs.floating,predicate=~/../sneak_in_air] return run function ~/../activate:
        tag @s add psmoba.blaze.legs.floating
        tag @s add psmoba.blaze.legs.sneaking
        tp @s @s
        attribute @s generic.gravity modifier add 963852b3-465b-4bcf-87fc-df1212018842 psmoba.blaze.legs -0.08 add_value
        attribute @s generic.fall_damage_multiplier modifier add 963852b3-465b-4bcf-87fc-df1212018abc a -1 add_multiplied_total

    if entity @s[tag=!psmoba.blaze.legs.sneaking,tag=psmoba.blaze.legs.floating,predicate=~/../sneak] return run function ~/../deactivate:
        tag @s remove psmoba.blaze.legs.floating
        tag @s remove psmoba.blaze.legs.up
        tag @s remove psmoba.blaze.legs.down
        tag @s add psmoba.blaze.legs.sneaking
        attribute @s generic.gravity modifier remove 963852b3-465b-4bcf-87fc-df1212018842
        attribute @s generic.gravity modifier remove 963852b3-465b-4bcf-87fc-df1275018845
        attribute @s generic.gravity modifier remove 963852b3-465b-4bcf-87fc-8f1275018848
        attribute @s generic.fall_damage_multiplier modifier remove 963852b3-465b-4bcf-87fc-df1212018abc

    if entity @s[tag=psmoba.blaze.legs.floating,tag=!psmoba.blaze.legs.up,x_rotation=-90..-40] return run function ~/../up:
        tag @s add psmoba.blaze.legs.up
        attribute @s generic.gravity modifier add 963852b3-465b-4bcf-87fc-df1275018845 psmoba.blaze.legs.up -0.02 add_value

    if entity @s[tag=psmoba.blaze.legs.floating,tag=!psmoba.blaze.legs.down,x_rotation=80..90] return run function ~/../down:
        tag @s add psmoba.blaze.legs.down
        attribute @s generic.gravity modifier add 963852b3-465b-4bcf-87fc-8f1275018848 psmoba.blaze.legs.down 0.02 add_value

    if entity @s[tag=psmoba.blaze.legs.floating,tag=psmoba.blaze.legs.up,x_rotation=-40..80] return run function ~/../stop_up:
        tag @s remove psmoba.blaze.legs.up
        attribute @s generic.gravity modifier remove 963852b3-465b-4bcf-87fc-df1275018845

    if entity @s[tag=psmoba.blaze.legs.floating,tag=psmoba.blaze.legs.down,x_rotation=-90..80] return run function ~/../stop_down:
        tag @s remove psmoba.blaze.legs.down
        attribute @s generic.gravity modifier remove 963852b3-465b-4bcf-87fc-8f1275018848

    if entity @s[tag=psmoba.blaze.legs.floating] function ~/../is_floating:
        particle large_smoke ~ ~ ~ 0.2 0.2 0.2 0.035 1
        if predicate ~/../float_ambient_chance playsound minecraft:entity.blaze.burn player @a ~ ~ ~ 1 1


prepend function ./../tungsten/legs:
    if score @s psmoba.legs matches 3 function ./legs/unequip:
        tag @s remove psmoba.blaze.legs.sneaking
        tag @s remove psmoba.blaze.legs.floating
        tag @s remove psmoba.blaze.legs.up
        tag @s remove psmoba.blaze.legs.down
        attribute @s generic.gravity modifier remove 963852b3-465b-4bcf-87fc-df1212018842
        attribute @s generic.gravity modifier remove 963852b3-465b-4bcf-87fc-df1275018845
        attribute @s generic.gravity modifier remove 963852b3-465b-4bcf-87fc-8f1275018848
        attribute @s generic.fall_damage_multiplier modifier remove 963852b3-465b-4bcf-87fc-df1212018abc


predicate ~/sneak_in_air {
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "nbt": "{OnGround:0b}",
        "flags": {
            "is_sneaking": true
        }
    }
}

predicate ~/sneak {
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "flags": {
            "is_sneaking": true
        }
    }
}

predicate ~/float_ambient_chance {
    "condition": "minecraft:random_chance",
    "chance": 0.05
}
