function onCreate()
	-- background shit

	makeLuaSprite('blue2', 'blue2', -500, -10);
	setLuaSpriteScrollFactor('blue2', 1, 1);
	scaleObject('blue2', 1, 1);
                addLuaSprite('blue2',false)

    makeAnimatedLuaSprite('NewRAINLayer01','NewRAINLayer01',-400,-200)
    scaleObject('NewRAINLayer01', 2.5, 2.5);
    addAnimationByPrefix('NewRAINLayer01','RainFirstlayer instance','RainFirstlayer instance',24,true)
  addLuaSprite('NewRAINLayer01',true)

  	   makeAnimatedLuaSprite('bg','memorybg',60,200)
    scaleObject('bg', 0.6, 0.6);
    addAnimationByPrefix('bg','bg','bg',24,true)
  addLuaSprite('bg',false)
  setProperty('bg.visible',false)

end

function onStepHit()				
	if curStep == 512 then
		setProperty('bg.visible',true)
		setProperty('boyfriendGroup.visible',false)
		if curStep % 2 == 0 then
			objectPlayAnimation('bg', 'bg');
	    end
	end
	if curStep == 768 then
		setProperty('bg.visible',false)
		setProperty('boyfriendGroup.visible',true)
		removeLuaSprite('bg',true)
	end
end