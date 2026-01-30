
#> Timer
execute if score $state CmdData matches 0 run scoreboard players add $powertime Timer 1
execute if score $state CmdData matches 0 if score $powertime Timer >= $maxptime Timer run function powerup:spawn
execute if score $state CmdData matches 0 if score $powertime Timer >= $maxptime Timer run scoreboard players remove $maxptime Timer 7
execute if score $state CmdData matches 0 if score $powertime Timer >= $maxptime Timer run scoreboard players reset $powertime Timer

#> Exploding Tile
execute as @a if items entity @s weapon.mainhand tnt run tag @s add PressDrop
execute as @a if items entity @s weapon.offhand tnt unless items entity @s weapon.mainhand * run tag @s add PressDrop
execute as @e[type=item,predicate=custom:onground] if items entity @s contents tnt if data entity @s Thrower at @s run function powerup:explodingtile/place
execute as @e[type=marker,tag=exploding,tag=!vanished] at @s positioned ~ ~1 ~ if entity @a[team=Player,gamemode=!spectator,distance=..1.5] positioned ~ ~-1 ~ run function powerup:explodingtile/explode
execute as @e[type=marker,tag=exploding,tag=!vanished] at @s positioned ~ ~1 ~ if entity @e[type=zoglin,distance=..1.5] positioned ~ ~-1 ~ run function powerup:explodingtile/explode
execute as @e[type=marker,tag=exploding,tag=!vanished] at @s positioned ~ ~1 ~ if entity @e[type=arrow,distance=..1.5] positioned ~ ~-1 ~ run function powerup:explodingtile/explode
execute as @e[type=marker,tag=exploding,tag=fallen] at @s run function powerup:explodingtile/explode
execute as @e[type=block_display,tag=tnt] at @s at @e[type=marker,tag=square,limit=1,sort=nearest] if entity @e[type=marker,tag=fallen,limit=1,sort=nearest,distance=..3] run kill @s 

#> Falling Tile
execute as @a if items entity @s weapon.mainhand sand run tag @s add PressDrop
execute as @a if items entity @s weapon.offhand sand unless items entity @s weapon.mainhand * run tag @s add PressDrop
execute as @e[type=item,predicate=custom:onground] if items entity @s contents sand if data entity @s Thrower run scoreboard players add @s CmdData 1
execute as @e[type=item,predicate=custom:onground] if items entity @s contents sand if score @s CmdData matches 10.. if data entity @s Thrower at @s run function powerup:fallingtile/place
execute as @e[type=marker,tag=falling,tag=!fallen,tag=!vanished] at @s positioned ~-2.8 ~ ~-2.8 if entity @a[team=Player,gamemode=!spectator,dx=5.6,dy=2,dz=5.6] at @s run function powerup:fallingtile/fall
execute as @e[type=marker,tag=falling,tag=!fallen,tag=!vanished] at @s positioned ~-2.8 ~ ~-2.8 if entity @e[type=zoglin,dx=5.6,dy=2,dz=5.6] at @s run function powerup:fallingtile/fall
execute as @e[type=marker,tag=falling,tag=!fallen,tag=!vanished] at @s positioned ~-2.8 ~ ~-2.8 if entity @e[type=arrow,dx=5.6,dy=2,dz=5.6] at @s run function powerup:fallingtile/fall

#> Lifting Tile
execute as @a if items entity @s weapon.mainhand piston run tag @s add PressDrop
execute as @a if items entity @s weapon.offhand piston unless items entity @s weapon.mainhand * run tag @s add PressDrop
execute as @e[type=item,predicate=custom:onground] if items entity @s contents piston if data entity @s Thrower at @s run function powerup:liftingtile/place

#> Portal Tile
execute as @a if items entity @s weapon.mainhand respawn_anchor run tag @s add PressDrop
execute as @a if items entity @s weapon.offhand respawn_anchor unless items entity @s weapon.mainhand * run tag @s add PressDrop
execute as @e[type=item,predicate=custom:onground] if items entity @s contents respawn_anchor if data entity @s Thrower at @s run function powerup:portaltile/place
execute as @a[team=Player,gamemode=!spectator,tag=!teleported] at @s if block ~ ~-1 ~ respawn_anchor if entity @e[type=marker,tag=portal,tag=!fallen,tag=!vanished,distance=5..] run function powerup:portaltile/use
execute as @a[team=Player,gamemode=!spectator,tag=teleported] at @s unless block ~ ~-1 ~ respawn_anchor run tag @s remove teleported
execute as @e[type=zoglin,tag=!teleported] at @s if block ~ ~-1 ~ respawn_anchor if entity @e[type=marker,tag=portal,tag=!fallen,tag=!vanished,distance=5..] run function powerup:portaltile/use
execute as @e[type=zoglin,tag=teleported] at @s unless block ~ ~-1 ~ respawn_anchor run tag @s remove teleported
execute as @e[type=marker,tag=portal,tag=!fallen,tag=!portalfalling] at @s run function powerup:portaltile/setanchor
execute as @e[type=marker,tag=portalfalling] at @s positioned ~ ~-2 ~ if entity @e[type=falling_block,distance=..2] at @s run function powerup:portaltile/sand

