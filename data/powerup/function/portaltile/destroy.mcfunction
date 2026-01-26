execute as @s[tag=0,tag=!selected,tag=!falling,tag=!fallen] run setblock ~ ~ ~ white_concrete
execute as @s[tag=1,tag=!selected,tag=!falling,tag=!fallen] run setblock ~ ~ ~ black_concrete
execute as @s[tag=selected,tag=!falling,tag=!fallen] if score $state CmdData matches 0 run setblock ~ ~ ~ red_concrete
execute as @s[tag=selected,tag=!falling,tag=!fallen] if score $state CmdData matches 1 run setblock ~ ~ ~ lime_concrete
scoreboard players reset @s portaluse
tag @s remove portal