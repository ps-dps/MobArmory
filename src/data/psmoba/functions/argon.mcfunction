
append function_tag argon:player_hurt_entity {"values":["psmoba:argon/player_hurt_entity"]}
function ~/player_hurt_entity:
    on attacker scoreboard players operation .mainhand psmoba = @s psmoba.mainhand
    on attacker scoreboard players operation .offhand psmoba = @s psmoba.offhand
    on attacker scoreboard players operation .head psmoba = @s psmoba.head
    on attacker scoreboard players operation .chest psmoba = @s psmoba.chest
    on attacker scoreboard players operation .legs psmoba = @s psmoba.legs
    on attacker scoreboard players operation .feet psmoba = @s psmoba.feet

    if score .chest psmoba matches 1 function ./wither_skeleton/player_hurt_entity
