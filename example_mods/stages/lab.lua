function onCreate()
	-- background shit

	makeLuaSprite('lab', 'lab', -400, -580);
	setLuaSpriteScrollFactor('lab', 1, 1);
	scaleObject('lab', 1.1, 1.1);
  addLuaSprite('lab',false)

  makeAnimatedLuaSprite('Scientist','Scientist',-400,0)
  scaleObject('Scientist', 1.5, 1.5);
  addAnimationByPrefix('Scientist','Scientist','idle',15,true)
  addLuaSprite('Scientist',true)     
  setObjectOrder('Scientist', getObjectOrder('dadGroup'))           

  makeAnimatedLuaSprite('CUpheqdshidA','CUpheqdshidA',-400,-200)
  scaleObject('CUpheqdshidA', 2, 2);
  addAnimationByPrefix('CUpheqdshidA','CUpheqdshid','CUpheqdshid',24,true)
  addLuaSprite('CUpheqdshidA',true)
  

end