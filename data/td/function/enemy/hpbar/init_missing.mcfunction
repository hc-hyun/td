# /reload 이후 아직 체력바가 갱신되지 않은 기존 적을 보정합니다.
execute as @e[tag=td.enemy,tag=!td.hpbar.ready] at @s run function td:enemy/hpbar/update
