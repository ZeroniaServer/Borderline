kill @e[type=area_effect_cloud,tag=Joinpad]
kill @e[type=armor_stand,tag=Credits]
setblock 10 5 8 minecraft:oak_wall_sign[facing=west]{front_text:{has_glowing_text:true,messages:["",{text:"Borderline",bold:true},{text:"v1.1.6",italic:true},""]}}

summon armor_stand 11 7 6 {Tags:["Credits","YZEROcredit"],Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,ShowArms:1b,CustomName:{text:"YZEROgame",color:"green"},CustomNameVisible:1b,Pose:{LeftLeg:[327f,0f,0f],RightLeg:[35f,0f,0f],LeftArm:[5f,0f,0f],RightArm:[285f,50f,0f]}}
summon armor_stand 11 7 10 {Tags:["Credits","Evcredit"],Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,ShowArms:1b,CustomName:{text:"Evtema3",color:"red"},CustomNameVisible:1b,Pose:{Head:[0f,0f,348f],RightLeg:[14f,0f,0f],LeftArm:[265f,54f,0f],RightArm:[270f,0f,0f]},Rotation:[-180.0f,0.0f]}

item replace entity @e[type=armor_stand,tag=Evcredit,limit=1] armor.chest with leather_chestplate[dyed_color=16777215,enchantments={binding_curse:1},enchantment_glint_override=false]
item replace entity @e[type=armor_stand,tag=Evcredit,limit=1] armor.legs with leather_leggings[dyed_color=16777215,enchantments={binding_curse:1},enchantment_glint_override=false]
item replace entity @e[type=armor_stand,tag=Evcredit,limit=1] armor.feet with leather_boots[dyed_color=0,enchantments={binding_curse:1},enchantment_glint_override=false]

item replace entity @e[type=armor_stand,tag=YZEROcredit,limit=1] armor.chest with leather_chestplate[dyed_color=0,enchantments={binding_curse:1},enchantment_glint_override=false]
item replace entity @e[type=armor_stand,tag=YZEROcredit,limit=1] armor.legs with leather_leggings[dyed_color=0,enchantments={binding_curse:1},enchantment_glint_override=false]
item replace entity @e[type=armor_stand,tag=YZEROcredit,limit=1] armor.feet with leather_boots[dyed_color=16777215,enchantments={binding_curse:1},enchantment_glint_override=false]

item replace entity @e[type=armor_stand,tag=YZEROcredit,limit=1] weapon.mainhand with cod
item replace entity @e[type=armor_stand,tag=Evcredit,limit=1] weapon.mainhand with bow
item replace entity @e[type=armor_stand,tag=YZEROcredit,limit=1] armor.head with player_head[profile="YZEROgame"]
item replace entity @e[type=armor_stand,tag=Evcredit,limit=1] armor.head with player_head[profile="Evtema3"]

data modify entity @e[type=armor_stand,tag=YZEROcredit,limit=1] DisabledSlots set value 4144959
data modify entity @e[type=armor_stand,tag=Evcredit,limit=1] DisabledSlots set value 4144959

summon area_effect_cloud 13 4 6 {Duration:2000000000,Tags:["JoinpadPlay","Joinpad"],CustomName:"Join",CustomNameVisible:1b,Radius:0,custom_particle:{type:"block",block_state:"air"}}
summon area_effect_cloud 13 4 10 {Duration:2000000000,Tags:["JoinpadSpec","Joinpad"],CustomName:"Leave/Spectate",CustomNameVisible:1b,Radius:0,custom_particle:{type:"block",block_state:"air"}}

# Zorrpann statue
setblock 17 4 7 minecraft:deepslate_brick_wall[north=none,waterlogged=false,south=low,east=none,up=true,west=none] strict
setblock 17 4 8 minecraft:deepslate_brick_wall[north=low,waterlogged=false,south=low,east=low,up=true,west=none] strict
setblock 17 4 9 minecraft:deepslate_brick_wall[north=low,waterlogged=false,south=none,east=none,up=true,west=none] strict
setblock 18 4 7 minecraft:polished_deepslate_slab[type=bottom,waterlogged=false] strict
setblock 19 4 7 minecraft:deepslate_brick_wall[north=none,waterlogged=false,south=tall,east=none,up=true,west=none] strict
setblock 19 4 8 minecraft:deepslate_brick_wall[north=tall,waterlogged=false,south=tall,east=none,up=true,west=low] strict
setblock 19 4 9 minecraft:deepslate_brick_wall[north=tall,waterlogged=false,south=none,east=none,up=true,west=none] strict
setblock 18 4 9 minecraft:polished_deepslate_slab[type=bottom,waterlogged=false] strict
setblock 18 4 8 minecraft:reinforced_deepslate strict
setblock 18 5 8 minecraft:red_carpet strict
setblock 17 5 7 minecraft:red_stained_glass_pane[waterlogged=false,south=false,east=true,north=false,west=false] strict
setblock 17 5 9 minecraft:red_stained_glass_pane[waterlogged=false,south=false,east=true,north=false,west=false] strict
setblock 18 5 9 minecraft:red_stained_glass_pane[waterlogged=false,south=false,east=true,north=false,west=true] strict
setblock 18 5 7 minecraft:red_stained_glass_pane[waterlogged=false,south=false,east=true,north=false,west=true] strict
setblock 19 5 7 minecraft:red_stained_glass_pane[waterlogged=false,south=true,east=false,north=false,west=true] strict
setblock 19 5 9 minecraft:red_stained_glass_pane[waterlogged=false,south=false,east=false,north=true,west=true] strict
setblock 19 5 8 minecraft:red_stained_glass_pane[waterlogged=false,south=true,east=false,north=true,west=false] strict
setblock 19 6 8 minecraft:red_stained_glass_pane[waterlogged=false,south=true,east=false,north=true,west=false] strict
setblock 19 6 7 minecraft:red_stained_glass_pane[waterlogged=false,south=true,east=false,north=false,west=true] strict
setblock 19 6 9 minecraft:red_stained_glass_pane[waterlogged=false,south=false,east=false,north=true,west=true] strict
setblock 18 6 9 minecraft:red_stained_glass_pane[waterlogged=false,south=false,east=true,north=false,west=false] strict
setblock 18 6 7 minecraft:red_stained_glass_pane[waterlogged=false,south=false,east=true,north=false,west=false] strict
setblock 17 6 7 minecraft:end_rod[facing=up] strict
setblock 17 6 9 minecraft:end_rod[facing=up] strict

kill @e[type=text_display,tag=statue]
kill @e[type=item_display,tag=statue]
kill @e[type=interaction,tag=statue]
execute as @e[type=mannequin,tag=statue] run function custom:kill
summon text_display 17 7.25 8 {Tags:["statue"],text:[{text:"Zorrpann",color:"white",shadow_color:[0.2,0.2,0.2,1],bold:true}],billboard:"fixed",Rotation:[90.0,0.0],background:0,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.25f,2.25f,2.25f]}}
summon text_display 17 7 8 {Tags:["statue"],text:[{text:"First to 1000 Rounds",color:"yellow",shadow_color:[0.5,0.5,0,1],bold:true}],billboard:"fixed",Rotation:[90.0,0.0],background:0}
execute positioned 18 5 8 align xyz positioned ~0.5 ~ ~0.5 run summon item_display ~ ~ ~ {Tags:["statue"],Passengers:[{id:"interaction",width:1.5,height:1.5,response:0b,Tags:["statue"]},{id:"minecraft:mannequin",Tags:["statue"],Invulnerable:1b,profile:"Zorrpann",NoGravity:1b,Rotation:[90.0,0.0]}]}