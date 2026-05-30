# BlackWoolTD

검은 양털을 길 데이터로 사용하는 Minecraft Java 26.1 계열 타워 디펜스 데이터팩입니다.

이 README는 맵 제작자가 설정하는 순서대로 정리되어 있습니다. 먼저 맵과 마커를 만들고, 웨이브를 구성한 뒤, 필요하면 몹/아군/경제 수치를 조정하면 됩니다.

`data/td/function/config/*` 값을 바꾼 뒤에는 `/reload`를 실행해야 새 설정이 적용됩니다.

## 지원 버전

- Minecraft Java Edition 26.1 계열
- 데이터팩 포맷: `101.1`
- 최신 데이터팩 구조인 `data/<namespace>/function` 및 `data/minecraft/tags/function` 단수 폴더를 사용합니다.

## 설치 위치

월드의 `datapacks` 폴더 안에 `BlackWoolTD` 폴더를 둡니다.

```text
world/
  datapacks/
    BlackWoolTD/
      pack.mcmeta
      data/
      README.md
      .gitignore
```

게임 안에서 다시 불러옵니다.

```mcfunction
/reload
```

## 1. 맵 만들기

검은 양털(`minecraft:black_wool`)을 1칸 폭으로 깔아 적 이동 경로를 만듭니다. 적은 현재 칸의 동/서/남/북 검은 양털을 보고 이동하며, 방금 온 방향으로는 되돌아가지 않습니다.

| 해야 할 일 | 명령 또는 위치 |
| --- | --- |
| 시작점 저장 | `/function td:map/save_here` |
| 코어 저장 | `/function td:core/save_here` |
| 플레이할 맵 활성화 | `/function td:map/activate_nearest` |
| 스폰 지점 저장 | `/function td:spawnpoint/save_here/1` ~ `/8` |
| 합류 지점 방향 가이드 | `/function td:path/guide/east`, `west`, `south`, `north` |
| 상태 확인 | `/function td:map/status`, `/function td:spawnpoint/status`, `/function td:core/status` |
| 게임 시작 | `/function td:wave/start` |

### 맵 제작 체크리스트

```mcfunction
/reload
/function td:map/save_here
/function td:core/save_here
/function td:spawnpoint/save_here/1
/function td:path/guide/east
/function td:map/status
/function td:spawnpoint/status
/function td:core/status
/function td:wave/start
```

방향 가이드는 합류 지점이나 강제 진행이 필요한 칸에서만 저장합니다. 예시의 `east`는 목적지가 동쪽일 때 쓰는 값입니다.

### 경로 규칙

- 검은 양털 경로는 평면 1칸 폭을 기준으로 합니다.
- 대각선 이동은 지원하지 않습니다.
- 시작점은 막다른 길로 만들고, 도착 지점에는 코어 marker를 저장합니다.
- 코어가 아닌 막다른 길에 적이 도착하면 경로 오류로 처리되며 코어 HP는 줄지 않습니다.
- 갈림길은 지원합니다. 후보가 여러 개면 적마다 랜덤으로 하나를 고릅니다.
- 두 길이 다시 만나는 합류 칸에는 목적지 방향 가이드를 둡니다.
- 순환 경로는 방문 기록이 없으므로 피합니다.

### 기본 맵 저장 순서

1. 검은 양털 시작 칸 위에 섭니다.
2. 시작점을 저장합니다.

```mcfunction
/function td:map/save_here
```

3. 지켜야 할 코어 블록 위에 서서 코어를 저장합니다.

```mcfunction
/function td:core/save_here
```

코어 marker는 활성 맵의 `td.map_id`에 묶입니다. 적이 이 marker 근처의 막다른 길에 도착하면 타입별 `td.core_damage`만큼 코어 HP가 줄어듭니다. 코어 에너지는 `td:core` bossbar로 표시됩니다.

4. 적을 나오게 할 칸마다 서서 스폰 지점을 저장합니다.

```mcfunction
/function td:spawnpoint/save_here/1
/function td:spawnpoint/save_here/2
```

스폰 지점은 활성 맵의 `td.map_id`에 묶입니다. 한 맵에는 `1`부터 `8`까지 저장할 수 있습니다. 스폰 지점이 하나도 없으면 활성 맵 시작점인 `td.start`에서 적이 나옵니다.

5. 합류형 경로가 있다면 합류 칸에서 목적지 방향 가이드를 저장합니다.

```mcfunction
/function td:path/guide/east
/function td:path/guide/west
/function td:path/guide/south
/function td:path/guide/north
```

6. 저장 상태를 확인합니다.

```mcfunction
/function td:map/status
/function td:spawnpoint/status
/function td:core/status
```

7. 게임을 시작합니다.

```mcfunction
/function td:wave/start
```

### 여러 맵 운영

