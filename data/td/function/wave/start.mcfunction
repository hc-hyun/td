# 새 웨이브 게임을 시작합니다.
# 적과 방어 유닛을 모두 정리하고, 코어 HP를 20으로 되돌린 뒤 1웨이브를 시작합니다.
function td:reset/all
scoreboard players set $base td.hp 20
scoreboard players set $wave td.wave 1
function td:wave/begin

