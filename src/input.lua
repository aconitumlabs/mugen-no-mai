local M = {}

local player = require("src.player")

M.bind = {
    left  = "h",
    down  = "j",
    up    = "k",
    right = "l",
    pan   = "lshift"
}

M.pressed = false

function M.keypressed(key)
    local panning = false
    if love.keyboard.isDown(M.bind.pan) then
        panning = true
    end
    local actions = {
        [M.bind.left] = function()
            if panning then
                player.camera.x = player.camera.x + player.cameraStep
            else
                player.position.x = player.position.x - player.moveStep
            end
        end,
        [M.bind.down] = function()
            if panning then
                player.camera.y = player.camera.y - player.cameraStep
            else
                player.position.y = player.position.y + player.moveStep
            end
        end,
        [M.bind.up] = function()
            if panning then
                player.camera.y = player.camera.y + player.cameraStep
            else
                player.position.y = player.position.y - player.moveStep
            end
        end,
        [M.bind.right] = function()
            if panning then
                player.camera.x = player.camera.x - player.cameraStep
            else
                player.position.x = player.position.x + player.moveStep
            end
        end,
    }

    local currentAction = actions[key]
    if currentAction ~= nil then
        currentAction()
    end

    M.pressed = false
end

return M
