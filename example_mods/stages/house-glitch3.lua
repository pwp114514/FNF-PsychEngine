local xx = 400;
local yy = 300;
local xx2 = 1000;
local yy2 = 500;
local ofs = 30;
local angleshit = 1;
local anglevar = 1;
local followchars = true;
function onCreate()
	-- background shit
	makeLuaSprite('place', 'place', -600, -300);
	scaleObject('place', 1, 1);
	addLuaSprite('place', false);

	   makeAnimatedLuaSprite('glitch','glitch',-550,-300)
    scaleObject('glitch', 1, 1);
    addAnimationByPrefix('glitch','glitch','glitch',24,true)
  addLuaSprite('glitch',false)

	   makeAnimatedLuaSprite('glitch2','glitch2',400,200)
    scaleObject('glitch2', 1, 1);
    addAnimationByPrefix('glitch2','glitch2','glitch2',24,true)
  addLuaSprite('glitch2',false)

	   makeAnimatedLuaSprite('glitch3','glitch3',-550,400)
    scaleObject('glitch3', 1, 1);
    addAnimationByPrefix('glitch3','glitch3','glitch3',24,true)
  addLuaSprite('glitch3',false)

	   makeAnimatedLuaSprite('glitch4','glitch4',1150,600)
    scaleObject('glitch4', 1, 1);
    addAnimationByPrefix('glitch4','glitch4','glitch4',24,true)
  addLuaSprite('glitch4',false)

	   makeAnimatedLuaSprite('glitch-mice','glitch-mice',400,200)
    scaleObject('glitch-mice', 0.7, 0.7);
    addAnimationByPrefix('glitch-mice','idle','idle',24,true)
  addLuaSprite('glitch-mice',false)

	   makeAnimatedLuaSprite('glitch dog','glitch dog',750,200)
    scaleObject('glitch dog', 2, 2);
    addAnimationByPrefix('glitch dog','idle','idle',24,true)
  addLuaSprite('glitch dog',true)

end

function onStepHit()
    cameraShake('hud', 0.003, 0.2);
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('pibby','bounce',true)
    end
end

function opponentNoteHit()	
    local luckyRoll = math.random(1, 50)
    local luckyRoll2 = math.random(1, 50)
    
    if mustHitSection == false then
        if (luckyRoll >= 45) then
            cameraShake('hud', 0.08, 0.05);
        end
    end
    if mustHitSection == false then
        if (luckyRoll2 >= 45) then
            cameraShake('game', 0.08, 0.05);
        end
    end
end

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.85)
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
            setProperty('defaultCamZoom',1.05)
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
        triggerEvent('Camera Follow Pos','','')
    end
end