execute as @e[type=marker,tag=square,tag=!selected] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 air
execute as @e[type=marker,tag=selected,limit=1] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 lime_stained_glass
worldborder add 0.00001 1000000
scoreboard players set $timer Timer 100
scoreboard players set $state CmdData 1