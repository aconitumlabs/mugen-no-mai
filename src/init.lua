local input  = require("src.input")
local map    = require("src.map")
local player = require("src.player")

function love.load()
    player.load()
    map.load()
end

function love.update(dt)
    map.update(dt)
    player.update(dt)
end

function love.draw()
    love.graphics.print("hiii", 0, 0)
    love.graphics.translate(
        player.camera.x,
        player.camera.y
    )
    love.graphics.scale(input.zoom, input.zoom)
    map.draw()
    player.draw()
end

function love.keypressed(key)
    input.keypressed(key)
end

function love.mousepressed(x, y, button, istouch, presses)
    input.mousepressed(x, y, button, istouch, presses)
end

function love.mousereleased(x, y, button, istouch, presses)
    input.mousereleased(x, y, button, istouch, presses)
end

function love.mousemoved(x, y, dx, dy, istouch)
    input.mousemoved(x, y, dx, dy, istouch)
end

function love.wheelmoved(x, y)
    input.wheelmoved(x, y)
end
