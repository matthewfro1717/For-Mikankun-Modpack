
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1725;
local yy = 1100;
local xx2 = 1725;
local yy2 = 1100;
local ofs = 10;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
	makeLuaSprite('floornew', 'reactor/floornew', -0, -0)
	
	makeLuaSprite('wallbgthing', 'reactor/wallbgthing', -0, -0)

	makeLuaSprite('backbars', 'reactor/backbars', -0, -0)

	makeLuaSprite('frontblack', 'reactor/frontblack', -0, -0)

	makeAnimatedLuaSprite('ball lol','reactor/ball lol', 1200, 100)
	addAnimationByPrefix('ball lol','ball lol','ball lol',24,true)

	makeAnimatedLuaSprite('yellowcoti','reactor/yellowcoti', 900, 900)
	addAnimationByPrefix('yellowcoti','yellowcoti','yellowcoti',24,true)

	makeAnimatedLuaSprite('browngeoff','reactor/browngeoff', 450, 1000)
	addAnimationByPrefix('browngeoff','browngeoff','browngeoff',24,true)

	makeAnimatedLuaSprite('yeahman','reactor/yeahman', 0, 0)
	addAnimationByPrefix('yeahman','yeahman','yeahman',24,true)

addLuaSprite('wallbgthing', false);
addLuaSprite('ball lol', false);
addLuaSprite('floornew', false);
addLuaSprite('yellowcoti', false);
addLuaSprite('backbars', false);
addLuaSprite('browngeoff', false);
addLuaSprite('yeahman', true);
addLuaSprite('frontblack', true);
end




function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
           
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    if curBeat == 64 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1450
        yy = 1150
        xx2 = 1950
        yy2 = 1150
    end
    if curBeat == 128 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 1725
        yy = 1100
        xx2 = 1725
        yy2 = 1100
    end
    if curBeat == 192 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1450
        yy = 1150
        xx2 = 1950
        yy2 = 1150
    end
    if curBeat == 224 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1725
        yy = 1100
        xx2 = 1725
        yy2 = 1100
    end
    if curBeat == 256 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1450
        yy = 1150
        xx2 = 1950
        yy2 = 1150
    end
    if curBeat == 320 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 1725
        yy = 1100
        xx2 = 1725
        yy2 = 1100
    end
    if curBeat == 384 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1450
        yy = 1150
        xx2 = 1950
        yy2 = 1150
    end
    if curBeat == 479 then
        setProperty('defaultCamZoom',0.9)
		followchars = true
        xx = 1725
        yy = 1200
        xx2 = 1725
        yy2 = 1200
    end
    if curBeat == 544 then
        setProperty('defaultCamZoom',0.8)
		followchars = true
        xx = 1725
        yy = 1100
        xx2 = 1725
        yy2 = 1100
    end
    if curBeat == 608 then
        setProperty('defaultCamZoom',0.9)
		followchars = true
        xx = 1725
        yy = 1200
        xx2 = 1725
        yy2 = 1200
    end
    if curBeat == 672 then
        setProperty('defaultCamZoom',0.7)
		followchars = true
        xx = 1725
        yy = 1100
        xx2 = 1725
        yy2 = 1100
    end

    
end
