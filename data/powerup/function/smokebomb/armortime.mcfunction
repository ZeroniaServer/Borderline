scoreboard players add @s SmokeTime 1
execute as @s[scores={SmokeTime=60..}] run function powerup:smokebomb/makevisible
tag @s[scores={SmokeTime=60..}] remove SmokeBombed