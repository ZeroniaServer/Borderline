tag @e[type=marker,tag=square,limit=1,sort=random,tag=!selected,tag=!fallen] add spawnLocation
scoreboard players add @e[type=marker,tag=spawnLocation] CmdData 1
execute as @e[type=marker,tag=spawnLocation,scores={CmdData=..10}] at @s positioned ~-2.8 ~ ~-2.8 if entity @a[dx=5.6,dy=2,dz=5.6] run tag @s remove spawnLocation
execute as @e[type=marker,tag=spawnLocation,scores={CmdData=..10}] at @s positioned ~-2.8 ~ ~-2.8 if entity @e[type=item,dx=5.6,dy=2,dz=5.6] run tag @s remove spawnLocation
execute if entity @e[type=marker,tag=spawnLocation] run scoreboard players reset @e[type=marker,tag=square] CmdData
execute unless entity @e[type=marker,tag=spawnLocation] run function powerup:selectlocation