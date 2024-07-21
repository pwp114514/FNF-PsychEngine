function onCreate()

	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'knife' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'knife'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'HURTnoteSplashes'); -- change splash
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'knife' then
		makeLuaSprite('image', 'JS 4', 0, 0);
		addLuaSprite('image', true);
		doTweenColor('hello', 'image', 'FFFFFFFF', 0.1, 'quartIn');
    		setObjectCamera('image', 'other');
   		runTimer('wait', 0.5);
		bruh = getProperty('health');
                setProperty('health', 0.25);
		playSound('TailsScreamLOL', 0.5);
		
	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'knife' then
		-- put something here if you want

	end
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'wait' then
    doTweenAlpha('byebye', 'image', 0, 0.1, 'linear');
    end
end

function onTweenCompleted(tag)
    if tag == 'byebye' then
    removeLuaSprite('image', true);
    end
end