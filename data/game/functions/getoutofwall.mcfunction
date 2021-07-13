summon marker ~ ~ ~ {Tags:["tempwall"]}
execute as @e[type=marker,tag=tempwall,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @e[type=marker,tag=center,limit=1]
execute as @e[type=marker,tag=tempwall,limit=1,sort=nearest] at @s run tp @s ^ ^ ^0.5
data modify entity @e[type=marker,tag=tempwall,limit=1,sort=nearest] Pos[1] set from entity @s Pos[1]
execute at @e[type=marker,tag=tempwall,limit=1,sort=nearest] rotated as @s run tp @e[type=marker,tag=tempwall,limit=1,sort=nearest] ~ ~ ~ ~ ~
tp @s @e[type=marker,tag=tempwall,limit=1,sort=nearest]
kill @e[type=marker,tag=tempwall]