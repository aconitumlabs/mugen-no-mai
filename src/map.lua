local M = {}

local player = require("src.player")

function M.load()
end

function M.update(dt)
end

function M.draw(dt)
    love.graphics.rectangle("line", 0, 0, 100, 100)
end

return M
