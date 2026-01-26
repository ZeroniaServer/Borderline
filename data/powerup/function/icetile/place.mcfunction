tag @e[type=marker,tag=square,limit=1,sort=nearest,tag=!fallen,tag=!ice,distance=..5] add current
execute as @e[type=marker,tag=current] at @s run playsound minecraft:entity.evoker.cast_spell ambient @a ~ ~ ~ 0.5 1.4
# todo: add to book
execute as @e[type=marker,tag=current] run tag @s remove falling
execute as @e[type=marker,tag=current] at @s run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 moving_piston
execute as @e[type=marker,tag=current] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 frosted_ice[age=0]
execute as @e[type=marker,tag=current,tag=portal] at @s run function powerup:portaltile/setanchor

execute as @e[type=marker,tag=current] at @s positioned ~-2 ~ ~-2 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~-1 ~ ~-2 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~0 ~ ~-2 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~1 ~ ~-2 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~2 ~ ~-2 run summon marker ~ ~ ~ {Tags:["icecheck"]}

execute as @e[type=marker,tag=current] at @s positioned ~-2 ~ ~-1 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~-1 ~ ~-1 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~0 ~ ~-1 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~1 ~ ~-1 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~2 ~ ~-1 run summon marker ~ ~ ~ {Tags:["icecheck"]}

execute as @e[type=marker,tag=current] at @s positioned ~-2 ~ ~ run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~-1 ~ ~ run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current,tag=!portal] at @s positioned ~ ~ ~ run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~1 ~ ~ run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~2 ~ ~ run summon marker ~ ~ ~ {Tags:["icecheck"]}

execute as @e[type=marker,tag=current] at @s positioned ~-2 ~ ~1 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~-1 ~ ~1 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~ ~ ~1 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~1 ~ ~1 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~2 ~ ~1 run summon marker ~ ~ ~ {Tags:["icecheck"]}

execute as @e[type=marker,tag=current] at @s positioned ~-2 ~ ~2 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~-1 ~ ~2 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~ ~ ~2 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~1 ~ ~2 run summon marker ~ ~ ~ {Tags:["icecheck"]}
execute as @e[type=marker,tag=current] at @s positioned ~2 ~ ~2 run summon marker ~ ~ ~ {Tags:["icecheck"]}

tag @e[type=marker,tag=current] add ice
tag @e[type=marker,tag=current] remove current
function powerup:deduct
execute if entity @s[scores={CmdData=1..}] at @s run function powerup:icetile/place