-- mapa de prueba

mapa = {}

mapa.xVisible = 0
mapa.yVisible = 0
mapa.matrizObjetos = {} --todas las entidades puestas en una matriz para ver si colisionan con algo

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
			mapa.matrizObjetos[i]={}
			for j=0, mapa.alto do
				mapa.matrizObjetos[i][j] = {}
			end
	end	

	mapa.batch = gfx.newSpriteBatch(mapa.tex, 30)
	mapa.tipoTex[1] = gfx.newQuad(0, 0, 327, 51, mapa.tex:getWidth(), mapa.tex:getHeight())
	mapa.tipoTex[2] = gfx.newQuad(0, 51, 68, 189, mapa.tex:getWidth(), mapa.tex:getHeight())
	mapa.tipoTex[3] = gfx.newQuad(68, 51, 89, 95, mapa.tex:getWidth(), mapa.tex:getHeight())

	-- screen_width = love.graphics.getWidth()
	-- screen_height = love.graphics.getHeight()

	o1 = new("objeto")
	x, y, w, h = mapa.tipoTex[1]:getViewport()
	o1:init(80, 100, w, h, mapa.tipoTex[1])
	mapa:ubicarObjeto(o1)
	o2 = new("objeto")
	x, y, w, h = mapa.tipoTex[2]:getViewport()
	o2:init(10, 10, w, h, mapa.tipoTex[2])
	mapa:ubicarObjeto(o2)


end

function mapa:ubicarObjeto(objeto)
	for i=objeto.x/mapa.sizeCelda, (objeto.x + objeto.ancho)/mapa.sizeCelda do
		for j=objeto.y/mapa.sizeCelda, (objeto.y + objeto.alto)/mapa.sizeCelda do
			mapa.matrizObjetos[math.floor(i)][math.floor(j)][objeto] = objeto
		end
	end
	mapa.objetos[objeto]=objeto
end

function mapa:update()
	mapa.batch:bind()
    mapa.batch:clear()
    for i, v in pairs(mapa.objetos)do
        mapa.batch:addq(v.quad, v.x, v.y)
  	end
    mapa.batch:unbind()
end

function mapa:draw( )
	gfx.draw(mapa.batch, 0, 0)	
end
