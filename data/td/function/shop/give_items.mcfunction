# 자유 배치용 타워 선택 아이템과 제거 도구를 지급합니다.
# 새 상점 아이템은 #td:shop/give_items 태그에 등록합니다.
function #td:shop/give_items

tellraw @s {text:'Tower tools added to your inventory.',color:'green'}
