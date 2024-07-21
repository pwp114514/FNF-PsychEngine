local Text = {
   enabled = true, -- Adds the Combo Text
   font = 'UT.ttf', -- Font
   alpha = 1, -- Opacity
   x = 10, -- X of text
   y = 300, -- Y of Text
   Allignment = 'left', -- side
   Size = 30, -- Size of Text
   tweens = true, -- If disabled then will only change colors instanly -- Kinda Breaks
   ease = 'ExpoOut' -- For Tweens
}
local Colors = { -- Default Colors
   WellDoneColor = 'FFFFFF',
   OKColor = 'FFFFFF',
   NoobColor = 'FFFFFF',
   SuckColor = 'FFFFFF',
   MissColor = 'FFFFFF',
   ColorCobo = 'FFFFFF',
   maxcobo = 'FFFFFF'
}















if Text.enabled == true then
   maxcombo = 0
   x = Text.x
   y = Text.y
   side = Text.Allignment
function onCreate()
     makeLuaText('maxcobo', 'Max Combo: 0', 350, x, y + Text.Size)
     makeLuaText('cobo', 'Combo: 0', 300, x, y + Text.Size*2)
     makeLuaText('W', 'Welldones: 0', 300, x, y + Text.Size*3)
     makeLuaText('O', 'OKs: 0', 300, x, y + Text.Size*4)
     makeLuaText('N', 'Noobs: 0', 300, x, y + Text.Size*5)
     makeLuaText('SU', 'Sucks: 0', 300, x, y + Text.Size*6)
     addLuaText('maxcobo', true)
     addLuaText('W', true)
     addLuaText('O', true)
     addLuaText('N', true)
     addLuaText('SU', true)
     addLuaText('misst', true)
     addLuaText('cobo', true)
     setTextAlignment('accuracy', side)
     setTextAlignment('maxcobo', side)
     setTextAlignment('W', side)
     setTextAlignment('O', side)
     setTextAlignment('N', side)
     setTextAlignment('SU', side)
     setTextAlignment('misst', side)
     setTextAlignment('cobo', side)
     setProperty('accuracy.alpha', Text.alpha)
     setProperty('maxcobo.alpha', Text.alpha)
     setProperty('W.alpha', Text.alpha)
     setProperty('O.alpha', Text.alpha)
     setProperty('N.alpha', Text.alpha)
     setProperty('SU.alpha',Text.alpha)
     setProperty('misst.alpha', Text.alpha)
     setProperty('cobo.alpha', Text.alpha)
     setTextSize('accuracy', Text.Size)
     setTextSize('maxcobo', Text.Size)
     setTextSize('W', Text.Size)
     setTextSize('O', Text.Size)
     setTextSize('N', Text.Size)
     setTextSize('SU', Text.Size)
     setTextSize('misst', Text.Size)
     setTextSize('cobo', Text.Size)
     setTextColor('accuracy', Colors.SickColor)
     setTextColor('maxcobo', Colors.WellDoneColor)
     setTextColor('W', Colors.WellDoneColor)
     setTextColor('O', Colors.OKColor)
     setTextColor('N', Colors.NoobColor)
     setTextColor('SU', Colors.SuckColor)
     setTextColor('misst', Colors.MissColor)
     setTextColor('cobo', Colors.ColorCobo)
     setTextFont('accuracy', Text.font)
     setTextFont('maxcobo', Text.font)
     setTextFont('W', Text.font)
     setTextFont('O', Text.font)
     setTextFont('N', Text.font)
     setTextFont('SU', Text.font)
     setTextFont('misst', Text.font)
     setTextFont('cobo', Text.font)

