local spacepress = 0
androidPad={}
function addAndroidPad(name, x, y, color) makeAnimatedLuaSprite(name:lower()..'abc', 'virtualpad', x, y) setObjectCamera(name:lower()..'abc', 'other') addLuaSprite(name:lower()..'abc', true) addAnimationByPrefix(name:lower()..'abc', 'normal', name:lower()..'1', 24, false) addAnimationByPrefix(name:lower()..'abc', 'pressed', name:lower()..'2', 24, false) setProperty(name:lower()..'abc.alpha', 0.7) setProperty(name:lower()..'abc.color', getColorFromHex(color)) table.insert(androidPad, name:lower()) end
function AndroidPadUpdate() for i = 1, #androidPad do if ((getMouseY('camOther') > getProperty(androidPad[i]..'abc.y') and getMouseY('camOther') < getProperty(androidPad[i]..'abc.y')+132) and (getMouseX('camOther') > getProperty(androidPad[i]..'abc.x') and getMouseX('camOther') < getProperty(androidPad[i]..'abc.x')+132) and mousePressed('left')) then objectPlayAnimation(androidPad[i]..'abc', 'pressed', true) else objectPlayAnimation(androidPad[i]..'abc', 'normal', true) end end end
function androidPadPress(name) return ((getMouseY('camOther') > getProperty(name:lower()..'abc.y') and getMouseY('camOther') < getProperty(name:lower()..'abc.y')+132) and (getMouseX('camOther') > getProperty(name:lower()..'abc.x') and getMouseX('camOther') < getProperty(name:lower()..'abc.x')+132) and mouseClicked('left')) end
function onCreate()
addAndroidPad('a', 1148, 593, 'FFFFFF')
precacheImage('dodge/dodge');
end
function onUpdate()
AndroidPadUpdate()
if keyPressed('space') or androidPadPress("a") or botPlay and spacepress==1 then
spacepress=2
end
end
function onEvent(name, value1, value2)
	if name == 'dodge' then
		makeAnimatedLuaSprite('Warn', 'dodge/dodge', -200, -100)
    addAnimationByPrefix('Warn','dodge/dodge','dodge',24,true)
    luaSpritePlayAnimation('Warn', 'dodge');
	setObjectCamera('Warn', 'hud')
	addLuaSprite('Warn', true)
	scaleObject('Warn', 1.3, 1.3);
	spacepress=1
		runTimer('second-beep', value1, 1)
		runTimer('alert-time', value2, 1)
	end
end

function onTimerCompleted(tag, Loops, LoopsLeft)
	if tag == 'alert-time' then
		if spacepress==2 then
           characterPlayAnim('boyfriend', 'dodge', true);
           setProperty('boyfriend.specialAnim', true);
           characterPlayAnim('dad', 'attack', true);
           setProperty('dad.specialAnim', true); 
			removeLuaSprite('Warn', true)
			playSound('dodged2', 0.7);
		else
			setProperty('health', getProperty('health')-1.75)
			playSound('dodged2', 0.7);
           characterPlayAnim('dad', 'attack', true);
           setProperty('dad.specialAnim', true);
           characterPlayAnim('boyfriend', 'singRIGHTmiss', true);
           setProperty('boyfriend.specialAnim', true);
           removeLuaSprite('Warn', true)
		end
	end

end