#> Ice Tile
execute as @a if items entity @s weapon.mainhand ice run tag @s add PressDrop
execute as @a if items entity @s weapon.offhand ice unless items entity @s weapon.mainhand * run tag @s add PressDrop
execute as @e[type=item,predicate=custom:onground] if items entity @s contents ice if data entity @s Thrower at @s run function powerup:icetile/place
execute as @e[type=marker,tag=icecheck,tag=!vanished] run scoreboard players add @s icecheck 0
execute as @e[type=marker,tag=icecheck,tag=!vanished] at @s positioned ~ ~1 ~ if entity @a[distance=..1,predicate=custom:onground] run scoreboard players add @s[scores={icecheck=..60}] icecheck 1
execute as @e[type=marker,tag=icecheck,tag=!vanished] at @s run function powerup:icetile/setice
execute as @e[type=marker,tag=ice,tag=!fallen,tag=!vanished] at @s if blocks ~-2 ~ ~-2 ~2 ~ ~2 ~ -10 ~ all run tag @s add fallen

#> Jump Boost
execute as @a if items entity @s weapon.mainhand rabbit_foot run tag @s add PressClick
execute as @a if items entity @s weapon.offhand rabbit_foot unless items entity @s weapon.mainhand * run tag @s add PressClick

#> Smoke Bomb
execute as @a if items entity @s weapon.mainhand popped_chorus_fruit run tag @s add PressClick
execute as @a if items entity @s weapon.offhand popped_chorus_fruit unless items entity @s weapon.mainhand * run tag @s add PressClick
execute as @a[tag=SmokeBombed] at @s run function powerup:smokebomb/armortime
scoreboard players reset @a[tag=!SmokeBombed,scores={SmokeTime=1..}] SmokeTime

#> Ender Pearl
execute as @e[type=ender_pearl] at @s run function powerup:pearl/track
execute as @e[type=marker,tag=pearltracker] at @s unless entity @e[type=ender_pearl,tag=tracked,distance=..2] run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1
execute as @e[type=marker,tag=pearltracker] at @s unless entity @e[type=ender_pearl,tag=tracked,distance=..2] run kill @s

#> Unleash the Beast
execute as @a if items entity @s weapon.mainhand rotten_flesh run tag @s add PressDrop
execute as @a if items entity @s weapon.offhand rotten_flesh unless items entity @s weapon.mainhand * run tag @s add PressDrop
execute as @e[type=item,predicate=custom:onground] if items entity @s contents rotten_flesh if data entity @s Thrower at @s run function powerup:beast/unleash

#> Weakness Arrow
execute as @a[predicate=powerup:has_weakness] if items entity @s weapon.mainhand copper_spear[custom_data~{weak:false}] run item modify entity @s weapon.mainhand powerup:weaken_fish
execute as @a[predicate=!powerup:has_weakness] if items entity @s weapon.mainhand copper_spear[custom_data~{weak:true}] run item modify entity @s weapon.mainhand powerup:strengthen_fish

#> Actionbar
execute as @a[tag=PressDrop] run title @s actionbar ["",{text:"Press ",color:"red"},{"keybind":"key.drop",bold:true,color:"blue"},{text:" to use this powerup!",color:"red"}]
execute as @a[tag=PressClick] run title @s actionbar ["",{text:"Press ",color:"red"},{"keybind":"key.use",bold:true,color:"blue"},{text:" to use this powerup!",color:"red"}]
execute as @a[tag=!PressDrop,tag=!PressClick] run title @s actionbar [""]
tag @a[tag=PressDrop] remove PressDrop
tag @a[tag=PressClick] remove PressClick

#> Item removal
execute as @a[team=Player] at @s run function powerup:crafting/check