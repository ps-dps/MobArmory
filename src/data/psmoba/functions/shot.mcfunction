
function ~/bow:
    scoreboard players reset @s psmoba.shot_bow

    tag @s add psmoba.shooter
    if score @s psmoba.chest matches 1 anchored eyes positioned ^ ^ ^ as @e[type=arrow,distance=..1,tag=!psmoba.wither_skeleton.chest,nbt={life:0s}] function ./wither_skeleton/chest/shoot_arrow
    tag @s remove psmoba.shooter

function ~/crossbow:
    scoreboard players reset @s psmoba.shot_crossbow

    tag @s add psmoba.shooter
    if score @s psmoba.chest matches 1 anchored eyes positioned ^ ^ ^ as @e[type=arrow,distance=..1,tag=!psmoba.wither_skeleton.chest,nbt={life:0s}] function ./wither_skeleton/chest/shoot_arrow
    tag @s remove psmoba.shooter
