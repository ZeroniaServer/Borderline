execute if score $state CmdData matches 0.. run function game:stop
scoreboard players set $maxtime Timer 200
tag @e[type=marker,tag=square,sort=random,limit=1,tag=!selected] add selected
function grid:random
gamemode adventure @a
tp @a 8 4 8