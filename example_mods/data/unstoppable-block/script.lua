local allowCountdown = false
function onEndSong()
    setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
    if not allowCountdown and isStoryMode and not seenCutscene then 
        startVideo('pibby-end');
        allowCountdown = true;
          return Function_Stop;
     end
return Function_Continue;
end
