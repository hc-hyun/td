# 타입별 소환 함수가 몹을 만든 뒤 공통으로 실행하는 초기화 함수입니다.
# 이 함수는 반드시 새 몹 자신을 @s로 잡은 상태에서 실행해야 합니다.

# 새 적의 이동 상태를 초기화합니다.
# td.dir 0은 아직 이동 방향이 정해지지 않은 상태입니다.
# td.step은 현재 블록 안에서 이동한 틱 수, td.next는 다음 방향 후보입니다.
scoreboard players set @s td.dir 0
scoreboard players set @s td.step 0
scoreboard players set @s td.next 0

# 소환 직후 현재 칸에서 주변 검은 양털을 검사해 첫 이동 방향을 정합니다.
function td:path/on_cell

# 초기화가 끝난 적에서 임시 태그를 제거합니다.
tag @s remove td.new
