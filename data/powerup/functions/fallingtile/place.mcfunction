tag @e[type=marker,tag=square,limit=1,sort=nearest,tag=!fallen,tag=!falling] add falling
execute as @e[type=marker,tag=falling,tag=!fallen,limit=1,sort=nearest] at @s run playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 0.5 0.8
execute as @e[type=marker,tag=falling,tag=!fallen,limit=1,sort=nearest] at @s run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 moving_piston
execute as @e[type=marker,tag=0,tag=!selected,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 white_concrete_powder
execute as @e[type=marker,tag=1,tag=!selected,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 black_concrete_powder
execute as @e[type=marker,tag=selected,limit=1,tag=falling,tag=!fallen] at @s run fill ~-2 ~ ~-2 ~2 ~ ~2 red_concrete_powder
kill @s