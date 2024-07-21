function onCreate( )
     makeLuaSprite('black', '', -300, -100);
        makeGraphic('black',3000,1030,'000000')
         addLuaSprite('black',true)
          setLuaSpriteScrollFactor('black',0,0)
makeAnimatedLuaSprite('1','characters/gf-alt',450,200)
scaleObject('1', 1, 1)
addLuaSprite('1',false)
function onStepHit( )
if curStep > 0 then
addAnimationByPrefix('1','characters/gf-alt','Idle',24,true)
end
end
end


function onSongStart( )
doTweenAlpha('6','black', 0 ,3 ,'linear');

end

function onBeatHit( )
if curBeat == 260 then
setProperty('WBBG2.alpha',0)

function onBeatHit( )

if curBeat == 324 then
setProperty('WBBG2.alpha',1)

end
end
end

function onStepHit( )
if curStep == 2064 then
setProperty('WBBG2.alpha',0)
end
end
end