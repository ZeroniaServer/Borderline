execute as @e[type=area_effect_cloud,tag=Joinpad] at @s run particle minecraft:dust_color_transition{from_color:0,to_color:16777215,scale:1} ~ ~ ~ 0.5 0 0.5 0 8 force

execute as @a[tag=!JoinPlay] at @s if entity @e[type=area_effect_cloud,tag=JoinpadPlay,distance=..1.5] run tag @s remove JoinSpec
execute as @a[tag=!JoinPlay] at @s if entity @e[type=area_effect_cloud,tag=JoinpadPlay,distance=..1.5] run tellraw @a ["",{"selector":"@s",bold:true,color:"white"},{text:" will play in the next match!",color:"gray"}]
execute as @a[tag=!JoinPlay] at @s if entity @e[type=area_effect_cloud,tag=JoinpadPlay,distance=..1.5] run playsound minecraft:block.beehive.enter master @a ~ ~ ~ 0.3 1
execute as @a[tag=!JoinPlay] at @s if entity @e[type=area_effect_cloud,tag=JoinpadPlay,distance=..1.5] run tag @s add JoinPlay

execute as @a[tag=JoinPlay] at @s if entity @e[type=area_effect_cloud,tag=JoinpadSpec,distance=..1.5] run tellraw @a ["",{"selector":"@s",bold:true,color:"white"},{text:" will no longer play in the next match!",color:"gray"}]
execute as @a[tag=JoinPlay] at @s if entity @e[type=area_effect_cloud,tag=JoinpadSpec,distance=..1.5] run playsound minecraft:block.beehive.exit master @a ~ ~ ~ 0.3 1
execute as @a[tag=JoinPlay] at @s if entity @e[type=area_effect_cloud,tag=JoinpadSpec,distance=..1.5] run effect clear @s glowing
execute as @a[tag=JoinPlay] at @s if entity @e[type=area_effect_cloud,tag=JoinpadSpec,distance=..1.5] run tag @s remove JoinPlay

effect give @a[tag=JoinPlay] glowing 2 0 true

scoreboard players reset $Joined CmdData
execute as @a[tag=JoinPlay] run scoreboard players add $Joined CmdData 1
scoreboard players set $minplayers CmdData 1

execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run scoreboard players set $Countdown CmdData 20
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run bossbar add countdown ["",{text:"Starting in: ",bold:true,color:"white"},{"score":{"name":"$Countdown","objective":"CmdData"},bold:true,color:"gold"}]
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run bossbar set countdown max 20
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run bossbar set countdown style notched_20
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run bossbar set countdown value 20
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run bossbar set countdown players @a
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run schedule function lobby:countdown 1s
execute if score $gamestate CmdData matches 0 if score $Joined CmdData >= $minplayers CmdData run scoreboard players set $gamestate CmdData 1

execute as @e[type=armor_stand,tag=YZEROcredit] at @s run particle dust{color:16777215,scale:2} ~ ~-0.2 ~ 0.3 0 0.3 0 1 force
execute as @e[type=armor_stand,tag=Evcredit] at @s run particle dust{color:0,scale:2} ~ ~-0.2 ~ 0.3 0 0.3 0 1 force

