slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 10,
	countType = 29450
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29452,
	target = "TargetSelf",
	countType = 29450
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {}

return {
	time = 0,
	name = "专属弹幕",
	init_effect = "",
	id = 29452,
	picture = "",
	desc = "主武器每进行10次攻击，触发专属弹幕-克利夫兰μII",
	stack = 1,
	color = "red",
	icon = 29450,
	last_effect = ""
}