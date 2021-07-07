function borderrun:reset
tag @e[type=marker,tag=square,sort=random,limit=1,tag=!selected] add selected
execute as @e[type=marker,tag=selected,limit=1] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 lime_stained_glass
execute as @e[type=marker,tag=selected,limit=1] at @s run worldborder center ~ ~
schedule function borderrun:vanish 10s