월드 안에 여러 시작점을 저장할 수 있지만, 게임은 항상 하나의 활성 맵만 사용합니다. 플레이할 맵 시작점 8블록 안에서 아래 명령을 실행하면 해당 맵이 활성화되고, 기존 적/아군/웨이브 상태와 코어 HP가 초기화됩니다.

```mcfunction
/function td:map/activate_nearest
```

가까운 맵 시작점을 지우면 같은 `td.map_id`에 묶인 스폰 지점과 코어도 함께 삭제됩니다.

```mcfunction
/function td:map/remove_nearest
```

## 2. 웨이브 구성하기

웨이브는 사람이 직접 편집하는 함수 파일입니다.

```text
data/td/function/wave/config/
  wave_01.mcfunction
  wave_02.mcfunction
  ...
  wave_20.mcfunction
```

각 파일에는 “몇 tick에 무엇을 소환할지”와 “언제 스폰 완료로 볼지”만 적습니다. 웨이브 시작, 클리어, 준비 시간, 승리/패배는 `td:wave/*`가 공통 처리합니다.

| 목적 | 예시 |
| --- | --- |
| 활성 스폰 지점 중 랜덤 | `execute if score $wave_time td.wave_time matches 20 run function td:spawn/random {type:"basic"}` |
| 특정 번호 스폰 지점 | `execute if score $wave_time td.wave_time matches 100 run function td:spawn/from {type:"fast",id:2}` |
| 모든 활성 스폰 지점 | `execute if score $wave_time td.wave_time matches 200 run function td:spawn/all {type:"tank"}` |
| 웨이브 스폰 완료 | `execute if score $wave_time td.wave_time matches 300 run scoreboard players set $wave_done td.wave_done 1` |

예시:

```mcfunction
# Wave 01: basic x3
execute if score $wave_time td.wave_time matches 20 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 50 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 80 run function td:spawn/random {type:"basic"}
execute if score $wave_time td.wave_time matches 140 run scoreboard players set $wave_done td.wave_done 1
```

`$wave_done`이 `1`이고 남은 `td.enemy`가 없으면 웨이브가 클리어됩니다. 완료 tick은 마지막 적이 충분히 나올 시간을 둔 뒤로 잡는 것이 좋습니다.

## 3. 몹 추가하기

현재 적 타입은 `basic`, `fast`, `tank`, `boss`입니다.

| 타입 | 랜덤 소환 예시 | 엔티티 | 기본 HP | 기본 속도 | 기본 보상 | 코어 피해 |
| --- | --- | --- | ---: | --- | ---: | ---: |
| basic | `td:spawn/random {type:"basic"}` | zombie | 10 | normal | 5 | 1 |
| fast | `td:spawn/random {type:"fast"}` | vindicator | 6 | fast | 6 | 1 |
| tank | `td:spawn/random {type:"tank"}` | pillager | 30 | slow | 15 | 3 |
| boss | `td:spawn/random {type:"boss"}` | evoker | 100 | slow | 80 | 10 |

### 기존 몹 수치만 조정

| 바꿀 것 | 수정 위치 |
| --- | --- |
| HP, 속도, 처치 보상, 코어 피해 | `data/td/function/config/enemy/<타입>.mcfunction` |
| 엔티티 종류 | `data/td/function/spawn/type/<타입>.mcfunction` |
| 장비, 크기, 소환 이펙트 | `data/td/function/enemy/type/<타입>.mcfunction` |
| 머리 위 체력바 표시 이름 | `data/td/function/enemy/hpbar/type/<타입>.mcfunction` |

속도 값은 `1 = slow`, `2 = normal`, `3 = fast`입니다. 크기(`minecraft:scale`)는 `attribute` 명령이 숫자 리터럴을 요구하므로 `enemy/type/<타입>.mcfunction`에서 직접 수정합니다.

### 새 몹 타입 추가

기존 타입 중 가장 비슷한 것을 복사해서 만듭니다. 새 타입 이름은 매크로의 `type` 값과 파일명이 같아야 합니다.

1. `data/td/function/config/enemy/<새타입>.mcfunction`을 만들고 HP, 속도, 보상, 코어 피해를 설정합니다.
2. `data/td/function/spawn/type/<새타입>.mcfunction`에서 실제 엔티티를 소환하고 `td:enemy/type/<새타입>`, `td:spawn/common`을 호출합니다.
3. `data/td/function/enemy/type/<새타입>.mcfunction`에서 팀, 크기, 장비, 이펙트를 설정합니다.
4. `data/td/function/enemy/hpbar/type/<새타입>.mcfunction`과 `enemy/hpbar/run/<새타입>.mcfunction`을 만듭니다.
5. `data/td/tags/function/config/load.json`과 `enemy/hpbar_types.json`에 새 함수를 등록합니다.
6. 필요하면 `td:load`의 팀 생성부에 새 적 팀을 추가합니다.
7. 웨이브 config에서 `function td:spawn/random {type:"<새타입>"}`처럼 호출합니다.

