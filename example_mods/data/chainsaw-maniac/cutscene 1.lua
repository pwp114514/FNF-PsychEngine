local allowCountdown = false
function onEndSong()
    if not allowCountdown and isStoryMode and not seenCutscene then 
        startVideo('w43');
        allowCountdown = true;
     return Function_Stop;
     end
return Function_Continue;
end

