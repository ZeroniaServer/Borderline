function powerup:selectlocation
execute as @e[type=marker,tag=spawnLocation,limit=1] at @s run loot spawn ~ ~1 ~ loot powerup:items
execute as @e[type=marker,tag=spawnLocation,limit=1] at @s run summon firework_rocket ~ ~1.4 ~ {LifeTime:0,FireworksItem:{id:"firework_rocket",count:1,components:{fireworks:{flight_duration:0,explosions:[{shape:burst,has_twinkle:false,has_trail:false,colors:[15790320],fade_colors:[1973019]}]}}}}
execute as @e[type=marker,tag=spawnLocation,limit=1] at @s as @e[type=item,limit=1,sort=nearest,tag=!PowerupSpawn] run data modify entity @s CustomName set from entity @s Item.components."minecraft:custom_name"
execute as @e[type=marker,tag=spawnLocation,limit=1] at @s as @e[type=item,limit=1,sort=nearest,tag=!PowerupSpawn] run data merge entity @s {Glowing:1b,CustomNameVisible:1b,Tags:["PowerupSpawn"]}
tag @e[type=marker,tag=spawnLocation] remove spawnLocation