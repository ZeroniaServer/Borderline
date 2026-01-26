execute as @e[type=marker,tag=square,tag=!selected] run tag @s add vanished
execute as @e[type=marker,tag=vanished] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 air
execute as @e[type=marker,tag=selected,limit=1,tag=!falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 lime_concrete
execute as @e[type=marker,tag=selected,limit=1,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 lime_concrete_powder
execute as @e[type=marker,tag=selected,limit=1,tag=portal] at @s run function powerup:portaltile/setanchor
execute as @e[type=falling_block,nbt={BlockState:{Name:"minecraft:red_concrete_powder"}}] at @s run function grid:sandreplace
worldborder add 0.00001 1000000
scoreboard players set $state CmdData 1
execute as @e[type=block_display,tag=tnt] run data merge entity @s {block_state:{Name:"air"}}