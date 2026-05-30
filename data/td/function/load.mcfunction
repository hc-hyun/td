# 데이터팩이 로드될 때 한 번 실행되는 초기화 함수입니다.
# 적 이동과 타입별 설정에 필요한 점수판 목표들을 준비합니다.
# 이미 존재하는 목표를 다시 추가하면 게임 로그에 경고가 뜰 수 있지만,
# 이후 명령은 계속 실행되므로 테스트용 기본 데이터팩에서는 그대로 둡니다.
scoreboard objectives add td.dir dummy
scoreboard objectives add td.path_dir dummy
scoreboard objectives add td.map_id dummy
scoreboard objectives add td.spawn_id dummy
scoreboard objectives add td.spawn_count dummy
scoreboard objectives add td.spawn_pick dummy
scoreboard objectives add td.step dummy
scoreboard objectives add td.next dummy
scoreboard objectives add td.branch_count dummy
scoreboard objectives add td.branch_pick dummy
scoreboard objectives add td.hp dummy
scoreboard objectives add td.enemy_hp dummy
scoreboard objectives add td.enemy_max_hp dummy
scoreboard objectives add td.hp_ratio dummy
scoreboard objectives add td.speed dummy
scoreboard objectives add td.tower_cd dummy
scoreboard objectives add td.tower_id dummy
scoreboard objectives add td.tower_cost dummy
scoreboard objectives add td.blink_time dummy
scoreboard objectives add td.money dummy
scoreboard objectives add td.reward dummy
scoreboard objectives add td.player_id dummy
scoreboard objectives add td.owner_id dummy
scoreboard objectives add td.place_use minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add td.place_cd dummy
scoreboard objectives add td.place_step dummy
scoreboard objectives add td.place_cost dummy
scoreboard objectives add td.refund dummy
scoreboard objectives add td.tmp dummy
scoreboard objectives add td.wave dummy
scoreboard objectives add td.wave_time dummy
scoreboard objectives add td.wave_state dummy
scoreboard objectives add td.wave_done dummy
scoreboard objectives add td.wave_prep dummy

# 맵 제작자가 바꾸기 쉬운 기본 설정값을 준비합니다.
function td:config/load

# 기지 체력은 가짜 플레이어 $base의 td.hp 점수로 관리합니다.
scoreboard players operation $base td.hp = $core_hp td.hp

# 웨이브 진행 상태입니다.
# 상태값: 0 대기, 1 진행 중, 2 준비 시간, 3 승리, -1 패배.
scoreboard players set $wave td.wave 0
scoreboard players set $wave_time td.wave_time 0
scoreboard players set $wave_state td.wave_state 0
scoreboard players set $wave_done td.wave_done 0
scoreboard players set $wave_prep td.wave_prep 0

# 보스 타입 적이 살아 있을 때 화면 상단에 전체 보스 체력 합계를 보여줍니다.
bossbar add td:boss {text:'Boss Wave',color:'dark_purple',bold:true}
bossbar set td:boss color purple
bossbar set td:boss style notched_10
bossbar set td:boss players @a
bossbar set td:boss max 1
bossbar set td:boss value 0
bossbar set td:boss visible false

# /reload 이후 기존 적 이름표도 현재 텍스트 컴포넌트 문법으로 다시 갱신되게 합니다.
tag @e[tag=td.enemy] remove td.hpbar.ready

function td:map/ensure_ids
function td:spawnpoint/activate_for_map

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
