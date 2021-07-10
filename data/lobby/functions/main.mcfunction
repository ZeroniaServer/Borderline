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
execute as @a[team=Lobby,nbt=!{Inventory:[{id:"minecraft:written_book"}]}] run clear @s written_book
execute as @a[team=Lobby,nbt=!{Inventory:[{id:"minecraft:written_book"}]}] run give @s written_book{pages:['["",{"text":"      Borderline","bold":true},{"text":"\\n","color":"reset"},{"text":"===================","color":"gray"},{"text":"\\n\\n","color":"reset"},{"text":"Welcome to Borderline, a minigame made in 1 week of time for the\\n     ","color":"blue"},{"text":"\\"Beyond Limits\\"\\n    ","color":"gold"},{"text":"MCMaps Map Jam!","color":"blue"},{"text":"\\n\\n","color":"reset"},{"text":"      Created by:\\n      ","color":"blue"},{"text":"YZEROgame","color":"#00DB19"},{"text":"\\n","color":"reset"},{"text":"        Evtema3","color":"red"}]','["",{"text":" \\u0020 \\u0020 \\u0020Game Info","bold":true},{"text":"\\n","color":"reset"},{"text":"===================","color":"gray"},{"text":"\\n","color":"reset"},{"text":"In each round of this hectic game, you must navigate a checkerboard-style grid and reach the world border (surrounding one randomly selected tile) before all the other tiles vanish at a quickening pace.","color":"blue"}]','["",{"text":" \\u0020 \\u0020 \\u0020Game Info","bold":true},{"text":"\\n","color":"reset"},{"text":"===================","color":"gray"},{"text":"\\n","color":"reset"},{"text":"Along the way, you can pick up special powerups to either help your chances of surviving or hurt your opponents\'. Can you be the last one standing, and how long can you last before you\'re stuck beyond limits?","color":"blue"}]'],title:"[Borderline] Game Info",author:Zeronia,display:{Name:'[{"text":"Borderline Game Info","italic":false,"color":"gold"}]',Lore:['[{"text":"made by:","italic":false,"color":"gray"},{"text":"","italic":false,"color":"dark_purple"}]','[{"text":"YZEROgame","italic":false,"color":"green"},{"text":"","italic":false,"color":"dark_purple"}]','[{"text":"Evtema3","italic":false,"color":"red"}]']}}