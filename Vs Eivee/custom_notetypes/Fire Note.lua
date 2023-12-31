ohnourFireedlol = 0.015
FireTimer = false;
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Fire Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'fireassets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function onStepHit()
	if FireTimer == true then
              health = getProperty('health')
              setProperty('health', getProperty('health')-ohnourFireedlol)
            		
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Fire Note' then
            runTimer('somethingrandom09', 10);
            FireTimer = true;
                addMisses(1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'somethingrandom09' then
            FireTimer = false
	end
end