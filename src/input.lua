local M = {}

M.bind = {
    left  = "h",
    down  = "j",
    up    = "k",
    right = "l",
}

M.pressed = false

function M.keypressed(key)
    if key == M.bind.left then
        M.pressed = true
        print(M.pressed)
        print(M.bind.left)
    elseif key == M.bind.down then
        print(M.bind.down)
    elseif key == M.bind.up then
        print(M.bind.up)
    elseif key == M.bind.right then
        print(M.bind.right)
    end

    M.pressed = false
end

return M
