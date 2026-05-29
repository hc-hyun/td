# td.speed 값에 따라 속도별 이동 함수를 실행합니다.
# 1 = slow, 2 = normal, 3 = fast입니다.
# 잘못된 값이 들어간 적은 normal 속도로 처리해 경로 이동이 멈추지 않게 합니다.
execute if score @s td.speed matches 1 run function td:enemy/speed/slow
execute if score @s td.speed matches 2 run function td:enemy/speed/normal
execute if score @s td.speed matches 3 run function td:enemy/speed/fast
execute unless score @s td.speed matches 1..3 run function td:enemy/speed/normal
