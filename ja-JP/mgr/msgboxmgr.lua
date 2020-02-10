pg = pg or {}
slot0 = pg
slot0.MsgboxMgr = singletonClass("MsgboxMgr")
slot1 = slot0.MsgboxMgr
slot1.BUTTON_BLUE = 1
slot1.BUTTON_GRAY = 2
slot1.BUTTON_RED = 3
slot1.BUTTON_MEDAL = 4
slot1.BUTTON_RETREAT = 5
slot1.BUTTON_PREPAGE = 6
slot1.BUTTON_NEXTPAGE = 7
slot1.BUTTON_BLUE_WITH_ICON = 8
slot1.TITLE_INFORMATION = "infomation"
slot1.TITLE_SETTING = "setting"
slot1.TITLE_WARNING = "warning"
slot1.TITLE_OBTAIN = "obtain"
slot1.TEXT_CANCEL = "text_cancel"
slot1.TEXT_CONFIRM = "text_confirm"
MSGBOX_TYPE_NORMAL = 1
MSGBOX_TYPE_INPUT = 2
MSGBOX_TYPE_SINGLE_ITEM = 3
MSGBOX_TYPE_EXCHANGE = 4
MSGBOX_TYPE_DROP_ITEM = 5
MSGBOX_TYPE_ITEM_BOX = 6
MSGBOX_TYPE_HELP = 7
MSGBOX_TYPE_SECONDPWD = 8
MSGBOX_TYPE_OBTAIN = 9
slot1.enable = false
slot2 = require("Mgr.const.MsgboxBtnNameMap")

function slot1.Init(slot0, slot1)
	print("initializing msgbox manager...")
	PoolMgr.GetInstance():GetUI("MsgBox", true, function (slot0)
		uv0._go = slot0

		uv0._go:SetActive(false)

		uv0._tf = uv0._go.transform

		uv0._tf:SetParent(uv1.UIMgr.GetInstance().OverlayMain.transform, false)

		uv0._window = uv0._tf:Find("window")

		setActive(uv0._window, true)

		uv0._top = uv0._window:Find("top")
		uv0._titleList = uv0._top:Find("bg")
		uv0._closeBtn = uv0._top:Find("btnBack")
		uv0._res = uv0._tf:Find("res")
		uv0._msgPanel = uv0._window:Find("msg_panel")
		uv0.contentText = uv0._msgPanel:Find("content"):GetComponent("RichText")

		uv0.contentText:AddSprite("diamond", uv0._res:Find("diamond"):GetComponent(typeof(Image)).sprite)
		uv0.contentText:AddSprite("gold", uv0._res:Find("gold"):GetComponent(typeof(Image)).sprite)
		uv0.contentText:AddSprite("oil", uv0._res:Find("oil"):GetComponent(typeof(Image)).sprite)

		uv0._exchangeShipPanel = uv0._window:Find("exchange_ship_panel")
		uv0._itemPanel = uv0._window:Find("item_panel")
		uv0._itemsText = uv0._itemPanel:Find("Text"):GetComponent(typeof(Text))
		uv0._itemListItemTpl = uv0._itemPanel:Find("scrollview/item")
		uv0._itemListItemContainer = uv0._itemPanel:Find("scrollview/list")
		uv0._sigleItemPanel = uv0._window:Find("single_item_panel")
		uv0._singleItemshipTypeTF = uv0._sigleItemPanel:Find("name_mode/ship_type")
		uv0._singleItemshipTypeBgTF = uv0._sigleItemPanel:Find("name_mode/ship_type_bg")
		uv0.singleItemIntros = {}
		uv0.singleItemIntro = uv0._sigleItemPanel:Find("intro_view/Viewport/Content/intro")
		uv0.singleItemIntroTF = uv0.singleItemIntro:GetComponent("RichText")

		uv0.singleItemIntroTF:AddSprite("diamond", uv0._res:Find("diamond"):GetComponent(typeof(Image)).sprite)
		uv0.singleItemIntroTF:AddSprite("gold", uv0._res:Find("gold"):GetComponent(typeof(Image)).sprite)
		uv0.singleItemIntroTF:AddSprite("oil", uv0._res:Find("oil"):GetComponent(typeof(Image)).sprite)
		table.insert(uv0.singleItemIntros, uv0.singleItemIntro)

		uv0._inputPanel = uv0._window:Find("input_panel")
		uv0._inputTitle = uv0._inputPanel:Find("label"):GetComponent(typeof(Text))
		uv0._inputTF = uv0._inputPanel:Find("InputField")
		uv0._inputField = uv0._inputTF:GetComponent(typeof(InputField))
		uv0._placeholderTF = uv0._inputTF:Find("Placeholder"):GetComponent(typeof(Text))
		uv0._inputConfirmBtn = uv0._inputPanel:Find("btns/confirm_btn")
		uv0._inputCancelBtn = uv0._inputPanel:Find("btns/cancel_btn")
		uv0._helpPanel = uv0._window:Find("help_panel")
		uv0._helpBgTF = uv0._tf:Find("bg_help")
		uv0._helpList = uv0._helpPanel:Find("list")
		uv0._helpTpl = uv0._helpPanel:Find("list/help_tpl")
		uv0._obtainPanel = uv0._window:Find("obtain_panel")
		uv0._otherPanel = uv0._window:Find("other_panel")
		uv0._countSelect = uv0._window:Find("count_select")
		uv0._pageUtil = PageUtil.New(uv0._countSelect:Find("value_bg/left"), uv0._countSelect:Find("value_bg/right"), uv0._countSelect:Find("max"), uv0._countSelect:Find("value_bg/value"))
		uv0._countDescTxt = uv0._countSelect:Find("desc_txt")
		uv0._sliders = uv0._window:Find("sliders")
		uv0._discountInfo = uv0._sliders:Find("discountInfo")
		uv0._discountDate = uv0._sliders:Find("discountDate")
		uv0._discount = uv0._sliders:Find("discountInfo/discount")
		uv0._strike = uv0._sliders:Find("strike")
		uv0._scrollTxts = {}
		uv0.stopRemindToggle = uv0._window:Find("stopRemind"):GetComponent(typeof(Toggle))
		uv0.stopRemindText = tf(uv0.stopRemindToggle.gameObject):Find("Label"):GetComponent(typeof(Text))
		uv0._btnContainer = uv0._window:Find("button_container")
		uv0._defaultSize = Vector2(930, 620)
		uv0._defaultHelpSize = Vector2(870, 480)
		uv0._defaultHelpPos = Vector2(0, -40)

		onButton(nil, uv0._inputCancelBtn, function ()
			uv0:hide()
		end, SFX_CANCEL)
		onButton(nil, uv0._closeBtn, function ()
			uv0:hide()
		end, SFX_CANCEL)
		onButton(nil, uv0._inputConfirmBtn, function ()
			if uv0.settings.onYes then
				uv0.settings.onYes(uv0._inputField.text)
			end

			uv0:hide()
		end, SFX_CONFIRM)

		uv0.pools = {}
		uv0.timers = {}

		uv2()
	end)
