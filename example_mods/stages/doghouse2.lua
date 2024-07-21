function onCreate()
	-- background shit

	makeLuaSprite('doghouse', 'doghouse', -400, -580);
	setLuaSpriteScrollFactor('doghouse', 1.1, 1.1);
	scaleObject('doghouse', 1.1, 1.1);
                addLuaSprite('doghouse',false)

	makeLuaSprite('tree', 'tree', -400, -580);
	setLuaSpriteScrollFactor('tree', 1.1, 1.1);
	scaleObject('tree', 1.1, 1.1);
                addLuaSprite('tree',true)
end