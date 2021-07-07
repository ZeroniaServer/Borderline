execute as @e[type=marker,tag=0,tag=!selected] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 white_stained_glass
execute as @e[type=marker,tag=1,tag=!selected] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 black_stained_glass
execute as @e[type=marker,tag=selected,limit=1] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 red_stained_glass