end

function slot1.getMsgBoxOb(slot0)
	return slot0._go
end

function slot3(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._msgPanel, true)

	slot0.contentText.alignment = slot0.settings.alignment or TextAnchor.MiddleCenter
	slot0.contentText.fontSize = slot0.settings.fontSize or 36
	slot0.contentText.text = slot0.settings.content or ""

	slot0:Loaded(slot1)
end

function slot4(slot0, slot1)
	slot0:commonSetting(slot1)
	setActive(slot0._inputPanel, true)
	setActive(slot0._btnContainer, false)
	slot0._inputPanel:SetAsLastSibling()

	slot0._inputTitle.text = slot1.title or ""
	slot0._placeholderTF.text = slot1.placeholder or ""
	slot0._inputField.characterLimit = slot1.limit or 0

	setActive(slot0._inputCancelBtn, not slot1.onNo)
	slot0.updateButton(slot0, slot0._inputCancelBtn, slot1.noText or uv0.TEXT_CANCEL)
	slot0.updateButton(slot0, slot0._inputConfirmBtn, slot1.yesText or uv0.TEXT_CONFIRM)
	slot0._tf:SetAsLastSibling()
	onButton(slot0, slot0._closeBtn, function ()
		uv0:hide()
	end, SFX_CANCEL)
	slot0:Loaded(slot1)
end

