function onCreate()
        --background shit

      makeLuaSprite('sky', 'sky', -700, -110);
	setLuaSpriteScrollFactor('sky', 0.9, 0.9);
	scaleObject('sky', 0.9, 0.9);
                addLuaSprite('sky',false)

        makeLuaSprite('alley light', 'alley light', -700, -110);
	setLuaSpriteScrollFactor('alley light', 0.9, 0.9);
	scaleObject('alley light', 0.9, 0.9);
                addLuaSprite('alley light',false)

        makeLuaSprite('alley BG', 'alley BG', -700, -110);
	setLuaSpriteScrollFactor('alley BG', 0.9, 0.9);
	scaleObject('alley BG', 0.9, 0.9);
                addLuaSprite('alley BG',false)

end