local CAMxx = 0.85;
local CAMyy = 0.85;
local xx = 600;
local yy = 620;
local xx2 = 850;
local yy2 = 620;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
end

    else            
if getProperty('girlfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('girlfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('girlfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('girlfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('girlfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
    end
    
end

function onCreate()


    makeAnimatedLuaSprite('1','cold/snowy',-370,-200)
    scaleObject('1', 1.8, 1.5);
    addAnimationByPrefix('1','cold/snowy','snow',20,true)
   addLuaSprite('1',true)

    makeLuaSprite('back', 'freezebg back', -200, 150)
    scaleObject('back', 1.48, 1.48)
    setScrollFactor('back',0.8,1.0)
    addLuaSprite('back',false)

   makeLuaSprite('word', 'cold/cold', 0, 0)
    scaleObject('word', 1, 1)
    setScrollFactor('word',1.0,1.0)
    addLuaSprite('word',true)
setObjectCamera('word', 'other');
setProperty('word.alpha',0)

    makeLuaSprite('front', 'freezebg front', -200, 150)
    scaleObject('front', 1.48, 1.48)
    addLuaSprite('front',false)

	makeLuaSprite('black', '', -1200, -1000)
	setScrollFactor('black', 0, 0)
	makeGraphic('black', 5000, 5000, '000000')
	addLuaSprite('black', false)
	setProperty('black.alpha', 0)

    
end

function onBeatHit( )
if curBeat == 328 then
doTweenAlpha('10','1', 0 ,0.3, 'linear')
   makeLuaSprite('7', 'cold/snow', 0, 0)
    scaleObject('7', 1, 1.6)
    setScrollFactor('7',1.0,1.0)
    addLuaSprite('7',true)
   setObjectCamera('7', 'other');
   setProperty('7.alpha',0)
   doTweenAlpha('8','7', 1, 1,'linear')
end

if curBeat == 342 then
doTweenAlpha('2','word',1,15)

end

if curBeat == 391 then
doTweenAlpha('2', 'word',0,1.5)
doTweenAlpha('8','7', 0, 1,'linear')
end

if curBeat == 396 then
removeLuaSprite('7', true)
end

if curBeat == 116 then
doTweenColor('1', 'dad', '9999FF', 1.2, 'linear')
doTweenAlpha('3', 'black', 1, 1.2, 'linear')
end

if curBeat == 120 then
doTweenColor('1', 'dad', 'FFFFFF', 0.1, 'linear')
removeLuaSprite('black',true)
end
if curBeat == 456 then
doTweenAlpha('10','1', 1, 0.3,'linear')
end
end
function onCreatePost()
    setProperty('defaultCamZoom', CAMyy)
    local size = 0.8
    setProperty('boyfriend.scale.x', size)
    setProperty('boyfriend.scale.y', size)
end