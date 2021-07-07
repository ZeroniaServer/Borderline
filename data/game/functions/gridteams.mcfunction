execute as @a[team=!Spectator] at @s if block ~ ~-1 ~ black_concrete run team join Black @s
execute as @a[team=!Spectator] at @s if block ~ ~-1 ~ black_stained_glass run team join Black @s

execute as @a[team=!Spectator] at @s if block ~ ~-1 ~ white_concrete run team join White @s
execute as @a[team=!Spectator] at @s if block ~ ~-1 ~ white_stained_glass run team join White @s

execute as @a[team=!Spectator] at @s if block ~ ~-1 ~ lime_concrete run team join Border @s
execute as @a[team=!Spectator] at @s if block ~ ~-1 ~ lime_stained_glass run team join Border @s
execute as @a[team=!Spectator] at @s if block ~ ~-1 ~ red_concrete run team join Border @s
execute as @a[team=!Spectator] at @s if block ~ ~-1 ~ red_stained_glass run team join Border @s

execute if score $state CmdData matches 0 run team modify Border color red
execute if score $state CmdData matches 1 run team modify Border color green

execute as @a[team=White] unless entity @s[scores={armorcolor=0}] run item replace entity @s armor.head with leather_helmet{Unbreakable:1b,display:{Name:'[{"text":"White Armor","color":"white","italic":false}]',color:16777215},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[team=White] unless entity @s[scores={armorcolor=0}] run item replace entity @s armor.chest with leather_chestplate{Unbreakable:1b,display:{Name:'[{"text":"White Armor","color":"white","italic":false}]',color:16777215},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[team=White] unless entity @s[scores={armorcolor=0}] run item replace entity @s armor.legs with leather_leggings{Unbreakable:1b,display:{Name:'[{"text":"White Armor","color":"white","italic":false}]',color:16777215},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[team=White] unless entity @s[scores={armorcolor=0}] run scoreboard players set @s armorcolor 0

execute as @a[team=Black] unless entity @s[scores={armorcolor=1}] run item replace entity @s armor.head with leather_helmet{Unbreakable:1b,display:{Name:'[{"text":"Black Armor","color":"black","italic":false}]',color:0},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[team=Black] unless entity @s[scores={armorcolor=1}] run item replace entity @s armor.chest with leather_chestplate{Unbreakable:1b,display:{Name:'[{"text":"Black Armor","color":"black","italic":false}]',color:0},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[team=Black] unless entity @s[scores={armorcolor=1}] run item replace entity @s armor.legs with leather_leggings{Unbreakable:1b,display:{Name:'[{"text":"Black Armor","color":"black","italic":false}]',color:0},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[team=Black] unless entity @s[scores={armorcolor=1}] run scoreboard players set @s armorcolor 1

execute if score $state CmdData matches 0 as @a[team=Border] unless entity @s[scores={armorcolor=2}] run item replace entity @s armor.head with leather_helmet{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"green","italic":false}]',color:12320768},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute if score $state CmdData matches 0 as @a[team=Border] unless entity @s[scores={armorcolor=2}] run item replace entity @s armor.chest with leather_chestplate{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"green","italic":false}]',color:12320768},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute if score $state CmdData matches 0 as @a[team=Border] unless entity @s[scores={armorcolor=2}] run item replace entity @s armor.legs with leather_leggings{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"green","italic":false}]',color:12320768},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[team=Border] unless entity @s[scores={armorcolor=2}] run scoreboard players set @s armorcolor 2

execute if score $state CmdData matches 1 as @a[team=Border] unless entity @s[scores={armorcolor=3}] run item replace entity @s armor.head with leather_helmet{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"green","italic":false}]',color:48154},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute if score $state CmdData matches 1 as @a[team=Border] unless entity @s[scores={armorcolor=3}] run item replace entity @s armor.chest with leather_chestplate{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"green","italic":false}]',color:48154},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute if score $state CmdData matches 1 as @a[team=Border] unless entity @s[scores={armorcolor=3}] run item replace entity @s armor.legs with leather_leggings{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"green","italic":false}]',color:48154},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
execute as @a[team=Border] unless entity @s[scores={armorcolor=3}] run scoreboard players set @s armorcolor 3

stopsound @a player item.armor.equip_generic
stopsound @a player item.armor.equip_leather