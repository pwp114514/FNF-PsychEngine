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


    makeAnimatedLuaSprite('CUpheqdshidA','CUpheqdshidA',-400,-200)
    scaleObject('CUpheqdshidA', 2, 2);
    addAnimationByPrefix('CUpheqdshidA','CUpheqdshid','CUpheqdshid',24,true)
  addLuaSprite('CUpheqdshidA',true)

end