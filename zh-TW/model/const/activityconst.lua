slot0 = setmetatable({}, {
	__index = function (slot0, slot1)
		return pg.activity_const[slot1].act_id
	end
})
slot0.ACTIVITY_TYPE_BUILDSHIP_1 = 1
slot0.ACTIVITY_TYPE_7DAYSLOGIN = 3
slot0.ACTIVITY_TYPE_LEVELAWARD = 4
slot0.ACTIVITY_TYPE_LEVELPLAN = 5
slot0.ACTIVITY_TYPE_MONTHSIGN = 6
slot0.ACTIVITY_TYPE_MILITARY_EXERCISE = 7
slot0.ACTIVITY_TYPE_PROGRESSLOGIN = 8
slot0.ACTIVITY_TYPE_CHARGEAWARD = 9
slot0.ACTIVITY_TYPE_EVENT = 11
slot0.ACTIVITY_TYPE_ZPROJECT = 12
slot0.ACTIVITY_TYPE_TASKS = 13
slot0.ACTIVITY_TYPE_SHOP = 14
slot0.ACTIVITY_TYPE_PT_RANK = 16
slot0.ACTIVITY_TYPE_TASK_LIST = 18
slot0.ACTIVITY_TYPE_VOTE = 19
slot0.ACTIVITY_TYPE_BB = 20
slot0.ACTIVITY_TYPE_PUZZLA = 21
slot0.ACTIVITY_TYPE_LOTTERY = 22
slot0.ACTIVITY_TYPE_CHALLENGE_RANK = 24
slot0.ACTIVITY_TYPE_BUILD = 26
slot0.ACTIVITY_TYPE_SHOP_STREET = 27
slot0.ACTIVITY_TYPE_BUFF = 30
slot0.ACTIVITY_TYPE_HITMONSTERNIAN = 32
slot0.ACTIVITY_TYPE_CARD_PAIRS = 33
slot0.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK = 36
slot0.ACTIVITY_TYPE_CHALLENGE = 37
slot0.ACTIVITY_TYPE_SUMMARY = 38
slot0.ACTIVITY_TYPE_TASK_LIST_MONITOR = 39
slot0.ACTIVITY_TYPE_TASK_RES = 40
slot0.ACTIVITY_TYPE_VIRTUAL_BAG = 41
slot0.ACTIVITY_TYPE_REFLUX = 42
slot0.ACTIVITY_TYPE_COLORING_ALPHA = 43
slot0.ACTIVITY_TYPE_GUIDE_TASKS = 44
slot0.ACTIVITY_TYPE_LINK_LINK = 45
slot0.ACTIVITY_TYPE_BOSS_RANK = 46
slot0.ACTIVITY_TYPE_SHOP_DISCOUNT = 48
slot0.ACTIVITY_TYPE_LOTTERY_AWARD = 49
slot0.ACTIVITY_TYPE_DODGEM = 50
slot0.ACTIVITY_TYPE_MONOPOLY = 51
slot0.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 = 52
slot0.ACTIVITY_TYPE_BLACKWHITE = 53
slot0.ACTIVITY_TYPE_PT_ACCUM = 54
slot0.ACTIVITY_TYPE_BUILDSHIP_PRAY = 55
slot0.ACTIVITY_TYPE_RETURN_AWARD = 56
slot0.ACTIVITY_TYPE_MINIGAME = 57
slot0.ACTIVITY_TYPE_SHIP_BUFF = 58
slot0.ACTIVITY_TYPE_STORY_AWARD = 59
slot0.ACTIVITY_TYPE_INSTAGRAM = 60
slot0.ACTIVITY_TYPE_TURNTABLE = 61
slot0.ACTIVITY_TYPE_SHRINE = 63
slot0.ACTIVITY_TYPE_RED_PACKETS = 64
slot0.ACTIVITY_TYPE_PIZZA_PT = 66
slot0.ACTIVITY_TYPE_BUILDING_BUFF = 67
slot0.ACTIVITY_TYPE_SKIN_COUPON = 68
slot0.ACTIVITY_TYPE_CLIENT_DISPLAY = 70
slot0.ELITE_AWARD_ACTIVITY_ID = 40030
slot0.HIDE_PT_PANELS = false
slot0.WITHOUT_ACTIVITY = 0
slot0.MONOPOLY_OP_THROW = 1
slot0.MONOPOLY_OP_MOVE = 2
slot0.MONOPOLY_OP_TRIGGER = 3
slot0.MONOPOLY_OP_AWARD = 4
slot0.RETURN_AWARD_OP_ACTIVTION = 1
slot0.RETURN_AWARD_OP_GET_RETRUNERS = 2
slot0.RETURN_AWARD_OP_GET_AWARD = 3
slot0.RETURN_AWARD_OP_PUSH_UID = 4
slot0.RETURN_AWARD_OP_ACCEPT_TASK = 5
slot0.RETURN_AWARD_OP_SET_RETRUNER = 11
slot0.RETURN_AWARD_OP_RETURNER_GET_AWARD = 12
slot0.RETURN_AWARD_OP_MATCH = 13
slot0.RETURN_AWARD_OP_SHOW_AWARD_OVERVIEW = 20
slot0.RETURN_AWARD_OP_SHOW_RETURNER_AWARD_OVERVIEW = 21
slot0.LIMIT_SKIN_SHOP_TIME = {
	{
		{
			2020,
			5,
			28
		},
		{
			0,
			0,
			0
		}
	},
	{
		{
			2020,
			6,
			10
		},
		{
			23,
			59,
			59
		}
	}
}
slot0.XIAOBEIFA_PT_SKIP = {
	{
		{
			2020,
			4,
			30
		},
		{
			0,
			0,
			0
		}
	},
	{
		{
			2020,
			5,
			14
		},
		{
			14,
			0,
			0
		}
	}
}
slot0.INSTAGRAM_OP_ACTIVE = 0
slot0.INSTAGRAM_OP_UPDATE = 1
slot0.INSTAGRAM_OP_COMMENT = 2
slot0.INSTAGRAM_OP_LIKE = 3
slot0.INSTAGRAM_OP_SHARE = 4
slot0.INSTAGRAM_OP_MARK_READ = 5

