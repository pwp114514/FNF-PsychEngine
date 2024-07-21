--[[
	
	Legit stage change script
	
	Original by soushi0210#4026
	Cleaned up by InvertZ#0306
	
]]--

local jsonText = nil
local jsonSplited = nil
local jsonSplitedPost = nil

function makeLuaStage(stage, removedStage)
	removeLuaScript('stages/' .. removedStage)
	addLuaScript('stages/' .. stage)
	runHaxeCode('game.setOnLuas("curStage", "' .. stage .. '")')
		
	jsonText = getTextFromFile('stages/' .. stage .. '.json')
		
	jsonSplitedPost = split(jsonText,"{")
	jsonSplited = jsonSplitedPost[1]
		
	jsonSplitedPost = split(jsonSplited,"}")
	jsonSplited = jsonSplitedPost[1]
		
	jsonSplitedPost = split(jsonSplited,"\n")
	table.remove(jsonSplitedPost, 1)
		
	jsonSplited = jsonSplitedPost
	
	configPositions()
end

function configPositions()
	local bfposPost = split(jsonSplited[5],'"boyfriend" :')
	table.remove(bfposPost, 1)
		
	local bfposX = split(bfposPost[1],'],')
	local bfposY = split(bfposPost[2],'],')
		
	local bfposYPost = split(bfposY[1],'[')
	bfposY = split(bfposYPost[1],'[')

	local bfposXPost = split(bfposX[1],'[')
	bfposX = split(bfposXPost[1],'[')
		
	setProperty('boyfriend.positionArray', {bfposX[1], bfposY[1] + 250})
	
	local dadposPost = split(jsonSplited[5],'"opponent" :')
	table.remove(dadposPost, 1)
		
	local dadposX = split(dadposPost[1],'],')
	local dadposY = split(dadposPost[2],'],')
		
	local dadposYPost = split(dadposY[1],'[')
	dadposY = split(dadposYPost[1],'[')

	local dadposXPost = split(dadposX[1],'[')
	dadposX = split(dadposXPost[1],'[')
		
	setProperty('dad.positionArray', {dadposX[1], dadposY[1] + 250})

	--remove "girlfriend": [ (and make pos table)
	local gfposPost = split(jsonSplited[5],'"girlfriend" :')
	table.remove(gfposPost, 1)
		
	local gfposX = split(gfposPost[1],'],')
	local gfposY = split(gfposPost[2],'],')
		
	local gfposYPost = split(gfposY[1],'[')
	gfposY = split(gfposYPost[1],'[')

	local gfposXPost = split(gfposX[1],'[')
	gfposX = split(gfposXPost[1],'[')
		
	setProperty('gf.positionArray', {gfposX[1], gfposY[1] + 250})
end

function onEvent(name, value1, value2)
	if name == "change_stage" then
		makeLuaStage(value1, value2) -- value1: new stage, value2: stage to remove
	end
end

-- cleaned up this function a little bit
function split(str, ts)
	if ts == nil then return {} end
	
	local t = {}; i=1
	
	for s in string.gmatch(str, "([^"..ts.."]+)") do
		t[i] = s
		i = i + 1
	end
  
	return t
end