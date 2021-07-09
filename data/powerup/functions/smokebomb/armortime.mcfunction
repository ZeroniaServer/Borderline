scoreboard players add @s SmokeTime 1
execute as @s[scores={SmokeTime=60..}] run function game:lifeboots
tag @s[scores={SmokeTime=60..}] remove SmokeBombed