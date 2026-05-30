# BlackWoolTD

검은 양털을 길 데이터로 사용하는 간단한 타워 디펜스용 Minecraft Java 데이터팩입니다.

몹은 현재 칸에서 주변 4방향의 `minecraft:black_wool`을 확인하고, 방금 온 방향의 반대편을 제외한 다음 검은 양털 칸으로 이동합니다. 이동 중에는 진행 방향을 바라보고, 끝점은 더 이상 앞으로 갈 검은 양털이 없는 막다른 길로 처리됩니다.

몹은 타입별 설정을 가질 수 있습니다. 현재는 `basic`, `fast`, `tank`, `boss` 4종을 제공하며, 각 타입은 체력, 속도, 크기, 외형, 이름, 소환 이펙트가 다릅니다.

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

1. 월드에서 검은 양털로 1칸 폭 경로를 만듭니다.
2. 게임 안에서 데이터팩을 다시 불러옵니다.

```mcfunction
/reload
```

3. 검은 양털 시작 칸 위에 서서 시작점을 저장합니다.

```mcfunction
/function td:set_start
```

4. 원하는 위치에 기본 방어 유닛을 배치합니다.

```mcfunction
/function td:tower/place/basic
```

가까운 방어 유닛을 제거하려면 다음 명령을 사용합니다.

```mcfunction
/function td:tower/remove_nearest
```

5. 원하는 타입의 적을 소환합니다.

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

6. 기지 체력을 확인합니다.

```mcfunction
/scoreboard players get $base td.hp
```

## 경로 제작 규칙

- 검은 양털 경로는 1칸 폭이어야 합니다.
- 대각선 이동은 지원하지 않습니다.
- 갈림길은 지원하지 않습니다.
- 높낮이 없는 평면 경로를 기준으로 합니다.
- 시작점과 끝점은 막다른 길이어야 합니다.

예시:

```text
S ■ ■ ■
      ■
      ■ ■ ■ E
```

## 주요 함수

- `td:load`: 점수판과 팀을 준비하고 기본 기지 체력을 20으로 설정합니다.
- `td:tick`: 매 틱마다 `td.enemy` 태그가 붙은 적을 처리합니다.
- `td:set_start`: 현재 위치를 적 시작점으로 저장합니다.
- `td:spawn/basic`: 기본 좀비 적을 소환합니다.
- `td:spawn/fast`: 빠른 vindicator 적을 소환합니다.
- `td:spawn/tank`: 느리고 튼튼한 pillager 적을 소환합니다.
- `td:spawn/boss`: 크고 체력이 높은 evoker 보스 적을 소환합니다.
- `td:spawn_enemy`: 예전 사용법을 위한 호환 함수입니다. 내부적으로 `td:spawn/basic`을 실행합니다.
- `td:tower/place/basic`: 플레이어 위치에 기본 mannequin 방어 유닛을 배치합니다.
- `td:tower/remove_nearest`: 플레이어 기준 4블록 안의 가장 가까운 방어 유닛을 제거합니다.
- `td:tower/tick`: 방어 유닛의 쿨타임과 공격 판정을 처리합니다.
- `td:path/on_cell`: 현재 칸 주변의 검은 양털을 검사해서 다음 이동 방향을 고릅니다.
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

| 타입 | 함수 | 엔티티 | 피해 | 사거리 | 공격 주기 |
| --- | --- | --- | ---: | ---: | ---: |
| basic | `td:tower/place/basic` | mannequin | 4 | 8블록 | 40틱 |

기본 방어 유닛은 `minecraft:mannequin`을 사용하며, 공격할 때 `/swing`으로 팔을 휘두르고 가장 가까운 `td.enemy`의 `td.enemy_hp` 점수를 깎습니다.

## 점수판 값

- `td.dir`: 현재 이동 방향입니다.
  - `0`: 아직 방향 없음
  - `1`: 동쪽, `+X`
  - `2`: 서쪽, `-X`
  - `3`: 남쪽, `+Z`
  - `4`: 북쪽, `-Z`
- `td.step`: 현재 블록을 몇 틱 동안 이동했는지 저장합니다.
- `td.next`: 다음 이동 방향 후보입니다.
- `td.hp`: 기지 체력입니다. `$base` 가짜 플레이어에 저장됩니다.
- `td.enemy_hp`: 적의 현재 체력입니다.
- `td.enemy_max_hp`: 적의 최대 체력입니다.
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

## 몹 타입 추가 방법

새 몹 타입을 추가할 때는 기존 타입을 복사해서 아래 흐름을 맞추면 됩니다.

1. `data/td/function/spawn/<타입>.mcfunction`을 만들고 원하는 바닐라 엔티티를 소환합니다.
2. 소환 NBT에 `td.enemy`, `td.new`, `td.type.<타입>` 태그를 넣습니다.
3. `data/td/function/enemy/type/<타입>.mcfunction`을 만들고 `td.type`, `td.enemy_hp`, `td.enemy_max_hp`, `td.speed`, `minecraft:scale`, 장비, 소환 이펙트를 설정합니다.
4. `data/td/function/load.mcfunction`에 타입별 팀을 추가하고 `collisionRule never`를 설정합니다.
5. 소환 함수에서 타입 설정 함수 실행 후 `td:spawn/common`을 실행합니다.

타입별 소환 함수는 몹 외형과 기본 설정만 담당하고, 실제 이동은 `td:enemy/move`와 `td:enemy/speed/*` 함수가 공통으로 처리합니다.

## 파일 메모

`.mcfunction` 파일은 `#` 주석을 사용할 수 있어서 각 명령의 역할을 한글 주석으로 설명했습니다.

`pack.mcmeta`, `load.json`, `tick.json`은 JSON 파일입니다. JSON은 표준 문법상 주석을 허용하지 않으므로, 데이터팩이 깨지지 않도록 이 파일들에는 주석을 넣지 않았습니다.

JSON 파일의 역할은 다음과 같습니다.

- `pack.mcmeta`: Minecraft가 이 폴더를 데이터팩으로 인식하게 하고, 지원 데이터팩 포맷을 `101.1`로 지정합니다.
- `data/minecraft/tags/function/load.json`: `/reload` 또는 월드 로드 시 `td:load`를 자동 실행하도록 등록합니다.
- `data/minecraft/tags/function/tick.json`: 매 게임 틱마다 `td:tick`을 자동 실행하도록 등록합니다.
