gfx = love.graphics
fsy = love.filesystem
new = function (nombre)
	return fsy.load(nombre .. ".lua")()
end
colorDef = {255,255,255,255}
require("mapaTest")

function love.load()
	mono = new("objeto")
	mono:init(100, 30, 50, 50, nil)
	vx = 200
	vy = 200
	cf = 0
	vcf = 200
	mapa:init()
	debug = false
	colis = false

	q1 = {x = 120, y = 100, w = 50, h = 50}
	q2 = {x = 100, y = 120, w = 100, h = 100}
	print(colision(q1, q2))
end	

function love.update( dt )
	if love.keyboard.isDown("up") then
		mono.cuadColi.y = mono.cuadColi.y - vy*dt
	end
	if love.keyboard.isDown("down") then
		mono.cuadColi.y = mono.cuadColi.y + vy*dt
	end
	if love.keyboard.isDown("left") then
		mono.cuadColi.x = mono.cuadColi.x - vx*dt
	end
	if love.keyboard.isDown("right") then
		mono.cuadColi.x = mono.cuadColi.x + vx*dt
	end
	if cf >255 or cf<0 then
		vcf = -vcf
	end
	cf = cf + vcf*dt
	mapa:update()
	colis = mapa:colisiona(mono.cuadColi.x, mono.cuadColi.y, mono.cuadColi.w, mono.cuadColi.h)
end	

function love.keyreleased(key)
   if key == "f1" then
         debug = not debug
   end
end

function love.draw()

	if debug then
		gfx.setColor(0, 255, 0, 255)
    	gfx.print("x = ".. mono.cuadColi.x, 10, 10)
    	gfx.print("y = ".. mono.cuadColi.y, 10, 30)
    	gfx.print("c = ".. tostring (colis), 10, 50)
    	gfx.print("x2 = ".. mono.cuadColi.x + mono.cuadColi.w, 10, 70)
    	gfx.print("y2 = ".. mono.cuadColi.y + mono.cuadColi.h, 10, 90)
	end
	gfx.translate(-mono.cuadColi.x + (gfx.getWidth() - mono.cuadColi.w)/2, -mono.cuadColi.y + (gfx.getHeight()- mono.cuadColi.h )/2)
	--gfx.setColor(cf, 255, cf,255)
	--gfx.rectangle( "fill", 300, 300, 1000, 500)
	gfx.setColor(colorDef)
	mapa:draw()
	gfx.setColor(65, 50, 255,255)
	gfx.rectangle( "fill", mono.cuadColi.x, mono.cuadColi.y, mono.cuadColi.w, mono.cuadColi.h)
end	

function colision( c1, c2)
	if (c1.x < c2.x + c2.w) and (c2.x < c1.x + c1.w) and (c1.y < c2.y + c2.h) then
		return c2.y < c1.y + c1.h
	end
	return false
end