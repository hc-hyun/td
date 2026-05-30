# 데이터팩이 로드될 때 한 번 실행되는 초기화 함수입니다.
# 적 이동과 타입별 설정에 필요한 점수판 목표들을 준비합니다.
# 이미 존재하는 목표를 다시 추가하면 게임 로그에 경고가 뜰 수 있지만,
# 이후 명령은 계속 실행되므로 테스트용 기본 데이터팩에서는 그대로 둡니다.
scoreboard objectives add td.dir dummy
scoreboard objectives add td.step dummy
scoreboard objectives add td.next dummy
scoreboard objectives add td.hp dummy
scoreboard objectives add td.enemy_hp dummy
scoreboard objectives add td.enemy_max_hp dummy
scoreboard objectives add td.type dummy
scoreboard objectives add td.speed dummy
scoreboard objectives add td.tower_cd dummy
scoreboard objectives add td.tower_type dummy
scoreboard objectives add td.tower_id dummy
scoreboard objectives add td.blink_time dummy
scoreboard objectives add td.tmp dummy

# 기지 체력은 가짜 플레이어 $base의 td.hp 점수로 관리합니다.
# /reload 할 때마다 기본값 20으로 다시 맞춰집니다.
scoreboard players set $base td.hp 20

# 예전 단일 적 팀 이름은 호환성을 위해 남겨둡니다.
team add td_enemy
team modify td_enemy collisionRule never

# 타입별 팀을 만들고 색상과 충돌 규칙을 설정합니다.
# 적은 타입별 팀 중 하나에 들어가며, td.enemy 태그로 공통 처리됩니다.
# NoAI 적을 tp로 움직이는 방식이라 충돌이 켜져 있으면 경로가 어긋날 수 있습니다.
team add td_enemy_basic
team modify td_enemy_basic color green
team modify td_enemy_basic collisionRule never

team add td_enemy_fast
team modify td_enemy_fast color yellow
team modify td_enemy_fast collisionRule never

team add td_enemy_tank
team modify td_enemy_tank color aqua
team modify td_enemy_tank collisionRule never

team add td_enemy_boss
team modify td_enemy_boss color dark_purple
team modify td_enemy_boss collisionRule never

# 방어 유닛은 mannequin 엔티티를 사용합니다.
# 적 경로와 플레이어 이동을 방해하지 않도록 충돌을 끕니다.
team add td_tower
team modify td_tower color blue
team modify td_tower collisionRule never
