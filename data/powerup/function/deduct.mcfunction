# TODO: couldn't this be done with an item modifier instead?
execute store result score @s CmdData run data get entity @s Item.count
scoreboard players remove @s CmdData 1
execute store result entity @s Item.count byte 1 run scoreboard players get @s CmdData
kill @s[scores={CmdData=..0}]