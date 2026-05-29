# 데이터팩이 로드될 때 한 번 실행되는 초기화 함수입니다.
# 적 이동에 필요한 점수판 목표들을 준비합니다.
# 이미 존재하는 목표를 다시 추가하면 게임 로그에 경고가 뜰 수 있지만,
# 이후 명령은 계속 실행되므로 테스트용 기본 데이터팩에서는 그대로 둡니다.
scoreboard objectives add td.dir dummy
scoreboard objectives add td.step dummy
scoreboard objectives add td.next dummy
scoreboard objectives add td.hp dummy

# 기지 체력은 가짜 플레이어 $base의 td.hp 점수로 관리합니다.
# /reload 할 때마다 기본값 20으로 다시 맞춰집니다.
scoreboard players set $base td.hp 20

# 적끼리 서로 밀리지 않도록 전용 팀을 만들고 충돌을 끕니다.
# NoAI 적을 tp로 움직이는 방식이라 충돌이 켜져 있으면 경로가 어긋날 수 있습니다.
team add td_enemy
team modify td_enemy collisionRule never
