tag @e[type=marker,tag=square,limit=1,sort=nearest,tag=!lifting,tag=!fallen] add lifting
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] at @s run playsound minecraft:block.piston.extend master @a ~ ~ ~ 1 1
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] at @s run clone ~-2 ~-1 ~-2 ~2 ~ ~2 ~-2 ~1 ~-2 replace move
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] if entity @s[tag=exploding] at @s as @e[type=armor_stand,tag=tnt,sort=nearest,limit=1] at @s run tp @s ~ ~2 ~
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] at @s positioned ~-2 ~ ~-2 as @a[dx=2,dy=2,dz=2] at @s run tp @s ~ ~2 ~
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] at @s run tp @s ~ ~2 ~
kill @s