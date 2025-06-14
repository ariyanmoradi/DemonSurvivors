-- sprites.lua

local sprites = {}

function sprites.load(player)
    local anim8 = require 'libraries/anim8'
    
    -- Store images in the sprites table
    sprites.background = love.graphics.newImage('sprites/map/map.png')  -- Store background in sprites table
    player.sprite = love.graphics.newImage('sprites/lex/lex_neutral.png')
    
    player.grid = anim8.newGrid(64, 64, player.sprite:getWidth(), player.sprite:getHeight())
    
end

return sprites

