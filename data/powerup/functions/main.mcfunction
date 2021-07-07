
#> Slap fish
tag @a remove HoldingSlapFish
tag @a[nbt={SelectedItem:{id:"minecraft:cod"}}] add HoldingSlapFish
execute as @a[tag=HoldingSlapFish,scores={DealtDamage=1..}] at @s run playsound minecraft:entity.guardian.flop master @a ~ ~ ~ 1 1
execute as @a[tag=HoldingSlapFish,scores={DealtDamage=1..}] at @s run clear @s cod 1
scoreboard players reset @a DealtDamage