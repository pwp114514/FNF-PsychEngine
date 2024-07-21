function onCreate( )
     makeLuaSprite('black', '', -300, -200);
        makeGraphic('black',3000,1030,'000000')
         addLuaSprite('black',true)
          setLuaSpriteScrollFactor('black',0,0)
end

function onSongStart( )
doTweenAlpha('6','black', 0 ,13 ,'linear');

end


function onBeatHit( )
      if curBeat == 224 then
      doTweenAlpha('1','dad', 0 ,13 ,'linear');
      doTweenAlpha('2','boyfriend', 0 ,13 ,'linear');
       doTweenAlpha('3','gf', 0 ,13 ,'linear');
       doTweenAlpha('4','WBBG', 0 ,13 ,'linear');
      doTweenAlpha('5','WBBG2', 0 ,13 ,'linear');
 end
 end
  