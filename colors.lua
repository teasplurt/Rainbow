function offset1(x, y)
	return math.pi * 2 / columns * x + math.pi * 2 / rows * y
end

function offset2(x, y)
	return math.pi * (math.sin(math.pi * x / columns + math.pi * y / rows) + 1)
end

function offset3(x, y)
	return math.pi * (math.cos(math.pi * x / columns + math.pi * y / rows) + 1)
end

function offset4(x, y)
	local centerx = columns / 2
	local centery = rows / 2
	local xoff = math.abs(x - centerx)
	local yoff = math.abs(y - centery)
	return math.pi * 2 * xoff / centerx + math.pi * 2 * yoff / centery
end

function offset5(x, y)
	local centerx = columns / 2
	local centery = rows / 2
	local dist = math.sqrt(((x - centerx) / centerx) * ((x - centerx) / centerx) + ((y - centery) / centery) * ((y - centery) / centery))
	return math.pi * 2 * dist
end

function offset6(x, y)
	local centerx = columns / 2
	local centery = rows / 2
	local dist = math.sqrt(((x - centerx) / centerx) * ((x - centerx) / centerx) + (y / centery) * (y / centery))
	return math.pi * 2 * dist
end
