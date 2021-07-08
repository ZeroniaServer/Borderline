bossbar remove countdown

schedule clear grid:random
schedule clear grid:vanish
tag @e[type=marker,tag=square] remove selected
execute as @e[type=marker,tag=lifted] at @s run fill ~-2 ~-1 ~-2 ~2 ~ ~2 air
execute as @e[type=marker] at @s run tp @s ~ 3 ~
execute as @e[type=marker,tag=falling] at @s run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 air
tag @e[type=marker,tag=falling] remove falling
tag @e[type=marker,tag=fallen] remove fallen
tag @e[type=marker,tag=lifted] remove lifted
kill @e[tag=tnt,type=armor_stand]
kill @e[type=arrow]
kill @e[type=ender_pearl]
kill @e[type=marker,tag=pearltracker]
scoreboard players reset @e[type=marker,tag=exploding] blast
tag @e[type=marker,tag=exploding] remove exploding
function grid:reset
worldborder center 8 8
worldborder set 50
scoreboard players reset $timer Timer
scoreboard players reset $maxtime Timer
scoreboard players reset $state CmdData
clear @a
kill @e[type=item]

tag @a remove JoinPlay

scoreboard objectives remove GameID
scoreboard objectives add GameID dummy

team join Lobby @a
clear @a
execute as @a run tp @s @s
tp @a 8 5 8 -90 0
gamemode adventure @a

#> Remove gridtimer bossbar
bossbar remove gridtimer

#> Change gamestate
scoreboard players set $gamestate CmdData 0

#> set up lobby
function lobby:build