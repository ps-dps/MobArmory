
append function_tag load:load {"values":["psmoba:load"]}
function ./load:
    scoreboard objectives add psmoba dummy

    scoreboard objectives add psmoba.shot_bow minecraft.used:minecraft.bow
    scoreboard objectives add psmoba.shot_crossbow minecraft.used:minecraft.crossbow

    scoreboard objectives add psmoba.jump minecraft.custom:minecraft.jump

    scoreboard objectives add psmoba.clear.levitation dummy

    scoreboard objectives add psmoba.head dummy
    scoreboard objectives add psmoba.chest dummy
    scoreboard objectives add psmoba.legs dummy
    scoreboard objectives add psmoba.feet dummy

    function ./tick


function ./tick:
    schedule function ~/ 1t replace

    as @a[scores={psmoba.shot_bow=1..}] at @s function ./shot/bow
    as @a[scores={psmoba.shot_crossbow=1..}] at @s function ./shot/crossbow

    scoreboard players remove @a[scores={psmoba.clear.levitation=1..}] psmoba.clear.levitation 1
    as @a[scores={psmoba.clear.levitation=0}] function ./clear/levitation

    as @a[scores={psmoba.chest=2}] at @s function ./phantom/chest/tick
    as @a[scores={psmoba.legs=2}] at @s function ./phantom/legs/tick
