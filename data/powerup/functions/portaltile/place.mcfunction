tag @e[type=marker,tag=square,limit=1,sort=nearest,tag=!fallen] add portal
scoreboard players set @e[type=marker,tag=portal,limit=1,sort=nearest] portaluse 3
execute as @e[type=marker,tag=portal] at @s run function powerup:portaltile/setanchor
execute as @e[type=marker,tag=portal,limit=1,sort=nearest] at @s run playsound minecraft:block.respawn_anchor.charge master @a ~ ~ ~ 0.5 0.8
execute as @e[type=marker,tag=portal,limit=1,sort=nearest] at @s run playsound minecraft:block.portal.trigger master @a ~ ~ ~ 0.5 2
kill @s