local SpeedBuilds=-10000
local lastStep=0
local WaitBuildB=false
local Credits=false
function onCreate()
    SpawnBuilds=false
    LinesCloudSpawn=false
    
    precacheImage('scrollingClouds')
    precacheImage('buildingSheet')
    precacheImage('speedLines')
    addLuaScript('data/CameraMove.lua')
    setGlobalFromScript('data/CameraMove.lua','CamNoteMove',20)
    setGlobalFromScript('data/CameraMove.lua','ManualPos',{275,550})
    setGlobalFromScript('data/CameraMove.lua','ForceCamPos',true)

    makeLuaSprite('Sky','sky',-2800,-3900)
    addLuaSprite('Sky',false)
    setProperty('Sky.visible',false)
    makeLuaSprite('CloudsBF','fgClouds',-3000,-200)
    addLuaSprite('CloudsBF',false)
    setProperty('CloudsBF.visible',false)
    BuildsCreate=0
    Int={A=1,B=1,Lines=1}

   makeLuaSprite('CreditsBG',nil,-300,200)
   makeGraphic('CreditsBG',300,100,'FFFFFF')
   setProperty('CreditsBG.alpha',0.4)
   setObjectCamera('CreditsBG','other')
   addLuaSprite('CreditsBG')
   Text=getTextFromFile('data/'..songName..'/info.txt')
   makeLuaText('CreditsTxt',Text,0,getProperty('CreditsBG.x')+12,getProperty('CreditsBG.y')+12)
   setTextAlignment('CreditsTxt','left')
   setTextSize('CreditsTxt',24)
   setObjectCamera('CreditsTxt','other')
   addLuaText('CreditsTxt')
   
   setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-fall')
   setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'ejected_death')
   setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameover_v4_LOOP')
   setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameover_v4_End')
end
function onCreatePost()
    setProperty('dad.visible',false)
    setProperty('boyfriend.visible',false)
    setProperty('gf.visible',false)
    setTextColor('scoreTxt','003315')
    makeLuaSprite('TimeBarBG','timeBar',defaultOpponentStrumX0,getProperty('timeBar.y'))
    setProperty('camHUD.visible',false)
end
function onCountdownTick(swagCounter)
    setObjectCamera('countdownGo','other')
    setObjectCamera('countdownSet','other')
    setObjectCamera('countdownReady','other')
