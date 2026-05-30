# 자유 배치용 타워 선택 아이템과 제거 도구를 지급합니다.
give @s minecraft:carrot_on_a_stick[custom_data={td:{tool:"tower",tower:"basic"}},item_name='{"text":"Basic Tower","color":"green","italic":false}',lore=['{"text":"Configured cost | Single target","color":"gray","italic":false}'],enchantment_glint_override=true] 1
give @s minecraft:carrot_on_a_stick[custom_data={td:{tool:"tower",tower:"splash"}},item_name='{"text":"Splash Tower","color":"yellow","italic":false}',lore=['{"text":"Configured cost | Area attack","color":"gray","italic":false}'],enchantment_glint_override=true] 1
give @s minecraft:carrot_on_a_stick[custom_data={td:{tool:"tower",tower:"blink"}},item_name='{"text":"Blink Tower","color":"aqua","italic":false}',lore=['{"text":"Configured cost | Teleport area attack","color":"gray","italic":false}'],enchantment_glint_override=true] 1
give @s minecraft:carrot_on_a_stick[custom_data={td:{tool:"remove_tower"}},item_name='{"text":"Remove Tower","color":"red","italic":false}',lore=['{"text":"Refund: 100% before waves, 50% during waves","color":"gray","italic":false}'],enchantment_glint_override=true] 1

tellraw @s {text:'Tower tools added to your inventory.',color:'green'}
