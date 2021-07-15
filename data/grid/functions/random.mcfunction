execute as @e[type=marker,tag=selected,limit=1] run tag @s add old
execute as @e[type=marker,tag=old,limit=1] at @s run tag @e[type=marker,tag=square,sort=random,limit=1,tag=!selected,tag=!fallen,tag=!old,distance=10..] add selected
execute if entity @e[type=marker,tag=old,tag=!fallen,tag=!falling,limit=1] run tag @a[gamemode=spectator,scores={Lives=1..}] add goback
execute as @a[gamemode=spectator,scores={Lives=1..}] at @s run function game:respawn
tag @e[type=marker,tag=old] remove selected
tag @e[type=marker,tag=old] remove old
function grid:reset
function powerup:spawn
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 0
execute as @e[type=marker,tag=selected,limit=1] at @s run worldborder center ~ ~
item replace entity @e[type=armor_stand,tag=tnt] armor.head with tnt