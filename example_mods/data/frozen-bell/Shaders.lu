function onCreate()
    if shadersEnabled then

    shaderCoordFix() -- initialize a fix for textureCoord when resizing game window
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {

            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end

function onCreatePost()

    --initLuaShader("bloom") --add shaders to character or sprites
    --setSpriteShader("boyfriend", "bloom")  --add shaders to character or sprites

    --setShaderFloat("shader1", "time", os.clock())
    --setShaderFloatArray("shader1", "fixedSize", {1280, 720})

    --luaDebugMode = true  

    initLuaShader("snow")


    makeLuaSprite("shader1")
    makeGraphic("shader1", screenWidth, screenHeight)
    makeLuaSprite("shader2")
    makeGraphic("shader2", screenWidth, screenHeight)


    setSpriteShader("shader1", "snow")


    addHaxeLibrary("ShaderFilter", "openfl.filters")

    runHaxeCode([[

        trace(ShaderFilter);

        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shader1").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shader1").shader)]);
        
    ]])

end

function onUpdate(elapsed)
    setShaderFloat("shader1", "iTime", os.clock())
    setShaderFloat("shader2", "iTime", os.clock())
end