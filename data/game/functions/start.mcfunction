execute if score $state CmdData matches 0.. run function game:stop
scoreboard players set $maxtime Timer 200
tag @e[type=marker,tag=square,sort=random,limit=1,tag=!selected] add selected
function grid:random
gamemode adventure @a
team leave @a[team=Lobby]
tp @a 8 4 8

title @a title {"text":"Go!","color":"dark_aqua"}
title @a subtitle {"text":"Keep your enemies beyond the borders","color":"gold"}

#> Add gridtimer bossbar
bossbar add gridtimer " "
bossbar set gridtimer max 200
bossbar set gridtimer color red
scoreboard players set @a Lives 3
scoreboard players set @a Rounds 0

#> Gear
item replace entity @a[team=!Spectator] hotbar.0 with bow{Unbreakable:1b,display:{Name:'[{"text":"Slap Shot","italic":false,"bold":true,"color":"gold"}]',Lore:['[{"text":"Arrows recharge over time","italic":false,"color":"gray"},{"text":"","italic":false,"color":"dark_purple"}]','[{"text":"","italic":false,"color":"dark_purple"}]']},Enchantments:[{id:"mending",lvl:1},{id:"punch",lvl:1}],HideFlags:1}
give @a[team=!Spectator] arrow{display:{Name:'[{"text":"Arrow","italic":false,"color":"gold","bold":true}]'}} 1
item replace entity @a[team=!Spectator] armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"green","italic":false}]',color:65315},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1

#> Change gamestate
scoreboard players set $gamestate CmdData 2