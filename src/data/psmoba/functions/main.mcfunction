
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

    scoreboard objectives add psmoba.crafter dummy
    scoreboard objectives add psmoba.crafter.progress dummy

    scoreboard objectives add psmoba.mine.barrel minecraft.mined:minecraft.barrel

    function ./register/crafter/inventory
    function ./register/crafter/crafting
    function ./register/crafter/recipes

    function ./tick
    function ./tick1s


function ./tick:
    schedule function ~/ 1t replace

    as @a[scores={psmoba.shot_bow=1..}] at @s function ./shot/bow
    as @a[scores={psmoba.shot_crossbow=1..}] at @s function ./shot/crossbow

    scoreboard players remove @a[scores={psmoba.clear.levitation=1..}] psmoba.clear.levitation 1
    as @a[scores={psmoba.clear.levitation=0}] function ./clear/levitation

    as @a[scores={psmoba.chest=2}] at @s function ./phantom/chest/tick
    as @a[scores={psmoba.legs=2}] at @s function ./phantom/legs/tick

    at @a[scores={psmoba.mine.barrel=1..}] as @e[type=item_display,distance=..8,tag=psmoba.crafter] at @s unless block ~ ~-1 ~ barrel function ./crafter/break

    as @a store result score @s psmoba.crafter clear @s structure_void{psmoba:{is_inventory:1b}}
    as @a[scores={psmoba.crafter=1..}] at @s as @e[type=item_display,distance=..8,tag=psmoba.crafter] at @s function ./crafter/tick


function ./tick1s:
    schedule function ~/ 1s replace

    as @e[type=item_display,tag=psmoba.crafter] at @s function ./crafter/tick1s


function ./summon_item:
    $summon item ~ ~ ~ {Item:$(item),Motion:[0d,.3d,0d]}
