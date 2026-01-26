tag @e[type=marker,tag=square,limit=1,sort=nearest,distance=..5] add current
scoreboard players add @e[type=marker,tag=current] lifts 0
tag @e[type=marker,tag=current,tag=!lifting,tag=!fallen,scores={lifts=..2}] add lifting
execute as @e[type=marker,tag=current,tag=lifting] at @s run playsound minecraft:block.piston.extend master @a ~ ~ ~ 1 1
execute as @e[type=marker,tag=current,tag=lifting] at @s run clone ~-2 ~-1 ~-2 ~2 ~ ~2 ~-2 ~1 ~-2 replace move
execute as @e[type=marker,tag=current,tag=lifting] if entity @s[tag=exploding] at @s as @e[type=block_display,tag=tnt,sort=nearest,limit=1] at @s run tp @s ~ ~2 ~
execute as @e[type=marker,tag=current,tag=lifting] at @s positioned ~-2.8 ~ ~-2.8 as @a[team=Player,gamemode=!spectator,dx=5.6,dy=4,dz=5.6] at @s run tp @s @s
execute as @e[type=marker,tag=current,tag=lifting] at @s positioned ~-2.8 ~ ~-2.8 as @a[team=Player,gamemode=!spectator,dx=5.6,dy=4,dz=5.6] at @s run tp @s ~ ~4 ~
execute as @e[type=marker,tag=current,tag=lifting] at @s positioned ~-2.8 ~ ~-2.8 as @e[type=item,dx=5.6,dy=4,dz=5.6] at @s run tp @s ~ ~4 ~
execute as @e[type=marker,tag=current,tag=lifting] at @s positioned ~-2.8 ~ ~-2.8 as @e[type=zoglin,dx=5.6,dy=4,dz=5.6] at @s run tp @s ~ ~4 ~
execute as @e[type=marker,tag=current,tag=lifting] at @s run tp @s ~ ~2 ~
scoreboard players add @e[type=marker,tag=current,tag=lifting] lifts 1
tag @e[type=marker,tag=current,tag=lifting] add lifted
tag @e[type=marker,tag=current,tag=lifted] remove lifting
tag @e[type=marker,tag=current] remove current
function powerup:deduct
execute if entity @s[scores={CmdData=1..}] at @s run function powerup:liftingtile/place