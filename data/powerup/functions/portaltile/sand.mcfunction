execute as @s[scores={portaluse=3}] if entity @e[type=marker,tag=portal,tag=!fallen,tag=!vanished,distance=5..] as @e[type=falling_block,limit=1,sort=nearest] at @s run summon falling_block ~ ~ ~ {Time:1,BlockState:{Name:"minecraft:respawn_anchor",Properties:{charges:"3"}},Tags:["anchor"]}
execute as @s[scores={portaluse=2}] if entity @e[type=marker,tag=portal,tag=!fallen,tag=!vanished,distance=5..] as @e[type=falling_block,limit=1,sort=nearest] at @s run summon falling_block ~ ~ ~ {Time:1,BlockState:{Name:"minecraft:respawn_anchor",Properties:{charges:"2"}},Tags:["anchor"]}
execute as @s[scores={portaluse=1}] if entity @e[type=marker,tag=portal,tag=!fallen,tag=!vanished,distance=5..] as @e[type=falling_block,limit=1,sort=nearest] at @s run summon falling_block ~ ~ ~ {Time:1,BlockState:{Name:"minecraft:respawn_anchor",Properties:{charges:"1"}},Tags:["anchor"]}
execute unless entity @e[type=marker,tag=portal,tag=!fallen,tag=!vanished,distance=5..] as @e[type=falling_block,limit=1,sort=nearest] at @s run summon falling_block ~ ~ ~ {Time:1,BlockState:{Name:"minecraft:respawn_anchor",Properties:{charges:"0"}},Tags:["anchor"]}
execute as @e[type=falling_block,limit=1,sort=nearest] at @s run data modify entity @e[type=falling_block,tag=anchor,distance=..1,limit=1,sort=nearest] Motion set from entity @s Motion
execute as @e[type=falling_block,limit=1,sort=nearest] at @s run data modify entity @e[type=falling_block,tag=anchor,distance=..1,limit=1,sort=nearest] Time set from entity @s Time
kill @e[type=falling_block,limit=1,sort=nearest,tag=!anchor]
tag @s remove portalfalling
tag @s remove portal
scoreboard players reset @s portaluse