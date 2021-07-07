
#> Slap fish
tag @a remove HoldingSlapFish
tag @a[nbt={SelectedItem:{id:"minecraft:cod"}}] add HoldingSlapFish
execute as @a[tag=HoldingSlapFish,scores={DealtDamage=1..}] at @s run playsound minecraft:entity.guardian.flop master @a ~ ~ ~ 1 1
execute as @a[tag=HoldingSlapFish,scores={DealtDamage=1..}] at @s run clear @s cod 1
scoreboard players reset @a DealtDamage

#> Exploding tile
tag @a remove HoldingETile
tag @a[nbt={SelectedItem:{id:"minecraft:tnt_minecart"}}] add HoldingETile
execute as @a[tag=HoldingETile] run title @s actionbar ["",{"text":"Press ","color":"red"},{"keybind":"key.drop","bold":true,"color":"blue"},{"text":" to use this powerup!","color":"red"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:tnt_minecart"},OnGround:1b}] if data entity @s Thrower at @s run function powerup:explodingtile/place
execute as @e[type=marker,tag=exploding] at @s positioned ~-2 ~ ~-2 if entity @a[dx=2,dy=2,dz=2] at @s run function powerup:explodingtile/explode
