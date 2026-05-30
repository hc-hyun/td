# BlackWoolTD

검은 양털을 길 데이터로 사용하는 간단한 타워 디펜스용 Minecraft Java 데이터팩입니다.

몹은 현재 칸에서 주변 4방향의 `minecraft:black_wool`을 확인하고, 방금 온 방향의 반대편을 제외한 다음 검은 양털 칸으로 이동합니다. 갈 수 있는 칸이 여러 개면 적마다 후보 중 하나를 균등 랜덤으로 고릅니다. 이동 중에는 진행 방향을 바라보고, 끝점은 더 이상 앞으로 갈 검은 양털이 없는 막다른 길로 처리됩니다.

몹은 타입별 설정을 가질 수 있습니다. 현재는 `basic`, `fast`, `tank`, `boss` 4종을 제공하며, 각 타입은 체력, 속도, 크기, 외형, 이름, 소환 이펙트가 다릅니다.

적은 머리 위에 `타입명 n/10 체력바` 형식의 이름표 체력바를 표시합니다. boss 타입 적이 살아 있으면 화면 상단에는 살아 있는 boss들의 HP 합산 bossbar도 표시됩니다.

웨이브 게임은 직접 편집 가능한 `td:wave/config/wave_01` ~ `td:wave/config/wave_20` 스폰표를 사용합니다. 각 파일은 특정 tick에 어떤 적을 소환할지만 담고, 웨이브 시작/클리어/준비 시간/승패 처리는 `td:wave/*` 함수가 공통으로 담당합니다.

## 지원 버전

- Minecraft Java Edition 26.1 계열
- 데이터팩 포맷: `101.1`
- 최신 데이터팩 구조인 `data/<namespace>/function` 및 `data/minecraft/tags/function` 단수 폴더를 사용합니다.

## 설치 위치

이 폴더 전체를 월드의 `datapacks` 폴더 안에 둡니다.

```text
world/
  datapacks/
    BlackWoolTD/
      pack.mcmeta
      data/
      README.md
      .gitignore
```

Minecraft가 데이터팩으로 인식하려면 `BlackWoolTD` 폴더 바로 아래에 `pack.mcmeta`와 `data/`가 있어야 합니다.

## 사용 방법

1. 월드에서 검은 양털로 1칸 폭 경로를 하나 이상 만듭니다.
2. 게임 안에서 데이터팩을 다시 불러옵니다.

```mcfunction
/reload
```

3. 각 맵의 검은 양털 시작 칸 위에 서서 시작점을 저장합니다.

```mcfunction
/function td:map/save_here
```

기존 테스트 명령인 `td:set_start`도 계속 사용할 수 있지만, 새 운영에서는 `td:map/save_here`를 권장합니다.

4. 플레이할 맵 시작점 근처에 서서 활성 맵을 선택합니다.

```mcfunction
/function td:map/activate_nearest
```

맵 상태를 보거나 가까운 저장 맵을 삭제하려면 다음 명령을 사용합니다.

```mcfunction
/function td:map/status
/function td:map/remove_nearest
```

5. 웨이브 게임을 시작합니다.

```mcfunction
/function td:wave/start
```

`td:wave/start`는 활성 맵이 있을 때만 동작합니다. 새 게임 시작용이라 기존 방어 유닛도 함께 정리합니다. 방어 유닛은 `td:wave/start` 이후에 배치합니다.

6. 원하는 위치에 방어 유닛을 배치합니다.

```mcfunction
/function td:tower/place/basic
/function td:tower/place/splash
/function td:tower/place/blink
```

가까운 방어 유닛을 제거하려면 다음 명령을 사용합니다.

```mcfunction
/function td:tower/remove_nearest
```

웨이브 사이 30초 준비 시간을 건너뛰거나, 상태를 확인하거나, 진행 중인 웨이브를 멈추려면 다음 명령을 사용합니다.

```mcfunction
/function td:wave/next
/function td:wave/status
/function td:wave/stop
```

7. 원하는 타입의 적을 수동 소환해서 테스트할 수도 있습니다.

```mcfunction
/function td:spawn/basic
/function td:spawn/fast
/function td:spawn/tank
/function td:spawn/boss
```

기존 테스트 명령도 계속 사용할 수 있습니다. 이 명령은 `td:spawn/basic`을 호출합니다.

```mcfunction
/function td:spawn_enemy
```

8. 기지 체력을 확인합니다.

```mcfunction
/scoreboard players get $base td.hp
```

테스트 중 유닛을 정리하려면 다음 초기화 함수를 사용합니다.

