local backgroundWidth, backgroundHeight
local scrollSpeed = 120
local offsetX, offsetY = 0, 0
local visibilityRange = 400
local mapVisible = true

-- Initialize player variables
local player = {}
local playerX, playerY = 0, 0

function love.load()
    love.window.setFullscreen(true)
    background = love.graphics.newImage('sprites/map/map.png')
    
    -- Initialize the player table first
    player.sprite = love.graphics.newImage('sprites/lex/lex_neutral.png')
    player.width = 5
    player.height = 5

    backgroundWidth = background:getWidth()
    backgroundHeight = background:getHeight()

    local screenWidth, screenHeight = love.graphics.getDimensions()

    -- Center the player
    playerX = (screenWidth - player.width) / 2
    playerY = (screenHeight - player.height) / 2
end

function love.update(dt)
    local moveX, moveY = 0, 0
    if love.keyboard.isDown("d") then
        moveX = scrollSpeed * dt
    end
    if love.keyboard.isDown("a") then
        moveX = -scrollSpeed * dt
    end

    if love.keyboard.isDown("s") then
        moveY = scrollSpeed * dt
    end
    if love.keyboard.isDown("w") then
        moveY = -scrollSpeed * dt
    end

    -- Update the camera offset instead of player position
    offsetX = (offsetX + moveX) % backgroundWidth
    offsetY = (offsetY + moveY) % backgroundHeight
end

function love.draw()
    -- Draw the background map if it's visible
    if mapVisible then
        -- Calculate the number of tiles to draw based on the screen size
        local screenWidth, screenHeight = love.graphics.getDimensions()
        
        -- Calculate how many tiles to draw in both directions
        local tilesX = math.ceil(screenWidth / backgroundWidth) + 1
        local tilesY = math.ceil(screenHeight / backgroundHeight) + 1

        -- Draw the background in a way that ensures it stays visible
        for i = -1, tilesX do
            for j = -1, tilesY do
                love.graphics.draw(background, 
                    (i * backgroundWidth) - offsetX, 
                    (j * backgroundHeight) - offsetY)
            end
        end
    end                                                                                                                               
                                                                                                                                      
    -- Draw the player sprite at the center of the screen                                                                                                         
    local screenWidth, screenHeight = love.graphics.getDimensions()
    love.graphics.draw(player.sprite, (screenWidth - player.width) / 2, (screenHeight - player.height) / 2)                                                                                       
end

