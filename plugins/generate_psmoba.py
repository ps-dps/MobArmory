from random import randint
from beet import Context, LootTable, Language, Recipe, Advancement, Texture, Model, PngFile, TextFile
from typing import ClassVar, Tuple
from src.items import armors


def beet_default(ctx: Context):
    set_up_cit_file_types(ctx)
    for armor in armors:
        for slot, base_item in [
            ("head", "leather_helmet"),
            ("chest", "leather_chestplate"),
            ("legs", "leather_leggings"),
            ("feet", "leather_boots")
        ]:
            if armor["id"] == "phantom" and slot == "chest":
                base_item = "elytra"
            components = get_components(armor, slot)
            ctx.data.recipes[f'psmoba:{armor["id"]}/{slot}'] = recipe(armor, base_item, components)
            ctx.data.loot_tables[f'psmoba:{armor["id"]}/{slot}'] = loot_table(base_item, components)
    print(armors)


class CitPropertiesFile(TextFile):
    """Class representing the cit properties file"""
    scope: ClassVar[Tuple[str, ...]] = ("optifine", "cit", "psmoba")
    extension: ClassVar[str] = ".properties"


class CitArmorTexture(PngFile):
    """Class representing a cit texture file"""
    scope: ClassVar[Tuple[str, ...]] = ("optifine", "cit", "psmoba")
    extension: ClassVar[str] = ".png"


def set_up_cit_file_types(ctx: Context):
    ctx.assets.extend_namespace += [
        CitPropertiesFile,
        CitArmorTexture,
    ]


def get_components(armor: dict, slot: str) -> dict:
    modifiers = [{
        "type": "minecraft:generic.luck",
        "amount": -9.094947017729282e-13,
        "name": "tungsten."+slot,
        "slot": slot,
        "uuid": [
            12, 42069, 0,
            (12 if slot == 'head' else 13 if slot == 'chest' else 14 if slot == 'legs' else 15)
        ],
        "operation": "add_value",
    }]
    for stat, value in armor["stats"][slot].items():
        modifiers.append({
            "type": "minecraft:generic."+stat,
            "amount": value,
            "name": "psmoba."+slot+"."+stat,
            "slot": slot,
            "uuid": [ 2557, randint(-60000, 60000), randint(-60000, 60000), randint(-60000, 60000) ],
            "operation": "add_value",
        })

    lore = ['{ "translate": "psmoba.'+armor["id"]+'.'+slot+'.lore0", "color": "#ffcc00", "underlined": true, "italic": false }']
    lore.extend(
        ['{ "translate": "psmoba.'+armor["id"]+'.'+slot+'.lore'+str(i+1)+'", "color": "#a1a1a1", "italic": false }' for i in range(len(armor["lore"][slot].trim().split('\n')))]
    )
    lore.append(
        "[" + '," ",'.join([
            '{ "translate": "psmoba.stat.pos", "color": "blue", "italic": false, "with": ['+
            '{ "text": "'+str(value)+'", "color": "blue", "italic": false },'+
            '{ "translate": "psmoba.stat.'+stat+'.icon", "color": "white", "italic": false, "font": "psmoba:icons" }]}'
        ] for stat, value in armor["stats"][slot].items()) + "]"
    )

    return {
        "minecraft:custom_data": {
            "psmoba": {
                "id": f'{armor["id"]}.{slot}',
                "nid": armor["nid"],
            }
        },
        "minecraft:rarity": "rare",
        "minecraft:dyed_color": {
            "rgb": armor["color"],
            "show_in_tooltip": False,
        },
        "minecraft:custom_model_data": armor["cmd"],
        "minecraft:max_damage": armor["durability"][slot],
        "minecraft:attribute_modifiers": {
            "modifiers": modifiers,
            "show_in_tooltip": False
        },
        "minecraft:lore": lore,
        "minecraft:item_name": '{"translate": "psmoba.'+armor["id"]+'.'+slot+'.name", "color": "#'+hex(armor["color"])[2:].rjust(6,'0')+'", "italic": false}',
    }


def recipe(recipe: list[list[str|None]], base_item: str, components: dict) -> Recipe:
    keys = {}
    keys_items = {}
    for i, row in enumerate(recipe):
        for j, ritem in enumerate(row):
            if not ritem or ritem in keys_items: continue
            char = chr(ord('A') + i*3 + j)
            keys[char] = {"item": ritem}
            keys_items[ritem] = char

    pattern = [
        "".join(
            [keys_items[item] if item else " " for item in row]
        ) for row in recipe
    ]

    return Recipe({
        "type": "minecraft:crafting_shaped",
        "category": "equipment",
        "pattern": pattern,
        "key": keys,
        "result": {
            "id": base_item,
            "components": components,
        }
    })

def loot_table(base_item: str, components: dict) -> LootTable:
    return LootTable({
        "pools": [{
            "rolls": 1,
            "entries": [{
                "type": "minecraft:item",
                "name": base_item,
                "functions": {
                    "function": "minecraft:set_components",
                    "components": components,
                },
            }]
        }]
    })
