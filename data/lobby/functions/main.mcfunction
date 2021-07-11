execute as @e[tag=Joinpad] at @s run particle minecraft:dust_color_transition 0 0 0 1.5 1 1 1 ~ ~ ~ 0.5 0 0.5 0 8 force

execute as @a[tag=!JoinPlay] at @s if entity @e[tag=JoinpadPlay,distance=..1.5] run tag @s remove JoinSpec
execute as @a[tag=!JoinPlay] at @s if entity @e[tag=JoinpadPlay,distance=..1.5] run tellraw @a ["",{"selector":"@s","bold":true,"color":"white"},{"text":" will play in the next match!","color":"gray"}]
execute as @a[tag=!JoinPlay] at @s if entity @e[tag=JoinpadPlay,distance=..1.5] run playsound minecraft:block.beehive.enter master @a ~ ~ ~ 0.3 1
execute as @a[tag=!JoinPlay] at @s if entity @e[tag=JoinpadPlay,distance=..1.5] run tag @s add JoinPlay

execute as @a[tag=JoinPlay] at @s if entity @e[tag=JoinpadSpec,distance=..1.5] run tellraw @a ["",{"selector":"@s","bold":true,"color":"white"},{"text":" will no longer play in the next match!","color":"gray"}]
execute as @a[tag=JoinPlay] at @s if entity @e[tag=JoinpadSpec,distance=..1.5] run playsound minecraft:block.beehive.exit master @a ~ ~ ~ 0.3 1
execute as @a[tag=JoinPlay] at @s if entity @e[tag=JoinpadSpec,distance=..1.5] run effect clear @s glowing
execute as @a[tag=JoinPlay] at @s if entity @e[tag=JoinpadSpec,distance=..1.5] run tag @s remove JoinPlay

effect give @a[tag=JoinPlay] glowing 2 0 true

scoreboard players reset $Joined CmdData
execute as @a[tag=JoinPlay] run scoreboard players add $Joined CmdData 1
scoreboard players set $minplayers CmdData 1

execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run scoreboard players set $Countdown CmdData 20
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run bossbar add countdown ["",{"text":"Starting in: ","bold":true,"color":"white"},{"score":{"name":"$Countdown","objective":"CmdData"},"bold":true,"color":"dark_gray"}]
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run bossbar set countdown max 20
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run bossbar set countdown style notched_20
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run bossbar set countdown value 20
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run bossbar set countdown players @a
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run schedule function lobby:countdown 1s
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run scoreboard players set $gamestate CmdData 1

execute as @e[tag=YZEROcredit] at @s run particle dust 1 1 1 2 ~ ~-0.2 ~ 0.3 0 0.3 0 1 force
execute as @e[tag=Evcredit] at @s run particle dust 0 0 0 2 ~ ~-0.2 ~ 0.3 0 0.3 0 1 force

#> Lobby book
tag @a[team=Lobby,tag=hasbook] remove hasbook
tag @a[team=Lobby,nbt={Inventory:[{Slot:4b,id:"minecraft:written_book"}]}] add hasbook
clear @a[team=Lobby,tag=!hasbook] written_book
item replace entity @a[team=Lobby,tag=!hasbook] hotbar.4 with written_book{pages:['["",{"text":"     Borderline","bold":true},{"text":"\\n","color":"reset"},{"text":"===================","color":"gray"},{"text":"\\n\\n","color":"reset"},{"text":"Welcome to Borderline,\\n a minigame made in 1\\n week of time for the\\n     ","color":"blue"},{"text":"\\"Beyond Limits\\"\\n    ","color":"gold"},{"text":"MCMaps Map Jam!","color":"blue"},{"text":"\\n\\n","color":"reset"},{"text":"       Created by:\\n       ","color":"blue"},{"text":"YZEROgame","color":"#00DB19","hoverEvent":{"action":"show_text","value":["",{"text":"Click to check out YZEROgame.","italic":true,"color":"white"}]},"clickEvent":{"action":"open_url","value":"https://www.youtube.com/channel/UC7-j3tkiF9PeT2FVbI8WR4A"}},{"text":"\\n         ","color":"reset"},{"text":"Evtema3","color":"red","hoverEvent":{"action":"show_text","value":["",{"text":"Click to check out Evtema3.","italic":true,"color":"white"}]},"clickEvent":{"action":"open_url","value":"https://www.youtube.com/Evtema3"}}]','["",{"text":"\\u0020 \\u0020 \\u0020Game Info:","bold":true},{"text":"\\n","color":"reset"},{"text":"===================","color":"gray"},{"text":"\\n","color":"reset"},{"text":"In each round of this hectic game, you must navigate a checker-\\nboard-style grid and reach the world border (surrounding one randomly selected tile) before all the other tiles vanish at a quickening pace.","color":"blue"}]','["",{"text":"\\u0020 \\u0020 \\u0020Game Info:","bold":true},{"text":"\\n","color":"reset"},{"text":"===================","color":"gray"},{"text":"\\n","color":"reset"},{"text":"Along the way, you can pick up special powerups to either help your chances of surviving or hurt your opponents\'. Can you be the last one standing, and how long can you last before you\'re stuck ","color":"blue"},{"text":"beyond limits?","color":"blue","italic":true}]'],title:"[Borderline] Game Info",author:"Zeronia (§aYZEROgame§r and §cEvtema3§r)",display:{Name:'[{"text":"Borderline Game Info","italic":false,"color":"gold"}]'}}
item replace entity @a[team=Lobby] hotbar.0 with air
item replace entity @a[team=Lobby] hotbar.1 with air
item replace entity @a[team=Lobby] hotbar.2 with air
item replace entity @a[team=Lobby] hotbar.3 with air
item replace entity @a[team=Lobby] hotbar.5 with air
item replace entity @a[team=Lobby] hotbar.6 with air
item replace entity @a[team=Lobby] hotbar.7 with air
item replace entity @a[team=Lobby] hotbar.8 with air
item replace entity @a[team=Lobby] weapon.offhand with air