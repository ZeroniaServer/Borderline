execute as @a[scores={shootbow=1..}] run tag @s add ChargeArrow

scoreboard players add @a[tag=ChargeArrow] shootbow 1

execute as @a[tag=ChargeArrow,scores={shootbow=85..}] run give @s arrow{display:{Name:'[{"text":"Arrow","italic":false,"color":"gold","bold":true}]'}} 1
execute as @a[tag=ChargeArrow,scores={shootbow=85..}] run tag @s remove ChargeArrow

execute as @e[type=arrow,nbt={inGround:1b}] run kill @s

scoreboard players reset @a[tag=!ChargeArrow] shootbow