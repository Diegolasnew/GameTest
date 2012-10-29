gfx = love.graphics
fsy = love.filesystem
new = function (nombre)
	return fsy.load(nombre .. ".lua")()
end
colorDef = {255,255,255,255}
require("mapaTest")

function love.load()
	mono = new("palo")
	mono:init(100, 30, 50, 50)
	vx = 200
	vy = 200
	cf = 0
	vcf = 200
	mapa:init()
	debug = false
end	

function love.update( dt )
	if love.keyboard.isDown("up") then
		mono.y = mono.y - vy*dt
	end
	if love.keyboard.isDown("down") then
		mono.y = mono.y + vy*dt
	end
	if love.keyboard.isDown("left") then
		mono.x = mono.x - vx*dt
	end
	if love.keyboard.isDown("right") then
		mono.x = mono.x + vx*dt
	end
	if cf >255 or cf<0 then
		vcf = -vcf
	end
	cf = cf + vcf*dt
	mapa:update()
end	

function love.keyreleased(key)
   if key == "f1" then
         debug = not debug
   end
end

function love.draw()

	if debug then
		gfx.setColor(0, 255, 0, 255)
    	gfx.print("x = ".. mono.x, 10, 10)
    	gfx.print("y = ".. mono.y, 10, 30)
	end
	gfx.translate(-mono.x + (gfx.getWidth() - mono.ancho)/2, -mono.y + (gfx.getHeight()- mono.alto )/2)
	gfx.setColor(cf, 255, cf,255)
	gfx.rectangle( "fill", 300, 300, 1000, 500)
	gfx.setColor(colorDef)
	mapa:draw()
	gfx.setColor(65, 50, 255,255)
	gfx.rectangle( "fill", mono.x, mono.y, mono.ancho, mono.alto)
end	

function colision( c1, c2)
	if (c1.x < c2.x + c2.w) and (c2.x < c1.x + c1.w) and (c1.y < c2.y + c2.h) then
		return c2.y < c1.y + c1.h
	end
	return false
end