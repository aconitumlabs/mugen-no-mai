local M        = {}

M.position     = {
    x = 1,
    y = 1,
}

M.moveDistance = 50

function M.load()

end

function M.update(dt)
end

function M.draw(dt)
    love.graphics.rectangle(
        "fill",
        M.position.x,
        M.position.y,
        M.moveDistance,
        M.moveDistance
    )
end

function M.walk(vec2)

end

return M