```mcfunction
/function td:reset/enemies
/function td:reset/towers
/function td:reset/all
```

이 초기화 함수들은 적과 방어 유닛만 정리하며, 검은 양털 경로 시작점과 기지 체력은 유지합니다.

## 경로 제작 규칙

- 검은 양털 경로는 1칸 폭이어야 합니다.
- 대각선 이동은 지원하지 않습니다.
- 갈림길은 지원합니다. 적마다 되돌아가는 방향을 제외한 검은 양털 후보 중 하나를 균등 랜덤으로 선택합니다.
- 높낮이 없는 평면 경로를 기준으로 합니다.
- 시작점과 끝점은 막다른 길이어야 합니다.
- 순환 경로는 방문 기록을 따로 저장하지 않으므로 피하는 것이 좋습니다.

예시:

```text
S ■ ■ ■
      ■
      ■ ■ ■ E
```

## 주요 함수

- `td:load`: 점수판과 팀을 준비하고 기본 기지 체력을 20으로 설정합니다.
- `td:tick`: 매 틱마다 `td.enemy` 태그가 붙은 적을 처리합니다.
- `td:set_start`: 예전 사용법을 위한 호환 함수입니다. 내부적으로 `td:map/save_here`를 실행합니다.
- `td:map/save_here`: 현재 위치에 저장 맵 시작점을 만들고 즉시 활성 맵으로 전환합니다.
- `td:map/activate_nearest`: 플레이어 8블록 안의 가장 가까운 저장 맵 시작점을 활성 맵으로 선택합니다.
- `td:map/remove_nearest`: 플레이어 8블록 안의 가장 가까운 저장 맵 시작점을 삭제합니다.
- `td:map/status`: 활성 맵 존재 여부와 현재 웨이브/코어 상태를 표시합니다.
- `td:spawn/basic`: 기본 좀비 적을 소환합니다.
- `td:spawn/fast`: 빠른 vindicator 적을 소환합니다.
- `td:spawn/tank`: 느리고 튼튼한 pillager 적을 소환합니다.
- `td:spawn/boss`: 크고 체력이 높은 evoker 보스 적을 소환합니다.
- `td:spawn_enemy`: 예전 사용법을 위한 호환 함수입니다. 내부적으로 `td:spawn/basic`을 실행합니다.
- `td:wave/start`: 활성 맵이 있으면 적과 방어 유닛을 초기화하고 코어 HP를 20으로 되돌린 뒤 1웨이브를 시작합니다.
- `td:wave/next`: 준비 시간 중이면 즉시 다음 웨이브를 시작합니다.
- `td:wave/stop`: 웨이브를 대기 상태로 전환하고 남은 적을 정리합니다.
- `td:wave/status`: 현재 웨이브, 코어 HP, 상태값, 준비 시간 tick을 채팅에 표시합니다.
- `td:wave/tick`: 웨이브 스폰표 실행, 클리어 판정, 준비 시간, 승패 처리를 담당합니다.
- `td:tower/place/basic`: 플레이어 위치에 기본 mannequin 방어 유닛을 배치합니다.
- `td:tower/place/splash`: 플레이어 위치에 광역 마법 방어 유닛을 배치합니다.
- `td:tower/place/blink`: 플레이어 위치에 순간이동 광역 방어 유닛을 배치합니다.
- `td:tower/remove_nearest`: 플레이어 기준 4블록 안의 가장 가까운 방어 유닛을 제거합니다.
- `td:tower/tick`: 방어 유닛의 쿨타임과 공격 판정을 처리합니다.
- `td:enemy/hpbar/update`: 현재 적의 점수판 HP를 기준으로 머리 위 체력바를 갱신합니다.
- `td:enemy/bossbar/tick`: 살아 있는 boss 타입 적들의 전체 HP를 bossbar에 반영합니다.
- `td:reset/enemies`: 모든 적 유닛과 bossbar 상태를 초기화합니다.
- `td:reset/towers`: 모든 아군 방어 유닛과 blink 복귀 marker를 초기화합니다.
- `td:reset/all`: 적과 아군 방어 유닛을 모두 초기화합니다.
- `td:path/on_cell`: 현재 칸 주변의 검은 양털을 검사해서 다음 이동 방향을 고릅니다. 후보가 여러 개면 적마다 랜덤으로 하나를 선택합니다.
- `td:path/finish`: 적이 끝점에 도착했을 때 기지 체력을 1 줄이고 적을 제거합니다.

## 몹 타입

