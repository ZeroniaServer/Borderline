
#> Functions that run every tick
execute if score $gamestate CmdData matches 2 run function game:gridteams
execute if score $state CmdData matches 0.. run function powerup:main
execute if score $gamestate CmdData matches 2 run function game:bowcharge

#> First join players
scoreboard players set @a[scores={firstjoin=0}] firstjoin 1
scoreboard players add @a firstjoin 0
execute as @a[scores={firstjoin=0}] run gamemode adventure @s
execute as @a[scores={firstjoin=0}] run scoreboard players add @s leaveGame 1
execute as @a[scores={firstjoin=0}] run title @s title [{"text":"Borderline","color":"white","bold":true}]
execute as @a[scores={firstjoin=0}] run title @s subtitle [{"text":"A game by ","color":"gold"},{"text":"YZEROgame","color":"#00DB19"},{"text":" and ","color":"gold"},{"text":"Evtema3","color":"red"}]
execute as @a[scores={firstjoin=0}] at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0.2
execute as @a[scores={firstjoin=0}] at @s run playsound minecraft:entity.firework_rocket.twinkle_far master @s ~ ~ ~ 1 1.5

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
execute if score $state CmdData matches 1 if score $timer Timer matches 100 as @e[type=marker,tag=selected,tag=!fallen] at @s positioned ~-2.8 ~ ~-2.8 run scoreboard players add @a[gamemode=!spectator,team=Player,dx=5.6,dy=4,dz=5.6] Rounds 1
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run scoreboard players add $TotalRounds Rounds 1
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run team modify Player friendlyFire true
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run execute as @a at @s run playsound minecraft:entity.shulker_bullet.hit master @s ~ ~ ~ 2 0.7
execute if score $state CmdData matches 1 if score $timer Timer matches 100 run function grid:random

execute if score $state CmdData matches 0 if score $timer Timer matches 0 run bossbar set gridtimer color red
execute if score $state CmdData matches 0 if score $timer Timer matches 0 run team modify Player friendlyFire false
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
execute as @a[predicate=custom:void] run tag @s add dead
execute as @a[gamemode=!spectator,team=Player,predicate=custom:void] run tellraw @a ["",{"selector":"@s","bold":false,"color":"gray"},{"text":" fell in the void.","color":"red"}]
execute as @a[gamemode=!spectator,team=Player,tag=!wall] at @s if block ~ ~-1 ~ tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,team=Player,tag=!wall] at @s if block ~0.2 ~-1 ~ tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,team=Player,tag=!wall] at @s if block ~-0.2 ~-1 ~ tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,team=Player,tag=!wall] at @s if block ~ ~-1 ~0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,team=Player,tag=!wall] at @s if block ~ ~-1 ~-0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,team=Player,tag=!wall] at @s if block ~0.2 ~-1 ~0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,team=Player,tag=!wall] at @s if block ~0.2 ~-1 ~-0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,team=Player,tag=!wall] at @s if block ~-0.2 ~-1 ~-0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,team=Player,tag=!wall] at @s if block ~-0.2 ~-1 ~0.2 tinted_glass run tag @s[nbt={OnGround:1b}] add wall
execute as @a[gamemode=!spectator,team=Player,tag=wall,predicate=custom:abovewall] run tellraw @a ["",{"selector":"@s","bold":false,"color":"gray"},{"text":" stood on the wall.","color":"red"}]
tag @a[gamemode=!spectator,team=Player,tag=wall,predicate=custom:abovewall] add dead
execute as @a[gamemode=!spectator,team=Player,tag=wall,predicate=!custom:abovewall] at @s run function game:getoutofwall

tag @a[gamemode=!spectator,team=Player,tag=wall] remove wall

