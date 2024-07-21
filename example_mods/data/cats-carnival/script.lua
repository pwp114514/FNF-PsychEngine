function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.02);
        end
    end
end
