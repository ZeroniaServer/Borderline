execute as @e[type=marker,tag=square,tag=!selected] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 air
execute as @e[type=marker,tag=selected,limit=1,tag=!falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 lime_concrete
execute as @e[type=marker,tag=selected,limit=1,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 lime_concrete_powder
worldborder add 0.00001 1000000
scoreboard players set $state CmdData 1
item replace entity @e[tag=tnt,type=armor_stand] armor.head with air