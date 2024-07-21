function onCreate()
	-- background shit

	makeLuaSprite('meme new', 'meme new', -400, -580);
	scaleObject('meme new', 1.1, 1.1);
                addLuaSprite('meme new',false)

	   makeAnimatedLuaSprite('watcher','watcher',-100,180)
    scaleObject('watcher', 2, 2);
    addAnimationByPrefix('watcher','watcher','watcher',24,true)
  addLuaSprite('watcher',true)

	makeLuaSprite('chee', 'chee', -400, -580);
	setLuaSpriteScrollFactor('chee', 1.1, 1.1);
	scaleObject('chee', 1.1, 1.1);
                addLuaSprite('chee',true)

end