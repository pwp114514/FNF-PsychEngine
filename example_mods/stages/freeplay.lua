function onCreate()

	makeLuaSprite('back', 'freeplay/backBG', -50, 0)
	addLuaSprite('back')
        scaleObject('back',1.1,1.1)
	setScrollFactor('back', 1, 1);

	makeLuaSprite('arrow', 'freeplay/arrows', -600, 0)
	addLuaSprite('arrow')
	setScrollFactor('arrow', 1, 1);

	makeLuaSprite('info', 'freeplay/infoBar', -600, 30)
	addLuaSprite('info')
	setScrollFactor('info', 1, 1);

	makeLuaSprite('info2', 'freeplay/infoDifficulty', -600, 30)
	addLuaSprite('info2')
	setScrollFactor('info2', 1, 1);
end

function onCreatePost()
	setProperty('timeTxt.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setProperty('scoreTxt.visible', false)
	setProperty('boyfriend.visible', false)
	setProperty('gf.visible', false)
	setProperty('dad.visible', false)
	setProperty('camHUD.visible', false)
end

function onUpdate()
triggerEvent('Camera Follow Pos',640,360);
end


