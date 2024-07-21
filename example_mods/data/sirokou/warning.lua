local allowCountdown = false
local warningimage = 'warningimage'
local confirmed = 0

function onCreate()
 makeLuaSprite('warningimage', warningimage, 0, 0)
 screenCenter('warningimage', 'xy')
 setObjectCamera('warningimage', 'other')
 
 addLuaSprite('warningimage', true)
end

function onStartCountdown()
 if not allowCountdown then
  return Function_Stop
 end
 if allowCountdown then
  return Function_Continue
 end
end

function onUpdate()
 if (getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') or mouseClicked('left')) and confirmed == 0 then
  allowCountdown = true
  startCountdown();
  doTweenAlpha('nomorewarningimage', 'warningimage', 0, 1, sineOut);
  playSound('confirmMenu');
  confirmed = 1
 end
 
 if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') and confirmed == 0 then
  allowCountdown = true
  confirmed = 1
  playSound('cancelMenu');
  endSong();
 end
end