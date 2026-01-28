tag @e[type=marker,tag=square,limit=1,sort=nearest,tag=!fallen,distance=..5] add exploding
execute as @e[type=marker,tag=exploding,limit=1,sort=nearest,distance=..5] unless score @s blast matches 42.. run scoreboard players add @s blast 1
execute as @e[type=marker,tag=exploding,limit=1,sort=nearest,scores={blast=1},distance=..5] at @s align xyz run summon block_display ~0.5 ~-0.75 ~0.5 {block_state:{Name:"tnt"},teleport_duration:0,transformation:{scale:[0.6,0.6,0.6],left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],translation:[-0.3,1.3,-0.3]},Tags:["tnt"],brightness:{block:15,sky:15}}
execute as @e[type=marker,tag=exploding,limit=1,sort=nearest,scores={blast=1..},distance=..5] at @s run playsound minecraft:block.grass.place master @a ~ ~ ~ 0.5 0.8
execute as @e[type=marker,tag=exploding,limit=1,sort=nearest,scores={blast=1..},distance=..5] at @s run playsound minecraft:entity.creeper.primed master @a ~ ~ ~ 0.5 2
function powerup:deduct
execute if entity @s[scores={CmdData=1..}] at @s run function powerup:explodingtile/place