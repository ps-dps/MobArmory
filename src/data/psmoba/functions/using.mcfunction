
advancement ~/bow {
    "criteria": { "requirement": { "trigger": "minecraft:using_item", "conditions": {
        "item": { "items": "minecraft:bow" }
    }}},
    "rewards": { "function": "psmoba:using/bow" }
}
function ~/bow:
    advancement revoke @s only ~/
    scoreboard players add @s psmoba.using.time 1
    if score @s psmoba.head matches 3 function ./blaze/head/charge_bow


advancement ~/shield {
    "criteria": { "requirement": { "trigger": "minecraft:using_item", "conditions": {
        "item": { "items": "minecraft:shield" }
    }}},
    "rewards": { "function": "psmoba:using/shield" }
}
function ~/shield:
    advancement revoke @s only ~/
    scoreboard players add @s psmoba.using.time 1
    if score @s psmoba.chest matches 3 function ./blaze/chest/using_shield


function ~/tick:
    scoreboard players add @s psmoba.using.last 1
    if score @s psmoba.using.last = @s psmoba.using.time return 0
    scoreboard players reset @s psmoba.using.last
    scoreboard players reset @s psmoba.using.time