## 4. 아군 추가하기

현재 방어 유닛은 `basic`, `splash`, `blink`입니다.

| 타입 | 배치 함수 | 기본 비용 | 피해 | 사거리 | 공격 주기 | 특징 |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| basic | `td:tower/place {type:"basic"}` | 20 | 4 | 8 | 40틱 | 단일 대상 |
| splash | `td:tower/place {type:"splash"}` | 40 | 3 | 7 | 60틱 | 타겟 주변 2.5블록 광역 |
| blink | `td:tower/place {type:"blink"}` | 70 | 5 | 12 | 100틱 | 순간이동 후 주변 3블록 광역 |

### 기존 아군 수치만 조정

| 바꿀 것 | 수정 위치 |
| --- | --- |
| 비용 | `data/td/function/config/economy.mcfunction` |
| 공격 피해 | `data/td/function/config/tower/<타입>.mcfunction` |
| 상점 아이템 이름/설명 | `data/td/function/shop/give_item/<타입>.mcfunction` |
| 장비, 크기, 배치 이펙트 | `data/td/function/tower/type/<타입>.mcfunction` |
| 사거리, 실제 공격 주기 | `data/td/function/tower/tick/<타입>.mcfunction` |
| 공격 방식과 이펙트 | `data/td/function/tower/attack/<타입>.mcfunction` |

주의: `distance=..8`, `scores={td.tower_cd=40..}` 같은 선택자 리터럴은 점수판 값으로 대체하기 어렵습니다. 사거리와 실제 공격 주기를 바꿀 때는 `tower/tick/<타입>.mcfunction`의 해당 줄을 직접 수정합니다. `config/tower/<타입>`의 초기 쿨타임은 새로 배치된 타워가 첫 공격을 언제 시작할지에 영향을 줍니다.

### 새 아군 타입 추가

1. `data/td/function/config/tower/<새타입>.mcfunction`에 피해량과 초기 쿨타임을 추가합니다.
2. `data/td/function/config/economy.mcfunction`에 비용 fake player를 추가합니다.
3. `tower/select/<새타입>.mcfunction`에서 `td.place.<새타입>` 태그와 비용을 설정하고, `tower/select/clear.mcfunction`에 해당 태그 제거를 추가합니다.
4. `shop/give_item/<새타입>.mcfunction`과 `shop/use/<새타입>.mcfunction`을 만듭니다.
5. `tower/spawn/<새타입>.mcfunction`에서 mannequin을 소환하고 소유자/구매가를 복사합니다.
6. `tower/place_type/<새타입>.mcfunction`에서 선택 태그에 맞는 spawn 함수를 호출합니다.
7. `tower/type/<새타입>.mcfunction`에서 팀, 장비, 크기, 배치 이펙트를 설정합니다.
8. `tower/tick/<새타입>.mcfunction`에 사거리와 쿨타임 조건을 작성합니다.
9. `tower/attack/<새타입>.mcfunction`에서 타겟 선정, `/swing`, 파티클/소리, 피해 적용을 구현합니다.
10. `tower/attack/run/<새타입>.mcfunction`에서 임시 태그 정리 전후로 실제 공격 함수를 호출합니다.
11. `shop/give_items`, `shop/use_items`, `tower/place_types`, `tower/tick_types`, `config/load` 태그 JSON에 새 함수를 등록합니다.

단일 타겟은 `td.tower.target`, 광역 대상은 `td.tower.hit`, blink 복귀 지점은 `td.tower.origin` marker를 사용합니다.

## 5. 경제 시스템 조정하기

돈은 플레이어별 `td.money`로 관리됩니다. 적이 죽으면 그 적의 보상만큼 모든 온라인 플레이어가 같은 돈을 받습니다.

| 바꿀 것 | 수정 위치 | 기본값 |
| --- | --- | ---: |
| 시작 돈 | `td:config/economy`의 `$start_money` | 60 |
| basic 비용 | `td:config/economy`의 `$tower_basic_cost` | 20 |
| splash 비용 | `td:config/economy`의 `$tower_splash_cost` | 40 |
| blink 비용 | `td:config/economy`의 `$tower_blink_cost` | 70 |
| 전투 중 환불 비율 | `td:config/economy`의 `$combat_refund_divisor` | 2 |
| 적 처치 보상 | `td:config/enemy/<타입>`의 reward | 타입별 |
| 적 코어 피해 | `td:config/enemy/<타입>`의 core damage | 타입별 |
| 코어 HP | `td:config/core`의 `$core_hp` | 20 |
| 웨이브 준비 시간 | `td:config/core`의 `$wave_prep_ticks` | 600 |

