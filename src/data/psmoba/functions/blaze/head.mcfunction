
function ~/shoot:
    anchored eyes positioned ^ ^ ^ as @e[type=arrow,distance=..1,nbt={life:0s}] kill @s

    unless score @s psmoba.using.time matches 20.. data modify storage psmoba:temp blaze.head.damage set value 1d
    if score @s psmoba.using.time matches 20..49 data modify storage psmoba:temp blaze.head.damage set value 3.5d
    if score @s psmoba.using.time matches 50..99 data modify storage psmoba:temp blaze.head.damage set value 6d
    if score @s psmoba.using.time matches 100.. data modify storage psmoba:temp blaze.head.damage set value 13d

    playsound minecraft:entity.blaze.hurt player @a ~ ~ ~ 1 1.3

    scoreboard players set .ray psmoba 400
    anchored eyes positioned ^ ^ ^ function ~/../raycast:
        scoreboard players remove .ray psmoba 1
        particle small_flame ~ ~ ~ 0 0 0 0 1 force

        positioned ~-.5 ~-.5 ~-.5 as @e[dx=1,limit=1,type=!#./../non_living,tag=!psmoba.shooter] return run function ~/../damage with storage psmoba:temp blaze.head:
            $damage @s $(damage) in_fire by @a[limit=1,tag=psmoba.shooter]
        unless block ~ ~ ~ #./../walk_through return 0

        if score .ray psmoba matches 1.. positioned ^ ^ ^.4 function ~/


function ~/charge_bow:
    anchored eyes positioned ^ ^ ^1 particle small_flame ~ ~.2 ~ 0 1 0 0.25 0
    if score @s psmoba.using.time matches 20 particle flame ~ ~1 ~ 0.3 .6 0.3 .03 80
    if score @s psmoba.using.time matches 20 playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1 0.8
    if score @s psmoba.using.time matches 50 particle flame ~ ~1 ~ 0.4 .8 0.4 .03 100
    if score @s psmoba.using.time matches 50 playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1 1.1
    if score @s psmoba.using.time matches 100 particle soul_fire_flame ~ ~1 ~ 0.4 .8 0.4 .03 100
    if score @s psmoba.using.time matches 100 playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 1.7
    if score @s psmoba.using.time matches 100 playsound minecraft:block.beacon.activate player @a ~ ~ ~ 1 2
