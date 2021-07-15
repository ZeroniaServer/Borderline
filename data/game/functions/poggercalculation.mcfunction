
#> Blatantly stolen from Meteor Miners but it works
execute if entity @a[team=Player,scores={CmdData=1024..}] run scoreboard players remove @a[team=Player] CmdData 1024
execute if entity @a[team=Player,scores={CmdData=512..}] run scoreboard players remove @a[team=Player] CmdData 512
execute if entity @a[team=Player,scores={CmdData=256..}] run scoreboard players remove @a[team=Player] CmdData 256
execute if entity @a[team=Player,scores={CmdData=128..}] run scoreboard players remove @a[team=Player] CmdData 128
execute if entity @a[team=Player,scores={CmdData=64..}] run scoreboard players remove @a[team=Player] CmdData 64
execute if entity @a[team=Player,scores={CmdData=32..}] run scoreboard players remove @a[team=Player] CmdData 32
execute if entity @a[team=Player,scores={CmdData=16..}] run scoreboard players remove @a[team=Player] CmdData 16
execute if entity @a[team=Player,scores={CmdData=8..}] run scoreboard players remove @a[team=Player] CmdData 8
execute if entity @a[team=Player,scores={CmdData=4..}] run scoreboard players remove @a[team=Player] CmdData 4
execute if entity @a[team=Player,scores={CmdData=2..}] run scoreboard players remove @a[team=Player] CmdData 2
execute if entity @a[team=Player,scores={CmdData=1..}] run scoreboard players remove @a[team=Player] CmdData 1
execute if entity @a[team=Player,scores={CmdData=1..}] run function game:poggercalculation