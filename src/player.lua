local M = {}
M.input = require("src.input")

function M.update(dt)
    print(M.input.pressed)
end
function M.draw(dt)
end
function M.walk(vec2)
end
return M
