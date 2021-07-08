schedule clear grid:random
schedule clear grid:vanish
tag @e[type=marker,tag=square] remove selected
function grid:reset
worldborder center 8 8
worldborder set 50
scoreboard players reset $timer Timer
scoreboard players reset $maxtime Timer
scoreboard players reset $state CmdData
clear @a
kill @e[type=item]
kill @e[tag=tnt,type=armor_stand]
scoreboard players reset @e[type=marker,tag=exploding] blast
tag @e[type=marker,tag=exploding] remove exploding
execute as @e[type=marker,tag=falling] at @s run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 air
tag @e[type=marker,tag=falling] remove falling
tag @e[type=marker,tag=fallen] remove fallen

team join Lobby @a
clear @a
execute as @a run tp @s @s
tp @a 8 4 8
gamemode adventure @a

#> Remove gridtimer bossbar
bossbar remove gridtimer

#> Change gamestate
scoreboard players remove $gamestate CmdData 1