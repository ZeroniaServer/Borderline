bossbar remove countdown

kill @e[tag=Joinpad]
setblock 10 5 8 air

execute if score $state CmdData matches 0.. run function game:stop
scoreboard players set $maxtime Timer 200
tag @e[type=marker,tag=square,sort=random,limit=1,tag=!selected] add selected
tag @e[type=marker,tag=center] add old
function grid:random
gamemode adventure @a
team leave @a[team=Lobby,tag=JoinPlay]
team join Spectator @a[tag=!JoinPlay]
gamemode spectator @a[tag=!JoinPlay]
tag @a remove JoinPlay
clear @a
execute as @a run tp @s @s
tp @a 8 5 8 -90 0
scoreboard players reset @a armorcolor

title @a title {"text":"Go!","color":"dark_aqua"}
title @a subtitle {"text":"Keep your enemies beyond the border!","color":"gold"}

#> Create game ID
summon marker ~ ~ ~ {Tags:["GameID"]}
execute as @e[tag=GameID] store result score $GameID GameID run data get entity @s UUID[0]
execute as @a[team=!Spectator] store result score @s GameID run scoreboard players get $GameID GameID

#> Add gridtimer bossbar
bossbar add gridtimer " "
bossbar set gridtimer max 200
bossbar set gridtimer color red
scoreboard players set @a[team=!Spectator] Lives 3
scoreboard players reset @a[team=Spectator] Lives
scoreboard players set @a Rounds 0
scoreboard players set $TotalRounds Rounds 0

#> Gear
item replace entity @a[team=!Spectator] hotbar.0 with bow{Unbreakable:1b,display:{Name:'[{"text":"Slap Shot","italic":false,"bold":true,"color":"gold"}]',Lore:['[{"text":"Arrows recharge over time","italic":false,"color":"gray"},{"text":"","italic":false,"color":"dark_purple"}]','[{"text":"","italic":false,"color":"dark_purple"}]']},Enchantments:[{id:"punch",lvl:2}]}
give @a[team=!Spectator] arrow{display:{Name:'[{"text":"Arrow","italic":false,"color":"gold","bold":true}]'}} 1
item replace entity @a[team=!Spectator] armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"green","italic":false}]',color:65315},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1

#> Change gamestate
scoreboard players set $gamestate CmdData 2