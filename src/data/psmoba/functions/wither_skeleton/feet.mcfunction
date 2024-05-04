
prepend function ./../tungsten/feet:
    if score @s psmoba.feet matches 1 effect clear @s fire_resistance

append function ./../tungsten/feet:
    if score @s psmoba.feet matches 1 effect give @s fire_resistance infinite 0 true
