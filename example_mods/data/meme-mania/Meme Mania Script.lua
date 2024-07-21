function onCreate()
	setProperty('skipCountdown', true);
--screen
	makeLuaSprite('blackscreen', 'blackscreen', 0, -200)
	makeGraphic('blackscreen', 1920, 1280, '000000')
	setObjectCamera('blackscreen', 'HUD')
	addLuaSprite('blackscreen', false)
--add
	addCharacterToList(MEME-BOI,'dad')
	addCharacterToList(MEME-BOI-old,'dad')
	addCharacterToList(meme-sans,'dad')
end

function onStepHit()
	if curStep == 6 then
	doTweenAlpha('blackscreencum', 'blackscreen', 0, 5, 'linear')
	removeLuaSprite('none',false)
end
	if curStep == 96 then
	doTweenAlpha('GUItween', 'camHUD', 0.25, 0.25, 'linear');
end
	if curStep == 124 then
	doTweenAlpha('GUItween', 'camHUD', 1, 0.25, 'linear');
end
	if curStep == 656 then
	doTweenAlpha('GUItween', 'camHUD', 0.25, 0.25, 'linear');
end
	if curStep == 672 then
	doTweenAlpha('GUItween', 'camHUD', 0, 1, 'linear');
end
	if curStep == 688 then
	doTweenAlpha('GUItween', 'camHUD', 1, 0.5, 'linear');
end
	if curStep == 1072 then
	doTweenAlpha('GUItween', 'camHUD', 0.25, 0.25, 'linear');
end
	if curStep == 1098 then
	doTweenAlpha('GUItween', 'camHUD', 1, 0.75, 'linear');
end
end