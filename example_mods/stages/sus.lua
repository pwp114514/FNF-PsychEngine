local xx = 400;
local yy = 400;
local xx2 = 400;
local yy2 = 400;
local ofs = 30;


function onCreate()
	-- background shit
	makeLuaSprite('sus bg', 'sus bg', -1300, -550);
	scaleObject('sus bg', 1.3, 1.3);
	addLuaSprite('sus bg', false);
	makeLuaSprite('sus alien', 'sus alien', -1300, -550);
	scaleObject('sus alien', 1.3, 1.3);
	addLuaSprite('sus alien', true);

	   makeAnimatedLuaSprite('meme','meme',-100,-100)
    scaleObject('meme', 1, 1);
    addAnimationByPrefix('meme','meme','meme',24,true)
  addLuaSprite('meme',false)

	   makeAnimatedLuaSprite('light','light',550,-300)
    scaleObject('light', 1.2, 1.2);
    addAnimationByPrefix('light','light','light',24,true)
  addLuaSprite('light',false)

	   makeAnimatedLuaSprite('doj sus','DOJ sus',1100,-200)
    scaleObject('doj sus', 2, 2);
    addAnimationByPrefix('doj sus','DOJ sus','DOJ',24,true)
  addLuaSprite('doj sus',true)

end

function onCreatePost()

if curBeat == 0 then

	   makeAnimatedLuaSprite('mucho','mucho',-3500,-40)
    scaleObject('mucho', 2.3, 2.3);
    addAnimationByPrefix('mucho','mucho','mucho',24,true)
  addLuaSprite('mucho',true)
   doTweenX('mucho','mucho', 10000, 39, 'linear')
characterPlayAnim(crew-jerry, hi, false)


end
end

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.55)
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
            setProperty('defaultCamZoom',0.55)
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

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.3 then
            setProperty('health', health- 0.04);
        end
    end
end