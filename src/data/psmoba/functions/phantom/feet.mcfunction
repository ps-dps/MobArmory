import ./../tungsten as tungsten

prepend function ./../tungsten/feet:
    if score @s psmoba.feet matches 2 effect clear @s slow_falling

append function ./../tungsten/feet:
    if score @s psmoba.feet matches 2 effect give @s slow_falling infinite 0 true
