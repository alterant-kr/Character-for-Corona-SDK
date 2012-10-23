-------------------------------------------------
-- character.lua
-- Version: 2.1
-- Version Name: Coretech
-- Author: Rajendra Pondel
-- Email: neostar20@gmail.com
-- Licence: MIT Licence


-- This is 'Character' moudular class example of display 
-- object with Corona SDK.
-- It inherits properties of display object,
-- it also does inherits properties with  


-------------------------------------------------

-------------------------------------------------
--
-- character.lua
--
--
-------------------------------------------------

local character = {}
local character_mt = { __index = character }	-- metatable

-------------------------------------------------
-- PRIVATE FUNCTIONS
-------------------------------------------------


-------------------------------------------------
-- PUBLIC FUNCTIONS
-------------------------------------------------

function character.new(characterData)	-- constructor
	
	local characterData = characterData or {}
	local img = characterData.image or 'dog.png'
	local width = characterData.width or 128
	local height = characterData.height or 128
	local bodyType = characterData.bodyType or 'dynamic'
	local density = characterData.density or 1
	local friction = characterData.friction or 0.2
	local bounce = characterData.bounce or 0.3
	
	local newCharacter = display.newImageRect(img, width, height);
	
	local _character = newCharacter
	
	local newCharacter = {}

	local character_mt = {
		__index = function (t,k)
			if(_character[k]) then
				return _character[k]
			else
				return character[k]
			end
		end,

		__newindex = function (t,k,v)
			if(_character[k]) then
				_character[k] = v
				character[k] = v
			else
				_character[k] = v
				character[k] = v
			end
		end

	}
	newCharacter._proxy = _character._proxy
	newCharacter._userdata = _character._userdata
	
	physics.addBody(newCharacter, bodyType, {density=density, friction=friction, bounce=bounce})
	
	return setmetatable( newCharacter, character_mt )
end

-------------------------------------------------
-- This is collsion function for this character.
function character:collision(event)
	if('began'==event.phase) then
		print(self.name, 'is collided with', event.other.name)
		--self:punch(event.other)
	end
end

-------------------------------------------------






-------------------------------------------------
-- This is just example of how to create custom 
-- OOP functions for all your display object.
-- Usage of this function is shown at collsiion function

function character:punch(target)
	print( self.name .. " punched to ", target.name )
end

-------------------------------------------------


return character