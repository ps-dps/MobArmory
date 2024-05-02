
advancement ~/bow {
    "criteria": {
        "requirement": {
            "trigger": "minecraft:using_item",
            "conditions": {
                "item": {
                    "items": "minecraft:bow"
                }
            }
        }
    },
    "rewards": {
        "function": "psmoba:using/bow"
    }
}
function ~/bow:
    advancement revoke @s only ~/
    if score @s psmoba.chest matches 3 function ./blaze/chest/using_bow
