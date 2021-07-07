execute as @e[type=marker,tag=0] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 white_stained_glass
execute as @e[type=marker,tag=1] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 black_stained_glass
worldborder set 5
worldborder add -0.00001 1000000
scoreboard players set $state CmdData 0
scoreboard players operation $timer Timer = $maxtime Timer