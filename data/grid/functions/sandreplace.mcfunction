summon falling_block ~ ~ ~ {Time:1,BlockState:{Name:"minecraft:lime_concrete_powder"},Tags:["red"]}
data modify entity @e[type=falling_block,tag=red,distance=..1,limit=1,sort=nearest] Motion set from entity @s Motion
data modify entity @e[type=falling_block,tag=red,distance=..1,limit=1,sort=nearest] Time set from entity @s Time
kill @s