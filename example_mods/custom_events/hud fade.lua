function onEvent(name,value1,value2)
    if name == 'hud fade' then

        if value1 == 'Fade' then
            doTweenAlpha('GUItween', 'camHUD', 0, 0.5, 'linear');
        end
        if value1 == 'FadeBack' then
            doTweenAlpha('GUItween', 'camHUD', 1, 0.5, 'linear');
        end
    end
end