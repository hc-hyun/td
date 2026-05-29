# BlackWoolTD

검은 양털을 길 데이터로 사용하는 간단한 타워 디펜스용 Minecraft Java 데이터팩입니다.

몹은 현재 칸에서 주변 4방향의 `minecraft:black_wool`을 확인하고, 방금 온 방향의 반대편을 제외한 다음 검은 양털 칸으로 이동합니다. 이동 중에는 진행 방향을 바라보고, 끝점은 더 이상 앞으로 갈 검은 양털이 없는 막다른 길로 처리됩니다.

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

4. 적을 소환합니다.

```mcfunction
/function td:spawn_enemy
```

5. 기지 체력을 확인합니다.

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
- `td:spawn_enemy`: 저장된 시작점에 좀비 적을 소환합니다.
- `td:path/on_cell`: 현재 칸 주변의 검은 양털을 검사해서 다음 이동 방향을 고릅니다.
- `td:path/finish`: 적이 끝점에 도착했을 때 기지 체력을 1 줄이고 적을 제거합니다.

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

## 파일 메모

`.mcfunction` 파일은 `#` 주석을 사용할 수 있어서 각 명령의 역할을 한글 주석으로 설명했습니다.

`pack.mcmeta`, `load.json`, `tick.json`은 JSON 파일입니다. JSON은 표준 문법상 주석을 허용하지 않으므로, 데이터팩이 깨지지 않도록 이 파일들에는 주석을 넣지 않았습니다.

JSON 파일의 역할은 다음과 같습니다.

- `pack.mcmeta`: Minecraft가 이 폴더를 데이터팩으로 인식하게 하고, 지원 데이터팩 포맷을 `101.1`로 지정합니다.
- `data/minecraft/tags/function/load.json`: `/reload` 또는 월드 로드 시 `td:load`를 자동 실행하도록 등록합니다.
- `data/minecraft/tags/function/tick.json`: 매 게임 틱마다 `td:tick`을 자동 실행하도록 등록합니다.
