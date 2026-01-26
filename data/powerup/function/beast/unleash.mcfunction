playsound entity.zombified_piglin.hurt master @a ~ ~ ~ 1 0.5
playsound block.fire.extinguish master @a ~ ~ ~ 1 0.5
particle poof ~ ~ ~ 1 0 1 0.2 100 force
summon zoglin ~ ~ ~ {CustomName:{text:"The Beast",color:"dark_red",bold:true},CustomNameVisible:1b}
function powerup:deduct