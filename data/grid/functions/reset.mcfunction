function grid:solid
worldborder set 5
worldborder add -0.00001 1000000
scoreboard players set $state CmdData 0
scoreboard players operation $timer Timer = $maxtime Timer
tp @a[gamemode=spectator,scores={Lives=1..}] 8 4 8
gamemode adventure @a[gamemode=spectator,scores={Lives=1..}] 