| 타입 | 함수 | 엔티티 | HP | 속도 | 크기 |
| --- | --- | --- | ---: | --- | ---: |
| basic | `td:spawn/basic` | zombie | 10 | normal | 1.0 |
| fast | `td:spawn/fast` | vindicator | 6 | fast | 0.85 |
| tank | `td:spawn/tank` | pillager | 30 | slow | 1.25 |
| boss | `td:spawn/boss` | evoker | 100 | slow | 1.5 |

속도 프리셋은 다음과 같습니다.

| 속도 | `td.speed` | 이동량 | 다음 칸 검사 |
| --- | ---: | ---: | ---: |
| slow | 1 | 0.05블록/틱 | 20틱마다 |
| normal | 2 | 0.1블록/틱 | 10틱마다 |
| fast | 3 | 0.2블록/틱 | 5틱마다 |

## 방어 유닛

| 타입 | 함수 | 엔티티 | 피해 | 사거리 | 공격 주기 | 특징 |
| --- | --- | --- | ---: | ---: | ---: | --- |
| basic | `td:tower/place/basic` | mannequin | 4 | 8블록 | 40틱 | 가장 가까운 적 1명 공격 |
| splash | `td:tower/place/splash` | mannequin | 3 | 7블록 | 60틱 | 타겟 주변 2.5블록 광역 공격 |
| blink | `td:tower/place/blink` | mannequin | 5 | 12블록 | 100틱 | 타겟에게 순간이동해 주변 3블록 광역 공격 후 6틱 동안 머물다 복귀 |

방어 유닛은 `minecraft:mannequin`을 사용하며, 공격할 때 `/swing`으로 팔을 휘두르고 `td.enemy`의 `td.enemy_hp` 점수를 깎습니다. 쿨타임과 사거리 검사는 공통 `td:tower/tick`에서 처리하고, 실제 공격 방식과 이펙트는 `td:tower/attack/<타입>` 함수가 담당합니다.

## 적 체력바

일반 적은 이름표를 체력바로 사용합니다. 체력바는 바닐라 엔티티 `Health`가 아니라 데이터팩의 `td.enemy_hp`와 `td.enemy_max_hp` 점수판 값을 기준으로 계산합니다.

예시:

```text
Basic 6/10 ██████░░░░
Tank 3/10 ███░░░░░░░
```

체력바는 적 소환 직후와 타워 피해 적용 직후 갱신됩니다. `/reload` 이후 기존 적에게 체력바가 없으면 `td:enemy/hpbar/init_missing`이 다음 tick에 한 번 보정합니다.

boss 타입 적이 하나 이상 살아 있으면 `td:boss` bossbar가 화면 상단에 표시됩니다. 여러 boss가 동시에 있으면 현재 HP와 최대 HP를 각각 합산해서 하나의 보스 웨이브 체력처럼 보여줍니다.

## 다중 맵 운영

BlackWoolTD는 월드 안에 여러 디펜스맵 시작점을 저장할 수 있지만, 게임 진행은 항상 하나의 활성 맵만 사용합니다. 저장된 시작점은 `td.map.start` marker로 남고, 현재 활성 맵 하나에만 `td.map.active`와 기존 호환용 `td.start` 태그가 붙습니다.

예전 방식으로 만든 `td.start` 시작점만 남아 있는 월드는 `/reload` 때 자동으로 새 marker 구조로 보정됩니다.

맵을 추가하려면 각 맵의 시작 칸 위에서 다음 명령을 실행합니다.

```mcfunction
/function td:map/save_here
```

플레이할 맵을 바꾸려면 해당 맵 시작점 8블록 안에서 다음 명령을 실행합니다.

```mcfunction
/function td:map/activate_nearest
```

활성 맵을 바꾸면 진행 중인 적, 방어 유닛, 웨이브 상태가 초기화되고 코어 HP가 20으로 돌아갑니다. 같은 월드에 여러 맵을 두는 용도이며, 여러 맵을 동시에 독립 진행하는 구조는 아닙니다.

가까운 저장 맵 시작점을 삭제하거나 현재 상태를 확인하려면 다음 명령을 사용합니다.

```mcfunction
/function td:map/remove_nearest
/function td:map/status
```

## 웨이브 시스템

웨이브 게임은 다음 공개 함수로 제어합니다.

```mcfunction
/function td:wave/start
/function td:wave/next
/function td:wave/stop
/function td:wave/status
```

`td:wave/start`는 새 게임 시작용입니다. 모든 적과 방어 유닛을 정리하고 `$base td.hp`를 20으로 리셋한 뒤 1웨이브를 시작합니다. 웨이브가 클리어되면 방어 유닛은 유지되고, 다음 웨이브까지 `600`틱, 즉 30초 준비 시간이 주어집니다.