end
function onUpdate(elapsed)
    --Camera Move
    setProperty('camHUD.y',math.sin((180 / math.pi) * ((getSongPosition() / 1000) / 16))*10)
    setProperty('camHUD.angle',(math.sin(((getSongPosition() / 1000) * math.pi)) * 2.5))

    setProperty('timeBar.alpha',0)
    
    if getProperty('timeBar.percent')>0 then
        setProperty('TimeBar.visible',true)
    setGraphicSize('TimeBar',(getProperty('TimeBarBG.width')-8)*(getProperty('timeBar.percent')/100),getProperty('TimeBarBG.height')-8)
    end
    if SpawnBuilds then
        if not luaSpriteExists('BuidingA'..Int['A']) then
        makeAnimatedLuaSprite('BuidingA'..Int['A'],'buildingSheet',-274,1700)
        addAnimationByPrefix('BuidingA'..Int['A'],'idle','BuildingA'..getRandomInt(1,3),0,true)
        setProperty('BuidingA'..Int['A']..'.velocity.y',SpeedBuilds)
        addLuaSprite('BuidingA'..Int['A'])
        elseif getProperty('BuidingA'..Int['A']..'.y')< -6700 and luaSpriteExists('BuidingA'..Int['A']) then
            removeLuaSprite('BuidingA'..Int['A']-1)
            Int['A']=Int['A']+1
            WaitBuildB=true
        end
        if not luaSpriteExists('BuidingB'..Int['B']) then
            makeAnimatedLuaSprite('BuidingB'..Int['B'],'buildingSheet',974,getProperty('BuidingA'..Int['A']..'.y')+6000)
            addAnimationByPrefix('BuidingB'..Int['B'],'idle','BuildingB'..getRandomInt(1,2),0,true)
            setProperty('BuidingB'..Int['B']..'.velocity.y',SpeedBuilds)
            addLuaSprite('BuidingB'..Int['B'])
            setObjectOrder('BuidingB'..Int['B'],getObjectOrder('BuidingA'..Int['A'])+getRandomInt(-1,1,'0'))
            makeAnimatedLuaSprite('BuidingB1'..Int['B'],'buildingSheet',-1220,getProperty('BuidingA'..Int['A']..'.y')+6000)
            addAnimationByPrefix('BuidingB1'..Int['B'],'idle','BuildingB'..getRandomInt(1,2),0,true)
            setProperty('BuidingB1'..Int['B']..'.velocity.y',SpeedBuilds)
            addLuaSprite('BuidingB1'..Int['B'])
            setObjectOrder('BuidingB1'..Int['B'],getObjectOrder('BuidingA'..Int['A'])+getRandomInt(-1,1,'0'))
            WaitBuildB=false
        elseif getProperty('BuidingA'..Int['A']..'.y')<-2000 then
            if WaitBuildB then
                removeLuaSprite('BuidingB1'..Int['B']-1)
                removeLuaSprite('BuidingB'..Int['B']-1)
            Int['B']=Int['B']+1
            end
        end
    end
    if LinesCloudSpawn then
        if not luaSpriteExists('Lines'..Int['Lines']) then
        makeLuaSprite('Lines'..Int['Lines'],'speedLines',-475+getRandomInt(-100,100),-550+2170 )
        setProperty('Lines'..Int['Lines']..'.velocity.y',SpeedBuilds)
        setProperty('Lines'..Int['Lines']..'.alpha',0.5)
        addLuaSprite('Lines'..Int['Lines'],true)
        elseif getProperty('Lines'..Int['Lines']..'.y')< -550 and luaSpriteExists('Lines'..Int['Lines']) then
            removeLuaSprite('Lines'..Int['Lines']-1)
            Int['Lines']=Int['Lines']+1
        end
        if curStep~=lastStep and curStep%2==0 then
            removeLuaSprite('Clouds'..curStep-6,true)
            makeAnimatedLuaSprite('Clouds'..curStep,'scrollingClouds',-250+(getRandomInt(-1,1)*800),1050 )
            addAnimationByPrefix('Clouds'..curStep,'idle','Cloud'..getRandomInt(0,3),0,true)
            setProperty('Clouds'..curStep..'.velocity.y',SpeedBuilds)
            addLuaSprite('Clouds'..curStep,true)
            lastStep=curStep
        end
    end
    if not Credits then
    setProperty('CreditsTxt.x',Lerp(getProperty('CreditsTxt.x'),12,0.1))
    setProperty('CreditsBG.x',Lerp(getProperty('CreditsBG.x'),0,0.1))
    else
        setProperty('CreditsTxt.x',Lerp(getProperty('CreditsTxt.x'),-300+12,0.1))
        setProperty('CreditsBG.x',Lerp(getProperty('CreditsBG.x'),-300,0.1))
    end
    if getProperty('CreditsBG.x')>-0.9 then
        Credits=true
    end
end
function onFinishedVideo(VideoName)
    if VideoName=='ejected' then
        setProperty('Sky.visible',true)
        setProperty('dad.visible',true)
        setProperty('boyfriend.visible',true)
        setProperty('gf.visible',true)
        setProperty('CloudsBF.visible',true)
        setProperty('camHUD.visible',true)
        makeLuaSprite('Black',nil,0,0)
        makeGraphic('Black',screenWidth,screenHeight,'000000')
        setObjectCamera('Black','other')
        addLuaSprite('Black')
        SpawnBuilds=true
        if not lowQuality then
            LinesCloudSpawn=true
        end
    end
end 
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
function onGameOver()
    removeLuaScript('data/CameraMove.lua')
end