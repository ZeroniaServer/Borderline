
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

#> Teams
#Black team
team add Black
team modify Black color black
team modify Black friendlyFire false
team modify Black seeFriendlyInvisibles false
#White team
team add White
team modify White color white
team modify White friendlyFire false
team modify White seeFriendlyInvisibles false
#In-border team
team add Border
team modify Border color green
team modify Border friendlyFire true
team modify Border seeFriendlyInvisibles false
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