schedule clear grid:random
schedule clear grid:vanish
tag @e[type=marker,tag=square] remove selected
function grid:reset
worldborder center 8 8
worldborder set 50
scoreboard players reset $timer Timer
scoreboard players reset $maxtime Timer
scoreboard players reset $state CmdData