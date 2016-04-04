-- Fer's Challenge

SCREEN_WIDTH = 32
SCREEN_HEIGHT = 32

PIXEL_WIDTH = love.graphics.getWidth() / 64
PIXEL_HEIGHT = love.graphics.getHeight() / 64
MAX_STARS = PIXEL_WIDTH * PIXEL_HEIGHT

function love.load(arg)
	--
	
end

function love.update(dt)

	if love.keyboard.isDown('escape') then
		love.event.push('quit')
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
        
	
end