#> Lobby book
tag @a[team=Lobby,tag=hasbook] remove hasbook
execute as @a[team=Lobby] if items entity @s hotbar.4 written_book run tag @s add hasbook
clear @a[team=Lobby,tag=!hasbook] written_book
item replace entity @a[team=Lobby,tag=!hasbook] hotbar.4 with written_book[written_book_content={pages:[["",{text:"     Borderline",bold:true},{text:"\n"},{text:"===================",color:"gray"},{text:"\n\n"},{text:"Welcome to Borderline,\n a minigame made in 1\n week of time for the\n     ",color:"blue"},{text:"\"Beyond Limits\"\n    ",color:"gold"},{text:"MCMaps Map Jam!",color:"blue"},{text:"\n\n"},{text:"       Created by:\n       ",color:"blue"},{text:"YZEROgame",color:"#00DB19",hover_event:{action:"show_text","value":["",{text:"Click to check out YZEROgame.",italic:true,color:"white"}]},click_event:{action:"open_url",url:"https://www.youtube.com/channel/UC7-j3tkiF9PeT2FVbI8WR4A"}},{text:"\n         "},{text:"Evtema3",color:"red",hover_event:{action:"show_text","value":["",{text:"Click to check out Evtema3.",italic:true,color:"white"}]},click_event:{action:"open_url",url:"https://www.youtube.com/Evtema3"}}],["",{text:"\u0020 \u0020 \u0020 Overview",bold:true},{text:"\n"},{text:"===================",color:"gray"},{text:"\n"},{text:"In each round of this hectic game, you must navigate a checker-\nboard-style grid and reach the world border (surrounding one randomly selected tile) before all the other tiles vanish at a quickening pace.",color:"blue"}],["",{text:"\u0020 \u0020 \u0020 Overview",bold:true},{text:"\n"},{text:"===================",color:"gray"},{text:"\n"},{text:"Along the way, you can pick up special powerups to either help your chances of surviving or hurt your opponents'. Can you be the last one standing, and how long can you last before you're stuck ",color:"blue"},{text:"beyond limits?",color:"blue",italic:true}],["",{text:"\u0020 \u0020 \u0020 Powerups",bold:true},{text:"\n"},{text:"===================",color:"gray"},{text:"\n"},{text:"Slap Fish",color:"dark_aqua",bold:true},{text:": Knocks back opponents (gets consumed upon use).\n",color:"blue"},{text:"Ender Pearl",color:"light_purple",bold:true},{text:": Throw to teleport.\n",color:"blue"},{text:"Smoke Bomb",color:"dark_purple",bold:true},{text:": Gives speed and invis (3s).\n",color:"blue"},{text:"Jump Boost",color:"#48d9d9",bold:true},{text:": Raises jump height (10s).\n",color:"blue"},{text:"Extra Life",color:"#00DB19",bold:true},{text:": Adds 1 extra life (players have 3 by default).\n",color:"blue"}],["",{text:"\u0020 \u0020 \u0020 Powerups",bold:true},{text:"\n"},{text:"===================",color:"gray"},{text:"\n"},{text:"Unleash the Beast",color:"dark_red",bold:true},{text:": Spawns a Zoglin.\n",color:"blue"},{text:"Blindness Arrow",color:"#53535a",bold:true},{text:": Inflicts blindness on target.\n",color:"blue"},{text:"Exploding Tile",color:"red",bold:true},{text:": Makes tile explode upon contact.\n",color:"blue"},{text:"Lifting Tile",color:"dark_green",bold:true},{text:": Lifts tile 2 blocks upon contact.\n",color:"blue"},{text:"Falling Tile",color:"gold",bold:true},{text:": Makes tile fall upon contact.\n",color:"blue"}],["",{text:"\u0020 \u0020 \u0020 Powerups",bold:true},{text:"\n"},{text:"===================",color:"gray"},{text:"\n"},{text:"Portal Tile",color:"blue",bold:true},{text:": Turns tile into a portal. Stand in one to warp to another. Expires after 3 uses (in/out).",color:"blue"},{text:"\n"},{text:"Ice Tile",color:"#81e2ff",bold:true},{text:": Turns tile into ice that melts beneath players.\n\n",color:"blue"},{text:"Note: Tiles with multiple powerups combine their effects.",color:"blue",italic:true}]],title:"[Borderline] Game Info",author:"Zeronia (§aYZEROgame§r and §cEvtema3§r)"},custom_name={text:"Borderline Game Info",italic:false,color:"gold"}]
item replace entity @a[team=Lobby] hotbar.0 with air
item replace entity @a[team=Lobby] hotbar.1 with air
item replace entity @a[team=Lobby] hotbar.2 with air
item replace entity @a[team=Lobby] hotbar.3 with air
item replace entity @a[team=Lobby] hotbar.5 with air
item replace entity @a[team=Lobby] hotbar.6 with air
item replace entity @a[team=Lobby] hotbar.7 with air
item replace entity @a[team=Lobby] hotbar.8 with air
item replace entity @a[team=Lobby] weapon.offhand with air