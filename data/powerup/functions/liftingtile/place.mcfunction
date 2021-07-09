execute if predicate custom:liftrange run tag @e[type=marker,tag=square,limit=1,sort=nearest,tag=!lifting,tag=!fallen] add lifting
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] at @s run playsound minecraft:block.piston.extend master @a ~ ~ ~ 1 1
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] at @s run clone ~-2 ~-1 ~-2 ~2 ~ ~2 ~-2 ~1 ~-2 replace move
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] if entity @s[tag=exploding] at @s as @e[type=armor_stand,tag=tnt,sort=nearest,limit=1] at @s run tp @s ~ ~2 ~
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] if entity @s[tag=portal] at @s as @e[type=armor_stand,tag=anchor,sort=nearest,limit=1] at @s run tp @s ~ ~2 ~
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] at @s positioned ~-2.75 ~ ~-2.75 as @a[dx=2.75,dy=4,dz=2.75] at @s run tp @s @s
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] at @s positioned ~-2.75 ~ ~-2.75 as @a[dx=2.75,dy=4,dz=2.75] at @s run tp @s ~ ~3 ~
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] at @s positioned ~-2 ~ ~-2 as @e[type=item,dx=2,dy=4,dz=2] at @s run tp @s ~ ~3 ~
execute as @e[type=marker,tag=lifting,limit=1,sort=nearest] at @s run tp @s ~ ~2 ~
execute as @e[type=marker,tag=lifting] run tag @s add lifted
execute as @e[type=marker,tag=lifted] run tag @s remove lifting
kill @s