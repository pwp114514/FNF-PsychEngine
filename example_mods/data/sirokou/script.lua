local allowCountdown = false
function onEndSong()
    setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
    if not allowCountdown and isStoryMode and not seenCutscene then 
        startVideo('end');
        allowCountdown = true;
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
     return Function_Stop;
     end
return Function_Continue;
end
