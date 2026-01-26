playsound block.respawn_anchor.deplete block @a ~ ~ ~ 1 1
particle minecraft:reverse_portal ~ ~1 ~ 0 0 0 3 50 force
scoreboard players remove @e[type=marker,tag=!fallen,tag=portal,limit=1,sort=nearest] portaluse 1
execute as @e[type=marker,tag=portal,tag=!fallen,tag=!falling,limit=1,sort=nearest] at @s run function powerup:portaltile/setanchor
execute at @e[type=marker,tag=portal,tag=!fallen,limit=1,sort=random,distance=5..] run tp @s ~ ~1 ~
execute at @s run playsound block.respawn_anchor.deplete block @a ~ ~ ~ 1 1
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 0 0 0 3 50 force
execute at @s run scoreboard players remove @e[type=marker,tag=!fallen,tag=portal,limit=1,sort=nearest] portaluse 1
execute at @s as @e[type=marker,tag=portal,tag=!fallen,tag=!falling,limit=1,sort=nearest] at @s run function powerup:portaltile/setanchor
tag @s add teleported