execute unless entity @e[type=interaction,tag=anchorblocker,distance=..1] if score @s portaluse matches 1.. run summon interaction ~ ~ ~ {width:1.01,height:1.01,Tags:["anchorblocker"],response:0b}
execute if score @s[tag=!fallen] portaluse matches 3 run setblock ~ ~ ~ respawn_anchor[charges=3] strict
execute if score @s[tag=!fallen] portaluse matches 2 run setblock ~ ~ ~ respawn_anchor[charges=2] strict
execute if score @s[tag=!fallen] portaluse matches 1 run setblock ~ ~ ~ respawn_anchor[charges=1] strict
execute unless entity @e[type=marker,tag=portal,tag=!fallen,tag=!vanished,distance=5..] run setblock ~ ~ ~ respawn_anchor[charges=0] strict
execute if score @s[tag=!fallen,tag=!vanished] portaluse matches ..0 run function powerup:portaltile/destroy