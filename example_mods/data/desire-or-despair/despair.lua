local currentBarPorcent = 1
local heightBar = 0
function onCreatePost()
    makeLuaSprite('FearBarImage','despairbar',screenWidth - 100,100)
    scaleObject('FearBarImage',1.2,1.1)
    setObjectCamera('FearBarImage','hud')
    addLuaSprite('FearBarImage',true)


    makeLuaSprite('FearBarBg','despairbarBG',getProperty('FearBarImage.x') + 15,getProperty('FearBarImage.y'))
    setObjectCamera('FearBarBg','hud')
    scaleObject('FearBarBg',0.82,1.1)
    addLuaSprite('FearBarBg',false)
    
    makeLuaSprite('FearBarBar','',getProperty('FearBarImage.x') + 15,getProperty('FearBarImage.y'))
    setObjectCamera('FearBarBar','hud')
    makeGraphic('FearBarBar',getProperty('FearBarBg.width')/2,getProperty('FearBarBg.height'),'161824')

    addLuaSprite('FearBarBar',false)
end
function onUpdate()
    if currentBarPorcent == 0 then
        setGraphicSize('FearBarBar',getProperty('FearBarBg.width')/1.8 * getProperty('FearBarBg.scale.x'),0)
    else
        setGraphicSize('FearBarBar',getProperty('FearBarBg.width')/1.8 * getProperty('FearBarBg.scale.x'),math.max(getProperty('FearBarBg.height')/1.132* currentBarPorcent),1)
    end
    setProperty('FearBarBar.x',getProperty('FearBarBg.x') + 21)
    setProperty('FearBarBar.x',getProperty('FearBarBg.x') + 21)
    setProperty('FearBarBar.y',getProperty('FearBarImage.y') + 302 - getProperty('FearBarBar.height'))

    if currentBarPorcent > 1 then
        currentBarPorcent  = 1
    end
    if currentBarPorcent == 0 then
        setProperty('health',getProperty('health') - 1)
    end
    if currentBarPorcent <= 0 then
        currentBarPorcent  = 0
        setGraphicSize('FearBarBar',getProperty('FearBarBg.width')/1.8 * getProperty('FearBarBg.scale.x'),0)
        setProperty('FearBarBar.visible',false)
    else
        setProperty('FearBarBar.visible',true)
    end
end
function opponentNoteHit()

    if currentBarPorcent > 0 then
        currentBarPorcent = currentBarPorcent - 0.0061
    end
end
function goodNoteHit()
    if currentBarPorcent > 0 and currentBarPorcent < 1 then
        currentBarPorcent = currentBarPorcent + 0.0056
    end
end
function noteMiss(id,dir,type,sustain)
    if type == '' then
        if currentBarPorcent > 0 then
            currentBarPorcent = currentBarPorcent - 0.0036
        end
    end
end