function slot0.BBRule(slot0)
	_.each(slot0, function (slot0)
		uv0[slot0] = uv0[slot0] + 1
	end)

	slot2 = 7

	if _.all({
		0,
		0,
		0,
		0,
		0,
		0
	}, function (slot0)
		return slot0 == 1
	end) then
		slot2 = 2
	else
		for slot6, slot7 in ipairs(slot1) do
			if slot6 == 4 then
				if slot7 >= 4 then
					slot2 = math.min(slot2, 1)
				elseif slot7 >= 3 then
					slot2 = math.min(slot2, 3)
				elseif slot7 >= 2 then
					slot2 = math.min(slot2, 5)
				elseif slot7 >= 1 then
					slot2 = math.min(slot2, 6)
				end
			elseif slot7 >= 5 then
				slot2 = math.min(slot2, 1)
			elseif slot7 >= 4 then
				slot2 = math.min(slot2, 4)
			end
		end
	end

	return slot2
end

slot0.PageIdLink = {
	[slot0.IDOL_INS_ID] = slot0.IDOL_PT_ID,
	[slot0.POCKY_SKIN_PT] = slot0.POCKY_SKIN_LOGIN,
	[slot0.POCKY_SKIN_TASKLIST] = slot0.POCKY_SKIN_LOGIN,
	[slot0.POCKY_SKIN_FINAL] = slot0.POCKY_SKIN_LOGIN,
	[slot0.POCKY_SKIN_FINAL] = slot0.POCKY_SKIN_LOGIN,
	[pg.activity_const.NEW_ORLEANS_TASK.act_id] = pg.activity_const.NEW_ORLEANS_LOGIN.act_id
}

return slot0
