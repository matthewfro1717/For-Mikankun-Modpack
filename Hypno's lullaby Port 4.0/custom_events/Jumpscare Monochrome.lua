function onEvent(eventName, value1, value2)
    if eventName=='Jumpscare Monochrome' and not getDataFromSave('HypnosPref','Pussy mode',false) then
        local length = tonumber(value2)
        local portrait = 'Gold';
        if dadName=='Gold-Head' then
            portrait = 'GoldAlt'
        end
        makeLuaSprite('newJumpscare','stage/None/'..portrait,0,0)
        scaleObject('newJumpscare',jumpscareSize,jumpscareSize)
        setObjectCamera('newJumpscare','other')
        screenCenter('newJumpscare','xy')
        addLuaSprite('newJumpscare',true)
        setProperty('newJumpscare.alpha',1)
        jumpscareSize= jumpscareSize + 0.05/6
        doTweenAlpha('Jumpscare','newJumpscare',0,(stepCrochet * (length * (1 / 2))) / 1000,'expoIn')
        TweenAlpha=true
    end
    if eventName=='Monochrome No More' then
        if jumpscareSize~=0.4 then
            jumpscareSize=0.4
        end
    end
end
function onUpdate(elapsed)
    if TweenAlpha then
        local jumpscareSizeInterval = jumpscareSize
        local shakeIntensity = (0.0125 * ((jumpscareSizeInterval)/ 2))
        setProperty('newJumpscare.x',getProperty('newJumpscare.x')+getRandomFloat(-shakeIntensity*screenWidth,shakeIntensity*screenWidth)*jumpscareSizeInterval*getProperty('newJumpscare.scale.x'))
        setProperty('newJumpscare.y',getProperty('newJumpscare.y')+getRandomFloat(-shakeIntensity*screenHeight,shakeIntensity*screenHeight)*jumpscareSizeInterval*getProperty('newJumpscare.scale.y'))
    end
end
function onTweenCompleted(tag)
    if tag=='Jumpscare' then
        TweenAlpha=false
    end
end
function onCreate()
    initSaveData('HypnosPref')

    TweenAlpha=false
    jumpscareSize=1
    precacheImage('stage/None/Gold')
    precacheImage('stage/None/GoldAlt')
    if jumpscareSize~=0.4 then
        jumpscareSize=0.4
    end
end