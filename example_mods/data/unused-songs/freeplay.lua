-- Thank you so much XooleDev
-- Brought a bunch of bugs

local songData = {
{"soul-chance","lightning","soul-chance-unused"},
{"unbelivable","sirokou","unbelivable"},
{"menaced","sirokou","menaced"},
{"mouse-chase","pibby-tom","mouse-chase"}
}
local MaxProductLimit = 4
local MinProductLimit = 1
local ProductSelected=1
local androidPad = {}
function addVirtualPad() if buildTarget == 'android' then addAndroidPad('up', 0, 471, 'FFFFFF') addAndroidPad('down', 0, 593, 'FFFFFF') addAndroidPad('a', 1148, 593, 'FFFFFF') addAndroidPad('b', 1024, 593, 'FFFFFF') end end
function addAndroidPad(name, x, y, color) makeAnimatedLuaSprite(name:lower()..'_AndroidPad', 'virtualpad', x, y) setObjectCamera(name:lower()..'_AndroidPad', 'other') addLuaSprite(name:lower()..'_AndroidPad', true) addAnimationByPrefix(name:lower()..'_AndroidPad', 'normal', name:lower()..'1', 24, false) addAnimationByPrefix(name:lower()..'_AndroidPad', 'pressed', name:lower()..'2', 24, false) setProperty(name:lower()..'_AndroidPad.alpha', 0.7) setProperty(name:lower()..'_AndroidPad.color', getColorFromHex(color)) table.insert(androidPad, name:lower()) end
function AndroidPadUpdate() for i = 1, #androidPad do if androidPadPress(androidPad[i]) then objectPlayAnimation(androidPad[i]..'_AndroidPad', 'pressed', true) else objectPlayAnimation(androidPad[i]..'_AndroidPad', 'normal', true) end end end
function androidPadJustPress(name) for i =1,#GetTouch("y") do
if ((GetTouch("y")[i] > getProperty(name:lower()..'_AndroidPad.y') and GetTouch("y")[i] < getProperty(name:lower()..'_AndroidPad.y')+132) and (GetTouch("x")[i] > getProperty(name:lower()..'_AndroidPad.x') and GetTouch("x")[i] < getProperty(name:lower()..'_AndroidPad.x')+132) and mouseClicked('left')) then
return true
end
end
return false end
function androidPadPress(name)
for i =1,#GetTouch("x") do
if ((GetTouch("y")[i] > getProperty(name:lower()..'_AndroidPad.y') and GetTouch("y")[i] < getProperty(name:lower()..'_AndroidPad.y')+132) and (GetTouch("x")[i] > getProperty(name:lower()..'_AndroidPad.x') and GetTouch("x")[i] < getProperty(name:lower()..'_AndroidPad.x')+132) and mousePressed('left')) then
return true
end
end
return false
end
function removeAndroidPad() for i = 1, #androidPad do removeLuaSprite(androidPad[i]..'_AndroidPad', true) end androidPad = {} end
function GetTouch(xy)
return runHaxeCode([[ var jlkk = []; for (touch in FlxG.touches.list) jlkk.push(touch.]]..xy..[[); return jlkk;]])
end
function onCreate()
	playMusic('freakyMenu', 0.8, true)
    
    addVirtualPad()
	Select(0)
end
function onStartCountdown()
return Function_Stop;
end
function onUpdate()
AndroidPadUpdate()
if keyJustPressed('pause') or androidPadJustPress("b") then
exitMenu()
end

if keyboardJustPressed('SPACE') or androidPadJustPress("a") then
playSound('play');
loadSong(songData[ProductSelected][1]);
end

if keyboardJustPressed('DOWN') or androidPadJustPress("DOWN") then
Select(1)
end
if keyboardJustPressed('UP') or androidPadJustPress("up") then
Select(-1)
end


end
function Select(add)
ProductSelected = ProductSelected + add
if ProductSelected > MaxProductLimit then
	ProductSelected = 1
elseif ProductSelected < MinProductLimit then
	ProductSelected = MaxProductLimit
end
makeLuaSprite('image', 'freeplay/pictures/'..songData[ProductSelected][2], 0, 280)
addLuaSprite('image', true)
setScrollFactor('image', 1, 1);
setProperty('image.x', 970-getProperty('image.width')/2)
makeLuaSprite('song', 'freeplay/songs/'..songData[ProductSelected][3], 150, 340)
addLuaSprite('song', true)
setScrollFactor('song', 1, 1);
setProperty('song.x', 330-getProperty('song.width')/2)

playSound('select');
end
function onTimerCompleted(tag, loops, loopsLeft)
	if keyJustPressed('pause') then
		exitMenu();
	end
end

function exitMenu()
	exitSong(true);
end