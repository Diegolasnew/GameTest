local objeto = {}
	objeto.cuadColi =
	{
		x = 0,
		y = 0,
		w = 0,
		h = 0,
	}
	objeto.tipo = 0
	objeto.quad = 0
	objeto.vx = 250
	objeto.vy = 250

function objeto:init(x, y, ancho, alto, tipo, quad)
	objeto.cuadColi.x = x
	objeto.cuadColi.y = y
	objeto.cuadColi.w = ancho
	objeto.cuadColi.h = alto
	objeto.tipo = tipo
	objeto.quad = quad
end

function objeto:update( dt )

	local coliser = mapa:colisiona(objeto.cuadColi.x, objeto.cuadColi.y , objeto.cuadColi.w, objeto.cuadColi.h)

	if love.keyboard.isDown("up") then
		local coli, cuad = mapa:colisiona(objeto.cuadColi.x, objeto.cuadColi.y - objeto.vy*dt, objeto.cuadColi.w, objeto.cuadColi.h)
		if  not coli then
			objeto.cuadColi.y = objeto.cuadColi.y - objeto.vy*dt
		end
	end
	if love.keyboard.isDown("down") then
		local coli, cuad = mapa:colisiona(objeto.cuadColi.x, objeto.cuadColi.y + objeto.vy*dt, objeto.cuadColi.w, objeto.cuadColi.h)
		if  not coli then
			objeto.cuadColi.y = objeto.cuadColi.y + objeto.vy*dt
		end
	end
	if love.keyboard.isDown("left") or coliser then
		local coli, cuad = mapa:colisiona(objeto.cuadColi.x - objeto.vx*dt, objeto.cuadColi.y, objeto.cuadColi.w, objeto.cuadColi.h)
		if  not coli or coliser then
			objeto.cuadColi.x = objeto.cuadColi.x - objeto.vx*dt
		end
	end
	if love.keyboard.isDown("right") then
		local coli, cuad = mapa:colisiona(objeto.cuadColi.x + objeto.vx*dt, objeto.cuadColi.y, objeto.cuadColi.w, objeto.cuadColi.h)
		if  not coli then
			objeto.cuadColi.x = objeto.cuadColi.x + objeto.vx*dt
		end
	end
end

return objeto