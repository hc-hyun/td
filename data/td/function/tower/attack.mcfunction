# 방어 유닛 공격 디스패처입니다.
# 타겟/피격 임시 태그를 정리한 뒤 타입별 공격 함수로 넘깁니다.
function td:tower/clear_temp

execute if score @s td.tower_type matches 1 run function td:tower/attack/basic
execute if score @s td.tower_type matches 2 run function td:tower/attack/splash
execute if score @s td.tower_type matches 3 run function td:tower/attack/blink

function td:tower/clear_temp
