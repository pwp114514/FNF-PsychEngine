local quantity = 200
function onCreate()
for i = 1,quantity do
snow(i,true)
end
end

function onUpdate()
for i = 1,quantity do
setProperty('s'..i..".x", getProperty('s'..i..".x")+getRandomFloat(-1,10)*(getProperty('s'..i..".scale.x")+0.2))
setProperty('s'..i..".y", getProperty('s'..i..".y")+getRandomFloat(3,9)*(getProperty('s'..i..".scale.y")+0.2))
setProperty('s'..i..".offset.x", getProperty('camGame.scroll.x'))
setProperty('s'..i..".offset.y", getProperty('camGame.scroll.y'))
if getProperty('s'..i..".y") >= 1000 then
snow(i,false)
end
end
end

function snow(i,ff)
scale=getRandomFloat(0.05,0.4)

makeLuaSprite('s'..i,'snowflake',getRandomFloat(-400,1280), -30);
scaleObject('s'..i, scale+0.15, scale+0.4)
setObjectCamera('s'..i, 'hud')
setProperty('s'..i..".antialiasing", false)
setProperty('s'..i..".alpha", scale*1.8)
if scale*1.8 < 0.5 then addLuaSprite('s'..i,false); else addLuaSprite('s'..i,true); end
if ff then
setProperty('s'..i..".y", getRandomFloat(0,900))
end
end