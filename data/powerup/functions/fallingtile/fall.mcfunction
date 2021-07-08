fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 air
execute as @s[tag=0,tag=!selected] run fill ~-2 ~ ~-2 ~2 ~ ~2 white_concrete_powder
execute as @s[tag=1,tag=!selected] run fill ~-2 ~ ~-2 ~2 ~ ~2 black_concrete_powder
execute as @s[tag=selected] if score $state CmdData matches 0 run fill ~-2 ~ ~-2 ~2 ~ ~2 red_concrete_powder
execute as @s[tag=selected] if score $state CmdData matches 1 run fill ~-2 ~ ~-2 ~2 ~ ~2 lime_concrete_powder
tag @s add fallen