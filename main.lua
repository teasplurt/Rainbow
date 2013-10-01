function love.load()
	columns = 64
	rows = 40
	cycle = 5
	fullscreen = false
	modes = love.graphics.getModes()
	table.sort(modes, function(a, b) return a.width+a.height < b.width+b.height end)
	maxWidth = modes[# modes].width
	maxHeight = modes[# modes].height
	love.graphics.setMode(800, 600, false, true, 4)
	require "colors"
	offset = offset1
end

function love.draw()
	for x = 0, columns - 1 do
		for y = 0, rows - 1 do
			love.graphics.setColor(
				255 * (math.sin(love.timer.getTime() * 2 * math.pi / cycle + offset(x, y))+1 ) / 2,
				255 * (math.sin(love.timer.getTime() * 2 * math.pi / cycle + math.pi * 2 / 3 + offset(x, y))+1) / 2,
				255 * (math.sin(love.timer.getTime() * 2 * math.pi / cycle + math.pi * 4 / 3 + offset(x, y))+1) / 2
			)
			love.graphics.rectangle(
				"fill",
				x * love.graphics.getWidth() / columns,
				y * love.graphics.getHeight() / rows,
				love.graphics.getWidth() / columns,
				love.graphics.getHeight() / rows
			)
		end
	end
	if love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift") then
		love.graphics.setColor(0, 0, 0)
		love.graphics.print("FPS: " .. 1 / love.timer.getDelta() ..
		"\nColumns: " .. columns .. " Rows: " .. rows ..
		"\nLength of cycle in seconds: " .. cycle,
		0, 0)
	end
end

function love.keypressed(key)
	if key == "escape" then
		os.exit()
	elseif key == 'f' then
		fullscreen = not fullscreen
		if fullscreen then
			love.graphics.setMode(maxWidth, maxHeight, true, true, 4)
			love.mouse.setVisible(false)
		else
			love.graphics.setMode(800, 600, false, true, 4)
			love.mouse.setVisible(true)
		end
	elseif key == "up" then
		rows = rows + 1
	elseif key == "down" then
		rows = rows - 1
		if rows < 1 then rows = 1 end
	elseif key == "right" then
		columns = columns + 1
	elseif key == "left" then
		columns = columns - 1
		if columns < 1 then columns = 1 end
	elseif key == 'w' then
		cycle = cycle * 1.1
	elseif key == 's' then
		cycle = cycle / 1.1
	elseif key == '1' then
		offset = offset1 --diagonal lines
	elseif key == '2' then
		offset = offset2 --sine wave
	elseif key == '3' then
		offset = offset3 --cosine wave
	elseif key == '4' then
		offset = offset4
	elseif key == '5' then
		offset = offset5
	elseif key == '6' then
		offset = offset6
	end
end
