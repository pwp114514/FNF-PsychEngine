androidPad={}
function addAndroidPad(name, x, y, color) makeAnimatedLuaSprite(name:lower()..'abc', 'virtualpad', x, y) setObjectCamera(name:lower()..'abc', 'other') addLuaSprite(name:lower()..'abc', true) addAnimationByPrefix(name:lower()..'abc', 'normal', name:lower()..'1', 24, false) addAnimationByPrefix(name:lower()..'abc', 'pressed', name:lower()..'2', 24, false) setProperty(name:lower()..'abc.alpha', 0.7) setProperty(name:lower()..'abc.color', getColorFromHex(color)) table.insert(androidPad, name:lower()) end
function AndroidPadUpdate() for i = 1, #androidPad do if ((getMouseY('camOther') > getProperty(androidPad[i]..'abc.y') and getMouseY('camOther') < getProperty(androidPad[i]..'abc.y')+132) and (getMouseX('camOther') > getProperty(androidPad[i]..'abc.x') and getMouseX('camOther') < getProperty(androidPad[i]..'abc.x')+132) and mousePressed('left')) then objectPlayAnimation(androidPad[i]..'abc', 'pressed', true) else objectPlayAnimation(androidPad[i]..'abc', 'normal', true) end end end
function androidPadJustPress(name) return ((getMouseY('camOther') > getProperty(name:lower()..'abc.y') and getMouseY('camOther') < getProperty(name:lower()..'abc.y')+132) and (getMouseX('camOther') > getProperty(name:lower()..'abc.x') and getMouseX('camOther') < getProperty(name:lower()..'abc.x')+132) and mouseClicked('left')) end
function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('spacebar');
    precacheSound('DODGE');
	precacheSound('Dodged');
	addAndroidPad('a', 1148, 593, 'FFFFFF')
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('spacebar', 'spacebar', 250, 100);
    luaSpriteAddAnimationByPrefix('spacebar', 'spacebar', 'spacebar', 25, true);
	luaSpritePlayAnimation('spacebar', 'spacebar');
	setObjectCamera('spacebar', 'other');
	scaleLuaSprite('spacebar', 1.30, 1.30); 
    addLuaSprite('spacebar', true); 
	
	--Set values so you can dodge
    playSound('DODGE');
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
   AndroidPadUpdate()
   if canDodge == true and (keyJustPressed('space') or androidPadJustPress("a") or botPlay) then
   
   Dodged = true;
   playSound('Dodged', 0.7);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);          
   removeLuaSprite('spacebar');
   canDodge = false
   characterPlayAnim('dad', 'fuck you', true);
   setProperty('dad.specialAnim', true);   

   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   playSound('dead', 0.7);

   elseif tag == 'Died' and Dodged == true then
   Dodged = false
   
   end
end