tag @a[team=Player,scores={Lives=1..},tag=dead] add LastStanding
effect clear @a[tag=dead]
tag @a[tag=dead] remove SmokeBombed
execute as @a[team=Player,tag=dead] run gamemode spectator @s
execute as @a[team=Player,tag=dead] run tp @s 8 20 8
execute as @a[team=Player,tag=dead,scores={Lives=..0}] run tag @s remove dead
execute as @a[team=Spectator,tag=dead] run tp @s 8 20 8
execute as @a[team=Lobby,tag=dead] run tp @s 8 5 8
execute as @a[team=Player,tag=dead] run clear @s #custom:powerups
execute as @a[team=Player,tag=dead] run scoreboard players remove @s Lives 1
tag @a[team=Player,tag=dead,scores={Lives=1..}] add ChargeArrow
execute as @a[team=Player,tag=dead] run title @s title {"text":"You died!","color":"dark_aqua"}
execute as @a[team=Player,tag=dead,scores={Lives=2..}] run title @s subtitle ["",{"score":{"name":"@s","objective":"Lives"},"color":"blue"},{"text":" lives remaining.","color":"gold"}]
execute as @a[team=Player,tag=dead,scores={Lives=1}] run title @s subtitle ["",{"score":{"name":"@s","objective":"Lives"},"color":"blue"},{"text":" life remaining.","color":"gold"}]
execute as @a[team=Player,tag=dead,scores={Lives=..0}] run title @s subtitle {"text":"Better luck next time!","color":"red"}
execute as @a[team=Player,tag=dead,scores={Lives=..0}] at @s run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 0.4 2
execute as @a[team=Player,tag=dead,scores={Lives=..0}] unless score @s Rounds matches 1 run tellraw @a ["",{"selector":"@s","bold":true,"color":"gray"},{"text":" was eliminated after surviving ","color":"red"},{"score":{"name":"@s","objective":"Rounds"},"color":"gold"},{"text":" rounds!","color":"red"}]
execute as @a[team=Player,tag=dead,scores={Lives=..0}] if score @s Rounds matches 1 run tellraw @a ["",{"selector":"@s","bold":true,"color":"gray"},{"text":" was eliminated after surviving ","color":"red"},{"score":{"name":"@s","objective":"Rounds"},"color":"gold"},{"text":" round!","color":"red"}]
execute as @a[team=Player,tag=dead] run function game:lifeboots
tag @a[tag=dead] remove dead

#> Lobby players and relogs
effect give @a saturation 1000000 255 true
effect give @a resistance 1000000 255 true
effect give @a night_vision 1000000 255 true
function game:nodrop
execute as @a[scores={leaveGame=1..}] run scoreboard players reset @s GameID
execute if score $gamestate CmdData matches 0 as @a[scores={leaveGame=1..}] run team join Lobby
execute if score $gamestate CmdData matches 0 as @a[scores={leaveGame=1..}] run gamemode adventure @s
execute if score $gamestate CmdData matches 2 as @a[scores={leaveGame=1..}] run team join Spectator
execute if score $gamestate CmdData matches 2 as @a[scores={leaveGame=1..}] run gamemode spectator @s
execute if score $gamestate CmdData matches 2 run tellraw @a[scores={leaveGame=1..}]  {"text":"There is currently a game ongoing. Please wait for this game to end.","color":"blue"}
execute as @a[scores={leaveGame=1..}] run clear @s
tag @a[scores={leaveGame=1..}] remove JoinPlay
execute as @a[scores={leaveGame=1..}] run tp @s 8 5 8 -90 0
execute as @a[scores={leaveGame=1..}] run scoreboard players reset @s Rounds
execute as @a[scores={leaveGame=1..}] run scoreboard players reset @s Lives
execute as @a[scores={leaveGame=1..,firstjoin=1..}] run title @s clear
scoreboard players reset @a leaveGame
execute unless score $gamestate CmdData matches 2 run function lobby:main
tag @a[team=!Player] remove LastStanding

#> End conditions
#No more players with lives
execute if entity @a[team=Player,scores={Lives=1..}] run tag @a[tag=LastStanding] remove LastStanding
execute unless entity @a[team=Player,scores={Lives=1..}] if score $gamestate CmdData matches 2 run tellraw @a ["",{"text":"\n=========== ","color":"dark_gray"},{"text":"Borderline","bold":true,"color":"white"},{"text":" ===========","color":"dark_gray"},"\n",{"text":"Game Over!","color":"red"},"\n",{"text":"Round reached: ","color":"dark_aqua"},{"score":{"name":"$TotalRounds","objective":"Rounds"},"bold":true,"color":"gold"}]
execute unless entity @a[team=Player,scores={Lives=1..}] if score $gamestate CmdData matches 2 if entity @a[tag=LastStanding] run tellraw @a ["",{"text":"Most rounds survived: ","color":"dark_aqua"},{"selector":"@a[tag=LastStanding]","bold":true,"color":"gold"},{"text":" (","color":"dark_aqua"},{"score":{"name":"@a[tag=LastStanding,limit=1,sort=random]","objective":"Rounds"},"bold":true,"color":"gold"},{"text":")","color":"dark_aqua"}]
execute unless entity @a[team=Player,scores={Lives=1..}] if score $gamestate CmdData matches 2 run tellraw @a [""]
execute unless entity @a[team=Player,scores={Lives=1..}] if score $gamestate CmdData matches 2 run execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1.8
execute unless entity @a[team=Player,scores={Lives=1..}] if score $gamestate CmdData matches 2 run function game:stop
execute unless entity @a[team=Player,scores={Lives=1..}] if entity @e[tag=GameID,type=marker] run function game:stop
#Only one tile left
execute if score $gamestate CmdData matches 2 store result score $tiles CmdData if entity @e[type=marker,tag=square,tag=!fallen]
execute if score $gamestate CmdData matches 2 if score $tiles CmdData matches ..1 run function game:stop