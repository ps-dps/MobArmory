from random import randint
from beet import Context, LootTable, Language, Recipe, Advancement, Texture, Model, PngFile, TextFile
from beet.contrib.vanilla import Vanilla
from typing import ClassVar, Tuple
from PIL import Image
from src.items import armors
import json
import math


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
            component_data = get_component_data(armor, slot)
            components = component_data.copy()
            components["minecraft:lore"] = [json.dumps(line) for line in components["minecraft:lore"]]
            components["minecraft:item_name"] = json.dumps(components["minecraft:item_name"])

            ctx.data.recipes[f'psmoba:{armor["id"]}/{slot}'] = recipe(armor["recipes"][slot], base_item, components)
            ctx.data.advancements[f'psmoba:{armor["id"]}/{slot}/unlock_recipe'] = recipe_advancement(armor, slot)
            ctx.data.advancements[f'psmoba:{armor["id"]}/{slot}/optain'] = optain_advancement(armor, slot, base_item, component_data)
            ctx.data.loot_tables[f'psmoba:{armor["id"]}/{slot}'] = loot_table(base_item, components)

    vanilla_armor_textures = get_leather_armor_textures(ctx)

    properties, cit_armor_textures = create_cit_files(vanilla_armor_textures, armors)
    for path, file in properties.items():
        ctx.assets[CitPropertiesFile][f'minecraft:{path}'] = file
    for path, file in cit_armor_textures.items():
        ctx.assets[CitArmorTexture][f'minecraft:{path}'] = file

    layer1, layer2 = get_modified_image_list(vanilla_armor_textures, armors)
    ctx.assets["minecraft:models/armor/leather_layer_1"] = stitch_textures(layer1)
    ctx.assets["minecraft:models/armor/leather_layer_2"] = stitch_textures(layer2)

    ctx.assets["minecraft:models/armor/leather_layer_1_overlay"] = Texture(Image.new('RGBA', (64, 32)))
    ctx.assets["minecraft:models/armor/leather_layer_2_overlay"] = Texture(Image.new('RGBA', (64, 32)))


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


def get_component_data(armor: dict, slot: str) -> dict:
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

    lore = [{
        "translate": f'psmoba.{armor["id"]}.{slot}.lore0',
        "color": "#ffcc00",
        "underlined": True,
        "italic": False,
    }] + [{
        "translate": f'psmoba.{armor["id"]}.{slot}.lore{i}',
        "color": "#a1a1a1",
        "italic": False
    } for i in range(1, len(armor["lore"][slot].strip().split('\n')))] + [
        [{
            "translate": "psmoba.stat.pos",
            "color": "blue",
            "italic": False,
            "with": [
                { "text": str(value), "color": "blue", "italic": False },
                { "translate": "psmoba.stat."+stat+".icon", "color": "white", "italic": False, "font": "psmoba:icons" }
            ]
        } for stat, value in armor["stats"][slot].items()]
    ]
    for i in range(len(lore[-1])-1):
        lore[-1][i+i+1:i+i+1] = [" "]

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
        "minecraft:item_name": {
            "translate": f'psmoba.{armor["id"]}.{slot}.name',
            "color": f'#{hex(armor["color"])[2:].rjust(6,"0")}',
            "italic": False
        },
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

def recipe_advancement(armor: dict, slot: str) -> Advancement:
    return Advancement({ "criteria": {
        "requirement": {
            "trigger": "minecraft:inventory_changed",
            "conditions": {
                "items": [{ "items": list(set([item for row in armor["recipes"][slot] for item in row if item])), }]
            }}
        },
        "rewards": { "recipes": [ f'psmoba:{armor["id"]}/{slot}' ]}
    })

def optain_advancement(armor: dict, slot: str, base_item: str, component_data: dict) -> Advancement:
    title = {
        "translate": "psmoba.advancements.generic.title",
        "with": [component_data["minecraft:item_name"]],
    }

    description = [line.copy() for line in component_data["minecraft:lore"]]
    description[0]["underlined"] = False
    for i in range(len(description)-1):
        description[i+i+1:i+i+1] = ["\n"]

    parent = ("psmoba:root" if slot == "head" else
            f"psmoba:{armor['id']}/head/optain" if slot == "chest" else
            f"psmoba:{armor['id']}/chest/optain" if slot == "legs" else
            f"psmoba:{armor['id']}/legs/optain")

    return Advancement({
        "display": {
            "icon": { "id": base_item, "components": { "minecraft:custom_model_data": armor["cmd"] }},
            "title": title,
            "description": description,
            "hidden": False
        },
        "parent": parent,
        "criteria": {
            "requirement": { "trigger": "minecraft:inventory_changed", "conditions": {
                "items": [{
                    "items": base_item,
                    "predicates": {
                        "minecraft:custom_data": { "psmoba": { "nid": armor["nid"] }}
                    }
                }]
            }}
        }
    })


