function onEvent(n,v1,v2)


	if n == 'Black flash' then

	   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'000000')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
              setObjectCamera('flash', 'other')
		doTweenAlpha('flTw','flash',0,v1,'linear')
	end



end