function onUpdate(elapsed)
    if curBeat > 320 then
       misses = getProperty('songMisses')
	if misses >5 then
		setProperty('health', 0)
	end
    end
end
