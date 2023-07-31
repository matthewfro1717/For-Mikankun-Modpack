function onCreatePost()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an paint
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'trap' then
		if not sus then
				oFX = getPropertyFromGroup('unspawnNotes', i, 'offsetX')
			else
				susFX = getPropertyFromGroup('unspawnNotes', i, 'offsetX')
			end
			if mustPress then
				setPropertyFromGroup('unspawnNotes', i, 'offsetX', getPropertyFromGroup('unspawnNotes', i, 'offsetX') - 640)
			else
				setPropertyFromGroup('unspawnNotes', i, 'offsetX', getPropertyFromGroup('unspawnNotes', i, 'offsetX') + 640)
			end
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'trap_note'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-0.5'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end

function onUpdatePost(el)
    songPos = getSongPosition()
	local currentBeat = (getSongPosition() / 1000)*(bpm/60)
    for a = 0, getProperty('notes.length') - 1 do
        strumTime = getPropertyFromGroup('notes', a, 'strumTime')
		sus = getPropertyFromGroup('notes', a, 'isSustainNote')
        if getPropertyFromGroup('notes', a, 'noteType') == 'trap' then
			if sus then
				setPropertyFromGroup('notes', a, 'offsetX', getPropertyFromGroup('notes', a, 'offsetX') + 3 * math.cos((currentBeat + a * 0.15) * math.pi))
			end
			if (strumTime - songPos) < 1100 / scrollSpeed and not sus then
				if getPropertyFromGroup('notes', a, 'offsetX') ~= oFX then
					setPropertyFromGroup('notes', a, 'offsetX', lerp(getPropertyFromGroup('notes', a, 'offsetX'), oFX, boundTo(el * 10, 0, 1)))                     
				elseif getPropertyFromGroup('notes', a, 'offsetX') <= oFX then
					setPropertyFromGroup('notes', a, 'offsetX', oFX)
				end
			elseif (strumTime - songPos) < 1200 / scrollSpeed and sus then
				if getPropertyFromGroup('notes', a, 'offsetX') ~= susFX then
					setPropertyFromGroup('notes', a, 'offsetX', lerp(getPropertyFromGroup('notes', a, 'offsetX'), susFX, boundTo(el * 10, 0, 1)))
				elseif getPropertyFromGroup('notes', a, 'offsetX') <= susFX then
					setPropertyFromGroup('notes', a, 'offsetX', susFX)
				end
			end
        end
    end
end

function lerp(a, b, ratio)
  return math.floor(a + ratio * (b - a))
end

function boundTo(value, min, max)
	return math.max(min, math.min(max, value))
end