
#> Functions that run every tick
execute if score $gamestate CmdData matches 2 run function game:gridteams

#> Gridtimer bossbar
bossbar set gridtimer players @a
execute if score $state CmdData matches 0 run bossbar set gridtimer color red
execute if score $state CmdData matches 0 store result bossbar gridtimer max run scoreboard players get $maxtime Timer
execute if score $state CmdData matches 1 run bossbar set gridtimer max 100
execute if score $state CmdData matches 1 run bossbar set gridtimer color green
execute store result bossbar gridtimer value run scoreboard players get $timer Timer

#> Flashing concrete stuff
execute if score $state CmdData matches 0 if score $timer Timer matches 1.. run scoreboard players remove $timer Timer 1
execute if score $state CmdData matches 1 if score $timer Timer matches ..99 run scoreboard players add $timer Timer 1

execute if score $state CmdData matches 1 if score $timer Timer matches 100 if score $maxtime Timer matches 105.. run scoreboard players remove $maxtime Timer 5
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run scoreboard players add @a[gamemode=!spectator] Rounds 1
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run function grid:random

execute if score $state CmdData matches 0 if score $timer Timer matches 0 run bossbar set gridtimer color red
execute if score $state CmdData matches 0 if score $timer Timer matches 0 run function grid:vanish

execute if score $state CmdData matches 0 if score $timer Timer matches 50 run function grid:transparent
execute if score $state CmdData matches 0 if score $timer Timer matches 40 run function grid:solid
execute if score $state CmdData matches 0 if score $timer Timer matches 30 run function grid:transparent
execute if score $state CmdData matches 0 if score $timer Timer matches 20 run function grid:solid
execute if score $state CmdData matches 0 if score $timer Timer matches 10 run function grid:transparent

execute if score $state CmdData matches 0.. run function powerup:main

#> Death stuff
execute as @a[gamemode=!spectator,predicate=custom:void] run tag @s add dead
execute as @a[tag=dead] run gamemode spectator @s
execute as @a[tag=dead] run tp @s 8 20 8
execute as @a[tag=dead] run clear @s
execute as @a[tag=dead] run scoreboard players remove @s Lives 1
execute as @a[tag=dead] run title @s title {"text":"You died!","color":"dark_aqua"}
execute as @a[tag=dead,scores={Lives=1..}] run title @s subtitle ["",{"score":{"name":"@s","objective":"Lives"},"color":"blue"},{"text":" lives remaining","color":"gold"}]
execute as @a[tag=dead,scores={Lives=..0}] run title @s subtitle {"text":"Better luck next time","color":"red"}
execute as @a[tag=dead,scores={Lives=3..}] run item replace entity @s armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"green","italic":false}]',color:65315},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[tag=dead,scores={Lives=2}] run item replace entity @s armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"gold","italic":false}]',color:16753152},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[tag=dead,scores={Lives=1}] run item replace entity @s armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"red","italic":false}]',color:16711680},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
tag @a[tag=dead] remove dead

execute unless entity @a[scores={Lives=1..}] if score $state CmdData matches 0.. run function game:stop

#> Miscellaneous
effect give @a saturation 1000000 255 true
effect give @a resistance 1000000 255 true
function game:nodrop