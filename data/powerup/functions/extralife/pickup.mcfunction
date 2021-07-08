playsound minecraft:item.totem.use master @s ~ ~ ~ 1 2
particle minecraft:totem_of_undying ~ ~1 ~ 0.3 0.3 0.3 0.6 30 force
scoreboard players add @s Lives 1
title @s title " "
title @s subtitle ["",{"text":"+1 Life! (","color":"green"},{"score":{"name":"@s","objective":"Lives"},"color":"gold"},{"text":")","color":"green"}]
item replace entity @s[scores={Lives=3..}] armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"green","italic":false}]',color:65315},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
item replace entity @s[scores={Lives=2}] armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"gold","italic":false}]',color:16753152},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
item replace entity @s[scores={Lives=1}] armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"red","italic":false}]',color:16711680},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
clear @s totem_of_undying 1