function slot5(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._exchangeShipPanel, true)
	setActive(findTF(slot0._exchangeShipPanel, "icon_bg/own"), false)
	updateDrop(slot0._exchangeShipPanel, slot1.drop)

	slot3 = SetActive

	slot3(slot0._exchangeShipPanel:Find("intro_view/Viewport/intro"), slot1.drop.type == DROP_TYPE_SHIP or slot1.drop.type == DROP_TYPE_RESOURCE or slot1.drop.type == DROP_TYPE_ITEM or slot1.drop.type == DROP_TYPE_FURNITURE or slot1.drop.type == DROP_TYPE_STRATEGY or slot1.drop.type == DROP_TYPE_SKIN)
	setActive(slot0.singleItemIntro, slot0.settings.numUpdate == nil)
	setActive(slot0._countDescTxt, slot3 ~= nil)
	setText(slot0._exchangeShipPanel:Find("name_mode/name"), HXSet.hxLan(slot1.name or slot1.drop.cfg.name or ""))
	setText(slot0._exchangeShipPanel:Find("name_mode/name/name"), getText(slot0._exchangeShipPanel:Find("name_mode/name")))

	slot5, slot6, slot7 = ShipWordHelper.GetWordAndCV(uv0.ship_data_statistics[slot1.drop.id].skin_id, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

	setText(slot2, slot7 or i18n("ship_drop_desc_default"))

	if slot1.intro then
		setText(slot2, slot1.intro)
	end

	if slot1.enabelYesBtn ~= nil then
		slot8 = slot0._btnContainer:GetChild(1)

		setButtonEnabled(slot8, slot1.enabelYesBtn)
		eachChild(slot8, function (slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = uv0.enabelYesBtn and 1 or 0.3
		end)
	end

	if slot1.show_medal then
		slot10.text = slot1.show_medal.desc
		slot10.btnType = uv1.BUTTON_MEDAL
		slot10.sound = SFX_UI_BUILDING_EXCHANGE

		slot0:createBtn({
			sibling = 0,
			hideEvent = true
		})
	end

	slot0:Loaded(slot1)
end

function slot6(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, true)
	removeAllChildren(slot0._itemListItemContainer)
	setActive(slot0._itemsText, slot1.content)

	slot0._itemsText.text = slot1.content or ""
	slot3 = slot0.settings.itemFunc

	for slot7, slot8 in ipairs(slot0.settings.items) do
		slot9 = cloneTplTo(slot0._itemListItemTpl, slot0._itemListItemContainer)
		slot13.anonymous = slot8.anonymous
		slot13.hideName = slot8.hideName

		updateDrop(slot9, slot8, {})

		slot10 = findTF(slot9, "name")

		if not slot8.hideName then
			slot11 = findTF(slot9, "name_mask")

			setActive(slot10, false)
			setActive(slot11, true)

			slot12 = ScrollTxt.New(slot11, findTF(slot9, "name_mask/name"))

			slot12:setText(getText(slot10))
			table.insert(slot0._scrollTxts, slot12)
		end

		if not slot8.anonymous then
			onButton(slot0, slot9, function ()
				if uv0 then
					uv0(uv1)
				end
			end, SFX_UI_CLICK)
		end
	end

	slot0:Loaded(slot1)
end

function slot7(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, true)
	SetActive(slot0._singleItemshipTypeTF, false)
	SetActive(slot0._singleItemshipTypeBgTF, false)
	SetActive(slot0._sigleItemPanel:Find("detail"), false)
	setText(slot0._sigleItemPanel:Find("icon_bg/count"), "")
	SetActive(slot0._sigleItemPanel:Find("icon_bg/startpl"), false)
	SetActive(slot0._sigleItemPanel:Find("intro_view/Viewport/Content/intro"), true)
	setFrame(slot0._sigleItemPanel:Find("icon_bg/frame"), slot1.frame or 1)

	slot9 = ScrollTxt.New(findTF(slot0._sigleItemPanel, "name_mode/name_mask"), findTF(slot0._sigleItemPanel, "name_mode/name_mask/name"))

	slot9.setText(slot9, slot1.name or "")
	setText(slot4, slot1.content or "")
	SetActive(slot0._sigleItemPanel:Find("icon_bg/icon").parent, slot1.sprite)

	if slot1.sprite then
		setImageSprite(slot2, slot1.sprite, false)
	end

	slot0:Loaded(slot1)
end

function slot8(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, true)
	setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), false)

	if slot1.drop then
		slot2, slot3 = GetOwnedpropCount(slot1.drop)

		setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), slot3 and slot1.showOwned)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/Text"), slot2)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/label"), i18n("word_own1"))
	end

	setParent(slot0._singleItemshipTypeTF, slot0._sigleItemPanel)
	updateDrop(slot0._sigleItemPanel, slot1.drop)

	if slot1.windowSize then
		rtf(slot0._window).sizeDelta = Vector2(slot1.windowSize.x or slot0._defaultSize.x, slot1.windowSize.y or slot0._defaultSize.y)
	end

	slot3 = 1

	SetActive(slot0._sigleItemPanel:Find("intro_view/Viewport/Content/intro"), slot1.drop.type == DROP_TYPE_SHIP or slot1.drop.type == DROP_TYPE_RESOURCE or slot1.drop.type == DROP_TYPE_ITEM or slot1.drop.type == DROP_TYPE_FURNITURE or slot1.drop.type == DROP_TYPE_STRATEGY or slot1.drop.type == DROP_TYPE_SKIN)
	setActive(slot0._countDescTxt, slot0.settings.numUpdate ~= nil)

	slot8 = slot1.name or slot1.drop.cfg.name or ""
	slot8 = ScrollTxt.New(slot0._sigleItemPanel:Find("name_mode/name_mask"), slot0._sigleItemPanel:Find("name_mode/name_mask/name"))

	slot8:setText(HXSet.hxLan(slot8))
	table.insert(slot0._scrollTxts, slot8)
	setParent(slot0._singleItemshipTypeTF, slot0._sigleItemPanel:Find("name_mode"))
	slot0._singleItemshipTypeTF:SetSiblingIndex(1)
	setActive(slot0._singleItemshipTypeBgTF, isActive(slot0._singleItemshipTypeTF))

	slot10 = slot1.drop.type == DROP_TYPE_ITEM and slot1.drop.cfg.type == 11

	setActive(slot0._sigleItemPanel:Find("detail"), slot10)

	if slot10 then
		slot9:GetComponent("RichText"):AddListener(function (slot0, slot1)
			slot2 = {
				items = _.map(uv0.drop.cfg.display_icon, function (slot0)
					slot1.type = slot0[1]
					slot1.id = slot0[2]

					return {}
				end),
				content = i18n("equip_skin_detail_tip"),
				item2Row = true,
				hideNo = true,
				itemFunc = function (slot0)
					slot3.drop = slot0

					function slot3.onYes()
						uv0(uv1, uv2)
					end

					function slot3.onNo()
						uv0(uv1, uv2)
					end

					uv0(uv1, {})
				end,
				onYes = function ()
					uv0(uv1, uv2)
				end,
				onNo = slot2.onYes
			}

			uv3(uv2, slot2)
		end)
	end

	if slot1.content and slot1.content ~= "" then
		slot0.singleItemIntroTF.text = slot1.content
	elseif slot1.drop.type == DROP_TYPE_RESOURCE then
		setText(slot2, slot1.drop.cfg.display)
	elseif slot1.drop.type == DROP_TYPE_ITEM then
		setText(slot2, HXSet.hxLan(slot1.drop.cfg.display))
	elseif slot1.drop.type == DROP_TYPE_FURNITURE then
		setText(slot2, slot1.drop.cfg.describe)
	elseif slot1.drop.type == DROP_TYPE_SHIP then
		slot12, slot13, slot14 = ShipWordHelper.GetWordAndCV(uv2.ship_data_statistics[slot1.drop.id].skin_id, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

		setText(slot2, slot14 or i18n("ship_drop_desc_default"))
	elseif slot1.drop.type == DROP_TYPE_EQUIP then
		-- Nothing
	elseif slot1.drop.type == DROP_TYPE_STRATEGY then
		setText(slot2, slot1.drop.cfg.desc)

		if slot1.extendDesc then
			slot0.singleItemIntros[slot3] = slot0.singleItemIntros[slot3 + 1] or cloneTplTo(slot0.singleItemIntro, slot0.singleItemIntro.parent)

			setText(slot0.singleItemIntros[slot3], slot1.extendDesc)
		end
	elseif slot1.drop.type == DROP_TYPE_SKIN then
		setText(slot2, HXSet.hxLan(slot1.drop.cfg.desc))
	elseif slot1.drop.type == DROP_TYPE_EQUIPMENT_SKIN then
		setText(slot2, slot1.drop.cfg.desc .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(_.map(slot1.drop.cfg.equip_type, function (slot0)
			return EquipType.Type2Name2(slot0)
		end), ","))
	elseif slot1.drop.type == DROP_TYPE_VITEM then
		setText(slot2, HXSet.hxLan(slot1.drop.cfg.display))
	elseif slot1.drop.type == DROP_TYPE_WORLD_ITEM then
		setText(slot2, HXSet.hxLan(slot1.drop.cfg.display))
	elseif slot1.drop.type == DROP_TYPE_ICON_FRAME then
		setText(slot2, slot1.drop.cfg.desc)
	elseif slot1.drop.type == DROP_TYPE_CHAT_FRAME then
		setText(slot2, slot1.drop.cfg.desc)
	elseif slot1.drop.type == DROP_TYPE_EMOJI then
		setText(slot2, slot1.drop.cfg.item_desc)
	end

	if slot1.intro then
		setText(slot2, slot1.intro)
	end

	if slot1.enabelYesBtn ~= nil then
		slot11 = slot0._btnContainer:GetChild(1)

		setButtonEnabled(slot11, slot1.enabelYesBtn)
		eachChild(slot11, function (slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = uv0.enabelYesBtn and 1 or 0.3
		end)
	end

	for slot14, slot15 in ipairs(slot0.singleItemIntros) do
		setActive(slot15, slot14 <= slot3 and slot4 == nil)
	end

	if slot1.show_medal then
		slot13.text = slot1.show_medal.desc
		slot13.btnType = uv3.BUTTON_MEDAL
		slot13.sound = SFX_UI_BUILDING_EXCHANGE

		slot0:createBtn({
			sibling = 0,
			hideEvent = true
		})
	end

	slot0:Loaded(slot1)
end

function slot9(slot0, slot1)
	slot1.hideNo = defaultValue(slot1.hideNo, true)
	slot1.hideYes = defaultValue(slot1.hideYes, true)

	slot0:commonSetting(slot1)
	setActive(findTF(slot0._helpPanel, "bg"), not slot1.helps.pageMode)
	setActive(slot0._helpBgTF, slot1.helps.pageMode)

	if slot1.helps.helpSize then
		rtf(slot0._helpPanel).sizeDelta = Vector2(slot1.helps.helpSize.x or slot0._defaultHelpSize.x, slot1.helps.helpSize.y or slot0._defaultHelpSize.y)
	end

	if slot1.helps.helpPos then
		slot4.x = slot1.helps.helpPos.x or slot0._defaultHelpPos.x
		slot4.y = slot1.helps.helpPos.y or slot0._defaultHelpPos.y

		setAnchoredPosition(slot0._helpPanel, {})
	end

	if slot1.helps.windowSize then
		rtf(slot0._window).sizeDelta = Vector2(slot1.helps.windowSize.x or slot0._defaultSize.x, slot1.helps.windowSize.y or slot0._defaultSize.y)
	end

	if slot1.helps.windowPos then
		slot4 = slot1.helps.windowSize.x or slot0._defaultSize.x
		rtf(slot0._window).sizeDelta = Vector2(slot4, slot1.helps.windowSize.y or slot0._defaultSize.y)
		slot4.x = slot1.helps.windowPos.x or 0
		slot4.y = slot1.helps.windowPos.y or 0

		setAnchoredPosition(slot0._window, {})
	else
		setAnchoredPosition(slot0._window, {
			x = 0,
			y = 0
		})
	end

	if slot1.helps.buttonsHeight then
		slot4.y = slot1.helps.buttonsHeight

		setAnchoredPosition(slot0._btnContainer, {
			x = 0
		})
	end

	if slot1.helps.disableScroll then
		GetComponent(slot0._helpPanel, typeof(ScrollRect)).enabled = not slot1.helps.disableScroll

		setAnchoredPosition(findTF(slot0._helpPanel, "list"), {
			x = 0,
			y = 0
		})
		setActive(findTF(slot0._helpPanel, "Scrollbar"), false)
	end

	if slot1.helps.ImageMode then
		setActive(slot0._top, false)
		setActive(findTF(slot0._window, "bg"), false)
	end

	for slot6 = #slot0.settings.helps, slot0._helpList.childCount - 1, 1 do
		Destroy(slot0._helpList:GetChild(slot6))
	end

	for slot6 = slot0._helpList.childCount, #slot2 - 1, 1 do
		cloneTplTo(slot0._helpTpl, slot0._helpList)
	end

	for slot6, slot7 in ipairs(slot2) do
		slot8 = slot0._helpList:GetChild(slot6 - 1)

		setActive(slot8, true)
		setText(slot8, slot7.info or "")
		setActive(slot8:Find("icon"), slot7.icon)
		setActive(findTF(slot8, "line"), slot7.line)

		if slot7.icon then
			slot10 = 1

			if slot1.helps.ImageMode then
				slot10 = 1.5
			end

			slot9.transform.localScale = Vector2(slot7.icon.scale or slot10, slot7.icon.scale or slot10)
			slot11 = slot7.icon.path

			setImageSprite(slot9:GetComponent(typeof(Image)), LoadSprite(slot7.icon.atlas, slot7.icon.path), true)

			slot17.x = slot7.icon.posX and slot7.icon.posX or -20
			slot17.y = slot7.icon.posY and slot7.icon.posY or 0

			setAnchoredPosition(slot9, {})
			setActive(slot9:Find("corner"), slot1.helps.pageMode)
		end
	end

	slot0.helpPage = slot1.helps.defaultpage or 1

	if slot1.helps.pageMode then
		slot0:switchHelpPage(slot0.helpPage)
	end

	slot0:Loaded(slot1)
	setActive(slot0._btnContainer, slot0._btnContainer.transform.childCount > 0)
end

function slot10(slot0, slot1)
	slot0:commonSetting(slot1)
	setActive(slot0._otherPanel, true)

	slot2 = tf(slot1.secondaryUI)
	rtf(slot0._window).sizeDelta = Vector2(960, slot0._defaultSize.y)

	setActive(slot2, true)

	slot5 = getProxy(SecondaryPWDProxy):getRawData()
	slot6 = slot2:Find("showresttime")

	if slot1.mode == "showresttime" then
		setActive(slot6, true)
		setActive(slot2:Find("settips"), false)

		slot8 = slot6:Find("desc"):GetComponent(typeof(Text))

		if slot0.timers.secondaryUItimer then
			slot0.timers.secondaryUItimer:Stop()
		end

		function slot9()
			if (uv1.fail_cd and uv1.fail_cd - uv0.TimeMgr.GetInstance():GetServerTime() or 0) < 0 then
				slot1 = 0
			end

			if math.floor(slot1 / 86400) > 0 then
				uv2.text = string.format(i18n("tips_fail_secondarypwd_much_times"), slot2 .. i18n("word_date"))
			elseif math.floor(slot1 / 3600) > 0 then
				uv2.text = string.format(i18n("tips_fail_secondarypwd_much_times"), slot3 .. i18n("word_hour"))
			else
				if math.floor(slot1 / 60) > 0 then
					slot4 = "" .. slot5 .. i18n("word_minute")
				end

				uv2.text = string.format(i18n("tips_fail_secondarypwd_much_times"), slot4 .. math.max(slot1 - slot5 * 60, 0) .. i18n("word_second"))
			end
		end

		slot9()

		slot10 = Timer.New(slot9, 1, -1)

		slot10:Start()

		slot0.timers.secondaryUItimer = slot10
	elseif slot3 == "settips" then
		setActive(slot6, false)
		setActive(slot7, true)

		slot1.references.inputfield = slot7:Find("InputField"):GetComponent(typeof(InputField))
		slot8.text = slot1.references.lasttext or ""
		slot9 = 20

		slot8.onValueChanged:AddListener(function ()
			slot0, slot1 = utf8_to_unicode(uv0.text)

			if uv1 < slot1 then
				uv0.text = SecondaryPasswordMediator.ClipUnicodeStr(uv0.text, uv1)
			end
		end)

		slot13.text = uv1.TEXT_CONFIRM
		slot13.btnType = uv1.BUTTON_BLUE
		slot13.onCallback = slot0.settings.onYes
		slot13.sound = SFX_CONFIRM

		function slot13.noQuit()
			if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
				return false
			end

			slot1, slot2 = wordVer(uv0.text, {
				isReplace = true
			})

			if slot1 > 0 or slot2 ~= slot0 then
				uv1.TipsMgr.GetInstance():ShowTips(i18n("secondarypassword_illegal_tip"))

				uv0.text = slot2

				return true
			else
				return false
			end
		end

		slot0:createBtn({})
	end

	slot0:Loaded(slot1)
end

function slot11(slot0, slot1)
	slot0:commonSetting(slot1)

	rtf(slot0._window).sizeDelta = Vector2(slot0._defaultSize.x, 520)

	setActive(slot0._obtainPanel, true)
	setActive(slot0._btnContainer, false)

	slot2.type = DROP_TYPE_SHIP
	slot2.id = slot1.shipId

	updateDrop(slot0._obtainPanel, {})

	slot0.obtainSkipList = slot0.obtainSkipList or UIItemList.New(slot0._obtainPanel:Find("skipable_list"), slot0._obtainPanel:Find("skipable_list/tpl"))

	slot0.obtainSkipList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = uv0.list[slot1 + 1]
			slot6 = slot3[3]

			setText(slot2:Find("title"), slot3[1])
			setActive(slot2:Find("skip_btn"), slot3[2][1] ~= "" and slot5[1] ~= "COLLECTSHIP")

			if slot5[1] ~= "" then
				onButton(uv1, slot2:Find("skip_btn"), function ()
					if uv0 and uv0 ~= 0 then
						if not getProxy(ActivityProxy):getActivityById(uv0) or slot0:isEnd() then
							uv1.TipsMgr.GetInstance():ShowTips(i18n("collection_way_is_unopen"))

							return
						end
					elseif uv2[1] == "SHOP" and uv2[2].warp == "supplies" and not uv1.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getData().level, "MilitaryExerciseMediator") then
						uv1.TipsMgr.GetInstance():ShowTips(i18n("military_shop_no_open_tip"))

						return
					elseif uv2[1] == "LEVEL" and uv2[2] then
						slot1 = getProxy(ChapterProxy)

						if slot1:getMaps()[slot1:getChapterById(uv2[2].chapterid):getConfig("map")] and slot4:getChapter(slot0) and slot4:getChapter(slot0):isUnlock() then
							if slot1:getActiveChapter() and slot5.id ~= slot0 then
								slot8.content = i18n("collect_chapter_is_activation")

								function slot8.onYes()
									slot3.type = ChapterConst.OpRetreat

									uv0.m02:sendNotification(GAME.CHAPTER_OP, {})
								end

								uv3:ShowMsgBox({})

								return
							else
								slot6 = {
									mapIdx = slot3:getConfig("map")
								}

								if slot3.active then
									slot6.chapterId = slot3.id
								else
									slot6.openChapterId = slot0
								end

								uv1.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot6)
							end
						else
							uv1.TipsMgr.GetInstance():ShowTips(i18n("acquisitionmode_is_not_open"))

							return
						end
					elseif uv2[1] == "COLLECTSHIP" then
						if uv4.mediatorName == CollectionMediator.__cname then
							slot3.displayGroupId = uv2[2].shipGroupId

							uv1.m02:sendNotification(CollectionMediator.EVENT_OBTAIN_SKIP, {
								toggle = 2
							})
						else
							slot4.displayGroupId = uv2[2].shipGroupId

							uv1.m02:sendNotification(GAME.GO_SCENE, SCENE.COLLECTSHIP, {
								toggle = 2
							})
						end
					else
						uv1.m02:sendNotification(GAME.GO_SCENE, SCENE[uv2[1]], uv2[2])
					end

					uv3:hide()
				end, SFX_PANEL)
			end
		end
	end)
	slot0.obtainSkipList:align(#slot1.list)
	slot0:Loaded(slot1)
end

function slot1.nextPage(slot0)
	slot0.helpPage = slot0.helpPage + 1

	if slot0.helpPage < 1 then
		slot0.helpPage = 1
	end

	if slot0._helpList.childCount < slot0.helpPage then
		slot0.helpPage = 1
	end

	slot0:switchHelpPage(slot0.helpPage)
end

function slot1.prePage(slot0)
	slot0.helpPage = slot0.helpPage - 1

	if slot0.helpPage < 1 then
		slot0.helpPage = slot0._helpList.childCount
	end

	if slot0._helpList.childCount < slot0.helpPage then
		slot0.helpPage = slot0._helpList.childCount
	end

	slot0:switchHelpPage(slot0.helpPage)
end

function slot1.switchHelpPage(slot0, slot1)
	for slot5 = 1, slot0._helpList.childCount, 1 do
		setActive(slot0._helpList:GetChild(slot5 - 1), slot1 == slot5)
		setText(slot6:Find("icon/corner/Text"), slot5)
	end
end

function slot1.commonSetting(slot0, slot1)
	rtf(slot0._window).sizeDelta = slot0._defaultSize
	rtf(slot0._helpPanel).sizeDelta = slot0._defaultHelpSize
	slot0.enable = true

	uv0.DelegateInfo.New(slot0)
	setActive(slot0._msgPanel, false)
	setActive(slot0._exchangeShipPanel, false)
	setActive(slot0._itemPanel, false)
	setActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)
	setActive(slot0._obtainPanel, false)
	setActive(slot0._otherPanel, false)
	setActive(slot0._helpBgTF, false)
	setActive(slot0._helpPanel, slot1.helps)
	setActive(slot0._btnContainer, true)

	slot0.stopRemindToggle.isOn = false

	setActive(go(slot0.stopRemindToggle), slot1.showStopRemind)

	slot0.stopRemindText.text = slot1.stopRamindContent or i18n("dont_remind_today")

	removeAllChildren(slot0._btnContainer)

	slot0.settings = slot1

	SetActive(slot0._go, true)
	setActive(slot0._countSelect, slot0.settings.needCounter or false)

	slot3 = slot0.settings.numUpdate

	slot0._pageUtil:setNumUpdate(function (slot0)
		if uv0 ~= nil then
			uv0(uv1._countDescTxt, slot0)
		end
	end)
	slot0._pageUtil:setAddNum(slot0.settings.addNum or 1)
	slot0._pageUtil:setMaxNum(slot0.settings.maxNum or -1)
	slot0._pageUtil:setDefaultNum(slot0.settings.defaultNum or 1)
	setActive(slot0._sliders, slot0.settings.discount)

	if slot0.settings.discount then
		slot0._discount:GetComponent(typeof(Text)).text = slot0.settings.discount.discount .. "%OFF"
		slot0._discountDate:GetComponent(typeof(Text)).text = slot0.settings.discount.date
	end

	slot7 = slot0.settings.hideNo or false
	slot8 = slot0.settings.hideYes or false
	slot10 = slot0.settings.onNo or function ()
	end

	if not (slot0.settings.modal or false) then
		onButton(slot0, slot0._go, function ()
			if uv0.settings.onClose then
				uv0.settings.onClose()
			else
				uv1()
			end

			uv0:hide()
		end, SFX_CANCEL)
	else
		removeOnButton(slot0._go)
	end

	slot11, slot12 = nil

	if not slot7 then
		slot15.text = slot0.settings.noText or uv1.TEXT_CANCEL
		slot15.btnType = slot0.settings.noBtnType or uv1.BUTTON_GRAY
		slot15.onCallback = slot10
		slot15.sound = slot1.noSound or SFX_CANCEL
		slot11 = slot0.createBtn(slot0, {})
	end

	if not slot8 then
		slot15.text = slot0.settings.yesText or uv1.TEXT_CONFIRM
		slot15.btnType = slot0.settings.yesBtnType or uv1.BUTTON_BLUE
		slot15.onCallback = slot0.settings.onYes or function ()
		end
		slot15.sound = slot1.yesSound or SFX_CONFIRM
		slot12 = slot0.createBtn(slot0, {})
	end

	if slot0.settings.yseBtnLetf then
		slot12:SetAsFirstSibling()
	end

	slot13 = nil

	if slot0.settings.type == MSGBOX_TYPE_HELP and slot0.settings.helps.pageMode and #slot0.settings.helps > 1 then
		slot16.btnType = uv1.BUTTON_PREPAGE

		function slot16.onCallback()
			uv0:prePage()
		end

		slot16.sound = SFX_CANCEL

		slot0:createBtn({
			noQuit = true
		})

		slot13 = #slot0.settings.helps
	end

	if slot0.settings.custom ~= nil then
		for slot17, slot18 in ipairs(slot0.settings.custom) do
			slot0:createBtn(slot18)
		end
	end

	if not slot13 then
		-- Nothing
	elseif slot13 > 1 then
		slot16.btnType = uv1.BUTTON_NEXTPAGE

		function slot16.onCallback()
			uv0:nextPage()
		end

		slot16.sound = SFX_CONFIRM

		slot0:createBtn({
			noQuit = true
		})
	end

	setActive(slot0._closeBtn, not slot1.hideClose)
	onButton(slot0, slot0._closeBtn, function ()
		uv0:hide()

		if uv0.settings.onClose then
			slot0()
		else
			uv1()
		end
	end, SFX_CANCEL)

	slot14 = slot0.settings.title or uv1.TITLE_INFORMATION

	while 0 < slot0._titleList.transform.childCount do
		slot17 = slot0._titleList.transform:GetChild(slot15)

		SetActive(slot17, slot17.name == slot14)

		slot15 = slot15 + 1
	end

	slot17 = slot0._go.transform.localPosition
	slot0._go.transform.localPosition = Vector3(slot17.x, slot17.y, slot0.settings.zIndex or 0)
