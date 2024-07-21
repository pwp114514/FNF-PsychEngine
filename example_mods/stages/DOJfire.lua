function onCreate()
	-- background shit

    makeAnimatedLuaSprite('fire','fire',-400,-200)
    scaleObject('fire', 1, 1);
    addAnimationByPrefix('fire','fire','fire',24,true)
    addLuaSprite('fire',false)

end