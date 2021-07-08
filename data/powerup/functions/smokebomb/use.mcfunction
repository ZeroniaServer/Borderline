tag @p add SmokeBombed
item replace entity @p armor.head with air
item replace entity @p armor.chest with air
item replace entity @p armor.legs with air
item replace entity @p armor.feet with air
effect give @p speed 3 4 true
effect give @p invisibility 3 4 true
playsound minecraft:entity.player.attack.nodamage master @a ~ ~ ~ 1 0
playsound minecraft:block.fire.extinguish master @a ~ ~ ~ 1 0
particle minecraft:spit ~ ~1.3 ~ 0.3 0.7 0.3 0.3 100 force
kill @s