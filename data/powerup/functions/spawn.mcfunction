execute as @e[type=marker,tag=square,limit=1,sort=random,tag=!selected] at @s run loot spawn ~ ~2 ~ loot powerup:items
execute as @e[type=item,limit=1] run data modify entity @s CustomName set from entity @s Item.tag.display.Name
data merge entity @e[type=item,limit=1] {Glowing:1b,CustomNameVisible:1b}