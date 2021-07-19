tag @e[type=marker,tag=square,limit=1,sort=nearest,tag=!fallen,distance=..5] add portal
scoreboard players set @e[type=marker,tag=portal,limit=1,sort=nearest,distance=..5] portaluse 3
execute as @e[type=marker,tag=portal,limit=1,sort=nearest,distance=..5] at @s run playsound minecraft:block.respawn_anchor.charge master @a ~ ~ ~ 0.5 0.8
execute as @e[type=marker,tag=portal,limit=1,sort=nearest,distance=..5] at @s run playsound minecraft:block.portal.trigger master @a ~ ~ ~ 0.5 2
function powerup:deduct
execute if entity @s[scores={CmdData=1..}] at @s run function powerup:portaltile/place