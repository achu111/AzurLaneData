slot0 = class("SkinTemplatePage", import("....base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.dayTF = slot0:findTF("day", slot0.bg)
	slot0.item = slot0:findTF("item", slot0.bg)
	slot0.items = slot0:findTF("items", slot0.bg)
	slot0.uilist = UIItemList.New(slot0.items, slot0.item)

	setActive(slot0.item, false)
end

function slot0.OnDataSetting(slot0)
	slot0.nday = 0
	slot0.taskProxy = getProxy(TaskProxy)
	slot0.taskGroup = slot0.activity:getConfig("config_data")

	return updateActivityTaskStatus(slot0.activity)
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = uv0:findTF("item", slot2)

			if not uv0.taskProxy:getTaskById(uv0.taskGroup[uv0.nday][slot1 + 1]) then
				slot6 = uv0.taskProxy:getFinishTaskById(slot5)
			end

			slot7 = slot6:getConfig("award_display")[1]

			updateDrop(slot4, {
				type = slot7[1],
				id = slot7[2],
				count = slot7[3]
			})
			onButton(uv0, slot4, function ()
				uv0:emit(BaseUI.ON_DROP, uv1)
			end, SFX_PANEL)

			slot9 = slot6:getProgress()
			slot10 = slot6:getConfig("target_num")

			setText(uv0:findTF("description", slot2), slot6:getConfig("desc"))
			setText(uv0:findTF("progressText", slot2), slot9 .. "/" .. slot10)
			setSlider(uv0:findTF("progress", slot2), 0, slot10, slot9)

			slot11 = uv0
			slot12 = uv0:findTF("get_btn", slot2)

			setActive(slot11:findTF("go_btn", slot2), slot6:getTaskStatus() == 0)
			setActive(slot12, slot14 == 1)
			setActive(uv0:findTF("got_btn", slot2), slot14 == 2)
			onButton(uv0, slot11, function ()
				uv0:emit(ActivityMediator.ON_TASK_GO, uv1)
			end, SFX_PANEL)
			onButton(uv0, slot12, function ()
				uv0:emit(ActivityMediator.ON_TASK_SUBMIT, uv1)
			end, SFX_PANEL)
		end
	end)
end

function slot0.OnUpdateFlush(slot0)
	slot0.nday = slot0.activity.data3
	slot1 = slot0.activity

	if checkExist(slot1:getConfig("config_client").story, {
		slot0.nday
	}, {
		1
	}) then
		slot2 = pg.StoryMgr.GetInstance()

		if not slot2:IsPlayed(slot1[slot0.nday][1]) then
			slot2:Play(slot1[slot0.nday][1])
		end
	end

	if slot0.dayTF then
		setText(slot0.dayTF, tostring(slot0.nday))
	end

	slot0.uilist:align(#slot0.taskGroup[slot0.nday])
end

function slot0.OnDestroy(slot0)
	eachChild(slot0.items, function (slot0)
		Destroy(slot0)
	end)
end

return slot0