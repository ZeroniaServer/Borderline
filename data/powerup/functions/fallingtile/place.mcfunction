tag @e[type=marker,tag=square,limit=1,sort=nearest,distance=..5] add current 
tag @e[type=marker,tag=current,tag=!fallen,tag=!falling] add falling
execute as @e[type=marker,tag=current,tag=falling,tag=!fallen] at @s run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 0.5 0.8
execute as @e[type=marker,tag=current,tag=falling,tag=!fallen] at @s run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 moving_piston
execute as @e[type=marker,tag=current,tag=0,tag=!selected,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 white_concrete_powder
execute as @e[type=marker,tag=current,tag=1,tag=!selected,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 black_concrete_powder
execute as @e[type=marker,tag=current,tag=selected,limit=1,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 red_concrete_powder
tag @e[type=marker,tag=current] remove current
execute as @e[type=marker,tag=portal] at @s run function powerup:portaltile/setanchor
function powerup:deduct
execute if entity @s[scores={CmdData=1..}] at @s run function powerup:fallingtile/place