
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
tag @a[nbt={SelectedItem:{id:"minecraft:tnt"}}] add PressDrop
execute as @e[type=item,nbt={Item:{id:"minecraft:tnt"},OnGround:1b}] if data entity @s Thrower at @s run function powerup:explodingtile/place
execute as @e[type=marker,tag=exploding,tag=!vanished] at @s positioned ~-2.8 ~ ~-2.8 if entity @a[team=Player,gamemode=!spectator,dx=5.6,dy=2,dz=5.6] at @s run function powerup:explodingtile/explode
execute as @e[type=marker,tag=exploding,tag=!vanished] at @s positioned ~-2.8 ~ ~-2.8 if entity @e[type=zoglin,dx=5.6,dy=2,dz=5.6] at @s run function powerup:explodingtile/explode
execute as @e[type=marker,tag=exploding,tag=!vanished] at @s positioned ~-2.8 ~ ~-2.8 if entity @e[type=arrow,dx=5.6,dy=2,dz=5.6] at @s run function powerup:explodingtile/explode
execute as @e[type=marker,tag=exploding,tag=fallen] at @s run function powerup:explodingtile/explode
execute as @e[type=armor_stand,tag=tnt] at @s at @e[type=marker,tag=square,limit=1,sort=nearest] if entity @e[type=marker,tag=fallen,limit=1,sort=nearest,distance=..3] run kill @s 

#> Falling Tile
tag @a[nbt={SelectedItem:{id:"minecraft:sand"}}] add PressDrop
execute as @e[type=item,nbt={Item:{id:"minecraft:sand"},OnGround:1b}] run scoreboard players add @s CmdData 1
execute as @e[type=item,nbt={Item:{id:"minecraft:sand"},OnGround:1b},scores={CmdData=10..}] if data entity @s Thrower at @s run function powerup:fallingtile/place
execute as @e[type=marker,tag=falling,tag=!fallen,tag=!vanished] at @s positioned ~-2.8 ~ ~-2.8 if entity @a[team=Player,gamemode=!spectator,dx=5.6,dy=2,dz=5.6] at @s run function powerup:fallingtile/fall
execute as @e[type=marker,tag=falling,tag=!fallen,tag=!vanished] at @s positioned ~-2.8 ~ ~-2.8 if entity @e[type=zoglin,dx=5.6,dy=2,dz=5.6] at @s run function powerup:fallingtile/fall
execute as @e[type=marker,tag=falling,tag=!fallen,tag=!vanished] at @s positioned ~-2.8 ~ ~-2.8 if entity @e[type=arrow,dx=5.6,dy=2,dz=5.6] at @s run function powerup:fallingtile/fall

#> Lifting Tile
tag @a[nbt={SelectedItem:{id:"minecraft:piston"}}] add PressDrop
execute as @e[type=item,nbt={Item:{id:"minecraft:piston"},OnGround:1b}] if data entity @s Thrower at @s run function powerup:liftingtile/place

#> Portal Tile
tag @a[nbt={SelectedItem:{id:"minecraft:respawn_anchor"}}] add PressDrop
execute as @e[type=item,nbt={Item:{id:"minecraft:respawn_anchor"},OnGround:1b}] if data entity @s Thrower at @s run function powerup:portaltile/place
execute as @a[team=Player,gamemode=!spectator,tag=!teleported] at @s if block ~ ~-1 ~ respawn_anchor if entity @e[type=marker,tag=portal,tag=!fallen,tag=!vanished,distance=5..] run function powerup:portaltile/use
execute as @a[team=Player,gamemode=!spectator,tag=teleported] at @s unless block ~ ~-1 ~ respawn_anchor run tag @s remove teleported
execute as @e[type=zoglin,tag=!teleported] at @s if block ~ ~-1 ~ respawn_anchor if entity @e[type=marker,tag=portal,tag=!fallen,tag=!vanished,distance=5..] run function powerup:portaltile/use
execute as @e[type=zoglin,tag=teleported] at @s unless block ~ ~-1 ~ respawn_anchor run tag @s remove teleported
execute as @e[type=marker,tag=portalfalling] at @s positioned ~ ~-2 ~ if entity @e[type=falling_block,distance=..2] at @s run function powerup:portaltile/sand

#> Extra Life
execute as @a[nbt={Inventory:[{id:"minecraft:totem_of_undying"}]}] at @s run function powerup:extralife/pickup

#> Jump Boost
tag @a[nbt={SelectedItem:{id:"minecraft:rabbit_foot"}}] add PressDrop
execute as @e[type=item,nbt={Item:{id:"minecraft:rabbit_foot"}}] if data entity @s Thrower at @s run function powerup:jumpboost/use

#> Smoke Bomb
tag @a[nbt={SelectedItem:{id:"minecraft:popped_chorus_fruit"}}] add PressDrop
execute as @e[type=item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}}] if data entity @s Thrower at @s run function powerup:smokebomb/use
execute as @a[tag=SmokeBombed] at @s run function powerup:smokebomb/armortime
scoreboard players reset @a[tag=!SmokeBombed,scores={SmokeTime=1..}] SmokeTime

#> Ender Pearl
execute as @e[type=ender_pearl] at @s run function powerup:pearl/track
execute as @e[type=marker,tag=pearltracker] at @s unless entity @e[type=ender_pearl,tag=tracked,distance=..2] run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1
execute as @e[type=marker,tag=pearltracker] at @s unless entity @e[type=ender_pearl,tag=tracked,distance=..2] run kill @s

#> Unleash the Beast
tag @a[nbt={SelectedItem:{id:"minecraft:rotten_flesh"}}] add PressDrop
execute as @e[type=item,nbt={Item:{id:"minecraft:rotten_flesh"},OnGround:1b}] if data entity @s Thrower at @s run function powerup:beast/unleash

#> Actionbar
execute as @a[tag=PressDrop] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @a[tag=!PressDrop] run title @s actionbar [""]
tag @a[tag=PressDrop] remove PressDrop