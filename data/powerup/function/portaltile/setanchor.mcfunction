execute if score @s[tag=!fallen] portaluse matches 3 run setblock ~ ~ ~ respawn_anchor[charges=3]
execute if score @s[tag=!fallen] portaluse matches 2 run setblock ~ ~ ~ respawn_anchor[charges=2]
execute if score @s[tag=!fallen] portaluse matches 1 run setblock ~ ~ ~ respawn_anchor[charges=1]
execute unless entity @e[type=marker,tag=portal,tag=!fallen,tag=!vanished,distance=5..] run setblock ~ ~ ~ respawn_anchor[charges=0]
execute if score @s[tag=!fallen,tag=!vanished] portaluse matches ..0 run function powerup:portaltile/destroy