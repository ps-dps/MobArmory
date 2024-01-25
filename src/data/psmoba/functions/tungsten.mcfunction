

append function_tag tungsten:swap/mainhand {"values":["psmoba:tungsten/mainhand"]}
append function_tag tungsten:swap/offhand {"values":["psmoba:tungsten/offhand"]}
append function_tag tungsten:swap/head {"values":["psmoba:tungsten/head"]}
append function_tag tungsten:swap/chest {"values":["psmoba:tungsten/chest"]}
append function_tag tungsten:swap/legs {"values":["psmoba:tungsten/legs"]}
append function_tag tungsten:swap/feet {"values":["psmoba:tungsten/feet"]}

function ~/mainhand:
    store result score @s psmoba.mainhand data get storage tungsten:player Item.tag.psmoba.nid

function ~/offhand:
    store result score @s psmoba.offhand data get storage tungsten:player Item.tag.psmoba.nid

function ~/head:
    store result score @s psmoba.head data get storage tungsten:player Item.tag.psmoba.nid

function ~/chest:
    store result score @s psmoba.chest data get storage tungsten:player Item.tag.psmoba.nid

function ~/legs:
    store result score @s psmoba.legs data get storage tungsten:player Item.tag.psmoba.nid

function ~/feet:
    store result score @s psmoba.feet data get storage tungsten:player Item.tag.psmoba.nid
