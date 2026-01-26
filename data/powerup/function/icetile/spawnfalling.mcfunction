execute if score @s icecheck matches ..15 unless block ~ ~ ~ respawn_anchor run summon falling_block ~ ~ ~ {BlockState:{Name:"frosted_ice",Properties:{age:"0"}}}
execute if score @s icecheck matches 16..30 unless block ~ ~ ~ respawn_anchor run summon falling_block ~ ~ ~ {BlockState:{Name:"frosted_ice",Properties:{age:"1"}}}
execute if score @s icecheck matches 31..45 unless block ~ ~ ~ respawn_anchor run summon falling_block ~ ~ ~ {BlockState:{Name:"frosted_ice",Properties:{age:"2"}}}
execute if score @s icecheck matches 46..60 unless block ~ ~ ~ respawn_anchor run summon falling_block ~ ~ ~ {BlockState:{Name:"frosted_ice",Properties:{age:"3"}}}
execute if score @s icecheck matches 61.. if block ~ ~ ~ frosted_ice run summon falling_block ~ ~ ~ {BlockState:{Name:"frosted_ice",Properties:{age:"3"}}}
setblock ~ ~ ~ air strict
kill @s