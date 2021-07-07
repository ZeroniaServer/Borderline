tag @e[type=marker,tag=selected] remove selected
execute as @e[type=marker,tag=0] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 white_stained_glass
execute as @e[type=marker,tag=1] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 black_stained_glass
worldborder set 5