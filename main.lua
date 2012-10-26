--require "map"
--El diegolas se la come

gfx = love.graphics
fsy = love.filesystem


function love.load()
	map = fsy.load('map.lua')()
	otroMap = fsy.load('mapPrueb.lua')()
	map:init()
	otroMap.init()
	map.update()
	tiempo = 0
	i = 0
end	

function love.update( dt )
	map.update()
	otroMap.update()
end	

function love.draw()
	--gfx.drawq(map.tex, map.typTile[1], 100, 100)
	--gfx.drawq(map2.tex, map2.typTile[1], 150, 100)
	map:draw()
	otroMap:draw()
end	