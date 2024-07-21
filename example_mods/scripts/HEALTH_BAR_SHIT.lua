function onCreate()
	
makeLuaSprite('uglyHB', 'Newhealthbar', 0, 0)
	setObjectCamera('uglyHB', 'hud')
	
setScrollFactor('uglyHB', 0.9, 0.9)
	
	
addLuaSprite('uglyHB', true)

end


function onCreatePost()
	--Fucker's Healthbar

    
setProperty('uglyHB.x', getProperty('healthBar.x') - 17)
setProperty('uglyHB.angle', getProperty('healthBar.angle'))
setProperty('uglyHB.y', getProperty('healthBar.y') - 17)
setProperty('uglyHB.scale.x', getProperty('healthBar.scale.x'))
setProperty('uglyHB.alpha', getProperty('healthBar.alpha'))
setProperty('uglyHB.scale.y', getProperty('healthBar.scale.y'))
    
setObjectOrder('uglyHB', getObjectOrder('healthBar'))
end
function onUpdate()
setProperty('uglyHB.alpha', getProperty('healthBar.alpha'))
end

