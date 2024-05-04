
function ~/shoot_arrow:
    on origin unless entity @s[tag=psmoba.shooter] return 0
    tag @s add psmoba.wither_skeleton.chest
    data modify entity @s Fire set value 2000s
