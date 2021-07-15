
#> Reset grid
schedule clear grid:random
schedule clear grid:vanish
tag @e[type=marker,tag=square] remove selected
execute as @e[type=marker,tag=square,tag=lifted] at @s run fill ~-2 ~-1 ~-2 ~2 ~ ~2 air
execute as @e[type=marker,tag=square] at @s run tp @s ~ 3 ~
execute as @e[type=marker,tag=falling] at @s run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 air
tag @e[type=marker,tag=falling] remove falling
tag @e[type=marker,tag=fallen] remove fallen
scoreboard players reset @e[type=marker,tag=lifted] lifts
tag @e[type=marker,tag=lifted] remove lifted
scoreboard players reset @e[type=marker,tag=exploding] blast
tag @e[type=marker,tag=exploding] remove exploding
scoreboard players reset @e[type=marker,tag=portal] portaluse
tag @e[type=marker,tag=portal] remove portal
function grid:reset

#> Kill entities
kill @e[type=armor_stand,tag=tnt]
kill @e[type=arrow]
kill @e[type=ender_pearl]
kill @e[type=marker,tag=pearltracker]
tp @e[type=zoglin] 0 -100 0
execute as @e[type=zoglin] run data merge entity @s {DeathTime:19s}
kill @e[type=zoglin]
kill @e[type=falling_block]
kill @e[type=item]

#> Reset world border and game states
worldborder center 8 8
worldborder set 50
scoreboard players reset $timer Timer
scoreboard players reset $maxtime Timer
scoreboard players reset $state CmdData
scoreboard players reset $maxptime Timer
scoreboard players reset $powertime Timer

#> Manage players
tag @a[tag=LastStanding] remove LastStanding
tag @a remove JoinPlay
kill @e[type=marker,tag=GameID]
scoreboard objectives remove GameID
scoreboard objectives add GameID dummy
team join Lobby @a
clear @a
execute as @a run tp @s @s
tp @a 8 5 8 -90 0
gamemode adventure @a
title @a clear
scoreboard players reset @a CmdData

#> Remove bossbars
bossbar remove gridtimer
bossbar remove countdown

#> Change gamestate
scoreboard players set $gamestate CmdData 0

#> Set up lobby
function lobby:build