-- this is a modified version of a script by MTFuture
-- https://www.youtube.com/watch?v=AgS4gzhIjBs
-- also i hate my life

--redthing x: 770
--marcospause x: 40
--resume x: 700
--restart x: 710
--exit x: 635
--quit x: 755
--pointer x: getProperty('h2.x') + 80
local tweentime = 0.3
local die = 0
local botplay = 0
function addVirtualPad() if buildTarget == 'android' then androidPad = {} addAndroidPad('up', 0, 471, 'FFFFFF') addAndroidPad('down', 0, 593, 'FFFFFF') addAndroidPad('a', 1148, 593, 'FFFFFF') addAndroidPad('b', 1024, 593, 'FFFFFF') end end function addAndroidPad(name, x, y, color) makeAnimatedLuaSprite(name:lower()..'_AndroidPad', 'virtualpad', x, y) setObjectCamera(name:lower()..'_AndroidPad', 'other') addLuaSprite(name:lower()..'_AndroidPad', true) addAnimationByPrefix(name:lower()..'_AndroidPad', 'normal', name:lower()..'1', 24, false) addAnimationByPrefix(name:lower()..'_AndroidPad', 'pressed', name:lower()..'2', 24, false) setProperty(name:lower()..'_AndroidPad.alpha', 0.7) setProperty(name:lower()..'_AndroidPad.color', getColorFromHex(color)) table.insert(androidPad, name:lower()) end  function AndroidPadUpdate() for i = 1, #androidPad do if ((getMouseY('camOther') > getProperty(androidPad[i]..'_AndroidPad.y') and getMouseY('camOther') < getProperty(androidPad[i]..'_AndroidPad.y')+132) and (getMouseX('camOther') > getProperty(androidPad[i]..'_AndroidPad.x') and getMouseX('camOther') < getProperty(androidPad[i]..'_AndroidPad.x')+132) and mousePressed('left')) then objectPlayAnimation(androidPad[i]..'_AndroidPad', 'pressed', true) else objectPlayAnimation(androidPad[i]..'_AndroidPad', 'normal', true) end end end  function androidPadJustPress(name) return ((getMouseY('camOther') > getProperty(name:lower()..'_AndroidPad.y') and getMouseY('camOther') < getProperty(name:lower()..'_AndroidPad.y')+132) and (getMouseX('camOther') > getProperty(name:lower()..'_AndroidPad.x') and getMouseX('camOther') < getProperty(name:lower()..'_AndroidPad.x')+132) and mouseClicked('left')) end  function androidPadPress(name) return ((getMouseY('camOther') > getProperty(name:lower()..'_AndroidPad.y') and getMouseY('camOther') < getProperty(name:lower()..'_AndroidPad.y')+132) and (getMouseX('camOther') > getProperty(name:lower()..'_AndroidPad.x') and getMouseX('camOther') < getProperty(name:lower()..'_AndroidPad.x')+132) and mousePressed('left')) end  function removeAndroidPad() for i = 1, #androidPad do removeLuaSprite(androidPad[i]..'_AndroidPad', true) end androidPad = {} end
function onPause() -- stops normal pause screen
if curStage == "freeplay" then
else
openCustomSubstate('pauseSub', true)
end
return Function_Stop;
end
function onCustomSubstateCreate(name)
if name == "pauseSub" then
addVirtualPad()
setProperty('bg.visible', true) -- pause screen bg
setProperty('left.visible', true) -- left image
setProperty('right.visible', true) -- right image
setProperty('right2.visible', true) -- right image
setProperty('box.visible', true) -- box img
setProperty('h2.visible', true) -- resume
setProperty('h3.visible', true) -- restart
setProperty('h4.visible', true) -- exit
setProperty('pointydoingy.visible', true) -- selector
doTweenAlpha('tween3', 'h2', 1, 0.2, 'circout') -- alpha animation
doTweenAlpha('tween4', 'h3', 1, 0.2, 'circout')
doTweenAlpha('tween5', 'h4', 1, 0.2, 'circout')
doTweenAlpha('boz', 'box', 1, 0.2, 'circout')
doTweenAlpha('tween7', 'pointydoingy', 1, 0.2, 'circout')
doTweenX('left', 'left', 70, 0.3, 'circout') -- left img slide anim
doTweenX('right', 'right', 766, 0.3, 'circout') -- right img slide anim
doTweenX('right2', 'right2', 766, 0.3, 'circout') -- right img slide anim
doTweenAlpha('lefta', 'left', 1, 0.1, 'circout') -- left alpha
doTweenAlpha('riweiaisght2a', 'right2', 1, 0.1, 'circout') -- left alpha
doTweenAlpha('lefa', 'right', 1, 0.1, 'circout') -- right alpha
end end
function onCreate()
	die = 0
	tinocoPaused = false -- pause
	resume = false -- options
	restart = false
	exit = false
	precacheSound('tea-time') -- pre cache pause song
	makeLuaSprite('bg', nil, 0, 0) -- dark bg
	makeGraphic('bg', screenWidth, screenHeight, '000000')
	setProperty('bg.alpha', 0.4)
	setObjectCamera('bg', 'other')
	setProperty('bg.visible', false)
	addLuaSprite('bg')
	if songName=="Chainsaw-Maniac" or songName=="Splatter" or songName=="bloodN_cartoon" or songName=="Sirokou" or songName=="house-for-sale" or songName=="Evaporate" or songName=="vanishing-old" then
	makeLuaSprite('right2', 'pause/right2', 1200, 0);
        scaleObject('right2', 0.5, 0.5);
        setObjectCamera('right2', 'other')
        addLuaSprite('right2',true)
        
        makeLuaSprite('right', 'pause/right', 1200, 200);
        scaleObject('right', 0.5, 0.5);
        setObjectCamera('right', 'other')
        addLuaSprite('right',true)
    elseif songName=="blue" or songName=="tragical-comedy" or songName=="shattered" then
    makeLuaSprite('right', 'pause/right', 1200, 200);
        scaleObject('right', 0.5, 0.5);
        setObjectCamera('right', 'other')
        addLuaSprite('right',true)
    end
    
    
	if songName=="Sirokou" or songName=="house-for-sale" or songName=="Evaporate" or songName=="vanishing-old" then
        makeLuaSprite('left', 'pause/left', -1000, 100);
        scaleObject('left', 0.7, 0.7);
        setObjectCamera('left', 'other')
        addLuaSprite('left',true)
    elseif songName=="bloodN_cartoon" then
        makeLuaSprite('left', 'pause/left5', -1000, 100);
        scaleObject('left', 1.4, 1.4);
        setProperty('left.offset.x', 200)
        setObjectCamera('left', 'other')
        addLuaSprite('left',true)
    elseif songName=="blue" or songName=="tragical-comedy" or songName=="shattered" then
    makeLuaSprite('left', 'pause/left3', -1000, 200);
    scaleObject('left', 0.8, 0.8);
    setProperty('left.offset.x', 150)
    setObjectCamera('left', 'other')
    addLuaSprite('left',true)
    elseif songName=="Splatter" then
    makeLuaSprite('left', 'pause/left6', -600, 100);
    scaleObject('left', 1.2, 1.2);
    setProperty('left.offset.x', 200)
    setProperty('left.offset.y', 0)
    setObjectCamera('left', 'other')
    addLuaSprite('left',true)

    elseif songName=="Cats Carnival" or songName=="funny-cartoon" or songName=="unstoppable-block" then
    makeLuaSprite('left', 'pause/left2', -1000, 30);
	scaleObject('left', 1, 1);
	setProperty('left.offset.x', 50)
    setObjectCamera('left', 'other')
    addLuaSprite('left',true)
    
    makeLuaSprite('right2', 'pause/right3', 1200, -100);
    scaleObject('right2', 0.7, 0.7);
    setObjectCamera('right2', 'other')
    addLuaSprite('right2',true)
    makeLuaSprite('right', 'pause/right', 1200, 210);
    scaleObject('right', 0.5, 0.5);
    setObjectCamera('right', 'other')
    addLuaSprite('right',true)
    elseif songName=="recurrence" then
    makeLuaSprite('left', 'pause/left4', -1000, 400);
    scaleObject('left', 0.7, 0.7);
    setObjectCamera('left', 'other')
    addLuaSprite('left',true)
    makeLuaSprite('right2', 'pause/right4', 2000, 350);
    scaleObject('right2', 0.5, 0.5);
    setObjectCamera('right2', 'other')
    addLuaSprite('right2',true)
    elseif songName=="Chainsaw-Maniac" then
    makeLuaSprite('left', 'pause/left7', -600, 0);
    scaleObject('left', 1, 1);
    setProperty('left.offset.x', 200)
    setObjectCamera('left', 'other')
    addLuaSprite('left',true)
    end
	makeLuaSprite('box', 'pause/box', 470, 245) -- pause box
	setProperty('box.alpha', 1)
	setObjectCamera('box', 'other')
	scaleObject('box', 0.5, 0.5);
	setProperty('box.visible', false)
	makeLuaText('h2', 'RESUME', 600, 365, 315) -- options
	addLuaSprite('box',true)
	setObjectCamera('h2', 'other')
	setTextSize('h2', 30)
	setProperty('h2.visible', false)
	addLuaText('h2',true)
	setTextFont('h2', 'vcr.ttf')
	makeLuaText('h3', 'RESTART', 570, 379, 350)
	setObjectCamera('h3', 'other')
	setTextSize('h3', 30)
	setProperty('h3.visible', false)
	addLuaText('h3',true)
	setTextFont('h3', 'vcr.ttf')
	makeLuaText('h4', 'EXIT', 600, 330, 385)
	setObjectCamera('h4', 'other')
	setTextSize('h4', 30)
	setProperty('h4.visible', false)
	addLuaText('h4',true)
	setTextFont('h4', 'vcr.ttf')
	makeLuaSprite('pointydoingy', 'pause/arrow', 525, 1000) -- selector arrow
	setObjectCamera('pointydoingy', 'other')
	setProperty('pointydoingy.visible', false)
	addLuaSprite('pointydoingy',true)
	doTweenAlpha('pp', 'pointydoingy', 0, 0.01, 'linear')
	scaleObject('pointydoingy', 0.05, 0.05);
	
