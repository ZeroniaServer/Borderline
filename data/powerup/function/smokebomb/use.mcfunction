execute store result score $temp playerUUID run data get entity @s Thrower[0]
execute as @a[team=Player] if score @s playerUUID = $temp playerUUID run tag @s add SmokeBombed
scoreboard players reset $temp playerUUID
effect give @a[tag=SmokeBombed,limit=1] speed 3 4 true
effect give @a[tag=SmokeBombed,limit=1] invisibility 3 4 true
playsound minecraft:entity.player.attack.nodamage master @a ~ ~ ~ 1 0
playsound minecraft:block.fire.extinguish master @a ~ ~ ~ 1 0
particle minecraft:spit ~ ~1.3 ~ 0.3 0.7 0.3 0.3 100 force
kill @s