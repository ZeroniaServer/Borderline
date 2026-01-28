item replace entity @s contents from block 0 184 -16 container.0

function custom:resolve_text_component {text_component:{selector:"@s"},write_to:"storage borderline:main crafting.item_name.with[0].extra[0]"}
data modify storage borderline:main crafting.item_name.with[0].extra[0] set from storage borderline:main crafting.item_name.with[0].extra[0].hover_event.name

kill @s
