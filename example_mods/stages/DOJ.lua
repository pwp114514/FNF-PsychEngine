function onCreate()
	-- background shit

	makeLuaSprite('wall', 'wall', -500, -200);
	setLuaSpriteScrollFactor('wall', 0.9, 0.9);
	scaleObject('wall', 0.9, 0.9);
                addLuaSprite('wall',false)

	makeLuaSprite('ground', 'ground', -500, -200);
	setLuaSpriteScrollFactor('ground', 0.9, 0.9);
	scaleObject('ground', 0.9, 0.9);
                addLuaSprite('ground',false)

	makeLuaSprite('cheese', 'cheese', -200, -400);
	setLuaSpriteScrollFactor('cheese', 0.9, 0.9);
	scaleObject('cheese', 0.9, 0.9);
                addLuaSprite('cheese',false)

end