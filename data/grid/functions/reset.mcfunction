tag @e[type=marker,tag=vanished] remove vanished
function grid:solid
worldborder set 5
worldborder add -0.00001 1000000
scoreboard players set $state CmdData 0
scoreboard players operation $timer Timer = $maxtime Timer
execute as @a[gamemode=spectator,scores={Lives=1..}] at @e[type=marker,tag=!square,tag=!selected,tag=!fallen,tag=!falling,limit=1,sort=random] run tp @s ~ ~ ~
gamemode adventure @a[gamemode=spectator,scores={Lives=1..}]