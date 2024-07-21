local makeIt = false
local madeCred = false
local scaleBg = {0.35, 0.45}

local removeHypens = false -- get rid of hypens from the song name | This is ONLY for the song name that shows on the bar
    local captialization = false -- Captialize the first letter from the song name | No real need if you don't use remove hypen

local allUpper = false -- Song name is being shouted at you (All caps)
local showCredit = true -- Shows the "Made By" thing

-- Easier to set colors --
local songTxtColor = 'ffffff'
local nowPlaynColor = 'ffffff'
local credColor = 'ffffff'

local moveOutTime = 3.7 -- How long should it last
local BGimage = "songBG"

function onCreate()
    -- fuck it
    if songName=="faded" or songName=="black-humor" then BGimage="songBG14"
    elseif songName=="bloodN_cartoon" then BGimage="songBG18"
    elseif songName=="blue" or songName=="tragical-comedy" then BGimage="songBG13"
    elseif songName=="hydrophobia" then BGimage="songBG11"
    elseif songName=="Chainsaw-Maniac" then BGimage="songBG20"
    elseif songName=="come-for-revenge" or songName=="reburning" then BGimage="songBG5"
    elseif songName=="desire-or-despair" then BGimage="songBG9"
    elseif songName=="funny-cartoon-old" then BGimage="songBG17"
    elseif songName=="jam" then BGimage="songBG10"
    elseif songName=="Kaboom" then BGimage="songBG4"
    elseif songName=="mucho-mouse" then BGimage="songBG6"
    elseif songName=="none-of-all" then BGimage="songBG15"
    elseif songName=="frozen-bell" then BGimage="songBG21"
    elseif songName=="paralyzed" then BGimage="songBG22"
    elseif songName=="Splatter" then BGimage="songBG19"
    elseif songName=="steep-slopes" then BGimage="songBG16"
    elseif songName=="triple-trouble" then BGimage="songBG7"
    elseif songName=="shattered" then BGimage="songBG12"
    elseif songName=="funny-cartoon" or songName=="unstoppable-block" or songName=="Cats Carnival" then BGimage="songBG8"
    elseif songName=="recurrence" then BGimage="songBG24"
    elseif songName=="faded" then BGimage="songBG23"
    elseif songName=="Evaporate" or songName=="hfs-old" or songName=="house-for-sale" or songName=="Sirokou" or songName=="vanishing-old" then BGimage="songBG"
    elseif songName=="meme-mania-old" or songName=="Meme Mania" then BGimage="songBG2"
    elseif songName=="Invade" or songName=="invade-old" then BGimage="songBG3"
    end
    count = string.len(songName)
    toughness = string.upper(difficultyName) -- it was this easy
    toughnessSmal = shrank(difficultyName)   -- smh -_-

    noHypens = fuckHypens(songName)
    properSongName = captialIt(noHypens) -- only for no hypens

    useName = ''

    if removeHypens == true and captialization == true then -- questionable | Is there a better way to do this?
        useName = properSongName
    elseif removeHypens == true then
        useName = noHypens
    elseif allUpper == true then
        useName = string.upper(songName)
    else
        useName = songName
    end

    if showCredit == false then
        scaleBg[2] = 0.2
    end
    if checkFileExists('credits/'..noHypens..'.txt') then
    name = '' .. getTextFromFile('credits/'..noHypens..'.txt') -- This fixes the need to guess whether the song name has hypens or not for the credits | Not perfect though

   

    --debugPrint(count)
    
    -- literally wont let the text thing pop up is there's nothing there or it can't find the file??? Weird

    -- make a folder called credits, then put a text file in there 
    -- with the song name and the person's or composer's name IN the text file

	makeLuaSprite('bgThing', BGimage, -550, 410)
    scaleObject('bgThing', scaleBg[1], scaleBg[2])
	setObjectCamera('bgThing', 'other')
    addLuaSprite('bgThing', true)
    setScrollFactor('bgThing', 0, 0)
    setProperty('bgThing.alpha', tonumber(1))

    if count < 15 then
        makeLuaText('songText', "".. useName.. " - ".. toughness, 400, getProperty('bgThing.x') + 180, 500) -- 30 letters is the width limit
        setObjectCamera("songText", 'other');
        setTextColor('songText', '0x'..songTxtColor)
        setTextSize('songText', 40);
        addLuaText("songText",true);
        setTextFont('songText', "vcr.ttf")
        setTextAlignment('songText', 'left')
    else
        makeIt = true
        makeLuaText('songText', "".. useName, 200, getProperty('bgThing.x') + 180, 520) -- Too big song name
        setObjectCamera("songText", 'other');
        setTextColor('songText', '0x'..songTxtColor)
        setTextSize('songText', 36);
        addLuaText("songText",true);
        setTextFont('songText', "vcr.ttf")
        setTextAlignment('songText', 'left')
    end
    
    makeLuaText('beforeSongText', "Now Playing... ", 500, getProperty('bgThing.x') + 100 - 40, 440)
    setObjectCamera("beforeSongText", 'other');
    setTextColor('beforeSongText', '0x'..nowPlaynColor)
    setTextSize('beforeSongText', 40);
    addLuaText("beforeSongText",true);
    setTextFont('beforeSongText', "vcr.ttf")
    setTextAlignment('beforeSongText', 'left')

    if showCredit == true then
        makeLuaText('whoDuntIt', "Made by - ".. name, 400, getProperty('bgThing.x') + 180, 610)
        setObjectCamera("whoDuntIt", 'other');
        setTextColor('whoDuntIt', '0x'..credColor)
        setTextSize('whoDuntIt', 40);
        addLuaText("whoDuntIt",true);
        setTextFont('whoDuntIt', "vcr.ttf")
        setTextAlignment('whoDuntIt', 'left')
        setObjectOrder('whoDunIt', 3)
        madeCred = true
    end


    setObjectOrder('beforeSongText', 3)
    setObjectOrder('songText', 3)
    setObjectOrder('bgThing', 2)
    end
