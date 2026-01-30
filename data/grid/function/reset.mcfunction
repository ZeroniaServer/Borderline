tag @e[type=marker,tag=vanished] remove vanished
function grid:solid
execute as @e[type=marker,tag=icecheck,tag=!vanished] at @s run function powerup:icetile/setice
worldborder set 5
worldborder add -0.00001 1000000
scoreboard players set $state CmdData 0
scoreboard players operation $timer Timer = $maxtime Timer