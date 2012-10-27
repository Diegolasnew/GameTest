-- mapa de prueba

mapa = {}

mapa.xVisible = 0
mapa.yVisible = 0
mapa.matrizEntidades = {}
mapa.sizeCelda = 100
mapa.ancho = 100
mapa.alto = 70
mapa.tex = gfx.newImage('gfx/tex.png')
mapa.tipoTex = {}
mapa.batch = nil

function mapa:init()

	for i=0, mapa.ancho do
			mapa.matrizEntidades[i]={}
			for j=0, mapa.ancho do
				mapa.matrizEntidades[i][j] = {objetos = {}}
			end
	end	

	map.batch = gfx.newSpriteBatch(map.tex, 5)
	mapa.tipoTex[1] = gfx.newQuad(0, 0, 327, 51, mapa.tex:getWidth(), mapa.tex:getHeight())
	mapa.tipoTex[2] = gfx.newQuad(0, 51, 68, 189, mapa.tex:getWidth(), mapa.tex:getHeight())
	mapa.tipoTex[3] = gfx.newQuad(68, 51, 89, 95, mapa.tex:getWidth(), mapa.tex:getHeight())




end

function mapa:ubicarObjeto(objeto)
	for i=objeto.x/mapa.sizeCelda, (objeto.x + objeto.ancho)/mapa.sizeCelda do
		for i=objeto.y/mapa.sizeCelda, (objeto.y + objeto.alto)/mapa.sizeCelda do
			
		end
	end
end

function mapa:update()
	
end