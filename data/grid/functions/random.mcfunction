execute as @e[type=marker,tag=selected,limit=1] run tag @s add old
execute as @e[type=marker,tag=old,limit=1] at @s run tag @e[type=marker,tag=square,sort=random,limit=1,tag=!selected,tag=!fallen,tag=!old,distance=10..] add selected
tag @e[type=marker,tag=old] remove selected
tag @e[type=marker,tag=old] remove old
function grid:reset
function powerup:spawn
execute as @e[type=marker,tag=selected,limit=1] at @s run worldborder center ~ ~
item replace entity @e[tag=tnt,type=armor_stand] armor.head with tnt