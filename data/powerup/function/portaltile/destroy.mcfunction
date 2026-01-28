execute at @s[tag=0,tag=!selected,tag=!falling,tag=!fallen] run setblock ~ ~ ~ white_concrete strict
execute at @s[tag=1,tag=!selected,tag=!falling,tag=!fallen] run setblock ~ ~ ~ black_concrete strict
execute at @s[tag=selected,tag=!falling,tag=!fallen] if score $state CmdData matches 0 run setblock ~ ~ ~ red_concrete strict
execute at @s[tag=selected,tag=!falling,tag=!fallen] if score $state CmdData matches 1 run setblock ~ ~ ~ lime_concrete strict
execute at @s run kill @n[type=interaction,tag=anchorblocker,distance=..1]
execute at @s[tag=ice] as @n[type=marker,tag=icecheck] at @s run function powerup:icetile/setice
scoreboard players reset @s portaluse
tag @s remove portal