execute if score $state CmdData matches 0.. run function game:stop
scoreboard players set $maxtime Timer 200
tag @e[type=marker,tag=square,sort=random,limit=1,tag=!selected] add selected
function grid:random
gamemode adventure @a
tp @a 8 4 8

title @a title {"text":"Go!","color":"dark_aqua"}
title @a subtitle {"text":"Keep your enemies beyond the borders","color":"gold"}

#> Add gridtimer bossbar
bossbar add gridtimer " "
bossbar set gridtimer max 200
bossbar set gridtimer color red
scoreboard players set @a Lives 3
scoreboard players set @a Rounds 0
