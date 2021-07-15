tag @e[type=marker,tag=square,limit=1,sort=nearest,tag=!fallen,distance=..5] add exploding
scoreboard players add @e[type=marker,tag=exploding,limit=1,sort=nearest,distance=..5] blast 1
execute as @e[type=marker,tag=exploding,limit=1,sort=nearest,scores={blast=1},distance=..5] at @s run summon armor_stand ~ ~-0.75 ~ {Invisible:1b,Silent:1b,NoGravity:1b,Marker:1b,ArmorItems:[{},{},{},{id:"minecraft:tnt",Count:1b}],Tags:["tnt"]}
execute as @e[type=marker,tag=exploding,limit=1,sort=nearest,scores={blast=1..},distance=..5] at @s run playsound minecraft:block.grass.place master @a ~ ~ ~ 0.5 0.8
execute as @e[type=marker,tag=exploding,limit=1,sort=nearest,scores={blast=1..},distance=..5] at @s run playsound minecraft:entity.creeper.primed master @a ~ ~ ~ 0.5 2
function powerup:deduct
execute if entity @s[scores={CmdData=1..}] at @s run function powerup:explodingtile/place