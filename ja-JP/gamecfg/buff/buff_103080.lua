slot2.trigger = {
	"onStartGame"
}
slot3.targetTemplateIDList = {
	10300051,
	10300052,
	10300053,
	10300054
}
slot2.arg_list = {
	check_target = "TargetTemplate",
	minTargetNumber = 1,
	buff_id = 103082,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onBulletCreate"
}
slot3.index = {
	-1
}
slot2.arg_list = {
	number = 1,
	attr = "cri"
}
slot1[2] = {
	type = "BattleBuffAddBulletAttr"
}
slot0.effect_list = {}
slot0[1] = {}
slot0[2] = {}
slot0[3] = {}
slot0[4] = {}
slot0[5] = {}
slot0[6] = {}
slot0[7] = {}
slot0[8] = {}
slot0[9] = {}
slot0[10] = {}

return {
	desc_get = "",
	name = "双影无双",
	init_effect = "",
	id = 103080,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 103080,
	last_effect = ""
}