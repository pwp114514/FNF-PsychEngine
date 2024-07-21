snow = 0

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'snow' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'snow');

				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); 
		end
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'snow' then
	    snow = snow + 1
		runTimer('snowcount', 2);
	end
end

function onUpdate()
	if snow == 1 then
		makeLuaSprite('snow1', 'cold/snow', 0, 0);
		setObjectCamera('snow1', 'other');
		scaleLuaSprite('snow1', 1.2, 1.2);
		setProperty('snow1.alpha', 1);
		addLuaSprite('snow1', true);

	elseif snow == 2 then
	    makeLuaSprite('snow2', 'cold/snow2', 0, 0);
		setObjectCamera('snow2', 'other');
		scaleLuaSprite('snow2', 1.2, 1.2);
		setProperty('snow2.alpha', 1);
		addLuaSprite('snow', true);

	elseif snow == 3 then
	    makeLuaSprite('snow3', 'cold/snow3', 0, 0);
		setObjectCamera('snow3', 'other');
		scaleLuaSprite('snow3', 1.2, 1.2);
		setProperty('snow3.alpha', 1);
		addLuaSprite('snow3', true);

end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'snowcount' then
		snow = 0
		doTweenAlpha('1', 'snow1', 0, 0.5, 'linear');
		doTweenAlpha('2', 'snow2', 0, 0.5, 'linear');
		doTweenAlpha('3', 'snow3', 0, 0.5, 'linear');
	end
end