
#> Functions that run every tick
execute if score $gamestate CmdData matches 2 run function game:gridteams
execute if score $state CmdData matches 0.. run function powerup:main
execute if score $gamestate CmdData matches 2 run function game:bowcharge

#> Gridtimer bossbar
bossbar set gridtimer players @a
execute if score $state CmdData matches 0 run bossbar set gridtimer name ["",{"text":"[","bold":true,"color":"dark_red"},{"score":{"name":"$TotalRounds","objective":"Rounds"},"bold":true,"color":"gold"},{"text":"] ","bold":true,"color":"dark_red"},{"text":"Run to the red square!","bold":true,"color":"red"}]
execute if score $state CmdData matches 0 run bossbar set gridtimer color red
execute if score $state CmdData matches 0 store result bossbar gridtimer max run scoreboard players get $maxtime Timer
execute if score $state CmdData matches 1 run bossbar set gridtimer max 100
execute if score $state CmdData matches 1 run bossbar set gridtimer name ["",{"text":"[","bold":true,"color":"dark_green"},{"score":{"name":"$TotalRounds","objective":"Rounds"},"bold":true,"color":"gold"},{"text":"] ","bold":true,"color":"dark_green"},{"text":"Wait until the next round.","bold":true,"color":"green"}]
execute if score $state CmdData matches 1 run bossbar set gridtimer color green
execute store result bossbar gridtimer value run scoreboard players get $timer Timer

#> Flashing concrete stuff
execute as @e[type=marker,tag=vanished] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 air

execute if score $state CmdData matches 0 if score $timer Timer matches 1.. run scoreboard players remove $timer Timer 1
execute if score $state CmdData matches 1 if score $timer Timer matches ..99 run scoreboard players add $timer Timer 1

execute if score $state CmdData matches 1 if score $timer Timer matches 100 if score $maxtime Timer matches 55.. run scoreboard players remove $maxtime Timer 5
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run scoreboard players add @a[gamemode=!spectator] Rounds 1
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run scoreboard players add $TotalRounds Rounds 1
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run team modify Border friendlyFire true
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run execute as @a at @s run playsound minecraft:entity.shulker_bullet.hit master @s ~ ~ ~ 2 0.7
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run function grid:random

execute if score $state CmdData matches 0 if score $timer Timer matches 0 run bossbar set gridtimer color red
execute if score $state CmdData matches 0 if score $timer Timer matches 0 run team modify Border friendlyFire false
execute if score $state CmdData matches 0 if score $timer Timer matches 0 run function grid:vanish

execute if score $state CmdData matches 0 if score $timer Timer matches 50 run function grid:transparent
execute if score $state CmdData matches 0 if score $timer Timer matches 50 run execute as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 2 0.5
execute if score $state CmdData matches 0 if score $timer Timer matches 40 run function grid:solid
execute if score $state CmdData matches 0 if score $timer Timer matches 30 run function grid:transparent
execute if score $state CmdData matches 0 if score $timer Timer matches 30 run execute as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 2 0.7
execute if score $state CmdData matches 0 if score $timer Timer matches 20 run function grid:solid
execute if score $state CmdData matches 0 if score $timer Timer matches 10 run function grid:transparent
execute if score $state CmdData matches 0 if score $timer Timer matches 10 run execute as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 2 0.9
execute if score $state CmdData matches 0 if score $timer Timer matches 1 run execute as @a at @s run playsound minecraft:entity.shulker_bullet.hit master @s ~ ~ ~ 2 0
execute if score $state CmdData matches 0 if score $timer Timer matches 1 run execute as @a at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 2 0.95

#> Death stuff
execute as @a[gamemode=!spectator,predicate=custom:void] run tag @s add dead

execute as @a[gamemode=!spectator,tag=!wall] at @s if block ~ ~-1 ~ tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,tag=!wall] at @s if block ~0.2 ~-1 ~ tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,tag=!wall] at @s if block ~-0.2 ~-1 ~ tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,tag=!wall] at @s if block ~ ~-1 ~0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,tag=!wall] at @s if block ~ ~-1 ~-0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,tag=!wall] at @s if block ~0.2 ~-1 ~0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,tag=!wall] at @s if block ~0.2 ~-1 ~-0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,tag=!wall] at @s if block ~-0.2 ~-1 ~-0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,tag=!wall] at @s if block ~-0.2 ~-1 ~0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
tellraw @a[gamemode=!spectator,tag=wall] {"text":"Don't stand on the wall!","color":"red"}
tag @a[gamemode=!spectator,tag=wall] add dead
tag @a[gamemode=!spectator,tag=wall] remove wall

