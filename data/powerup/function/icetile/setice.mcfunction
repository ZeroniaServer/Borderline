execute if score @s icecheck matches ..15 unless block ~ ~ ~ respawn_anchor run setblock ~ ~ ~ frosted_ice[age=0] strict
execute if score @s icecheck matches 16..30 unless block ~ ~ ~ respawn_anchor run setblock ~ ~ ~ frosted_ice[age=1] strict
execute if score @s icecheck matches 31..45 unless block ~ ~ ~ respawn_anchor run setblock ~ ~ ~ frosted_ice[age=2] strict
execute if score @s icecheck matches 46..60 unless block ~ ~ ~ respawn_anchor run setblock ~ ~ ~ frosted_ice[age=3] strict
execute if score @s icecheck matches 61.. if block ~ ~ ~ frosted_ice run playsound block.glass.break block @a ~ ~ ~ 1 0.8
execute if score @s icecheck matches 61.. if block ~ ~ ~ frosted_ice run particle block{block_state:"frosted_ice"} ~ ~0.5 ~ 0.5 0.5 0.5 1 75
execute if score @s icecheck matches 61.. if block ~ ~ ~ frosted_ice run setblock ~ ~ ~ air strict
execute if block ~ ~ ~ water run setblock ~ ~ ~ air strict
tag @s remove vanished