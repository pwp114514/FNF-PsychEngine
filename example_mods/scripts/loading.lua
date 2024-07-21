function onStartCountdown()
	if curStage == "freeplay" then
	else
	if not allowCountdown and not seenCutscene and not isStoryMode then
	    setProperty('inCutscene', true);
	    allowCountdown = true;
	    runTimer('loadingend', 2.5, 1)
	    runTimer('imageend', 2, 1)
	    
	        makeLuaSprite('loading', 'no', -150, -60)
	        addLuaSprite('loading', true)
	        setScrollFactor('loading', 1, 1)
	        scaleObject('loading', 0.6, 0.6);
	        setObjectCamera('loading', 'other')
		return Function_Stop;
end
	return Function_Continue;
end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'loadingend' then
        startCountdown()
    end
    if tag == 'imageend' then
        doTweenAlpha('imageend', 'loading', 0, 1, 'linear')
    end
end