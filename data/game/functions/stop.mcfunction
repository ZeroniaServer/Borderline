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
execute as @a run tp @s @s
tp @a 8 4 8
gamemode adventure @a

#> Remove gridtimer bossbar
bossbar remove gridtimer

#> Change gamestate
scoreboard players set $gamestate CmdData 0