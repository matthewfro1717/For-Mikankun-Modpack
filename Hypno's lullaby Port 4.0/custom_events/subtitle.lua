function onCreate()
    DefaultColor='FFFFFF' --Set color in HEX
    Font='poketext.ttf'--Set font
    Size=20--Set Word Size text
    TextY=534--Set Y text
    Word={' '}
    Time=0
end
local Active={}
function onEvent(tag,v1,v2)
    if tag == 'subtitle' then
        if Time~=0 then
        clearOldText(Word)
        end
        if v1~='' and v2~='' then
            Active=stringSplit(v1,',')
            Word=stringSplit(v2,'/')
        else
            Word={}
            Active={}
        end
        Time=1
    end
end
function UpdateSubtitle(Pos)
    if not luaTextExists(MakeTag(Word[1])) then
        for i=1,#Word do
            makeLuaText(MakeTag(Word[i]),Word[i]..'\n',0,0,TextY)
            TextStuff(MakeTag(Word[i]))
        end
    end
    Textlength=0
    for i=1,#Word do
        Textlength=Textlength+getProperty(MakeTag(Word[i])..'.width')
    end
    for i=1,#Word do     
        setProperty(MakeTag(Word[i])..'.x',screenWidth/2)
        setProperty(MakeTag(Word[i])..'.y',TextY)
        setTextColor(MakeTag(Word[i]),DefaultColor)
        setProperty(MakeTag(Word[i])..'.x',(getProperty(MakeTag(Word[i])..'.x')-Textlength/2))
         
        if i>1 then
            setProperty(MakeTag(Word[i])..'.x',getProperty(MakeTag(Word[i-1])..'.x')+getProperty(MakeTag(Word[i-1])..'.width'))
        end  
           
    end
    if luaTextExists(MakeTag(Word[Pos])) then
        setProperty(MakeTag(Word[Pos])..'.y',TextY-4)
        setTextColor(MakeTag(Word[Pos]),'FF0000')  
    end
end
function onStepHit()
    if Active[Time]~=nil and #Active~=0 then
        if curStep>=GetStep(Active[Time]) then
            UpdateSubtitle(Time)
            Time=Time+1
        end
    end
end
function GetStep(Step)
    return tonumber(Step)
end
function TextStuff(tag)
    setTextSize(tag,Size)
    setTextAlignment(tag,'center')
    setTextFont(tag,Font)
    setProperty(tag..'.antialiasing',false)
    setTextBorder(tag,2,'000000')
    setObjectCamera(tag,'other')
    addLuaText(tag)
end
function clearOldText(OldWords)
    for i=1,#OldWords do
        removeLuaText(MakeTag(OldWords[i]),true)
    end
end
function MakeTag(word)
    if stringEndsWith(word,'.') then
        return stringSplit(word,'.')[1]
    else
        return word;
    end
end