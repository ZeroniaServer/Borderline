summon creeper ~ ~2 ~ {Fuse:0,Silent:1b,ExplosionRadius:2}
execute store result entity @e[type=creeper,limit=1,sort=nearest] ExplosionRadius byte 3 run scoreboard players get @s blast
kill @e[type=armor_stand,tag=tnt,limit=1,sort=nearest]
tag @s remove exploding
scoreboard players reset @s blast