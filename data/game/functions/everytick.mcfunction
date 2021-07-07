execute if score $timer Timer matches 1.. run scoreboard players remove $timer Timer 1

execute if score $state CmdData matches 1 if score $timer Timer matches 0 if score $maxtime Timer matches 105.. run scoreboard players remove $maxtime Timer 5
execute if score $state CmdData matches 1 if score $timer Timer matches 0 run scoreboard players add @a[gamemode=!spectator] Rounds 1
execute if score $state CmdData matches 1 if score $timer Timer matches 0 run function grid:random

execute if score $state CmdData matches 0 if score $timer Timer matches 0 run function grid:vanish

execute if score $state CmdData matches 0 if score $timer Timer matches 50 run function grid:transparent
execute if score $state CmdData matches 0 if score $timer Timer matches 40 run function grid:solid
execute if score $state CmdData matches 0 if score $timer Timer matches 30 run function grid:transparent
execute if score $state CmdData matches 0 if score $timer Timer matches 20 run function grid:solid
execute if score $state CmdData matches 0 if score $timer Timer matches 10 run function grid:transparent

effect give @a saturation 1000000 255 true

execute as @a[gamemode=!spectator,predicate=custom:void] run tag @s add dead
execute as @a[tag=dead] run gamemode spectator @s
execute as @a[tag=dead] run tp @s 8 20 8
execute as @a[tag=dead] run scoreboard players remove @s Lives 1
tag @a[tag=dead] remove dead