slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	buff_id = 1030,
	shipType = 1
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetPlayerByType"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "装填指挥·驱逐舰",
	cd = 0,
	picture = "0",
	desc = "提高舰队中所有驱逐舰的装填属性",
	painting = 1,
	id = 1031,
	castCV = "skill"
}