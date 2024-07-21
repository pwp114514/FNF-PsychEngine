function onCreate()
    
    makeLuaSprite('bl');
    makeGraphic('bl',screenWidth,screenHeight,'000000')
    setObjectCamera('bl', 'HUD')
    setProperty('bl.scale.x',2)
    setProperty('bl.scale.y',2)
    addLuaSprite('bl', false);
end

function onSongStart()
    doTweenAlpha('blTw','bl',0,0.7,'linear')
end
