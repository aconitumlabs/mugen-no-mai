local M = {}

local player = require("src.player")

M.bind = {
    left  = "h",
    down  = "j",
    up    = "k",
    right = "l",
}

M.pressed = false

function M.keypressed(key)
    if key == M.bind.left then
        player.position.x = player.position.x - player.moveDistance

    elseif key == M.bind.down then
        player.position.y = player.position.y + player.moveDistance

    elseif key == M.bind.up then
        player.position.y = player.position.y - player.moveDistance

    elseif key == M.bind.right then
        player.position.x = player.position.x + player.moveDistance

    end

    M.pressed = false
end

return M
