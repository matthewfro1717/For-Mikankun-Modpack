--Code made by Drawoon_
--if you use this please give me credit
function onEvent(eventName, value1, value2)
if eventName=='Amusia Music Box' then
setProperty('dad.visible',false)
setProperty('boyfriend.visible',false)
setProperty('plateL.visible',false)
setProperty('plateR.visible',false)
setProperty('background.visible',false)
setProperty('background2.visible',false)
setProperty('QuestionareBackground.visible',true)
setProperty('WigglesQuest.visible',true)
setProperty('camZooming',false)
setProperty('camHUD.alpha',0)
doTweenAlpha('Vigette1','Static',0.1,64*(stepCrochet/1000),'linear')
doTweenAlpha('Vigette2','StaticOverlay',0,64*(stepCrochet/1000),'linear')

end
end