effect clear @a[tag=dead]
tag @a[tag=dead] remove SmokeBombed
execute as @a[tag=dead] run gamemode spectator @s
execute as @a[tag=dead] run tp @s 8 20 8
execute as @a[tag=dead] run clear @s #custom:powerups
execute as @a[tag=dead] run scoreboard players remove @s Lives 1
tag @a[tag=dead,scores={Lives=1..}] add ChargeArrow
execute as @a[tag=dead] run title @s title {"text":"You died!","color":"dark_aqua"}
execute as @a[tag=dead,scores={Lives=2..}] run title @s subtitle ["",{"score":{"name":"@s","objective":"Lives"},"color":"blue"},{"text":" lives remaining.","color":"gold"}]
execute as @a[tag=dead,scores={Lives=1}] run title @s subtitle ["",{"score":{"name":"@s","objective":"Lives"},"color":"blue"},{"text":" life remaining.","color":"gold"}]
execute as @a[tag=dead,scores={Lives=..0}] run title @s subtitle {"text":"Better luck next time!","color":"red"}
execute as @a[tag=dead,scores={Lives=3..}] run item replace entity @s armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"green","italic":false}]',color:65315},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[tag=dead,scores={Lives=2}] run item replace entity @s armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"gold","italic":false}]',color:16753152},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[tag=dead,scores={Lives=1}] run item replace entity @s armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"red","italic":false}]',color:16711680},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
tag @a[tag=dead] remove dead

#> Lobby players and relogs
effect give @a saturation 1000000 255 true
effect give @a resistance 1000000 255 true
function game:nodrop
execute as @a[team=] run team join Lobby
#TODO maybe change this to Spectator when the game is running
execute as @a[scores={leaveGame=1..}] run team join Lobby
execute as @a[scores={leaveGame=1..}] run clear @s
execute as @a[scores={leaveGame=1..}] if score $gamestate CmdData matches 2 run scoreboard players reset @s GameID
tag @a[scores={leaveGame=1..}] remove JoinPlay
execute as @a[scores={leaveGame=1..}] run gamemode adventure @s
execute as @a[scores={leaveGame=1..}] run tp @s 8 5 8 -90 0
execute as @a[scores={leaveGame=1..}] run scoreboard players reset @s Rounds
execute as @a[scores={leaveGame=1..}] run scoreboard players reset @s Lives
scoreboard players reset @a leaveGame
execute unless score $gamestate CmdData matches 2 run function lobby:main
tag @a[team=!Black,team=!White,team=!Border] remove LastStanding

#> End conditions - TODO add titles?
#No more players with lives
execute if score $gamestate CmdData matches 2 unless entity @a[scores={Lives=2..}] run tag @a add LastStanding
execute if score $gamestate CmdData matches 2 if entity @a[scores={Lives=2..}] run tag @a remove LastStanding
execute unless entity @a[scores={Lives=1..}] if score $gamestate CmdData matches 2 run tellraw @a ["",{"text":"=========== ","color":"dark_gray"},{"text":"Borderline","bold":true,"color":"white"},{"text":" ===========","color":"dark_gray"},"\n",{"text":"Game Over!","color":"red"},"\n",{"text":"Round reached: ","color":"dark_aqua"},{"score":{"name":"$TotalRounds","objective":"Rounds"},"bold":true,"color":"gold"},"\n",{"text":"Most rounds survived: ","color":"dark_aqua"},{"selector":"@a[tag=LastStanding]","bold":true,"color":"gold"},{"text":" (","color":"dark_aqua"},{"score":{"name":"@p[tag=LastStanding]","objective":"Rounds"},"bold":true,"color":"gold"},{"text":")","color":"dark_aqua"},"\n"]
execute unless entity @a[scores={Lives=1..}] if score $gamestate CmdData matches 2 run function game:stop

#Only one tile left
execute if score $gamestate CmdData matches 2 store result score $tiles CmdData if entity @e[type=marker,tag=square,tag=!fallen]
execute if score $gamestate CmdData matches 2 if score $tiles CmdData matches ..1 run function game:stop

#> Kick people with the wrong GameID out of the game.
execute as @a[team=!Spectator,team=!Lobby] unless score @s GameID = $GameID GameID run clear @s
execute as @a[team=!Spectator,team=!Lobby] unless score @s GameID = $GameID GameID run tag @s remove JoinPlay
execute as @a[team=!Spectator,team=!Lobby] unless score @s GameID = $GameID GameID run tellraw @s {"text":"There is currently a game ongoing. Please wait for this game to end.","color":"blue"}
execute as @a[team=!Spectator,team=!Lobby] unless score @s GameID = $GameID GameID run gamemode spectator @s
execute as @a[team=!Spectator,team=!Lobby] unless score @s GameID = $GameID GameID run scoreboard players reset @s GameID
execute as @a[team=!Spectator,team=!Lobby] unless score @s GameID = $GameID GameID run team join Spectator @s