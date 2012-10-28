--require "map"


gfx = love.graphics
fsy = love.filesystem
require("mapaTest")

function love.load()
	map = fsy.load('map.lua')()
	map:init()
	map.update()
	tiempo = 0
	i = 0
	mapa:init()

	mono = fsy.load('palo.lua')()
	mono:init(20, 30, 50, 50)
	vx = 200
	vy = 200
	cf = 0
	vcf = 100
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
end	

function love.draw()
	--gfx.drawq(map.tex, map.typTile[1], 100, 100)
	--gfx.drawq(map2.tex, map2.typTile[1], 150, 100)
	--map:draw()
	gfx.translate(-mono.x + (gfx.getWidth() - mono.ancho)/2, -mono.y + (gfx.getHeight()- mono.alto )/2)
	gfx.setColor(65, 50, 255,255)
	gfx.rectangle( "fill", mono.x, mono.y, mono.ancho, mono.alto)
	gfx.setColor(cf, 50, cf,255)
	gfx.rectangle( "fill", 300, 300, 1000, 500)

end	
