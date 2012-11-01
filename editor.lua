batchEditor = gfx.newSpriteBatch(mapa.tex, 100)

posObjetoEditor = 0
ponerObjeto = false

function updateEditor()
	local x, y = love.mouse.getPosition()
	x = x - translate[1]
	y = y - translate[2]
	if (posObjetoEditor > table.getn(mapa.tipoTex)) then
		posObjetoEditor = 0
	end
	if (posObjetoEditor < 0) then
		posObjetoEditor = table.getn(mapa.tipoTex)
	end
	batchEditor:bind()
	batchEditor:clear()
	if (posObjetoEditor ~= 0) then
		local x1, y1, w, h = mapa.tipoTex[posObjetoEditor]:getViewport()		
		x = x - (w/2)
		y = y - (h/2)
		batchEditor:setColor(255,255,255,200)
		batchEditor:addq(mapa.tipoTex[posObjetoEditor], x, y)
		if ponerObjeto then
			local o1 = new("objeto")
			o1:init(x, y, w, h, mapa.tipoTex[posObjetoEditor])
			mapa:ubicarObjeto(o1)
			ponerObjeto = false
		end
	else
		ponerObjeto = false
	end
	batchEditor:unbind()
	
end

function drawEditor(  )

	gfx.draw(batchEditor, 0, 0)
end