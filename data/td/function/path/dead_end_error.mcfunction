# 코어가 아닌 막다른 길에 도착한 적은 경로 오류로 제거합니다.
particle minecraft:smoke ~ ~1 ~ 0.35 0.35 0.35 0.03 16
playsound minecraft:block.note_block.bass master @a[distance=..24] ~ ~ ~ 0.5 0.6
tellraw @a[distance=..32] {text:'TD path error: enemy reached a dead end that is not near the active core.',color:'red'}
kill @s