end

function onCreatePost()
	if getProperty('cpuControlled') == true then -- if ghost tapping is off
		botplay = 1
	end
setProperty('showRating', true)
setProperty('showComboNum', false)
end

function onCustomSubstateUpdate(name)
AndroidPadUpdate()
	if resume == true then -- pointer y coords
		setProperty('pointydoingy.y', 320) -- resume
	elseif restart == true then
		setProperty('pointydoingy.y', 355) -- restart
	elseif exit == true then
		setProperty('pointydoingy.y', 390) -- exit
	end
	if tinocoPaused == false then -- if not paused
			playSound('tea-time', 0, 'pausesong') -- play pause song
			soundFadeIn('pausesong', 1, 0, 0.7) -- fade in song
			runTimer('loopmusic', 85.523, 0) -- loop music
			tinocoPaused = true -- it's paused now
			resume = true -- options
	restart = false
	exit = false
		
		else
		if androidPadJustPress("a") then
		if resume == true then -- if paused
			if botplay == 0 then -- if you have botplay off then
				setProperty('cpuControlled', false) -- botplay off
			end -- else (if botplay is on) then it stays on
			setProperty('vocals.volume', 1) -- unmute vocals
			stopSound('pausesong') -- stop pause music
			cancelTimer('loopmusic') -- cancel loop music timer thing
			tinocoPaused = false -- unpause
			resume = false
			restart = false
			exit = false
			removeAndroidPad()
			closeCustomSubstate()
			setProperty('bg.visible', false) -- bg gone
			doTweenX('left', 'left', -1000, tweentime, 'circin') -- bye bye left img
		doTweenX('right', 'right', 1200, tweentime, 'circin') -- adios right img
		doTweenX('right2', 'right2', 1200, tweentime, 'circin') -- adios right img
		doTweenAlpha('lefta', 'left', 0, 0.1, 'circin') -- alpha anim
		doTweenAlpha('rigbht2a', 'right2', 0, 0.1, 'circin')
		doTweenAlpha('righta', 'right', 0, 0.1, 'circin')
		doTweenAlpha('tween3', 'h2', 0, 0.1, 'circin')
		doTweenAlpha('tween3', 'h2', 0, 0.1, 'circin')
		doTweenAlpha('tween4', 'h3', 0, 0.1, 'circin')
		doTweenAlpha('tween5', 'h4', 0, 0.1, 'circin')
		doTweenAlpha('boz', 'box', 0, 0.1, 'circin')
		doTweenAlpha('tween7', 'pointydoingy', 0, 0.1, 'circin')
		elseif restart == true then -- restart
			restartSong(false);
		elseif exit == true then -- exit
			exitSong(false);
		end
		end
	
	if androidPadJustPress("up") then -- selection
		if resume == true then
			resume = false
			restart = false
			exit = true
		elseif exit == true then
			resume = false
			restart = true
			exit = false
		elseif restart == true then
			resume = true
			restart = false
			exit = false
		end
	end
	if androidPadJustPress("down") then
		if resume == true then
			resume = false
			restart = true
			exit = false
		elseif restart == true then
			resume = false
			restart = false
			exit = true
		elseif exit == true then
			resume = true
			restart = false
			exit = false
		end
	end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'loopmusic' then
		playSound('tea-time', 0.7, 'pausesong') -- loop song
	end
end