활성 맵이 없으면 `td:wave/start`는 시작하지 않고 안내 메시지만 표시합니다.

웨이브별 스폰표는 아래 파일을 직접 편집합니다.

```text
data/td/function/wave/config/
  wave_01.mcfunction
  wave_02.mcfunction
  ...
  wave_20.mcfunction
```

각 파일은 스폰 명령과 완료 tick만 담습니다.

```mcfunction
execute if score $wave_time td.wave_time matches 20 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 50 run function td:spawn/basic
execute if score $wave_time td.wave_time matches 220 run scoreboard players set $wave_done td.wave_done 1
```

새 적 타입을 웨이브에 넣을 때는 `td:spawn/<타입>` 함수를 만든 뒤 config 파일에서 호출하면 됩니다. 마지막 스폰 이후 충분한 여유 tick에 `$wave_done td.wave_done`을 `1`로 설정해야, 남은 적이 모두 사라졌을 때 클리어 판정이 납니다.

현재 웨이브 초안은 다음 흐름입니다.

| Wave | 구성 | 완료 tick |
| --- | --- | ---: |
| 1 | basic x6 | 220 |
| 2 | basic x10 | 300 |
| 3 | basic x8 + fast x4 | 340 |
| 4 | basic x14 | 340 |
| 5 | tank x2 + basic x10 | 420 |
| 6 | fast x12 | 320 |
| 7 | basic x12 + tank x3 | 480 |
| 8 | fast x8 + tank x4 | 500 |
| 9 | basic x24 | 360 |
| 10 | boss x1 + basic x10 | 520 |
| 11 | fast x18 + basic x8 | 480 |
| 12 | tank x8 | 420 |
| 13 | basic x20 + fast x10 | 540 |
| 14 | tank x5 + fast x12 | 560 |
| 15 | boss x1 + tank x4 + basic x12 | 700 |
| 16 | fast x24 + tank x4 | 640 |
| 17 | basic x30 + tank x8 | 760 |
| 18 | boss x1 + fast x18 | 720 |
| 19 | basic x20 + fast x12 + tank x6 + boss x1 | 840 |
| 20 | boss x2 + 지원군 반복 | 1000 |

## 점수판 값

- `td.dir`: 현재 이동 방향입니다.
  - `0`: 아직 방향 없음
  - `1`: 동쪽, `+X`
  - `2`: 서쪽, `-X`
  - `3`: 남쪽, `+Z`
  - `4`: 북쪽, `-Z`
- `td.step`: 현재 블록을 몇 틱 동안 이동했는지 저장합니다.
- `td.next`: 다음 이동 방향 후보입니다.
- `td.branch_count`: 현재 칸에서 되돌아가는 방향을 제외하고 갈 수 있는 검은 양털 후보 수입니다.
- `td.branch_pick`: 갈림길 후보 중 몇 번째 방향을 선택할지 저장하는 적별 랜덤 값입니다.
- `td.hp`: 기지 체력입니다. `$base` 가짜 플레이어에 저장됩니다.
- `td.enemy_hp`: 적의 현재 체력입니다.
- `td.enemy_max_hp`: 적의 최대 체력입니다.
- `td.hp_ratio`: 적 체력바의 1~10 단계 값입니다.
- `td.type`: 적 타입 번호입니다.
  - `1`: basic
  - `2`: fast
  - `3`: tank
  - `4`: boss
- `td.speed`: 적 속도 프리셋입니다.
  - `1`: slow
  - `2`: normal
  - `3`: fast
- `td.tower_cd`: 방어 유닛의 공격 쿨타임입니다. 40 이상이고 사거리 안에 적이 있으면 공격합니다.
- `td.tower_type`: 방어 유닛 타입 번호입니다.
  - `1`: basic
  - `2`: splash
  - `3`: blink