end

function slot1.createBtn(slot0, slot1)
	slot3 = slot1.onCallback or function ()
	end
	slot4 = slot1.noQuit

	if slot1.label then
		go(cloneTplTo(slot0._go.transform:Find("custom_btn_list/custom_button_" .. (slot1.btnType or uv0.BUTTON_BLUE)), slot0._btnContainer)).name = slot1.label
	end

	SetActive(slot6, true)

	if slot1.scale then
		slot6.localScale = Vector2(slot1.scale.x or 1, slot1.scale.y or 1)
	end

	if slot2 == uv0.BUTTON_MEDAL then
		setText(slot6:Find("text"), slot1.text)
	elseif slot2 ~= uv0.BUTTON_RETREAT and slot2 ~= uv0.BUTTON_PREPAGE and slot2 ~= uv0.BUTTON_NEXTPAGE then
		slot0:updateButton(slot6, slot1.text)
	end

	if slot2 == uv0.BUTTON_BLUE_WITH_ICON and slot1.iconName then
		setImageSprite(slot6:Find("ticket/icon"), LoadSprite(slot1.iconName[1], slot1.iconName[2]))
	end

	if not slot1.hideEvent then
		onButton(slot0, slot6, function ()
			if type(uv0) == "function" then
				if not uv0() then
					SetActive(uv1._go, false)
					uv1:Clear()
				else
					return
				end
			elseif not uv0 then
				SetActive(uv1._go, false)
				uv1:Clear()
			end

			uv2()
		end, slot1.sound or SFX_CONFIRM)
	end

	if slot1.sibling then
		slot6:SetSiblingIndex(slot1.sibling)
	end

	return slot6
