execute as @s[tag=!tracked] run summon marker ~ ~ ~ {Tags:["pearltracker"]}
tag @s add tracked
execute as @s[tag=tracked] run tp @e[type=marker,tag=pearltracker,limit=1,sort=nearest,distance=..3] ~ ~ ~
execute store result score @s CmdData if entity @e[type=marker,tag=pearltracker,distance=..0.1]
execute if score @s CmdData matches 2.. run kill @e[type=marker,tag=pearltracker,distance=..0.1,limit=1]
execute if score @s CmdData matches 0 run tag @s remove tracked