end
function goodNoteHit()
   if maxcombo <  getProperty('combo') then maxcombo = getProperty('combo') end
   setTextString('accuracy', 'Accuracy: ' .. math.floor( rating * 10000) * 0.01 .. ' [' .. ratingName .. ']')
   setTextString('maxcobo', 'Max Combo: ' .. maxcombo)
    setTextString('W', 'WellDones: ' .. getProperty('sicks'))
    setTextString('O', 'OKs: ' .. getProperty('goods'))
    setTextString('N', 'Noobs: ' .. getProperty('bads'))
    setTextString('SU', 'Sucks: ' .. getProperty('shits'))
    setTextString('cobo', 'Combo: ' .. getProperty('combo'))

          --All the IF THENs
          
  if rating == 1 and misses == 0 then
   if Text.tweens == false then
      setTextColor('accuracy', PfcColors.WellDoneColor)
      setTextColor('maxcobo', PfcColors.WellDoneColor)
      setTextColor('W', PfcColors.WellDoneColor)
      setTextColor('O', PfcColors.OKColor)
      setTextColor('N', PfcColors.NoobColor)
      setTextColor('SU', PfcColors.SuckColor)
      setTextColor('misst', PfcColors.MissColor)
      setTextColor('cobo', PfcColors.ColorCobo)
   elseif Text.tweens == true then
      doTweenColor('PFCH', 'accuracy', PfcColors.SickColor, 0.1, Text.ease)
      doTweenColor('PFCaH', 'maxcobo', PfcColors.SickColor, 0.1, Text.ease)
      doTweenColor('PFCI', 'W', PfcColors.SickColor, 0.1, Text.ease)
      doTweenColor('PFCJ', 'O', PfcColors.GoodColor, 0.1, Text.ease)
      doTweenColor('PFCK', 'N', PfcColors.BadColor, 0.1, Text.ease)
      doTweenColor('PFCL', 'SU', PfcColors.ShitColor, 0.1, Text.ease)
      doTweenColor('PFCM', 'misst', PfcColors.MissColor, 0.1, Text.ease)
      doTweenColor('PFCN', 'cobo', PfcColors.ColorCobo, 0.1, Text.ease)
   end

 elseif misses == 0 and rating ~= 1 then
   if Text.tweens == false then
    setTextColor('accuracy', FcColors.WellDoneColor)
    setTextColor('maxcobo', FcColors.WellDoneColor)
    setTextColor('W', FcColors.WellDoneColor)
    setTextColor('O', FcColors.OKColor)
    setTextColor('N', FcColors.NoobColor)
    setTextColor('SU', FcColors.SuckColor)
    setTextColor('misst', FcColors.MissColor)
    setTextColor('cobo', FcColors.ColorCobo)
   elseif Text.tweens == true then
      doTweenColor('dA', 'accuracy', FcColors.WellDoneColor, 0.1, Text.ease)
      doTweenColor('dA1', 'maxcobo', FcColors.WellDoneColor, 0.1, Text.ease)
      doTweenColor('dB', 'W', FcColors.WellDoneColor, 0.1, Text.ease)
      doTweenColor('dC', 'O', FcColors.OKColor, 0.1, Text.ease)
      doTweenColor('dD', 'N', FcColors.NoobColor, 0.1, Text.ease)
      doTweenColor('dE', 'SU', FcColors.SuckColor, 0.1, Text.ease)
      doTweenColor('dF', 'misst', FcColors.MissColor, 0.1, Text.ease)
      doTweenColor('sdG', 'cobo', FcColors.ColorCobo, 0.1, Text.ease)
   end
  

 
end
end
function noteMiss()
   setTextString('misst', 'Misses: ' .. misses)
   setTextString('cobo', 'Combo: ' .. getProperty('combo'))
     if Text.tweens == false then
        setTextColor('accuracy', Colors.WellDoneColor)
        setTextColor('maxcobo', Colors.WellDoneColor)
        setTextColor('W', Colors.WellDoneColor)
        setTextColor('O', Colors.OKColor)
        setTextColor('N', Colors.NoobColor)
        setTextColor('SU', Colors.SuckColor)
        setTextColor('misst', Colors.MissColor)
        setTextColor('cobo', Colors.ColorCobo)
     elseif Text.tweens == true then
        doTweenColor('H', 'accuracy', Colors.WellDoneColor, 0.1, Text.ease)
        doTweenColor('Haaaaa', 'maxcobo', Colors.WellDoneColor, 0.1, Text.ease)
        doTweenColor('sI', 'W', Colors.WellDoneColor, 0.1, Text.ease)
        doTweenColor('sJ', 'O', Colors.OKColor, 0.1, Text.ease)
        doTweenColor('sK', 'N', Colors.NoobColor, 0.1, Text.ease)
        doTweenColor('sL', 'SU', Colors.SuckColor, 0.1, Text.ease)
        doTweenColor('sM', 'misst', Colors.MissColor, 0.1, Text.ease)
        doTweenColor('sN', 'cobo', Colors.ColorCobo, 0.1, Text.ease)
     end
     
end
end