환불 규칙은 다음과 같습니다.

- 웨이브 진행 중(`$wave_state = 1`): 구매가를 `$combat_refund_divisor`로 나눈 값 환불
- 대기, 준비 시간, 승리, 패배 상태: 100% 환불
- 맵 전환, 새 게임 시작, `td:reset/towers`: 환불 없음

`$combat_refund_divisor`가 `2`이면 50%, `4`이면 25%입니다. 100% 환불 상태는 이 값과 무관합니다. 나눗셈 값이므로 `0`으로 두면 안 됩니다.

## 플레이/운영 명령

```mcfunction
/function td:shop/give_items
/function td:economy/status
/function td:core/status
/function td:wave/status
/function td:wave/next
/function td:wave/stop
/function td:reset/enemies
/function td:reset/towers
/function td:reset/all
```

`td:wave/start`는 새 게임 시작용입니다. 적과 방어 유닛을 모두 정리하고, 코어 HP와 플레이어 돈을 config 값으로 되돌린 뒤 1웨이브를 시작합니다.

## 참조: 주요 공개 함수

| 함수 | 역할 |
| --- | --- |
| `td:map/save_here` | 현재 위치에 맵 시작점을 저장하고 활성화 |
| `td:map/activate_nearest` | 8블록 안의 가장 가까운 저장 맵 활성화 |
| `td:map/remove_nearest` | 8블록 안의 가장 가까운 저장 맵 삭제 |
| `td:map/status` | 활성 맵과 현재 웨이브/코어 상태 표시 |
| `td:core/save_here` | 발밑 블록을 활성 맵 코어로 저장 |
| `td:core/remove_nearest` | 가까운 활성 맵 코어 삭제 |
| `td:core/status` | 활성 맵 코어와 코어 HP 표시 |
| `td:spawnpoint/save_here/1` ~ `/8` | 활성 맵에 번호별 스폰 지점 저장 |
| `td:spawnpoint/remove_nearest` | 가까운 활성 스폰 지점 삭제 |
| `td:spawnpoint/status` | 활성 맵의 스폰 지점 상태 표시 |
| `td:path/guide/east`, `west`, `south`, `north` | 현재 칸에 강제 진행 방향 저장 |
| `td:path/guide/remove_nearest` | 가까운 방향 가이드 삭제 |
| `td:spawn/random {type:"basic"}` | 활성 스폰 지점 중 랜덤 위치에 적 소환 |
| `td:spawn/from {type:"fast",id:2}` | 해당 번호 스폰 지점에서 적 소환 |
| `td:spawn/all {type:"tank"}` | 모든 활성 스폰 지점에서 적 소환 |
| `td:tower/place {type:"basic"}` | 명령으로 현재 위치에 타워 구매 배치 |
| `td:tower/remove_nearest` | 가까운 본인 소유 타워 환불 제거 |
| `td:wave/start` | 새 게임 시작 |

## 참조: 내부 설정 함수

| 함수 | 역할 |
| --- | --- |
| `td:config/load` | `#td:config/load`에 등록된 모든 설정 함수 호출 |
| `td:config/core` | 코어 HP, 웨이브 준비 시간, 체력바 배율 |
| `td:config/economy` | 시작 돈, 타워 비용, 전투 중 환불 divisor |
| `td:config/enemy/<타입>` | 적 HP, 속도, 보상, 코어 피해 |
| `td:config/tower/<타입>` | 타워 피해량, 초기 쿨타임 |

## 참조: 중요한 점수판

| Objective | 용도 |
| --- | --- |
| `td.hp` | 코어 HP와 일부 HP 관련 fake player |
| `td.enemy_hp`, `td.enemy_max_hp` | 적 현재/최대 HP |
| `td.core_damage` | 적이 코어에 도착했을 때 줄 피해량 |
| `td.reward` | 적 처치 보상 |
| `td.money` | 플레이어 개인 돈 |
| `td.place_cost` | 배치 비용과 비용 config fake player |
| `td.tower_cost` | 배치된 타워의 구매가 |
| `td.tower_cd` | 타워 공격 쿨타임 |
| `td.wave`, `td.wave_time`, `td.wave_state`, `td.wave_done`, `td.wave_prep` | 웨이브 진행 상태 |
| `td.map_id`, `td.spawn_id` | 맵과 스폰 지점 연결 |
| `td.dir`, `td.next`, `td.branch_count`, `td.branch_pick`, `td.path_dir` | 검은 양털 경로 이동과 분기/가이드 |
| `td.tmp` | 공통 임시 계산과 일부 config fake player |

## 파일 메모

`.mcfunction` 파일은 `#` 주석을 사용할 수 있습니다. `pack.mcmeta`, `load.json`, `tick.json`은 JSON이므로 주석을 넣지 않습니다.
