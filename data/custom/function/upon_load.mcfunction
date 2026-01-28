
#> Scoreboards
scoreboard objectives add CmdData dummy
scoreboard objectives add GameID dummy
scoreboard objectives add Timer dummy
scoreboard objectives add Rounds dummy
scoreboard objectives add Lives dummy
scoreboard objectives add armorcolor dummy
scoreboard objectives add shootbow minecraft.used:minecraft.bow
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
scoreboard objectives add icecheck dummy

#> Teams
#Player team
team add Player
team modify Player color white
team modify Player seeFriendlyInvisibles false
#Lobby team
team add Lobby
team modify Lobby color gold
team modify Lobby friendlyFire false
#Spectators
team add Spectator
team modify Spectator friendlyFire false
team modify Spectator color blue

#> Gamerules
gamerule mob_griefing false
gamerule spawn_mobs false
gamerule spawn_monsters false
gamerule spawn_patrols false
gamerule spawn_phantoms false
gamerule spawn_wandering_traders false
gamerule spawn_wardens false
gamerule mob_drops false
gamerule fall_damage false
gamerule send_command_feedback false
gamerule random_tick_speed 0
gamerule locator_bar false
gamerule log_admin_commands false

#> Extra
execute positioned 8 3 8 run tag @e[type=marker,tag=square,limit=1,sort=nearest] add center
execute unless score $lit CmdData matches 1 run function lobby:light
time set 12725