slot0 = class("SelectFleetCommanderCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = slot2.commanderId
	slot6 = slot2.callback
	slot7 = getProxy(FleetProxy):getFleetById(slot2.fleetId)
	slot9 = slot7:getCommanders()

	if not slot7:getCommanderByPos(slot2.pos) or slot8.id ~= slot5 then
		for slot14, slot15 in pairs(slot9) do
			if slot15.groupId == getProxy(CommanderProxy):getCommanderById(slot5).groupId and slot14 ~= slot4 and slot5 ~= slot15.id then
				pg.TipsMgr.GetInstance():ShowTips(i18n("commander_can_not_select_same_group"))

				return
			end
		end
	end

	function slot11(slot0)
		if uv1[uv0 == 2 and 1 or 2] and slot2.id == slot0 then
			return true, slot1
		end

		return false
	end

	slot13 = true
	slot14, slot15 = function (slot0)
		for slot5, slot6 in ipairs(getProxy(FleetProxy):getCommanders()) do
			if slot6.fleetId ~= uv0 and slot6.commanderId == slot0 then
				return true, slot6
			end
		end

		return false
	end(slot5)

	if slot14 then
		table.insert({}, function (slot0)
			slot5.content = i18n("comander_repalce_tip", Fleet.DEFAULT_NAME[uv0.fleetId], uv0.pos == 1 and i18n("commander_main_pos") or i18n("commander_assistant_pos"))

			function slot5.onYes()
				slot3.fleetId = uv0.fleetId
				slot3.pos = uv0.pos
				slot3.callback = uv1

				pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
					commanderId = 0
				})
			end

			function slot5.onNo()
				uv0 = false

				uv1()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		end)
	end

	slot16, slot17 = slot11(slot5)

	if slot16 then
		table.insert(slot12, function (slot0)
			slot4.fleetId = uv0
			slot4.pos = uv1
			slot4.callback = slot0

			pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {
				commanderId = 0
			})
		end)
	end

	table.insert(slot12, function (slot0)
		if uv0 then
			slot4.fleetId = uv1
			slot4.pos = uv2
			slot4.commanderId = uv3

			function slot4.callback(slot0)
				uv0()
			end

			pg.m02:sendNotification(GAME.COOMMANDER_EQUIP_TO_FLEET, {})
		else
			slot0()
		end
	end)
	seriesAsync(slot12, slot6)
end

return slot0