- `td.tower_id`: 방어 유닛과 순간이동 복귀 marker를 짝짓기 위한 고유 번호입니다.
- `td.blink_time`: blink 방어 유닛이 타겟 위치에 머무는 남은 틱입니다.
- `td.wave`: 현재 웨이브 번호입니다. `$wave` 가짜 플레이어에 저장됩니다.
- `td.wave_time`: 현재 웨이브 경과 tick입니다. `$wave_time` 가짜 플레이어에 저장됩니다.
- `td.wave_state`: 웨이브 상태입니다. `$wave_state` 값이 `0`이면 대기, `1`이면 진행 중, `2`이면 준비 시간, `3`이면 승리, `-1`이면 패배입니다.
- `td.wave_done`: 현재 웨이브의 스폰 완료 여부입니다. `$wave_done`이 `1`이고 남은 적이 없으면 클리어 처리됩니다.
- `td.wave_prep`: 다음 웨이브까지 남은 준비 tick입니다. `$wave_prep` 가짜 플레이어에 저장됩니다.
- `td.tmp`: 공통 계산용 임시 점수판입니다. 타워 데미지는 `$damage td.tmp`, 체력바 배율은 `$hp_scale td.tmp`, bossbar 합계는 `$boss_hp`와 `$boss_max`에 저장합니다.

## 몹 타입 추가 방법

새 몹 타입을 추가할 때는 기존 타입을 복사해서 아래 흐름을 맞추면 됩니다.

1. `data/td/function/spawn/<타입>.mcfunction`을 만들고 원하는 바닐라 엔티티를 소환합니다.
2. 소환 NBT에 `td.enemy`, `td.new`, `td.type.<타입>` 태그를 넣습니다.
3. `data/td/function/enemy/type/<타입>.mcfunction`을 만들고 `td.type`, `td.enemy_hp`, `td.enemy_max_hp`, `td.speed`, `minecraft:scale`, 장비, 소환 이펙트를 설정합니다.
4. `data/td/function/load.mcfunction`에 타입별 팀을 추가하고 `collisionRule never`를 설정합니다.
5. 소환 함수에서 타입 설정 함수 실행 후 `td:spawn/common`을 실행합니다.

타입별 소환 함수는 몹 외형과 기본 설정만 담당하고, 실제 이동은 `td:enemy/move`와 `td:enemy/speed/*` 함수가 공통으로 처리합니다.

## 방어 유닛 타입 추가 방법

새 방어 유닛을 추가할 때는 기존 `basic`, `splash`, `blink` 중 가장 비슷한 타입을 복사해서 아래 흐름을 맞추면 됩니다.

1. `data/td/function/tower/place/<타입>.mcfunction`을 만들고 `minecraft:mannequin`을 소환합니다.
2. 소환 NBT에 `td.tower`, `td.tower.new`, `td.tower.<타입>` 태그를 넣습니다.
3. `data/td/function/tower/type/<타입>.mcfunction`에서 `td.tower_type`, 초기 `td.tower_cd`, 팀, 장비, 크기, 배치 이펙트를 설정합니다.
4. `data/td/function/tower/tick.mcfunction`에 해당 타입의 쿨타임, 사거리, `td.tower_type` 분기 조건을 추가합니다.
5. `data/td/function/tower/attack.mcfunction`에 새 타입 번호와 `td:tower/attack/<타입>` 호출을 추가합니다.
6. `data/td/function/tower/attack/<타입>.mcfunction`에서 타겟 선정, `/swing`, 파티클/소리, 피해 적용을 구현합니다.

공격 함수에서는 시작 전에 `td:tower/attack`이 임시 태그를 정리합니다. 가장 가까운 단일 타겟은 `td.tower.target`, 광역 피해 대상은 `td.tower.hit` 태그를 붙인 뒤 `td:tower/damage/apply` 또는 `td:tower/damage/hit_tagged`를 호출합니다. 순간이동형 공격은 `td.tower.origin` marker로 원위치를 저장하고 `td.blink_time`이 끝난 뒤 반드시 돌아오도록 작성합니다. 적의 `td.enemy_hp`를 바꾸는 새 피해 함수는 생존한 적에게 `td:enemy/hpbar/update`도 호출해야 합니다.

## 파일 메모

`.mcfunction` 파일은 `#` 주석을 사용할 수 있어서 각 명령의 역할을 한글 주석으로 설명했습니다.

`pack.mcmeta`, `load.json`, `tick.json`은 JSON 파일입니다. JSON은 표준 문법상 주석을 허용하지 않으므로, 데이터팩이 깨지지 않도록 이 파일들에는 주석을 넣지 않았습니다.

JSON 파일의 역할은 다음과 같습니다.

- `pack.mcmeta`: Minecraft가 이 폴더를 데이터팩으로 인식하게 하고, 지원 데이터팩 포맷을 `101.1`로 지정합니다.
- `data/minecraft/tags/function/load.json`: `/reload` 또는 월드 로드 시 `td:load`를 자동 실행하도록 등록합니다.
- `data/minecraft/tags/function/tick.json`: 매 게임 틱마다 `td:tick`을 자동 실행하도록 등록합니다.
