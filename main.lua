-- Fer's Challenge

SCREEN_WIDTH = 8
SCREEN_HEIGHT = 8

PIXEL_WIDTH = love.graphics.getWidth() / SCREEN_WIDTH
PIXEL_HEIGHT = love.graphics.getHeight() / SCREEN_HEIGHT
MAX_STARS = PIXEL_WIDTH * PIXEL_HEIGHT

MAP = {}

player = { x = 1, y = 1, img = nil, moving=false}

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
			if player.x > 1 then
				player.x = player.x - 1
			end
		elseif love.keyboard.isDown('right', 'd') then
			if player.x < SCREEN_WIDTH then
				player.x = player.x + 1
			end
		end

		-- Player Vertical Movement

		if love.keyboard.isDown('up', 'w') then
			if player.y > 1 then
				player.y = player.y - 1
			end
		elseif love.keyboard.isDown('down', 's') then
			if player.y < SCREEN_HEIGHT then
				player.y = player.y + 1
			end
		end	

	else
		--
	end
	
end

function love.draw(dt)

	for j=0,SCREEN_HEIGHT do
        for i=0,SCREEN_WIDTH do
        	love.graphics.setColor(255, 0, 0, 100)
            love.graphics.rectangle('fill',i*PIXEL_WIDTH,j*PIXEL_HEIGHT, PIXEL_WIDTH,PIXEL_HEIGHT)
            love.graphics.setColor(0, 255, 0, 100)
            love.graphics.rectangle('line',i*PIXEL_WIDTH,j*PIXEL_HEIGHT, PIXEL_WIDTH,PIXEL_HEIGHT)
        end
    end

    love.graphics.setColor(0, 0, 255, 100)
    love.graphics.rectangle('fill',(player.x-1)*PIXEL_WIDTH,(player.y-1)*PIXEL_HEIGHT, PIXEL_WIDTH,PIXEL_HEIGHT)
	
end