end

-- still might need the ol' fuckin with if you got a big ass name, but should be better
local countIt = false
local startedIt = false
function onCreatePost()
    if getProperty('inCutscene') == false then
        doTweenX('bgThingMoveIn', 'bgThing', -50, 0.6, 'circout')
        doTweenX('bgThingText', 'songText', 50, 0.6, 'circout') 
        doTweenX('bgThingTextBleb', 'beforeSongText', 20, 0.6, 'circout')

        if madeCred == true then
            doTweenX('bgThingCredit', 'whoDuntIt', 70, 0.6, 'circout')
        end
        if makeIt == true then
            doTweenX('bgThingOptTextIn', 'optionalText', 350, 0.6, 'circout')
        end

        runTimer('moveOut', moveOutTime + (stepCrochet * 0.004), 1)
    else
        countIt = true -- move it to countdown
    end
end

function onStartCountdown(count)
    if countIt == true and startedIt == false then
        startedIt = true
        doTweenX('bgThingMoveInL8', 'bgThing', -50, 0.1, 'circin')
        doTweenX('bgThingTextL8', 'songText', 50, 0.1, 'circin') 
        doTweenX('bgThingTextBlebL8', 'beforeSongText', 20, 0.1, 'circin')
        
        if madeCred == true then
            doTweenX('bgThingCreditL8', 'whoDuntIt', 70, 0.1, 'circin')
        end
        if makeIt == true then
            doTweenX('bgThingOptTextInL8', 'optionalText', 350, 0.1, 'circin')
        end

        runTimer('moveOut', moveOutTime + (stepCrochet * 0.004), 1)
    end 
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'moveOut' then
        doTweenX('bgThingLeave', 'bgThing', -10000, 2.5, 'linear')
        doTweenX('bgThingLeaveText', 'songText', -10000, 2.5, 'linear')
        doTweenX('bgThingLeavePreText', 'beforeSongText', -10000, 2.5, 'linear')

        if madeCred == true then
            doTweenX('bgThingLeaveCredit', 'whoDuntIt', -10000, 2.5, 'linear')
        end
        if makeIt == true then
            doTweenX('bgThingOptTextBye', 'optionalText', -10000, 2.5, 'linear') -- long ass name
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'bgThingLeave' then
        removeLuaSprite('whoDuntIt', true)
        removeLuaSprite('bgThing', true)
        removeLuaText('songText', true)
        removeLuaText('optionalText', true)
        removeLuaText('beforeSongText', true)
    end
end


function shrank(diff)
    diff = string.upper(diff)

    if diff == 'HARD' then
        return 'HARD'
    elseif diff == 'NORMAL' then
        return 'NRML'
    elseif diff == 'EASY' then
        return 'EASY'
    else
        return diff -- cause unique difficulty names 'n all that jazz
    end
end

function captialIt(song)
    cool = string.lower(song)
    return (cool:gsub("^%l", string.upper))
end

function fuckHypens(song)
    return (song:gsub("%-", " "))
end