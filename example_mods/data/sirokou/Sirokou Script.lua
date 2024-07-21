function onCreate()
	setProperty('gfGroup.visible',false)
	setProperty('boyfriendGroup.visible',false)
	setProperty('dadGroup.visible',false)
--screen
	makeLuaSprite('blackscreen', 'blackscreen', 0, -200)
	makeGraphic('blackscreen', 1920, 1280, '000000')
	setObjectCamera('blackscreen', 'HUD')
	addLuaSprite('blackscreen', false)
--add
	addCharacterToList(mouse-angry,'dad')
	addCharacterToList(bf,'bf')
end

function onStepHit()
	if curStep == 1 then
	doTweenAlpha('GUItween', 'camHUD', 0, 0.00000000001, 'linear');
	setProperty('boyfriendGroup.visible',true)
	setProperty('dadGroup.visible',true)
	setProperty('gfGroup.visible',true)
	doTweenAlpha('blackscreencum', 'blackscreen', 0, 4, 'linear')
	removeLuaSprite('none',false)
--bg cum
	makeLuaSprite('basement', 'basement', -800, -450);
	scaleObject('basement', 1.1, 1.1);
	addLuaSprite('basement',false)
end
	if curStep == 120 then
	doTweenAlpha('GUItween', 'camHUD', 1, 0.5, 'linear');
end
	if curStep == 496 then
	doTweenAlpha('GUItween', 'camHUD', 0, 0.00000000001, 'linear');
	setProperty('gfGroup.visible',false)
	setProperty('boyfriendGroup.visible',false)
	setProperty('dadGroup.visible',false)
	makeLuaSprite('none', 'none', -800, -450);
	scaleObject('none', 1.1, 1.1);
	addLuaSprite('none',false)

	removeLuaSprite('basement',false)
end
	if curStep == 512 then
	doTweenAlpha('GUItween', 'camHUD', 1, 0.5, 'linear');
	setProperty('boyfriendGroup.visible',true)
	setProperty('dadGroup.visible',true)
	setProperty('gfGroup.visible',true)
	removeLuaSprite('none',false)
	makeLuaSprite('basementdark', 'basementdark', -800, -450);
	scaleObject('basementdark', 1.1, 1.1);
	addLuaSprite('basementdark',false)

end
	if curStep == 800 then
	removeLuaSprite('basement',false)
	makeLuaSprite('basementred', 'basementred', -800, -450);
	scaleObject('basementred', 1.1, 1.1);
	addLuaSprite('basementred',false)
end
	if curStep == 1312 then
	removeLuaSprite('basementred',false)
	makeLuaSprite('basementdark', 'basementdark', -800, -450);
	scaleObject('basementdark', 1.1, 1.1);
	addLuaSprite('basementdark',false)

end
	if curStep == 1432 then
	doTweenAlpha('GUItween', 'camHUD', 1, 0.5, 'linear');
end
	if curStep == 1568 then
	removeLuaSprite('basementdark',false)
	makeLuaSprite('basement', 'basement', -800, -450);
	scaleObject('basement', 1.1, 1.1);
	addLuaSprite('basement',false)
end
	if curStep == 1760 then
	removeLuaSprite('basement',false)
	setProperty('gfGroup.visible',false)
	setProperty('dadGroup.visible',false)
end
	if curStep == 1824 then
	setProperty('dadGroup.visible',true)
end
	if curStep == 1840 then
	setProperty('gfGroup.visible',true)
	makeLuaSprite('basementlight', 'basementlight', -800, -450);
	scaleObject('basementlight', 1.1, 1.1);
	addLuaSprite('basementlight',false)
	noteTweenX('oppo0', 0, -1000, 1.5, 'quartInOut')
	noteTweenX('oppo1', 1, -1000, 1.5, 'quartInOut')
	noteTweenX('oppo2', 2, -1000, 1.5, 'quartInOut')
	noteTweenX('oppo3', 3, -1000, 1.5, 'quartInOut')
	noteTweenAngle('opporotate0', 0, 360, 1, 'quartInOut')
	noteTweenAngle('opporotate1', 1, 360, 1, 'quartInOut')
	noteTweenAngle('opporotate2', 2, 360, 1, 'quartInOut')
	noteTweenAngle('opporotate3', 3, 360, 1, 'quartInOut')
	noteTweenX('play0', 4, 415, 1, 'quartInOut')
	noteTweenX('play1', 5, 525, 1, 'quartInOut')
	noteTweenX('play2', 6, 635, 1, 'quartInOut')
	noteTweenX('play3', 7, 745, 1, 'quartInOut')
	noteTweenAngle('playrotate0', 4, 360, 1, 'quartInOut')
	noteTweenAngle('playrotate1', 5, 360, 1, 'quartInOut')
	noteTweenAngle('playrotate2', 6, 360, 1, 'quartInOut')
	noteTweenAngle('playrotate3', 7, 360, 1, 'quartInOut')
end
	if curStep == 2088 then
	removeLuaSprite('basementlight',false)
	makeLuaSprite('basementdark', 'basementdark', -800, -450);
	scaleObject('basementdark', 1.1, 1.1);
	addLuaSprite('basementdark',false)
end
	if curStep == 2352 then
	removeLuaSprite('basementdark',false)
	makeLuaSprite('basementred', 'basementred', -800, -450);
	scaleObject('basementred', 1.1, 1.1);
	addLuaSprite('basementred',false)
end
	if curStep == 2865 then
	removeLuaSprite('basementred',true)
	makeLuaSprite('basementdark', 'basementdark', -800, -450);
	scaleObject('basementdark', 1.1, 1.1);
	addLuaSprite('basementdark',false)

	doTweenAlpha('GUItween', 'camHUD', 0, 5, 'linear');
end
end

function onBeatHit( )
if curBeat == 716 then
doTweenAlpha('1','boyfriend',0,0.5,'linear')
doTweenAlpha('2','gf',0,0.5,'linear')
doTweenAlpha('3','dad',0,0.5,'linear')
doTweenAlpha('4','basementdark',0,0.5,'linear')
end
end