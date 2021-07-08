
#> Timer
execute if score $state CmdData matches 0 run scoreboard players add $powertime Timer 1
execute if score $state CmdData matches 0 if score $powertime Timer >= $maxptime Timer run function powerup:spawn
execute if score $state CmdData matches 0 if score $powertime Timer >= $maxptime Timer run scoreboard players remove $maxptime Timer 7
execute if score $state CmdData matches 0 if score $powertime Timer >= $maxptime Timer run scoreboard players reset $powertime Timer

#> Slap Fish
tag @a remove HoldingSlapFish
tag @a[nbt={SelectedItem:{id:"minecraft:cod"}}] add HoldingSlapFish
execute as @a[tag=HoldingSlapFish,scores={DealtDamage=0..}] at @s run playsound minecraft:entity.guardian.flop master @a ~ ~ ~ 1 1
clear @a[tag=HoldingSlapFish,scores={DealtDamage=0..}] cod 1
scoreboard players reset @a DealtDamage

#> Exploding Tile
tag @a remove HoldingETile
tag @a[nbt={SelectedItem:{id:"minecraft:tnt_minecart"}}] add HoldingETile
execute as @a[tag=HoldingETile] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:tnt_minecart"},OnGround:1b}] if data entity @s Thrower at @s run function powerup:explodingtile/place
execute as @e[type=marker,tag=exploding,tag=!vanished] at @s positioned ~-2 ~ ~-2 if entity @a[dx=2,dy=2,dz=2] at @s run function powerup:explodingtile/explode
execute as @e[type=marker,tag=exploding,tag=!vanished] at @s positioned ~ ~1 ~ if entity @e[type=arrow,distance=..1] at @s run function powerup:explodingtile/explode

#> Falling Tile
tag @a remove HoldingFTile
tag @a[nbt={SelectedItem:{id:"minecraft:sand"}}] add HoldingFTile
execute as @a[tag=HoldingFTile] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:sand"},OnGround:1b}] run scoreboard players add @s CmdData 1
execute as @e[type=item,nbt={Item:{id:"minecraft:sand"},OnGround:1b},scores={CmdData=10..}] if data entity @s Thrower at @s run function powerup:fallingtile/place
execute as @e[type=marker,tag=falling,tag=!fallen,tag=!vanished] at @s positioned ~-2 ~ ~-2 if entity @a[dx=2,dy=2,dz=2] at @s run function powerup:fallingtile/fall
execute as @e[type=marker,tag=falling,tag=!fallen,tag=!vanished] at @s positioned ~ ~1 ~ if entity @e[type=arrow,distance=..1] at @s run function powerup:fallingtile/fall

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
execute as @e[type=item,nbt={Item:{id:"minecraft:rabbit_foot"}}] if data entity @s Thrower at @s run function powerup:jumpboost/use

#> Smoke Bomb
tag @a remove HoldingSmoke
tag @a[nbt={SelectedItem:{id:"minecraft:popped_chorus_fruit"}}] add HoldingSmoke
execute as @a[tag=HoldingSmoke] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run function powerup:smokebomb/use
execute as @a[tag=SmokeBombed] at @s run function powerup:smokebomb/armortime
scoreboard players reset @a[tag=!SmokeBombed,scores={SmokeTime=1..}] SmokeTime

#> Ender Pearl
execute as @e[type=ender_pearl] at @s run function powerup:pearl/track
execute as @e[type=marker,tag=pearltracker] at @s unless entity @e[type=ender_pearl,tag=tracked,distance=..2] run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1
execute as @e[type=marker,tag=pearltracker] at @s unless entity @e[type=ender_pearl,tag=tracked,distance=..2] run kill @s

#> Unleash the Beast
tag @a remove HoldingBeast
tag @a[nbt={SelectedItem:{id:"minecraft:rotten_flesh"}}] add HoldingBeast
execute as @a[tag=HoldingBeast] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:rotten_flesh"},OnGround:1b}] if data entity @s Thrower at @s run function powerup:beast/unleash