import ./../tungsten as tungsten

prepend function ./../tungsten/head:
    if score @s psmoba.head matches 2 effect clear @s night_vision

append function ./../tungsten/head:
    if score @s psmoba.head matches 2 effect give @s night_vision infinite 0 true
