local M = {}

M.bind = {
    left  = "h",
    down  = "j",
    up    = "k",
    right = "l",
}

M.player = require("src.player")
M.vec    = require("src.vec")

function M.keypressed(key)
    if key == M.bind.left then
        M.vec2(1)
        print(M.bind.left)
    elseif key == M.bind.down then
        print(M.bind.down)
    elseif key == M.bind.up then
        print(M.bind.up)
    elseif key == M.bind.right then
        print(M.bind.right)
    end
end

return M
