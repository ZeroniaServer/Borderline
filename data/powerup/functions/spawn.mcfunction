tag @e[type=marker,tag=square,limit=1,sort=random,tag=!selected,tag=!fallen] add spawnLocation
execute as @e[type=marker,tag=spawnLocation,limit=1] at @s run loot spawn ~ ~1 ~ loot powerup:items
execute as @e[type=marker,tag=spawnLocation,limit=1] at @s as @e[type=item,limit=1,sort=nearest,tag=!PowerupSpawn] run data modify entity @s CustomName set from entity @s Item.tag.display.Name
execute as @e[type=marker,tag=spawnLocation,limit=1] at @s as @e[type=item,limit=1,sort=nearest,tag=!PowerupSpawn] run data merge entity @s {Glowing:1b,CustomNameVisible:1b,Tags:["PowerupSpawn"]}
tag @e[type=marker,tag=spawnLocation] remove spawnLocation