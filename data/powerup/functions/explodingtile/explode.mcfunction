summon creeper ~ ~2 ~ {ignited:1b,Fuse:1,Silent:1b,ExplosionRadius:2}
execute store result entity @e[type=creeper,limit=1,sort=nearest] ExplosionRadius byte 3 run scoreboard players get @s blast
data merge entity @e[type=creeper,limit=1,sort=nearest] {Fuse:0}
kill @e[type=armor_stand,tag=tnt,limit=1,sort=nearest]
tag @s remove exploding
scoreboard players reset @s blast