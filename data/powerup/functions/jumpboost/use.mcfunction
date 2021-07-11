execute store result score $temp playerUUID run data get entity @s Thrower[0]
execute as @a[team=!Lobby,team=!Spectator] if score @s playerUUID = $temp playerUUID run effect give @s jump_boost 10 1 true
scoreboard players reset $temp playerUUID
playsound minecraft:block.sand.hit master @a ~ ~ ~ 1 0.6
kill @s