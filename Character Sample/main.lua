_W = display.contentWidth
_H = display.contentHeight

local physics = require('physics')
local character = require('character')
local dog = require('dog')
local rabbit = require('rabbit')
physics.start()

--physics.setDrawMode('hybrid')

local ground = display.newRect(0,0, _W*10, 5)
ground:setReferencePoint(display.centreRefrencePoint)
ground.name = 'ground'
ground.x = _W*0.5
ground.y = _H

physics.addBody(ground, 'static')

-- Create a new character with name 'tom'
local dog1 = dog.new({image='dog.png', width=128, height=128})
dog1.name = 'tommy'
dog1.x = _H*.25
dog1:addEventListener('collision', dog1)
dog1:addEventListener('bark', dog1)

local rabbit1 = rabbit.new({image='rabbit.png', width=128, height=128})
rabbit1.name = 'bugs_bunny'
rabbit1.x = _H*.5
rabbit1:addEventListener('collision', rabbit1)
rabbit1:addEventListener('smile', rabbit1)


timer.performWithDelay(1000, function(e)
		
		local event = {name="bark", other=rabbit1}
		dog1:dispatchEvent(event)
		
		local event = {name="smile"}
		rabbit1:dispatchEvent(event)
		
	end, 0)