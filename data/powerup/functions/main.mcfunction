
#> Slap Fish
tag @a remove HoldingSlapFish
tag @a[nbt={SelectedItem:{id:"minecraft:cod"}}] add HoldingSlapFish
execute as @a[tag=HoldingSlapFish,scores={DealtDamage=0..}] at @s run playsound minecraft:entity.guardian.flop master @a ~ ~ ~ 1 1
execute as @a[tag=HoldingSlapFish,scores={DealtDamage=0..}] at @s run clear @s cod 1
scoreboard players reset @a DealtDamage

#> Exploding Tile
tag @a remove HoldingETile
tag @a[nbt={SelectedItem:{id:"minecraft:tnt_minecart"}}] add HoldingETile
execute as @a[tag=HoldingETile] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:tnt_minecart"},OnGround:1b}] if data entity @s Thrower at @s run function powerup:explodingtile/place
execute as @e[type=marker,tag=exploding] at @s positioned ~-2 ~ ~-2 if entity @a[dx=2,dy=2,dz=2] at @s run function powerup:explodingtile/explode
execute as @e[type=marker,tag=exploding] at @s positioned ~ ~1 ~ if entity @e[type=arrow,distance=..1] at @s run function powerup:explodingtile/explode

#> Falling Tile
tag @a remove HoldingFTile
tag @a[nbt={SelectedItem:{id:"minecraft:sand"}}] add HoldingFTile
execute as @a[tag=HoldingFTile] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:sand"},OnGround:1b}] if data entity @s Thrower at @s run function powerup:fallingtile/place
execute as @e[type=marker,tag=falling,tag=!fallen] at @s positioned ~-2 ~ ~-2 if entity @a[dx=2,dy=2,dz=2] at @s run function powerup:fallingtile/fall
execute as @e[type=marker,tag=falling,tag=!fallen] at @s positioned ~ ~1 ~ if entity @e[type=arrow,distance=..1] at @s run function powerup:fallingtile/fall

#> Lifting Tile
tag @a remove HoldingLTile
tag @a[nbt={SelectedItem:{id:"minecraft:piston"}}] add HoldingLTile
execute as @a[tag=HoldingLTile] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:piston"},OnGround:1b}] if data entity @s Thrower at @s run function powerup:liftingtile/place

#> Extra Life
execute as @a[nbt={Inventory:[{id:"minecraft:totem_of_undying"}]}] at @s run function powerup:extralife/pickup

#> Jump Boost
tag @a remove HoldingJump
tag @a[nbt={SelectedItem:{id:"minecraft:rabbit_foot"}}] add HoldingJump
execute as @a[tag=HoldingJump] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:rabbit_foot"}}] if data entity @s Thrower at @s run effect give @p jump_boost 10 1 true
execute as @e[type=item,nbt={Item:{id:"minecraft:rabbit_foot"}}] if data entity @s Thrower at @s run playsound minecraft:block.sand.hit master @a ~ ~ ~ 1 0.6
execute as @e[type=item,nbt={Item:{id:"minecraft:rabbit_foot"}}] if data entity @s Thrower at @s run kill @s

#> Smoke Bomb
tag @a remove HoldingSmoke
tag @a[nbt={SelectedItem:{id:"minecraft:rabbit_foot"}}] add HoldingSmoke
execute as @a[tag=HoldingSmoke] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run tag @p add SmokeBombed
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run item replace entity @p armor.head with air
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run item replace entity @p armor.chest with air
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run item replace entity @p armor.legs with air
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run item replace entity @p armor.feet with air
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run effect give @p speed 3 4 true
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run effect give @p invisibility 3 4 true
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run playsound minecraft:entity.player.attack.nodamage master @a ~ ~ ~ 1 0
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run playsound minecraft:block.fire.extinguish master @a ~ ~ ~ 1 0
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run particle minecraft:spit ~ ~1.3 ~ 0.3 0.7 0.3 0.3 100 force
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run kill @s
execute as @a[tag=SmokeBombed] at @s run function powerup:smokebomb/armortime
scoreboard players reset @a[tag=!SmokeBombed,scores={SmokeTime=1..}] SmokeTime