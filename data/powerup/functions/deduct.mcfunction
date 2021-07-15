execute store result score @s CmdData run data get entity @s Item.Count
scoreboard players remove @s CmdData 1
execute store result entity @s Item.Count byte 1 run scoreboard players get @s CmdData
kill @s[scores={CmdData=..0}]