tp @s @s
execute as @s[tag=goback] at @e[type=marker,tag=old,tag=!fallen,tag=!falling,limit=1] run tp @s ~ ~2 ~
execute as @s[tag=!goback] at @e[type=marker,tag=selected,tag=!old,limit=1] at @e[type=marker,tag=square,tag=!selected,tag=!fallen,tag=!falling,limit=1,sort=random,distance=10..20] run tp @s ~ ~2 ~
execute at @s facing entity @e[type=marker,tag=selected,limit=1] eyes run tp @s ~ ~ ~ ~ ~
tag @s remove goback
gamemode adventure @s