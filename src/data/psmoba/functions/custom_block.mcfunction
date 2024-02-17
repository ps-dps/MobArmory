
append function_tag smithed.custom_block:event/on_place { "values": [ "psmoba:custom_block/place" ]}
function ~/place:
    if block ~ ~ ~ furnace if data storage smithed.custom_block:main {blockApi:{id:"psmoba:crafter"}} function ./crafter/place