end

function slot1.updateButton(slot0, slot1, slot2)
	slot3 = uv0[slot2]

	if IsNil(slot1:Find("pic")) then
		return
	end

	if slot3 then
		setText(slot4, i18n(slot3))
	else
		if string.len(slot2) > 12 then
			GetComponent(slot4, typeof(Text)).resizeTextForBestFit = true
		end

		setText(slot4, slot2)
	end
end

function slot1.Loaded(slot0, slot1)
	if slot1.parent then
		setParent(slot0._tf, slot1.parent)

		if slot1.canvasOrder then
			slot2 = GetComponent(slot0._tf, typeof(Canvas))
			slot0.originCanvasOrder = slot2.sortingOrder
			slot2.sortingOrder = slot1.canvasOrder
		end
	else
		slot6.groupName = slot1.groupName
		slot6.weight = slot1.weight
		slot6.blurLevelCamera = slot1.blurLevelCamera

		uv0.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {})
	end

	uv0.m02:sendNotification(GAME.OPEN_MSGBOX_DONE)
end

function slot1.Clear(slot0)
	rtf(slot0._window).sizeDelta = slot0._defaultSize
	rtf(slot0._helpPanel).sizeDelta = slot0._defaultHelpSize

	setAnchoredPosition(slot0._window, {
		x = 0,
		y = 0
	})
	setAnchoredPosition(slot0._btnContainer, {
		x = 0,
		y = 0
	})

	slot3.x = slot0._defaultHelpPos.x
	slot3.y = slot0._defaultHelpPos.y

	setAnchoredPosition(slot0._helpPanel, {})

	GetComponent(slot0._helpPanel, typeof(ScrollRect)).enabled = true

	setActive(slot0._top, true)
	setActive(findTF(slot0._window, "bg"), true)
	setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), false)

	for slot5 = 0, slot0._helpList.childCount - 1, 1 do
		slot0._helpList:GetChild(slot5):Find("icon"):GetComponent(typeof(Image)).sprite = nil
	end

	for slot5 = #slot0._scrollTxts, 1, -1 do
		if slot0._scrollTxts[slot5] then
			slot0._scrollTxts[slot5]:destroy()
			table.remove(slot0._scrollTxts, slot5)
		end
	end

	for slot5, slot6 in pairs(slot0.pools) do
		if slot6 then
			PoolMgr.GetInstance():ReturnUI(slot6.name, slot6)
		end
	end

	slot0.pools = {}

	for slot5, slot6 in pairs(slot0.timers) do
		slot6:Stop()
	end

	slot0.timers = {}

	uv0.DelegateInfo.Dispose(slot0)
	removeAllChildren(slot0._btnContainer)

	if slot0.settings and slot0.settings.parent then
		setParent(slot0._tf, uv0.UIMgr.GetInstance().OverlayMain, false)

		if slot0.settings.canvasOrder then
			GetComponent(slot0._tf, typeof(Canvas)).sortingOrder = slot0.originCanvasOrder
		end
	else
		uv0.UIMgr.GetInstance():UnblurPanel(slot0._tf, uv0.UIMgr.GetInstance().OverlayMain)
	end

	slot0.contentText:RemoveAllListeners()

	slot0.settings = nil
	slot0.enable = false
end

function slot1.ShowMsgBox(slot0, slot1)
	if (slot1.type or MSGBOX_TYPE_NORMAL) == MSGBOX_TYPE_NORMAL then
		uv0(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_INPUT then
		uv1(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_SINGLE_ITEM then
		uv2(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_EXCHANGE then
		uv3(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_DROP_ITEM then
		uv4(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_ITEM_BOX then
		uv5(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_HELP then
		uv6(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_SECONDPWD then
		PoolMgr.GetInstance():GetUI("Msgbox4SECPWD", true, function (slot0)
			uv0.pools.SedondaryUI = slot0

			if uv1.onPreShow then
				uv1.onPreShow()
			end

			uv1.secondaryUI = slot0

			SetParent(slot0, uv0._otherPanel, false)
			uv2(uv0, uv1)
		end)
	elseif slot2 == MSGBOX_TYPE_OBTAIN then
		slot1.title = slot1.title or uv8.TITLE_OBTAIN

		uv9(slot0, slot1)
	end
end

function slot1.hide(slot0)
	if not slot0.enable then
		return
	end

	slot0._go:SetActive(false)
	slot0:Clear()
	uv0.m02:sendNotification(GAME.CLOSE_MSGBOX_DONE)
end