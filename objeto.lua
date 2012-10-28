local objeto = {}
objeto.x = 0
objeto.y = 0
objeto.ancho = 0
objeto.alto = 0
objeto.quad = 0

function objeto:init(x, y, ancho, alto, quad)
	objeto.x = x
	objeto.y = y
	objeto.ancho = ancho
	objeto.alto = alto
	objeto.quad = quad
end

return objeto