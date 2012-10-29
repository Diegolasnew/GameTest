local objeto = {}
objeto.cuadColi =
{
	x = 0,
	y = 0,
	w = 0,
	h = 0
}
objeto.quad = 0

function objeto:init(x, y, ancho, alto, quad)
	objeto.cuadColi.x = x
	objeto.cuadColi.y = y
	objeto.cuadColi.ancho = ancho
	objeto.cuadColi.alto = alto
	objeto.quad = quad
end

return objeto