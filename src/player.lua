local M      = {}

M.position   = {
    x = 0,
    y = 0,
}

M.camera     = {
    x = 0,
    y = 0,
}

M.moveStep   = 50
M.cameraStep = 20

function M.load()

end

function M.update(dt)
end

function M.draw(dt)
    love.graphics.rectangle(
        "fill",
        M.position.x,
        M.position.y,
        M.moveStep,
        M.moveStep
    )
end

function M.walk(vec2)

end

return M
