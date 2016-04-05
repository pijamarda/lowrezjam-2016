-- Fer's Challenge

require("camera")

----

SCREEN_WIDTH = 8
SCREEN_HEIGHT = 8

PLAYER_START_X = 3
PLAYER_START_Y = 3



PIXEL_WIDTH = love.graphics.getWidth() / SCREEN_WIDTH
PIXEL_HEIGHT = love.graphics.getHeight() / SCREEN_HEIGHT


MAP = {}

player = {
    x = PLAYER_START_X, y = PLAYER_START_Y, 
    img = nil, moving=false, direction='right', 
    speed = 150,
    screen_x = PIXEL_WIDTH*PLAYER_START_X, screen_y = PIXEL_HEIGHT*PLAYER_START_Y, 
    dst_x=0, dst_y=0,
    height=PIXEL_WIDTH, width=PIXEL_WIDTH
    }




function love.load(arg)
    --

end

function love.update(dt)
    

    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    if not player.moving then

        -- Player Horizontal Movement

        if love.keyboard.isDown('left', 'a') then
            if player.x > 0 then
                player.direction = 'left'
                player.dst_x = (player.x - 1) * PIXEL_WIDTH
                player.moving = true
            end
        elseif love.keyboard.isDown('right', 'd') then
            if player.x < SCREEN_WIDTH then
                player.direction = 'right'
                player.dst_x = (player.x + 1) * PIXEL_WIDTH
                player.moving = true
            end
        end

        -- Player Vertical Movement

        if love.keyboard.isDown('up', 'w') then
            if player.y > 0 then
                player.direction = 'up'
                player.dst_y = (player.y - 1) * PIXEL_HEIGHT
                player.moving = true
            end
        elseif love.keyboard.isDown('down', 's') then
            if player.y < SCREEN_HEIGHT then
                player.direction = 'down'
                player.dst_y = (player.y + 1) * PIXEL_HEIGHT
                player.moving = true
            end
        end

    else
        if player.direction == 'left' and player.screen_x >= player.dst_x then
            player.screen_x = player.screen_x - (player.speed * dt)
            camera.x = camera.x - (player.speed * dt) -- + player.width/2
            if player.screen_x <= player.dst_x then
                player.x = player.x - 1
                player.moving = false
            end
        elseif player.direction == 'right' and player.screen_x <= player.dst_x then
            player.screen_x = player.screen_x + (player.speed * dt)
            camera.x = camera.x + (player.speed * dt) -- + player.width/2
            if player.screen_x >= player.dst_x then
                player.x = player.x + 1                
                player.moving = false
            end
        elseif player.direction == 'up' and player.screen_y >= player.dst_y then
            player.screen_y = player.screen_y - (player.speed * dt)
            camera.y = camera.y - (player.speed * dt)
            if player.screen_y <= player.dst_y then
                player.y = player.y - 1
                player.moving = false
            end
        elseif player.direction == 'down' and player.screen_y <= player.dst_y then
            player.screen_y = player.screen_y + (player.speed * dt)
            camera.y = camera.y + (player.speed * dt)
            if player.screen_y >= player.dst_y then
                player.y = player.y + 1
                player.moving = false
            end
        end
    end

end

function love.draw(dt)
    camera:set()

    for j=0,SCREEN_HEIGHT do
        for i=0,SCREEN_WIDTH do
            love.graphics.setColor(255, 0, 0, 100)
            love.graphics.rectangle('fill',i*PIXEL_WIDTH,j*PIXEL_HEIGHT, PIXEL_WIDTH,PIXEL_HEIGHT)
            love.graphics.setColor(0, 255, 0, 100)
            love.graphics.rectangle('line',i*PIXEL_WIDTH,j*PIXEL_HEIGHT, PIXEL_WIDTH,PIXEL_HEIGHT)
        end
    end

    love.graphics.setColor(0, 0, 255, 100)
    love.graphics.rectangle('fill',player.screen_x, player.screen_y, player.width,player.height)
    camera:unset()
end
