function onCreatePost()
	makeLuaSprite('blackbg', '', 0, 0)
	setScrollFactor('blackbg', 0, 0)
	makeGraphic('blackbg', 3840, 2160, '000000')
	addLuaSprite('blackbg', false)
	setProperty('blackbg.alpha', 0)
	setProperty('gf.alpha', 1)
	screenCenter('blackbg', 'xy')
end

function onEvent(n, v1, v2)
	if n == 'badapplelol2' and string.lower(v1) == 'a' then
		doTweenAlpha('applebadxd69', 'blackbg', 0.75, v2, 'linear')
		doTweenAlpha('badapplexd2', 'gf', 0.25, v2, 'linear')
	end
	if n == 'badapplelol2' and string.lower(v1) == 'b' then
		doTweenAlpha('applebadxd', 'blackbg', 0, v2, 'linear')
		doTweenAlpha('badapplexd5', 'gf', 1, v2, 'linear')
	end
end