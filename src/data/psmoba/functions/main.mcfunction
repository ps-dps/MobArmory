
append function_tag load:load {"values":["psmoba:load"]}
function ./load:
    scoreboard objectives add psmoba dummy

    scoreboard objectives add psmoba.shot_bow minecraft.used:minecraft.bow
    scoreboard objectives add psmoba.shot_crossbow minecraft.used:minecraft.crossbow

    scoreboard objectives add psmoba.jump minecraft.custom:minecraft.jump
    scoreboard objectives add psmoba.destroy dummy

    scoreboard objectives add psmoba.using.time dummy
    scoreboard objectives add psmoba.using.last dummy

    scoreboard objectives add psmoba.chest.var.0 dummy
    scoreboard objectives add psmoba.feet.var.0 dummy

    scoreboard objectives add psmoba.head dummy
    scoreboard objectives add psmoba.chest dummy
    scoreboard objectives add psmoba.legs dummy
    scoreboard objectives add psmoba.feet dummy

    function ./tick


function ./tick:
    schedule function ~/ 1t replace

    as @a[scores={psmoba.shot_bow=1..}] at @s function ./shot/bow
    as @a[scores={psmoba.shot_crossbow=1..}] at @s function ./shot/crossbow

    as @a[scores={psmoba.chest=2,psmoba.chest.var.0=1..}] function ./phantom/chest/boost
    as @a[scores={psmoba.chest=2}] at @s function ./phantom/chest/tick
    as @a[scores={psmoba.legs=2}] at @s function ./phantom/legs/tick
    as @a[scores={psmoba.chest=3,psmoba.chest.var.0=1..}] scoreboard players remove @s psmoba.chest.var.0 1
    as @a[scores={psmoba.legs=3}] at @s function ./blaze/legs/tick

    store result score .gametime psmoba time query gametime
    as @e[type=#./destroy,tag=psmoba.destroy] if score @s psmoba.destroy <= .gametime psmoba kill @s

    as @a[scores={psmoba.using.time=1..}] at @s function ./using/tick


entity_type_tag ./destroy {
    "values": [
        { "required": false, "id": "minecraft:small_fireball" }
    ]
}
entity_type_tag ./non_living { # https://github.com/HeDeAnTheonlyone/Taglib/blob/main/data/taglib/tags/entity_types/non_living.json
    "replace": false,
    "values": [
        { "required": false, "id": "minecraft:arrow" },
        { "required": false, "id": "minecraft:painting" },
        { "required": false, "id": "minecraft:experience_orb" },
        { "required": false, "id": "minecraft:eye_of_ender" },
        { "required": false, "id": "minecraft:falling_block" },
        { "required": false, "id": "minecraft:fireball" },
        { "required": false, "id": "minecraft:firework_rocket" },
        { "required": false, "id": "minecraft:item" },
        { "required": false, "id": "minecraft:potion" },
        { "required": false, "id": "minecraft:small_fireball" },
        { "required": false, "id": "minecraft:snowball" },
        { "required": false, "id": "minecraft:tnt" },
        { "required": false, "id": "minecraft:trident" },
        { "required": false, "id": "minecraft:minecart" },
        { "required": false, "id": "minecraft:tnt_minecart" },
        { "required": false, "id": "minecraft:command_block_minecart" },
        { "required": false, "id": "minecraft:chest_minecart" },
        { "required": false, "id": "minecraft:hopper_minecart" },
        { "required": false, "id": "minecraft:furnace_minecart" },
        { "required": false, "id": "minecraft:spawner_minecart" },
        { "required": false, "id": "minecraft:boat" },
        { "required": false, "id": "minecraft:chest_boat" },
        { "required": false, "id": "minecraft:dragon_fireball" },
        { "required": false, "id": "minecraft:egg" },
        { "required": false, "id": "minecraft:end_crystal" },
        { "required": false, "id": "minecraft:ender_pearl" },
        { "required": false, "id": "minecraft:evoker_fangs" },
        { "required": false, "id": "minecraft:experience_bottle" },
        { "required": false, "id": "minecraft:fishing_bobber" },
        { "required": false, "id": "minecraft:leash_knot" },
        { "required": false, "id": "minecraft:lightning_bolt" },
        { "required": false, "id": "minecraft:llama_spit" },
        { "required": false, "id": "minecraft:shulker_bullet" },
        { "required": false, "id": "minecraft:spectral_arrow" },
        { "required": false, "id": "minecraft:wither_skull" },
        { "required": false, "id": "minecraft:armor_stand" },
        { "required": false, "id": "minecraft:marker" },
        { "required": false, "id": "minecraft:area_effect_cloud" },
        { "required": false, "id": "minecraft:item_frame" },
        { "required": false, "id": "minecraft:glow_item_frame" },
        { "required": false, "id": "minecraft:interaction" },
        { "required": false, "id": "minecraft:block_display" },
        { "required": false, "id": "minecraft:text_display" },
        { "required": false, "id": "minecraft:item_display" }
    ]
}
block_tag ./walk_through { # https://github.com/HeDeAnTheonlyone/Taglib/blob/main/data/taglib/tags/blocks/walk_through.json
    "replace": false,
    "values": [
        { "required": false, "id": "minecraft:light" },
        { "required": false, "id": "minecraft:structure_void" },
        { "required": false, "id": "minecraft:cobweb" },
        { "required": false, "id": "minecraft:dead_bush" },
        { "required": false, "id": "minecraft:big_dripleaf_stem" },
        { "required": false, "id": "minecraft:small_dripleaf" },
        { "required": false, "id": "minecraft:hanging_roots" },
        { "required": false, "id": "minecraft:kelp_plant" },
        { "required": false, "id": "minecraft:powder_snow" },
        { "required": false, "id": "minecraft:glow_lichen" },
        { "required": false, "id": "minecraft:redstone_wire" },
        { "required": false, "id": "minecraft:repeater" },
        { "required": false, "id": "minecraft:comparator" },
        { "required": false, "id": "minecraft:lever" },
        { "required": false, "id": "minecraft:tripwire_hook" },
        { "required": false, "id": "minecraft:tripwire" },
        { "required": false, "id": "minecraft:sculk_vein" },
        { "required": false, "id": "minecraft:frogspawn" },
        { "required": false, "id": "#minecraft:wool_carpets" },
        { "required": false, "id": "#minecraft:signs" },
        { "required": false, "id": "#minecraft:rails" },
        { "required": false, "id": "#minecraft:buttons" },
        { "required": false, "id": "#minecraft:pressure_plates" },
        { "required": false, "id": "#minecraft:banners" },
        { "required": false, "id": "#minecraft:saplings" },
        { "required": false, "id": "#minecraft:crops" },
        { "required": false, "id": "#minecraft:small_flowers" },
        { "required": false, "id": "#minecraft:tall_flowers" },
        { "required": false, "id": "#minecraft:fire" },
        { "required": false, "id": "minecraft:air" },
        { "required": false, "id": "minecraft:cave_air" },
        { "required": false, "id": "minecraft:void_air" },
        { "required": false, "id": "minecraft:grass" },
        { "required": false, "id": "minecraft:tall_grass" },
        { "required": false, "id": "minecraft:seagrass" },
        { "required": false, "id": "minecraft:tall_seagrass" },
        { "required": false, "id": "minecraft:fern" },
        { "required": false, "id": "minecraft:large_fern" },
        { "required": false, "id": "minecraft:nether_sprouts" },
        { "required": false, "id": "minecraft:crimson_roots" },
        { "required": false, "id": "minecraft:warped_roots" },
        { "required": false, "id": "#minecraft:corals" },
        { "required": false, "id": "minecraft:brain_coral_fan" },
        { "required": false, "id": "minecraft:bubble_coral_fan" },
        { "required": false, "id": "minecraft:fire_coral_fan" },
        { "required": false, "id": "minecraft:horn_coral_fan" },
        { "required": false, "id": "minecraft:tube_coral_fan" },
        { "required": false, "id": "minecraft:dead_brain_coral" },
        { "required": false, "id": "minecraft:dead_bubble_coral" },
        { "required": false, "id": "minecraft:dead_fire_coral" },
        { "required": false, "id": "minecraft:dead_horn_coral" },
        { "required": false, "id": "minecraft:dead_tube_coral" },
        { "required": false, "id": "minecraft:dead_brain_coral_fan" },
        { "required": false, "id": "minecraft:dead_bubble_coral_fan" },
        { "required": false, "id": "minecraft:dead_fire_coral_fan" },
        { "required": false, "id": "minecraft:dead_horn_coral_fan" },
        { "required": false, "id": "minecraft:dead_tube_coral_fan" },
        { "required": false, "id": "minecraft:dead_brain_coral_wall_fan" },
        { "required": false, "id": "minecraft:dead_bubble_coral_wall_fan" },
        { "required": false, "id": "minecraft:dead_fire_coral_wall_fan" },
        { "required": false, "id": "minecraft:dead_horn_coral_wall_fan" },
        { "required": false, "id": "minecraft:dead_tube_coral_wall_fan" },
        { "required": false, "id": "minecraft:torch" },
        { "required": false, "id": "minecraft:wall_torch" },
        { "required": false, "id": "minecraft:soul_torch" },
        { "required": false, "id": "minecraft:soul_wall_torch" },
        { "required": false, "id": "minecraft:redstone_torch" },
        { "required": false, "id": "minecraft:redstone_wall_torch" },
        { "required": false, "id": "minecraft:vine" },
        { "required": false, "id": "#minecraft:cave_vines" },
        { "required": false, "id": "minecraft:weeping_vines" },
        { "required": false, "id": "minecraft:weeping_vines_plant" },
        { "required": false, "id": "minecraft:twisting_vines" },
        { "required": false, "id": "minecraft:twisting_vines_plant" },
        { "required": false, "id": "minecraft:water" },
        { "required": false, "id": "minecraft:lava" }
    ]
}
