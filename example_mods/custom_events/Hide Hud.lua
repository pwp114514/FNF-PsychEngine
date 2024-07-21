function onEvent(name,value1,value2)
	if name == 'Hide Hud' then
	
		if value1 == '1' then
						doTweenAlpha('GUItween', 'camHUD', 0, 0.01, 'linear'); 
triggerEvent('Screen Shake','0.1, 0.02','0.1, 0.02')
		end
	
		if value1 == '2' then
						doTweenAlpha('GUItween', 'camHUD', 1, 0.01, 'linear');
triggerEvent('Screen Shake','0.1, 0.02','0.1, 0.02')
		end
	end
	end	