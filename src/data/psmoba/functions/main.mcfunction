
append function_tag load:load {"values":["psmoba:load"]}
function ./load:
    scoreboard objectives add psmoba dummy

    scoreboard objectives add psmoba.shot_bow minecraft.used:minecraft.bow
    scoreboard objectives add psmoba.shot_crossbow minecraft.used:minecraft.crossbow

    scoreboard objectives add psmoba.jump minecraft.custom:minecraft.jump
    scoreboard objectives add psmoba.destroy dummy

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
    as @a[scores={psmoba.legs=3}] at @s function ./blaze/legs/tick
    as @a[scores={psmoba.feet=3}] at @s function ./blaze/feet/tick

    store result score .gametime psmoba time query gametime
    as @e[type=#./destroy,tag=psmoba.destroy] if score @s psmoba.destroy <= .gametime psmoba kill @s


entity_type_tag ./destroy {
    "values": [
        { "required": false, "id": "minecraft:small_fireball" }
    ]
}
