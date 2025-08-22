local M                   = {}

M.position                = {
    x = 0,
    y = 0,
}

M.camera                  = {
    x = 0,
    y = 0,
}

M.moveStep                = 64
M.cameraStep              = 20

local image
local animations          = {}
local animationSwitchTime = 0.5
M.currentAnimation        = 1
M.animationTime           = 0
M.flip                    = false

function M.load()
    image = love.graphics.newImage("res/image/miko.png")
    image:setFilter("nearest", "nearest")
    for i = 0, 128, 64 do
        table.insert(
            animations,
            love.graphics.newQuad(i, 0, 64, 64, image)
        )
    end
end

function M.update(dt)
    M.animationTime = M.animationTime + dt
    if M.animationTime >= animationSwitchTime then
        M.animationTime = 0
        M.currentAnimation = math.fmod(M.currentAnimation, 2) + 1
    end
end

function M.draw(dt)
    local xs = 1
    local offset = 0
    if M.flip then
        xs = -1
        offset = 64
    else
        xs = 1
        offset = 0
    end
    love.graphics.draw(
        image,
        animations[M.currentAnimation],
        M.position.x,
        M.position.y,
        nil,
        xs,
        1,
        offset
    )
end

function M.walk(vec2)

end

return M
