local M    = {}

local input    = require("src.input")
local map      = require("src.map")
local player   = require("src.player")

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
    map.draw()
    player.draw()
end

function M.keypressed(key)
    input.keypressed(key)
end

return M
