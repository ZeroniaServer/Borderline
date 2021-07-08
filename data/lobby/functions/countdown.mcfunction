scoreboard players remove $Countdown CmdData 1
scoreboard players set $cddone CmdData 0
scoreboard players set $cdsound CmdData 10
bossbar set countdown players @a
execute store result bossbar countdown value run scoreboard players get $Countdown CmdData
bossbar set countdown name ["",{"text":"Starting in: ","bold":true,"color":"white"},{"score":{"name":"$Countdown","objective":"CmdData"},"bold":true,"color":"dark_gray"}]

execute if score $Countdown CmdData <= $cdsound CmdData if score $Countdown CmdData matches 3.. as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1
execute if score $Countdown CmdData matches 2 as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.25
execute if score $Countdown CmdData matches 1 as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
execute if score $Countdown CmdData matches 0 as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2

execute if score $Countdown CmdData <= $cddone CmdData as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 0
execute if score $Countdown CmdData <= $cddone CmdData unless score $joined CmdData <= $minplayers CmdData run function game:start
execute if score $Countdown CmdData <= $cddone CmdData unless score $Joined CmdData >= $minplayers CmdData run function game:stop
execute if score $Countdown CmdData <= $cddone CmdData unless score $Joined CmdData >= $minplayers CmdData run tellraw @a {"text":"Invalid amount of players. The match has been cancelled.","color":"red"}
execute if score $Countdown CmdData <= $cddone CmdData unless score $Joined CmdData >= $minplayers CmdData run title @a title " "
execute if score $Countdown CmdData <= $cddone CmdData unless score $Joined CmdData >= $minplayers CmdData run title @a subtitle " "
execute if score $gamestate CmdData matches 1 if score $Countdown CmdData > $cddone CmdData run schedule function lobby:countdown 1s