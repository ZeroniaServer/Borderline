execute as @e[type=marker,tag=0,tag=!selected,tag=!falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 white_concrete
execute as @e[type=marker,tag=1,tag=!selected,tag=!falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 black_concrete
execute as @e[type=marker,tag=selected,limit=1,tag=!falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 red_concrete

execute as @e[type=marker,tag=0,tag=!selected,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 white_concrete_powder
execute as @e[type=marker,tag=1,tag=!selected,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 black_concrete_powder
execute as @e[type=marker,tag=selected,limit=1,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 red_concrete_powder

execute as @e[type=marker,tag=portal,tag=!fallen] at @s run function powerup:portaltile/setanchor