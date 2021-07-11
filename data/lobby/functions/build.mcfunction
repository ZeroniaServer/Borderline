kill @e[tag=Joinpad]
kill @e[tag=Credits]
setblock 10 5 8 minecraft:oak_wall_sign[facing=west]{GlowingText:1b,Text1:'{"text":""}',Text2:'{"text":"Borderline","bold":true}'}

summon armor_stand 11 7 6 {Tags:["Credits","YZEROcredit"],Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,ShowArms:1b,DisabledSlots:4144959,CustomName:'{"text":"YZEROgame","color":"green"}',CustomNameVisible:1b,Pose:{LeftLeg:[327f,0f,0f],RightLeg:[35f,0f,0f],LeftArm:[5f,0f,0f],RightArm:[285f,50f,0f]}}
summon armor_stand 11 7 10 {Tags:["Credits","Evcredit"],Invulnerable:1b,NoBasePlate:1b,NoGravity:1b,ShowArms:1b,DisabledSlots:4144959,CustomName:'{"text":"Evtema3","color":"red"}',CustomNameVisible:1b,Pose:{Head:[0f,0f,348f],RightLeg:[14f,0f,0f],LeftArm:[265f,54f,0f],RightArm:[270f,0f,0f]},Rotation:[-180.0f,0.0f]}

item replace entity @e[tag=Evcredit] armor.chest with leather_chestplate{display:{color:16777215},Enchantments:[{id:"binding_curse",lvl:1}]}
item replace entity @e[tag=Evcredit] armor.legs with leather_leggings{display:{color:16777215},Enchantments:[{id:"binding_curse",lvl:1}]}
item replace entity @e[tag=Evcredit] armor.feet with leather_boots{display:{color:0},Enchantments:[{id:"binding_curse",lvl:1}]}

item replace entity @e[tag=YZEROcredit] armor.chest with leather_chestplate{display:{color:0},Enchantments:[{id:"binding_curse",lvl:1}]}
item replace entity @e[tag=YZEROcredit] armor.legs with leather_leggings{display:{color:0},Enchantments:[{id:"binding_curse",lvl:1}]}
item replace entity @e[tag=YZEROcredit] armor.feet with leather_boots{display:{color:16777215},Enchantments:[{id:"binding_curse",lvl:1}]}

item replace entity @e[tag=YZEROcredit] weapon.mainhand with cod{Enchantments:[{id:"binding_curse",lvl:1}]}
item replace entity @e[tag=Evcredit] weapon.mainhand with bow{Enchantments:[{id:"binding_curse",lvl:1}]}
item replace entity @e[tag=YZEROcredit] armor.head with player_head{SkullOwner:YZEROgame}
item replace entity @e[tag=Evcredit] armor.head with player_head{SkullOwner:Evtema3}

summon area_effect_cloud 13 4 6 {Duration:2000000000,Tags:["JoinpadPlay","Joinpad"],CustomName:'"Join"',CustomNameVisible:1b}
summon area_effect_cloud 13 4 10 {Duration:2000000000,Tags:["JoinpadSpec","Joinpad"],CustomName:'"Leave/Spectate"',CustomNameVisible:1b}