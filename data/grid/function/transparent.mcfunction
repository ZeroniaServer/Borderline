execute as @e[type=marker,tag=0,tag=!selected,tag=!fallen,tag=!ice] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 white_stained_glass strict
execute as @e[type=marker,tag=1,tag=!selected,tag=!fallen,tag=!ice] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 black_stained_glass strict
execute as @e[type=marker,tag=selected,limit=1,tag=!fallen,tag=!ice] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 red_stained_glass strict

execute as @e[type=marker,tag=portal,tag=!fallen,tag=!portalfalling] at @s run function powerup:portaltile/setanchor