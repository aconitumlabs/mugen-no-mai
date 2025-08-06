local M    = {}

M.input    = require("src.input")
M.map      = require("src.map")
M.player   = require("src.player")
M.constant = require("src.constant")

function M.load()
end

function M.update(dt)
    M.map.update(dt)
    M.player.update(dt)
end

function M.draw()
    M.map.draw()
    M.player.draw()
end

function M.keypressed(key)
    M.input.keypressed(key)
end

function M.focus(f)
end

function M.quit()

end

return M
