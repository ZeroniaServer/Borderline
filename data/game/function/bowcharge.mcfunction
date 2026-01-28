execute as @a[scores={shootbow=1..}] store result score @s hasarrow run clear @s arrow 0
execute as @a[scores={shootbow=1..}] store result score @s hastippedarrow run clear @s tipped_arrow 0
execute as @a[scores={shootbow=1..}] run scoreboard players operation @s hasarrow += @s hastippedarrow
execute as @a[scores={shootbow=1..,hasarrow=0}] run tag @s add ChargeArrow

scoreboard players add @a[tag=ChargeArrow] shootbow 1

execute as @a[tag=ChargeArrow,scores={shootbow=85..,hasarrow=0}] run give @s arrow[custom_name={text:"Arrow",italic:false,color:"gold",bold:true},custom_data={main_item:true}] 1
execute as @a[tag=ChargeArrow,scores={shootbow=85..}] run tag @s remove ChargeArrow

execute as @e[type=arrow,nbt={inGround:1b}] run kill @s

scoreboard players reset @a[tag=!ChargeArrow] shootbow
scoreboard players reset @a[tag=!ChargeArrow] hasarrow
scoreboard players reset @a[tag=!ChargeArrow] hastippedarrow