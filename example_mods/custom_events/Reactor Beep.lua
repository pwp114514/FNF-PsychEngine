local frequency = 4
local beatPercent = 4
local enabled = false
local redCreated = false
local curColor = 'FF0000'
local target = 0.3
local speed = 0.3
function createRedBeep(layer)
    makeLuaSprite('reactorLol',nil,0,0)
    makeGraphic('reactorLol',screenWidth,screenHeight,'FF0000')
    setProperty('reactorLol.alpha',0.01)
    if layer == 'game' then
        setObjectCamera('reactorLol','hud')
        addLuaSprite('reactorLol',false)
    else
        setObjectCamera('reactorLol',layer)
        addLuaSprite('reactorLol',true)
    end
    addLuaSprite('reactorLol',true)
    redCreated = true
end
function onEvent(name,v1,v2)
    if name == 'Reactor Beep' then
        local color = "FF00000"
        local layer = 'hud'
        if not enabled then
            target = 0.3
            speed = 0.3
            beatPercent = 0
            frequency = 0
            curColor = color
        end
        if v1 ~= '' then
            local commaStartV1 = 0
            local commaEndV1 = 0
            commaStartV1,commaEndV1 = string.find(v1,',',0,true)
            if commaStartV1 ~= nil then
                target = string.sub(v1,0,commaStartV1 - 1)
                local commaStart2V1 = 0
                local commaEnd2V1 = 0
                commaStart2V1,commaEnd2V1 = string.find(v1,',',commaEndV1 + 1,true)
                if commaStart2V1 ~= nil then
                    layer = string.sub(v1,commaStartV1 + 1,commaStart2V1 - 1)
                    color = string.sub(v1,commaEnd2V1 + 1)
                else
                    layer = string.sub(v1,commaStartV1 + 1)
                end
            else
                target = tonumber(v1)
            end
        end
        if v2 ~= '' then
            local commaStartV2 = 0
            local commaEndV2 = 0
            local commaStart2V2 = 0
            local commaEnd2V2 = 0
            commaStartV2,commaEndV2 = string.find(v2,',',0,true)
            if commaStartV2 ~= nil then
                commaStart2V2,commaEnd2V2 = string.find(v2,',',commaStartV2 + 1,true)
                speed = string.sub(v2,0,commaStartV2 - 1)
                if commaEnd2V2 == nil then
                    beatPercent = tonumber(string.sub(v2,commaEndV2 + 1))
                    frequency = 0
                else
                    frequency = tonumber(string.sub(v2,commaStartV2 + 1,commaStart2V2 - 1))
                    beatPercent = tonumber(string.sub(v2,commaEnd2V2 + 1))
                end
            else
                speed = v2
            end
        end
        if target ~= 0 and target ~= nil then
            if color ~= curColor then
                makeGraphic('reactorLol',screenWidth,screenHeight,'FF0000')
            end
            reactor(target,speed,layer)
            if not enabled then
                enabled = true
            end
        else
            enabled = false
        end
        if frequency == beatPercent then
            frequency = 0
        end
    end
end
function reactor(alpha,tweenSpeed,layer)
    if not redCreated then
        createRedBeep(layer)
    end
    setProperty('reactorLol.alpha',alpha)
    doTweenAlpha('reactorAlpha','reactorLol',0,tweenSpeed,'linear')
end
function onTweenCompleted(tag)
    if tag == 'reactorAlpha' and not enabled then
        removeLuaSprite('reactorLol',true)
        redCreated = false
    end
end
function onStepHit()
    if enabled and beatPercent ~= 0 then
        if (curStep/4) % beatPercent == frequency then
            reactor(target,speed)
        end
    end
end