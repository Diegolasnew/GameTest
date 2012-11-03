
gfx = love.graphics
fsy = love.filesystem
new = function (nombre)
	return fsy.load(nombre .. ".lua")()
end
colorDef = {255,255,255,255}

require("mapaTest")
require("editor")

function love.load()
	mono = new("objeto")
	mono:init(100, 30, 40, 40, 0, nil)
	vx = 200
	vy = 200
	cf = 0
	vcf = 200
	mapa:init()
	debug = false
	colis = false
	editor = false
	translate = {1, 2}
	q1 = {x = 120, y = 100, w = 50, h = 50}
	q2 = {x = 100, y = 120, w = 100, h = 100}
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
	translate = {-mono.cuadColi.x + (gfx.getWidth() - mono.cuadColi.w)/2, -mono.cuadColi.y + (gfx.getHeight()- mono.cuadColi.h )/2}
	mapa:update()
	colis = mapa:colisiona(mono.cuadColi.x, mono.cuadColi.y, mono.cuadColi.w, mono.cuadColi.h)
	if editor then

		updateEditor()
	end
end	

function love.keyreleased(key)
   if key == "f1" then
         debug = not debug
   end	
   if key == "f2" then
         editor = not editor
   end	
   if key == "f5" then
         guardarMapa()
   end
   if key == "f6" then
         cargarMapa()
   end
end


function love.mousereleased( x, y, button )
	if editor then
		if button == "wd" then
			posObjetoEditor = posObjetoEditor +1
		end
		if button == "wu" then
			posObjetoEditor = posObjetoEditor -1
		end
		if button == "l" then
			ponerObjeto = true
		end
		if button == "r" then
			eliminarObjeto = true
		end
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
    	if editor then
    		local x, y = love.mouse.getPosition()
    		gfx.print("xMouseReal = ".. x, 160, 10)
    		gfx.print("yMouseReal = ".. y, 160, 30)
    		gfx.print("xMouseMapa = ".. x - translate[1], 160, 50)
    		gfx.print("yMouseMapa = ".. y - translate[2], 160, 70)
    		gfx.print("Objpos = ".. posObjetoEditor, 160, 90)
    	end
    else
    	gfx.setColor(255,100,100,255)
    	gfx.print("F1 Debug ", 10, 10)
    	gfx.print("F2 Editor ", 10, 30)
    	gfx.print("F4 Guardar Mapa ", 10, 50)
    	gfx.print("F5 Cargar Mapa ", 10, 70)
	end

	gfx.translate(translate[1], translate[2])
	--gfx.setColor(cf, 255, cf,255)
	--gfx.rectangle( "fill", 300, 300, 1000, 500)
	gfx.setColor(255, 0, 0,255)
	love.graphics.line(0,0,10000,0)
	love.graphics.line(0,0,0,10000)
	gfx.setColor(colorDef)
	mapa:draw()
	gfx.setColor(65, 50, 255,255)
	gfx.rectangle( "fill", mono.cuadColi.x, mono.cuadColi.y, mono.cuadColi.w, mono.cuadColi.h)

	if editor then
		drawEditor()	
	end
end	

function colision( c1, c2)
	if (c1.x < c2.x + c2.w) and (c2.x < c1.x + c1.w) and (c1.y < c2.y + c2.h) then
		return c2.y < c1.y + c1.h
	end
	return false
end

function string:split(delimiter) --source internet :D
	local result = {}
	local from  = 1
	local delim_from, delim_to = string.find( self, delimiter, from  )
	while delim_from do
		table.insert( result, string.sub( self, from , delim_from-1 ) )
		from = delim_to + 1
		delim_from, delim_to = string.find( self, delimiter, from  )
	end
	table.insert( result, string.sub( self, from  ) )
	return result
end