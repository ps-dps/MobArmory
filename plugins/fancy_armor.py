from typing import ClassVar, Tuple
from beet import Context, PngFile, Texture, TextFile
from beet.contrib.vanilla import Vanilla
from PIL import Image
import math


class ArmorTexture(PngFile):
    """Class representing an armor texture to be converted"""
    scope: ClassVar[Tuple[str, ...]] = ("armor",)
    extension: ClassVar[str] = ".png"


class CitPropertiesFile(TextFile):
    """Class representing the cit properties file"""
    scope: ClassVar[Tuple[str, ...]] = ("optifine", "cit", "fancypantslite")
    extension: ClassVar[str] = ".properties"


class CitArmorTexture(PngFile):
    """Class representing the cit properties file"""
    scope: ClassVar[Tuple[str, ...]] = ("optifine", "cit", "fancypantslite")
    extension: ClassVar[str] = ".png"


def setup(ctx: Context):
    ctx.assets.extend_namespace += [
        ArmorTexture,
        CitPropertiesFile,
        CitArmorTexture,
    ]


def get_leather_armor_textures(ctx: Context) -> Tuple[Image.Image, Image.Image]:
    ctx.require('beet.contrib.model_merging')
    vanilla = ctx.inject(Vanilla)
    client_jar = vanilla.mount('assets/minecraft/textures/models')
    return (
        client_jar.assets.textures['minecraft:models/armor/leather_layer_1'].copy().ensure_deserialized(),
        client_jar.assets.textures['minecraft:models/armor/leather_layer_2'].copy().ensure_deserialized(),
        client_jar.assets.textures['minecraft:models/armor/leather_layer_1_overlay'].copy().ensure_deserialized(),
        client_jar.assets.textures['minecraft:models/armor/leather_layer_2_overlay'].copy().ensure_deserialized(),)


def color_int_to_tuple(color: int) -> Tuple[int, int, int]:
    return (color >> 16 & 255, color >> 8 & 255, color & 255)


def stitch_texture(images: list[Image.Image]) -> Image.Image:
    num_images = len(images)
    num_cols = math.ceil(math.sqrt(num_images)*2/3)
    num_rows = math.ceil(num_images / num_cols)

    stitched_image = Image.new('RGBA', (num_cols * 64, num_rows * 32))

    for i, image in enumerate(images):
        row = i // num_cols
        col = i % num_cols
        stitched_image.paste(image, (col * 64, row * 32))

    return stitched_image


def fancify(ctx: Context):
    if not ArmorTexture in ctx.assets: return

    ctx.assets[CitPropertiesFile]['minecraft:base_leather_armor.properties'] = CitPropertiesFile('\n'.join([
        "# Generated using https://github.com/PuckiSilver/FancyPantsLite-to-CIT by PuckiSilver",
        "type=armor",
        "items=minecraft:leather_helmet minecraft:leather_chestplate minecraft:leather_leggings minecraft:leather_boots",
        "texture.leather_layer_1=base_leather_armor_1",
        "texture.leather_layer_2=base_leather_armor_2",
        "texture.leather_layer_1_overlay=base_leather_armor_1_overlay",
        "texture.leather_layer_2_overlay=base_leather_armor_2_overlay",
        "weight=-1",
    ""]))

    trash = []
    leather_armor_1, leather_armor_2, overlay_1, overlay_2 = get_leather_armor_textures(ctx)

    ctx.assets[CitArmorTexture]['minecraft:base_leather_armor_1'] = CitArmorTexture(leather_armor_1.copy())
    ctx.assets[CitArmorTexture]['minecraft:base_leather_armor_2'] = CitArmorTexture(leather_armor_2.copy())
    ctx.assets[CitArmorTexture]['minecraft:base_leather_armor_1_overlay'] = CitArmorTexture(overlay_1)
    ctx.assets[CitArmorTexture]['minecraft:base_leather_armor_2_overlay'] = CitArmorTexture(overlay_2)

    leather_armor_1.putpixel((0, 1), (255, 255, 255))
    leather_armor_2.putpixel((0, 1), (255, 255, 255))
    fancy_armor_1: list[Image.Image] = [leather_armor_1]
    fancy_armor_2: list[Image.Image] = [leather_armor_2]

    for path, file in ctx.assets[ArmorTexture].items():
        trash.append(path)

        filename = path.split(':')[1].split('.')[0]
        color = int(path.split('.')[-1])
        image: Image.Image = file.ensure_deserialized()

        ctx.assets[CitArmorTexture][f'minecraft:armor_{color}_{filename[-1]}'] = CitArmorTexture(image.copy())

        items = "minecraft:leather_helmet minecraft:leather_chestplate minecraft:leather_boots" if filename.endswith('1') else "minecraft:leather_leggings"
        if f'minecraft:armor_{color}' in ctx.assets[CitPropertiesFile]:
            properties_file = ctx.assets[CitPropertiesFile][f'minecraft:armor_{color}']
            ctx.assets[CitPropertiesFile][f'minecraft:armor_{color}'] = CitPropertiesFile('\n'.join([
                properties_file.get_content() + ' ' + items,
                f'texture.leather_layer_{filename[-1]}=empty',
                f'texture.leather_layer_1_overlay=armor_{color}_{filename[-1]}',
            ""]))
        else:
            ctx.assets[CitPropertiesFile][f'minecraft:armor_{color}'] = CitPropertiesFile('\n'.join([
                "# Generated using https://github.com/PuckiSilver/FancyPantsLite-to-CIT by PuckiSilver",
                "type=armor",
                "weight=1",
                f'nbt.display.color={color}',
                f'texture.leather_layer_{filename[-1]}=empty',
                f'texture.leather_layer_1_overlay=armor_{color}_{filename[-1]}',
                f'items={items}',
            ]))

        image.putpixel((0, 0), color_int_to_tuple(color))
        if filename.endswith('1'):
            fancy_armor_1.append(image)
        else:
            fancy_armor_2.append(image)

    ctx.assets['minecraft:models/armor/leather_layer_1'] = Texture(
        stitch_texture(fancy_armor_1)
    )
    ctx.assets['minecraft:models/armor/leather_layer_2'] = Texture(
        stitch_texture(fancy_armor_2)
    )

    for path in trash:
        del ctx.assets[ArmorTexture][path]