def get_leather_armor_textures(ctx: Context) -> Tuple[Image.Image, ...]:
    ctx.require('beet.contrib.model_merging')
    vanilla = ctx.inject(Vanilla)
    client_jar = vanilla.mount('assets/minecraft/textures/models')
    return (
        client_jar.assets.textures['minecraft:models/armor/leather_layer_1'].copy().ensure_deserialized(),
        client_jar.assets.textures['minecraft:models/armor/leather_layer_2'].copy().ensure_deserialized(),
        client_jar.assets.textures['minecraft:models/armor/leather_layer_1_overlay'].copy().ensure_deserialized(),
        client_jar.assets.textures['minecraft:models/armor/leather_layer_2_overlay'].copy().ensure_deserialized(),
    )

def stitch_textures(images: list[Image.Image]) -> Texture:
    num_images = len(images)
    num_cols = math.ceil(math.sqrt(num_images)*2/3)
    num_rows = math.ceil(num_images / num_cols)

    stitched_image = Image.new('RGBA', (num_cols * 64, num_rows * 32))

    for i, image in enumerate(images):
        row = i // num_cols
        col = i % num_cols
        stitched_image.paste(image, (col * 64, row * 32))

    return Texture(stitched_image)

def create_cit_files(vanilla_armor_textures: tuple[Image.Image, ...], armors: dict):
    properties = {}
    cit_armor_textures = {}

    properties["base_leather_armor"] = CitPropertiesFile('\n'.join([
        "# Armor textures for https://github.com/ps-dps/MobArmory by PuckiSilver",
        "type=armor",
        "items=minecraft:leather_helmet minecraft:leather_chestplate minecraft:leather_leggings minecraft:leather_boots",
        "texture.leather_layer_1=base_leather_armor_1",
        "texture.leather_layer_2=base_leather_armor_2",
        "texture.leather_layer_1_overlay=base_leather_armor_1_overlay",
        "texture.leather_layer_2_overlay=base_leather_armor_2_overlay",
        "weight=-1",
    ""]))

    cit_armor_textures["base_leather_armor_1"] = CitArmorTexture(vanilla_armor_textures[0].copy())
    cit_armor_textures["base_leather_armor_2"] = CitArmorTexture(vanilla_armor_textures[1].copy())
    cit_armor_textures["base_leather_armor_1_overlay"] = CitArmorTexture(vanilla_armor_textures[2].copy())
    cit_armor_textures["base_leather_armor_2_overlay"] = CitArmorTexture(vanilla_armor_textures[3].copy())
    cit_armor_textures["empty"] = CitArmorTexture(Image.new('RGBA', (64, 32)))

    for armor in armors:
        properties[f'{armor["id"]}'] = CitPropertiesFile('\n'.join([
            "# Armor textures for https://github.com/ps-dps/MobArmory by PuckiSilver",
            "type=armor",
            f'nbt.display.color={armor["color"]}',
            "items=minecraft:leather_helmet minecraft:leather_chestplate minecraft:leather_leggings minecraft:leather_boots",
            "texture.leather_layer_1=empty",
            f'texture.leather_layer_1_overlay={armor["id"]}_1',
            "texture.leather_layer_2=empty",
            f'texture.leather_layer_2_overlay={armor["id"]}_2',
            "weight=1",
        ]))

        cit_armor_textures[f'{armor["id"]}_1'] = CitArmorTexture(
            Image.open(f'src/assets/psmoba/armor/{armor["id"]}_1.png')
        )
        cit_armor_textures[f'{armor["id"]}_2'] = CitArmorTexture(
            Image.open(f'src/assets/psmoba/armor/{armor["id"]}_2.png')
        )

    return properties, cit_armor_textures

def get_modified_image_list(vanilla_armor_textures: tuple[Image.Image, ...], armors: dict) -> tuple[list[Image.Image], ...]:
    base_1, base_2, overlay_1, overlay_2 = vanilla_armor_textures
    base_1 = base_1.convert('RGBA')
    base_2 = base_2.convert('RGBA')
    overlay_1 = overlay_1.convert('RGBA')
    overlay_2 = overlay_2.convert('RGBA')
    base_1.putpixel((0, 1), (255, 255, 255))
    base_2.putpixel((0, 1), (255, 255, 255))
    base_1 = Image.alpha_composite(base_1, overlay_1)
    base_2 = Image.alpha_composite(base_2, overlay_2)
    layer1 = [base_1]
    layer2 = [base_2]

    for armor in armors:
        image1 = Image.open(f'src/assets/psmoba/armor/{armor["id"]}_1.png')
        image2 = Image.open(f'src/assets/psmoba/armor/{armor["id"]}_2.png')
        image1.putpixel((0, 0), (armor["color"] >> 16 & 255, armor["color"] >> 8 & 255, armor["color"] & 255))
        image2.putpixel((0, 0), (armor["color"] >> 16 & 255, armor["color"] >> 8 & 255, armor["color"] & 255))
        layer1.append(image1)
        layer2.append(image2)

    return layer1, layer2
