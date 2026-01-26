#Kill books
execute as @e[type=item] if items entity @s contents written_book run kill

#UUID storage
execute as @a store result score @s playerUUID run data get entity @s UUID[0]

#No item dropping - thanks to Cloud Wolf for the tip!
execute as @e[type=item,tag=!processed,tag=!PowerupSpawn] unless items entity @s contents *[custom_data~{Droppable:1b}] run data modify entity @s Owner set from entity @s Thrower
execute as @e[type=item,tag=!processed,tag=!PowerupSpawn] unless items entity @s contents *[custom_data~{Droppable:1b}] store result score @s playerUUID run data get entity @s Thrower[0]
execute as @e[type=item,tag=!processed,tag=!PowerupSpawn] unless items entity @s contents *[custom_data~{Droppable:1b}] run data merge entity @s {PickupDelay:0s}
execute as @e[type=item,tag=!processed,tag=!PowerupSpawn] unless items entity @s contents *[custom_data~{Droppable:1b}] run tag @s add processed
execute as @e[type=item,tag=!PowerupSpawn] unless items entity @s contents *[custom_data~{Droppable:1b}] if entity @a[team=Player] at @s run function game:nodroploop
tag @a[tag=itemChecked] remove itemChecked

#Kills items after a while
execute as @e[type=item,nbt={Age:15s},tag=!PowerupSpawn] unless items entity @s contents *[custom_data~{Droppable:1b}] run kill @s

#Item blastproof tag
execute as @e[type=item] if items entity @s contents *[custom_data={BlastProof:1b}] run data merge entity @s {Invulnerable:1b}