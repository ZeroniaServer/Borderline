execute as @e[type=marker,tag=square,tag=!selected] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 air
execute as @e[type=marker,tag=selected,limit=1] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 lime_concrete
worldborder add 0.001 1000000
scoreboard players set $state CmdData 1