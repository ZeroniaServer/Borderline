
#> Scoreboards
scoreboard objectives add CmdData dummy
scoreboard objectives add GameID dummy
scoreboard objectives add Timer dummy
scoreboard objectives add Rounds dummy
scoreboard objectives add Lives dummy
scoreboard objectives add armorcolor dummy
scoreboard objectives add shootbow minecraft.used:minecraft.bow
scoreboard objectives add DealtDamage minecraft.custom:minecraft.damage_dealt
scoreboard objectives add blast dummy
scoreboard objectives add playerUUID dummy
scoreboard objectives add leaveGame minecraft.custom:minecraft.leave_game
scoreboard objectives add SmokeTime dummy
scoreboard objectives add portaluse dummy
scoreboard objectives add hasarrow dummy
scoreboard objectives add hastippedarrow dummy
scoreboard objectives add firstjoin dummy
scoreboard objectives add gridcolor dummy
scoreboard objectives add lifts dummy

#> Teams
#Player team
team add Player
team modify Player color white
team modify White seeFriendlyInvisibles false
#Lobby team
team add Lobby
team modify Lobby color gold
team modify Lobby friendlyFire false
#Spectators
team add Spectator
team modify Spectator friendlyFire false
team modify Spectator color blue

#> Gamerules
gamerule mobGriefing false
gamerule doMobSpawning false
gamerule doMobLoot false
gamerule fallDamage false

#> Extra
execute positioned 8 3 8 run tag @e[type=marker,tag=square,limit=1,sort=nearest] add center
time set 12725