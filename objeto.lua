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

function objeto:init(x, y, ancho, alto, tipo, quad)
	objeto.cuadColi.x = x
	objeto.cuadColi.y = y
	objeto.cuadColi.w = ancho
	objeto.cuadColi.h = alto
	objeto.tipo = tipo
	objeto.quad = quad
end

return objeto