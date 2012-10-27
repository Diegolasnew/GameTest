local palo = {
	x = 0
	y = 0
	ancho = 0
	alto = 0
	quad = nil
}

function palo:init(x, y, ancho, alto, quad)
	palo.x = x
	palo.y = y
	palo.ancho = ancho
	palo.alto = alto
	palo.quad = quad
end

return palo