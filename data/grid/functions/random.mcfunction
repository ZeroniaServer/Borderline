execute as @e[type=marker,tag=selected,limit=1] run tag @s add old
execute as @e[type=marker,tag=old,limit=1] at @s run tag @e[type=marker,tag=square,sort=random,limit=1,tag=!selected,distance=10..] add selected
tag @e[type=marker,tag=old,limit=1] remove selected
tag @e[type=marker,tag=old,limit=1] remove old
function grid:reset
execute as @e[type=marker,tag=selected,limit=1] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 red_stained_glass
execute as @e[type=marker,tag=selected,limit=1] at @s run worldborder center ~ ~