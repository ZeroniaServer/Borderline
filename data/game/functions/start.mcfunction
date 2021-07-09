
#> Developer convenience
execute if score $state CmdData matches 0.. run function game:stop
tag @s add JoinPlay

#> Remove lobby
bossbar remove countdown
kill @e[tag=Joinpad]
kill @e[tag=Credits]
setblock 10 5 8 air

#> Grid/timer setup
scoreboard players set $maxtime Timer 200
scoreboard players set $maxptime Timer 320
tag @e[type=marker,tag=square,sort=random,limit=1,tag=!selected] add selected
tag @e[type=marker,tag=center] add old
function grid:random

#> Player setup
gamemode adventure @a
team leave @a[team=Lobby,tag=JoinPlay]
team join Spectator @a[tag=!JoinPlay]
gamemode spectator @a[tag=!JoinPlay]
title @a title {"text":"Let the game begin!","color":"dark_aqua"}
execute store result score $players CmdData if entity @a[tag=JoinPlay]
execute if score $players CmdData matches 2.. run title @a[tag=JoinPlay] subtitle {"text":"Keep your enemies beyond the border!","color":"gold"}
execute if score $players CmdData matches 1 run title @a[tag=JoinPlay] subtitle {"text":"Don't stay beyond the border!","color":"gold"}
tag @a remove JoinPlay
clear @a
execute as @a run tp @s @s
tp @a 8 5 8 -90 0
scoreboard players reset @a armorcolor

#> Create game ID
summon marker ~ ~ ~ {Tags:["GameID"]}
execute as @e[tag=GameID] store result score $GameID GameID run data get entity @s UUID[0]
execute as @a[team=!Spectator] store result score @s GameID run scoreboard players get $GameID GameID

#> Add gridtimer bossbar
bossbar add gridtimer " "
bossbar set gridtimer max 200
bossbar set gridtimer color red

#> Lives/Rounds
scoreboard players set @a[team=!Spectator] Lives 3
scoreboard players reset @a[team=Spectator] Lives
scoreboard players set @a Rounds 0
scoreboard players set $TotalRounds Rounds 0

#> Gear
item replace entity @a[team=!Spectator] hotbar.0 with bow{Unbreakable:1b,display:{Name:'[{"text":"Slap Shot","italic":false,"bold":true,"color":"gold"}]',Lore:['[{"text":"Arrows recharge over time","italic":false,"color":"gray"}]']},Enchantments:[{id:"punch",lvl:2}],HideFlags:4}
give @a[team=!Spectator] arrow{display:{Name:'[{"text":"Arrow","italic":false,"color":"gold","bold":true}]'}} 1
execute as @a[team=!Spectator] run function game:lifeboots

#> Change gamestate
scoreboard players set $gamestate CmdData 2