slot0 = {}
slot1 = 1e-06

function slot2(slot0, slot1)
	slot2 = slot1 - slot0

	return {
		a = -slot2.y,
		b = slot2.x,
		c = slot0.x * slot2.y - slot0.y * slot2.x
	}
end

function slot3(slot0, slot1, slot2)
	slot3 = uv0(slot0, slot1)
	slot5 = (slot3.b * (slot3.b * slot2.x - slot3.a * slot2.y) - slot3.a * slot3.c) / (slot3.a * slot3.a + slot3.b * slot3.b)
	slot6 = nil

	return Vector2(slot5, IsZero(slot3.b) and (slot3.x * slot5 + slot3.c) / -slot3.b or slot0.y)
end

slot4 = nil
