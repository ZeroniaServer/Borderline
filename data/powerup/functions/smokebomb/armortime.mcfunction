scoreboard players add @s SmokeTime 1
item replace entity @s[scores={Lives=3..,SmokeTime=60..}] armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"green","italic":false}]',color:65315},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
item replace entity @s[scores={Lives=2,SmokeTime=60..}] armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"gold","italic":false}]',color:16753152},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
item replace entity @s[scores={Lives=1,SmokeTime=60..}] armor.feet with leather_boots{Unbreakable:1b,display:{Name:'[{"text":"Life Boots","color":"red","italic":false}]',color:16711680},Enchantments:[{id:"binding_curse",lvl:1}],HideFlags:1} 1
tag @s[scores={SmokeTime=60..}] remove SmokeBombed