local M      = {}

local input  = require("src.input")
local map    = require("src.map")
local player = require("src.player")

function M.load()
    player.load()
    map.load()
end

function M.update(dt)
    map.update(dt)
    player.update(dt)
end

function M.draw()
    love.graphics.print("hiii", 0, 0)
    love.graphics.translate(
        player.camera.x,
        player.camera.y
    )
    love.graphics.scale(input.zoom, input.zoom)
    map.draw()
    player.draw()
end

function M.keypressed(key)
    input.keypressed(key)
end

function M.mousepressed(x, y, button, istouch, presses)
    input.mousepressed(x, y, button, istouch, presses)
end

function M.mousereleased(x, y, button, istouch, presses)
    input.mousereleased(x, y, button, istouch, presses)
end

function M.mousemoved(x, y, dx, dy, istouch)
    input.mousemoved(x, y, dx, dy, istouch)
end

function M.wheelmoved(x, y)
    input.wheelmoved(x, y)
end

return M
