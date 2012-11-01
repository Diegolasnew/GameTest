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

	mapa.batch = gfx.newSpriteBatch(mapa.tex, 200)
	mapa.tipoTex[1] = gfx.newQuad(0, 0, 327, 51, mapa.tex:getWidth(), mapa.tex:getHeight())
	mapa.tipoTex[2] = gfx.newQuad(0, 51, 68, 189, mapa.tex:getWidth(), mapa.tex:getHeight())
	mapa.tipoTex[3] = gfx.newQuad(68, 51, 89, 95, mapa.tex:getWidth(), mapa.tex:getHeight())

	-- screen_width = love.graphics.getWidth()
	-- screen_height = love.graphics.getHeight()

	for i=0,10 do
 		local o1 = new("objeto")
		local x, y, w, h = mapa.tipoTex[1]:getViewport()
		o1:init(i*123, i*100, w, h, mapa.tipoTex[1])
		mapa:ubicarObjeto(o1)
	 	local o2 = new("objeto")
	 	local x, y, w, h = mapa.tipoTex[2]:getViewport()
	 	o2:init(i*50, i*60, w, h, mapa.tipoTex[2])
	 	mapa:ubicarObjeto(o2)

		local o3 = new("objeto")
	 	local x, y, w, h = mapa.tipoTex[3]:getViewport()
	 	o3:init(i*150, i*300, w, h, mapa.tipoTex[3])
	 	mapa:ubicarObjeto(o3)
	 end
end

function mapa:ubicarObjeto(objeto)
	for i=math.floor(objeto.cuadColi.x/mapa.sizeCelda), ((objeto.cuadColi.x + objeto.cuadColi.w)/mapa.sizeCelda) do
		for j=math.floor(objeto.cuadColi.y/mapa.sizeCelda), ((objeto.cuadColi.y + objeto.cuadColi.h)/mapa.sizeCelda) do
			mapa.matrizObjetos[math.floor(i)][math.floor(j)][objeto] = objeto
		end
	end
	mapa.objetos[objeto]=objeto
end



function mapa:colisiona( x, y, w, h )
	for i = math.floor(x/mapa.sizeCelda), ((x+w)/mapa.sizeCelda) do
		for j = math.floor(y/mapa.sizeCelda), ((y+h)/mapa.sizeCelda)  do
			local q = {x = x, y = y, w = w, h = h}
			for k, v in pairs(mapa.matrizObjetos[math.floor(i)][math.floor(j)]) do
				if colision(q, v.cuadColi) then
					return true, v
				end
			end
		end	
	end
	return false
end

function mapa:update()
	mapa.batch:bind()
    mapa.batch:clear()
    for i, v in pairs(mapa.objetos)do
        mapa.batch:addq(v.quad, v.cuadColi.x, v.cuadColi.y)
  	end
    mapa.batch:unbind()
end

function mapa:draw( )
	gfx.draw(mapa.batch, 0, 0)
end
