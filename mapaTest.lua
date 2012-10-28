-- mapa de prueba

mapa = {}

mapa.xVisible = 0
mapa.yVisible = 0
mapa.matrizEntidades = {} --todas las entidades puestas en una matriz para ver si colisionan con algo

mapa.objetos = {} --objetos en general, no movibles 
mapa.movibles = {} --todos los objetos movibles
mapa.enemigos = {} -- todos los enemigos del mapa
mapa.jugadores = {} -- todos los jugadores en el mapa

mapa.sizeCelda = 100
mapa.ancho = 70
mapa.alto = 70
mapa.tex = gfx.newImage('gfx/tex.png')
mapa.tipoTex = {}
mapa.batch = nil

function mapa:init()

	for i=0, mapa.ancho do
			mapa.matrizEntidades[i]={}
			for j=0, mapa.alto do
				mapa.matrizEntidades[i][j] = {}
			end
	end	

	map.batch = gfx.newSpriteBatch(map.tex, 5)
	mapa.tipoTex[1] = gfx.newQuad(0, 0, 327, 51, mapa.tex:getWidth(), mapa.tex:getHeight())
	mapa.tipoTex[2] = gfx.newQuad(0, 51, 68, 189, mapa.tex:getWidth(), mapa.tex:getHeight())
	mapa.tipoTex[3] = gfx.newQuad(68, 51, 89, 95, mapa.tex:getWidth(), mapa.tex:getHeight())

	pato = fsy.load("palo.lua")()
	
	-- pato.x = 120
	-- pato.y = 340
	-- pato.ancho = 450
	-- pato.alto = 550

	-- pato2 = fsy.load("palo.lua")()
	-- pato2.x = 120
	-- pato2.y = 340
	-- pato2.ancho = 300
	-- pato2.alto = 609

	-- mapa:ubicarObjeto(pato)
	-- mapa:ubicarObjeto(pato2)	
	-- screen_width = love.graphics.getWidth()
	-- screen_height = love.graphics.getHeight()
end

function mapa:ubicarObjeto(objeto)
	for i=objeto.x/mapa.sizeCelda, (objeto.x + objeto.ancho)/mapa.sizeCelda do
		for j=objeto.y/mapa.sizeCelda, (objeto.y + objeto.alto)/mapa.sizeCelda do
			mapa.matrizEntidades[math.floor(i)][math.floor(j)][objeto] = objeto
		end
	end
	mapa.objetos[objeto]=objeto
end

function mapa:draw( )
	
end

function mapa:update()
	
end