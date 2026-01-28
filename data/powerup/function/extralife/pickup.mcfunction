advancement revoke @s only powerup:get_extra_life
playsound minecraft:item.totem.use master @s ~ ~ ~ 1 2
particle minecraft:totem_of_undying ~ ~1 ~ 0.3 0.3 0.3 0.6 30 force
scoreboard players add @s Lives 1
title @s title " "
title @s subtitle ["",{text:"+1 Life! (",color:"green"},{"score":{"name":"@s","objective":"Lives"},color:"gold"},{text:")",color:"green"}]
function game:lifeboots
clear @s totem_of_undying 1