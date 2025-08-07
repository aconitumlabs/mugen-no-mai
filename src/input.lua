local M = {}

local player = require("src.player")

local bind = {
    left  = "h",
    down  = "j",
    up    = "k",
    right = "l",
    pan   = "lshift"
}

local panningMouse = false

M.zoom = 2

function M.keypressed(key)
    player.currentAnimation = 1
    player.animationTime = 0
    local panning = false
    if love.keyboard.isDown(bind.pan) then
        panning = true
    end
    local actions = {
        [bind.left] = function()
            player.flip = false
            if panning then
                player.camera.x = player.camera.x + player.cameraStep
            else
                player.position.x = player.position.x - player.moveStep
            end
        end,
        [bind.down] = function()
            if panning then
                player.camera.y = player.camera.y - player.cameraStep
            else
                player.position.y = player.position.y + player.moveStep
            end
        end,
        [bind.up] = function()
            if panning then
                player.camera.y = player.camera.y + player.cameraStep
            else
                player.position.y = player.position.y - player.moveStep
            end
        end,
        [bind.right] = function()
            player.flip = true
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
end

function M.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        panningMouse = true
    end
end

function M.mousereleased(x, y, button, istouch, presses)
    if button == 1 then
        panningMouse = false
    end
end

function M.mousemoved(x, y, dx, dy, istouch)
    if panningMouse then
        player.camera.x = player.camera.x + dx
        player.camera.y = player.camera.y + dy
    end
end

function M.wheelmoved(x, y)
    M.zoom = math.max(M.zoom + 0.2 * y, 0)
end

return M
