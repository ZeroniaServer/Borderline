execute as @a[team=Player,gamemode=!spectator] at @s if block ~ ~-1 ~ white_concrete run scoreboard players set @s gridcolor 0
execute as @a[team=Player,gamemode=!spectator] at @s if block ~ ~-1 ~ white_stained_glass run scoreboard players set @s gridcolor 0

execute as @a[team=Player,gamemode=!spectator] at @s if block ~ ~-1 ~ black_concrete run scoreboard players set @s gridcolor 1
execute as @a[team=Player,gamemode=!spectator] at @s if block ~ ~-1 ~ black_stained_glass run scoreboard players set @s gridcolor 1

execute as @a[team=Player,gamemode=!spectator] at @s if block ~ ~-1 ~ red_concrete run scoreboard players set @s gridcolor 2
execute as @a[team=Player,gamemode=!spectator] at @s if block ~ ~-1 ~ red_stained_glass run scoreboard players set @s gridcolor 2

execute as @a[team=Player,gamemode=!spectator] at @s if block ~ ~-1 ~ lime_concrete run scoreboard players set @s gridcolor 2
execute as @a[team=Player,gamemode=!spectator] at @s if block ~ ~-1 ~ lime_stained_glass run scoreboard players set @s gridcolor 2

execute as @a[team=Player,gamemode=!spectator] at @s positioned ~ ~-1 ~ if block ~ ~ ~ respawn_anchor if entity @e[type=marker,tag=square,tag=!fallen,tag=!vanished,tag=!selected,tag=0,limit=1,distance=..1,sort=nearest] run scoreboard players set @s gridcolor 0
execute as @a[team=Player,gamemode=!spectator] at @s positioned ~ ~-1 ~ if block ~ ~ ~ respawn_anchor if entity @e[type=marker,tag=square,tag=!fallen,tag=!vanished,tag=!selected,tag=1,limit=1,distance=..1,sort=nearest] run scoreboard players set @s gridcolor 1
execute as @a[team=Player,gamemode=!spectator] at @s positioned ~ ~-1 ~ if block ~ ~ ~ respawn_anchor if entity @e[type=marker,tag=square,tag=!fallen,tag=!vanished,tag=selected,limit=1,distance=..1,sort=nearest] run scoreboard players set @s gridcolor 2

execute as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=0}] unless entity @s[scores={armorcolor=0}] run item replace entity @s armor.head with leather_helmet{Unbreakable:1b,display:{Name:'[{"text":"White Armor","color":"white","italic":false}]',color:16777215},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=0}] unless entity @s[scores={armorcolor=0}] run item replace entity @s armor.chest with leather_chestplate{Unbreakable:1b,display:{Name:'[{"text":"White Armor","color":"white","italic":false}]',color:16777215},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=0}] unless entity @s[scores={armorcolor=0}] run item replace entity @s armor.legs with leather_leggings{Unbreakable:1b,display:{Name:'[{"text":"White Armor","color":"white","italic":false}]',color:16777215},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=0}] unless entity @s[scores={armorcolor=0}] run scoreboard players set @s armorcolor 0

execute as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=1}] unless entity @s[scores={armorcolor=1}] run item replace entity @s armor.head with leather_helmet{Unbreakable:1b,display:{Name:'[{"text":"Black Armor","color":"black","italic":false}]',color:0},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=1}] unless entity @s[scores={armorcolor=1}] run item replace entity @s armor.chest with leather_chestplate{Unbreakable:1b,display:{Name:'[{"text":"Black Armor","color":"black","italic":false}]',color:0},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=1}] unless entity @s[scores={armorcolor=1}] run item replace entity @s armor.legs with leather_leggings{Unbreakable:1b,display:{Name:'[{"text":"Black Armor","color":"black","italic":false}]',color:0},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=1}] unless entity @s[scores={armorcolor=1}] run scoreboard players set @s armorcolor 1

execute if score $state CmdData matches 0 as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=2}] unless entity @s[scores={armorcolor=2}] run item replace entity @s armor.head with leather_helmet{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"red","italic":false}]',color:12320768},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute if score $state CmdData matches 0 as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=2}] unless entity @s[scores={armorcolor=2}] run item replace entity @s armor.chest with leather_chestplate{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"red","italic":false}]',color:12320768},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute if score $state CmdData matches 0 as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=2}] unless entity @s[scores={armorcolor=2}] run item replace entity @s armor.legs with leather_leggings{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"red","italic":false}]',color:12320768},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute if score $state CmdData matches 0 as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=2}] unless entity @s[scores={armorcolor=2}] run scoreboard players set @s armorcolor 2

execute if score $state CmdData matches 1 as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=2}] unless entity @s[scores={armorcolor=3}] run item replace entity @s armor.head with leather_helmet{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"green","italic":false}]',color:48154},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute if score $state CmdData matches 1 as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=2}] unless entity @s[scores={armorcolor=3}] run item replace entity @s armor.chest with leather_chestplate{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"green","italic":false}]',color:48154},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute if score $state CmdData matches 1 as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=2}] unless entity @s[scores={armorcolor=3}] run item replace entity @s armor.legs with leather_leggings{Unbreakable:1b,display:{Name:'[{"text":"Border Armor","color":"green","italic":false}]',color:48154},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:127} 1
execute if score $state CmdData matches 1 as @a[team=Player,gamemode=!spectator,tag=!SmokeBombed,scores={gridcolor=2}] unless entity @s[scores={armorcolor=3}] run scoreboard players set @s armorcolor 3

stopsound @a player item.armor.equip_generic
stopsound @a player item.armor.equip_leather
stopsound @a master item.armor.equip_generic
stopsound @a master item.armor.equip_leather